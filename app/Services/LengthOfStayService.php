<?php

namespace App\Services;

use App\Models\Availability;
use Carbon\Carbon;
use DateInterval;
use DatePeriod;
use Illuminate\Support\Collection;
use stdClass;

class LengthOfStayService
{
    public function getLengthOfStayPricing(): array
    {
        $availabilitiesWithPrices = $this->getAvailabilitiesWithPrices();

        $datesRange = $this->getDatesRange();

        $data = $this->getPricePerNightPerNumberOfPersons($availabilitiesWithPrices);

        $lengthOfStayPricing = [];
        foreach ($datesRange as $date) {
            $data->where('date', '=', $date)
                ->sortBy('pricePerNight')
                ->groupBy('persons')
                ->each(function ($infoPerPersons, $persons) use ($date, &$lengthOfStayPricing) {
                    for ($days = 1; $days <= $infoPerPersons->first()->maxLength; $days++) {
                        $departureDate = Carbon::create($date)->addDays($days);
                        if (!Availability::where('date', $departureDate->format('Y-m-d'))->pluck('departure_allowed')->first()) {
                            continue;
                        }
                        $daysLeft = $days;
                        $price = 0;
                        $infoPerPersons->each(function ($priceData) use (&$daysLeft, &$price) {
                            $price += $priceData->pricePerNight
                                * intdiv($daysLeft, $priceData->minimumStay)
                                * $priceData->minimumStay;
                            $daysLeft -= intdiv($daysLeft, $priceData->minimumStay) * $priceData->minimumStay;
                        });
                        $lengthOfStayPricing[$date->format('Y-m-d')][$persons][$days] = number_format($price/100, 2, '.', ' ');
                    }
                });
        }
        return $lengthOfStayPricing;
    }

    public function getAvailabilitiesWithPrices(): Collection
    {
        return Availability::join('prices', function ($join) {
            $join->on('availabilities.property_id', '=', 'prices.property_id');
            $join->on('availabilities.date', '>=', 'prices.period_from');
            $join->on('availabilities.date', '<=', 'prices.period_till');
        })->where('availabilities.quantity', '!=', '0')
            ->where('availabilities.arrival_allowed', '=', '1')
            ->get()
            ->map(function ($availability) {
                if ($availability?->duration) {
                    $availability->pricePerNight = intdiv($availability->amount, $availability->duration);
                }

                return $availability;
            });
    }

    public function getDatesRange(): DatePeriod
    {
        $dateFrom = Availability::orderBy('date', 'ASC')->pluck('date')->first();
        $dateTo = Availability::orderBy('date', 'DESC')->pluck('date')->first();
        $interval = new DateInterval('P1D');
        return new DatePeriod($dateFrom, $interval, $dateTo);
    }

    public function getPricePerNightPerNumberOfPersons(Collection $availabilitiesWithPrices): Collection
    {
        $pricePerNightPerNumberOfPersons = collect();

        $availabilitiesWithPrices->each(function ($availabilityWithPrice) use (&$pricePerNightPerNumberOfPersons) {
            $maxLength = Carbon::createFromDate($availabilityWithPrice->period_till)->diffInDays(Carbon::createFromDate($availabilityWithPrice->date)) + 1;
            if ($availabilityWithPrice->minimum_stay > $maxLength) {
                return;
            }

            $persons = explode('|', $availabilityWithPrice->persons);
            foreach ($persons as $index => $person) {
                $pricePerNightData = new StdClass();
                $pricePerNightData->date = $availabilityWithPrice->date;
                $pricePerNightData->persons = $person;
                $pricePerNightData->pricePerNight = $availabilityWithPrice->pricePerNight + $index * $availabilityWithPrice->extra_person_price;
                $pricePerNightData->maxLength = $maxLength;
                $pricePerNightData->minimumStay = $availabilityWithPrice->minimum_stay;
                $pricePerNightPerNumberOfPersons->push($pricePerNightData);
            }
        });

        return $pricePerNightPerNumberOfPersons;
    }
}
