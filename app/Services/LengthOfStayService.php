<?php

namespace App\Services;

use App\Models\Availability;
use Carbon\Carbon;
use DateInterval;
use DatePeriod;
use stdClass;

class LengthOfStayService
{
    public function getLengthOfStayPricing(): array
    {
        $all = Availability::join('prices', function ($join) {
            $join->on('availabilities.property_id', '=', 'prices.property_id');
            $join->on('availabilities.date', '>=', 'prices.period_from');
            $join->on('availabilities.date', '<=', 'prices.period_till');
        })->where('availabilities.quantity', '!=', '0')
            ->where('availabilities.arrival_allowed', '=', '1')
            ->get()
            ->map(function ($availability) {
                if ($availability?->duration) {
                    $availability->pricePerDay = intdiv($availability->amount, $availability->duration);
                }

                return $availability;
            });

        $dateFrom = Availability::orderBy('date', 'ASC')->pluck('date')->first();
        $dateTo = Availability::orderBy('date', 'DESC')->pluck('date')->first();
        $interval = new DateInterval('P1D');
        $dateRange = new DatePeriod($dateFrom, $interval, $dateTo);

        $data = collect();

        $all->each(function ($row) use (&$data) {
            $maxLength = Carbon::createFromDate($row->period_till)->diffInDays(Carbon::createFromDate($row->date)) + 1;
            if ($row->minimum_stay > $maxLength) {
                return;
            }

            $persons = explode('|', $row->persons);
            foreach ($persons as $index => $person) {
                $returnClass = new StdClass();
                $returnClass->date = $row->date;
                $returnClass->persons = $person;
                $returnClass->pricePerDay = $row->pricePerDay + $index * $row->extra_person_price;
                $returnClass->maxLength = $maxLength;
                $returnClass->minimumStay = $row->minimum_stay;
                $data->push($returnClass);
            }
        });

        $returnData = [];
        foreach ($dateRange as $date) {
            $data->where('date', '=', $date)
                ->sortBy('pricePerDay')
                ->groupBy('persons')
                ->each(function ($infoPerPersons, $persons) use ($date, &$returnData) {
                    for ($days = 1; $days <= $infoPerPersons->first()->maxLength; $days++) {
                        $departureDate = Carbon::create($date)->addDays($days);
                        if (!Availability::where('date', $departureDate->format('Y-m-d'))->pluck('departure_allowed')->first()) {
                            continue;
                        }
                        $daysLeft = $days;
                        $price = 0;
                        $infoPerPersons->each(function ($priceData) use (&$daysLeft, &$price) {
                            $price += $priceData->pricePerDay
                                * intdiv($daysLeft, $priceData->minimumStay)
                                * $priceData->minimumStay;
                            $daysLeft -= intdiv($daysLeft, $priceData->minimumStay) * $priceData->minimumStay;
                        });
                        $returnData[$date->format('Y-m-d')][$persons][$days] = number_format($price/100, 2, '.', ' ');
                    }
                });
        }
        return $returnData;
    }
}
