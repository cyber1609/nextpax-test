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
    private array $lengthOfStayPricing = [];
    private Collection $pricePerNightPerNumberOfPersons;
    private array $availableDepartureDates;

    public function getLengthOfStayPricing(): array
    {
        $availabilitiesWithPrices = $this->getAvailabilitiesWithPrices();

        $datesRange = $this->getDatesRange();

        $this->pricePerNightPerNumberOfPersons = $this->getPricePerNightPerNumberOfPersons($availabilitiesWithPrices);

        $this->availableDepartureDates = $this->getAvailableDepartureDates();

        foreach ($datesRange as $date) {
            $this->getLengthOfStayPricingForDate($date);
        }
        return $this->lengthOfStayPricing;
    }

    public function getLengthOfStayPricingForDate($date, $additionalDays = 0, $additionalPrice = 0): void
    {
        $this->pricePerNightPerNumberOfPersons->where('date', '=', $date)
            ->sortBy('pricePerNight')
            ->groupBy('persons')
            ->each(function ($infoPerPersons, $persons) use ($date, $additionalDays, $additionalPrice) {

                if ($infoPerPersons->first()->maxLength < $infoPerPersons->first()->duration && in_array($date, $this->availableDepartureDates)) {
                    $dateInResult = Carbon::create($date)->subDays($additionalDays)->format('Y-m-d');
                    $this->lengthOfStayPricing[$dateInResult][$persons][$infoPerPersons->first()->duration + $additionalDays][] = number_format(($infoPerPersons->first()->pricePerDuration + $additionalPrice)/100, 2, '.', ' ');
                }

                for ($days = 1; $days <= $infoPerPersons->first()->maxLength; $days++) {
                    $departureDate = Carbon::create($date)->addDays($days - 1);
                    if (in_array($departureDate->format('Y-m-d'), $this->availableDepartureDates)) {
                        continue;
                    }
                    $daysLeft = $days;
                    $price = $additionalPrice;
                    $infoPerPersons->each(function ($priceData) use (&$daysLeft, &$price) {
                        if ($daysLeft >= $priceData->duration && $priceData->pricePerDuration) {
                            $price += $priceData->pricePerDuration;
                            $daysLeft -= intdiv($daysLeft, $priceData->duration) * $priceData->duration;
                        } else {
                            $price += $priceData->pricePerNight
                                * intdiv($daysLeft, $priceData->minimumStay)
                                * $priceData->minimumStay;
                            $daysLeft -= intdiv($daysLeft, $priceData->minimumStay) * $priceData->minimumStay;
                        }
                    });

                    $dateInResult = Carbon::create($date)->subDays($additionalDays)->format('Y-m-d');

                    $this->lengthOfStayPricing[$dateInResult][$persons][$days+$additionalDays][] = number_format($price/100, 2, '.', ' ');

                    if ($this->pricePerNightPerNumberOfPersons->where('date', '=', Carbon::create($date)->addDays($days))->isNotEmpty()) {
                        $this->getLengthOfStayPricingForDate(Carbon::create($date)->addDays($days)->toDateTime(), $days + $additionalDays, $price);
                    }
                }
            });
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

    public function getPricePerNightPerNumberOfPersons(Collection $availabilitiesWithPrices): Collection
    {
        $pricePerNightPerNumberOfPersons = collect();

        $availabilitiesWithPrices->each(function ($availabilityWithPrice) use (&$pricePerNightPerNumberOfPersons) {
            $maxLength = Carbon::createFromDate($availabilityWithPrice->period_till)->diffInDays(Carbon::createFromDate($availabilityWithPrice->date)) + 1;
            if ($availabilityWithPrice->minimum_stay > $maxLength && $availabilityWithPrice->duration < $maxLength) {
                return;
            }

            $persons = explode('|', $availabilityWithPrice->persons);
            foreach ($persons as $index => $person) {
                $pricePerNightData = new StdClass();
                $pricePerNightData->date = $availabilityWithPrice->date;
                $pricePerNightData->persons = $person;
                $pricePerNightData->duration = $availabilityWithPrice->duration;
                $pricePerNightData->pricePerNight = $availabilityWithPrice->duration !== 1 ? 0 : $availabilityWithPrice->pricePerNight + $index * $availabilityWithPrice->extra_person_price;
                $pricePerNightData->pricePerDuration = $availabilityWithPrice->duration !== 1 ? $availabilityWithPrice->amount + $index * $availabilityWithPrice->extra_person_price : 0;
                $pricePerNightData->maxLength = $maxLength;
                $pricePerNightData->minimumStay = $availabilityWithPrice->minimum_stay;
                $pricePerNightPerNumberOfPersons->push($pricePerNightData);
            }
        });
        return $pricePerNightPerNumberOfPersons;
    }

    public function getDatesRange(): DatePeriod
    {
        $dateFrom = Availability::orderBy('date', 'ASC')->pluck('date')->first();
        $dateTo = Availability::orderBy('date', 'DESC')->pluck('date')->first();
        $interval = new DateInterval('P1D');
        return new DatePeriod($dateFrom, $interval, $dateTo);
    }

    private function getAvailableDepartureDates(): array
    {
        return Availability::where('departure_allowed',  true)->pluck('date')->toArray();
    }
}
