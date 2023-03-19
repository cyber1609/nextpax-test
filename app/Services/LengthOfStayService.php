<?php

namespace App\Services;

use App\Models\Availability;
use Carbon\Carbon;
use DateInterval;
use DatePeriod;
use Illuminate\Support\Collection;

class LengthOfStayService
{
    private array $lengthOfStayPricing = [];

    private array $pricePerNightPerNumberOfPersons;

    private array $availableDepartureDates;

    public function getLengthOfStayPricing(): array
    {
        $availabilitiesWithPrices = $this->getAvailabilitiesWithPrices();

        $datesRange = $this->getDatesRange();

        $this->pricePerNightPerNumberOfPersons = ($this->getPricePerNightPerNumberOfPersons($availabilitiesWithPrices));

        $this->availableDepartureDates = $this->getAvailableDepartureDates();

        foreach ($datesRange as $date) {
            $this->getLengthOfStayPricingForDate($date);
        }

        ksort($this->lengthOfStayPricing);

        return $this->lengthOfStayPricing;
    }

    public function getLengthOfStayPricingForDate($date, $additionalDays = 0, $additionalPrice = 0): void
    {
        if (! isset($this->pricePerNightPerNumberOfPersons[$date->format('Y-m-d')])) {
            return;
        }

        $dateInResult = Carbon::create($date)->subDays($additionalDays)->format('Y-m-d');

        if (isset($this->lengthOfStayPricing[$date->format('Y-m-d')])) {
            foreach ($this->lengthOfStayPricing[$date->format('Y-m-d')] as $persons => $pricePerNumberOfNights) {
                foreach ($pricePerNumberOfNights as $numberOfNights => $prices) {
                    $this->lengthOfStayPricing[$dateInResult][$persons][$numberOfNights + $additionalDays][] = min($prices) + $additionalPrice;
                }
            }

            return;
        }

        foreach ($this->pricePerNightPerNumberOfPersons[$date->format('Y-m-d')] as $persons => $pricePerNight) {
            if ($pricePerNight[0]['maxLength'] < $pricePerNight[0]['duration'] && in_array(Carbon::create($date)->addDays($pricePerNight[0]['duration']), $this->availableDepartureDates)) {
                $this->lengthOfStayPricing[$dateInResult][$persons][$pricePerNight[0]['duration'] + $additionalDays][] = $pricePerNight[0]['pricePerDuration'] + $additionalPrice;
            }

            for ($days = 1; $days <= $pricePerNight[0]['maxLength']; $days++) {
                $departureDate = Carbon::create($date)->addDays($days);
                if (! in_array($departureDate, $this->availableDepartureDates)) {
                    continue;
                }
                $daysLeft = $days;
                $price = $additionalPrice;
                foreach ($pricePerNight as $priceData) {
                    if ($daysLeft >= $priceData['duration'] && $priceData['pricePerDuration']) {
                        $price += $priceData['pricePerDuration'];
                        $daysLeft -= intdiv($daysLeft, $priceData['duration']) * $priceData['duration'];
                    } else {
                        $numberOfDaysWithThisPrice = intdiv($daysLeft, $priceData['minimumStay']) * $priceData['minimumStay'];
                        $price += $priceData['pricePerNight'] * $numberOfDaysWithThisPrice;
                        $daysLeft -= $numberOfDaysWithThisPrice;
                    }
                }

                $this->lengthOfStayPricing[$dateInResult][$persons][$days + $additionalDays][] = $price;

                if (isset($this->pricePerNightPerNumberOfPersons[Carbon::create($date)->addDays($days)->format('Y-m-d')])) {
                    $this->getLengthOfStayPricingForDate(Carbon::create($date)->addDays($days)->toDateTime(), $days + $additionalDays, $price);
                }
            }
        }
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

    public function getPricePerNightPerNumberOfPersons(Collection $availabilitiesWithPrices): array
    {
        $pricePerNightPerNumberOfPersons = [];

        $availabilitiesWithPrices->each(function ($availabilityWithPrice) use (&$pricePerNightPerNumberOfPersons) {
            $maxLength = Carbon::createFromDate($availabilityWithPrice->period_till)->diffInDays(Carbon::createFromDate($availabilityWithPrice->date)) + 1;
            if ($availabilityWithPrice->minimum_stay > $maxLength && $availabilityWithPrice->duration < $maxLength) {
                return;
            }

            $persons = explode('|', $availabilityWithPrice->persons);
            foreach ($persons as $index => $person) {
                $pricePerNightData = [];
                $pricePerNightData['duration'] = $availabilityWithPrice->duration;
                $pricePerNightData['netPricePerNight'] = $availabilityWithPrice->pricePerNight + $index * $availabilityWithPrice->extra_person_price;
                $pricePerNightData['pricePerNight'] = $availabilityWithPrice->duration !== 1 ? 0 : $pricePerNightData['netPricePerNight'];
                $pricePerNightData['pricePerDuration'] = $availabilityWithPrice->duration !== 1 ? $availabilityWithPrice->amount + $index * $availabilityWithPrice->extra_person_price : 0;
                $pricePerNightData['maxLength'] = $maxLength;
                $pricePerNightData['minimumStay'] = $availabilityWithPrice->minimum_stay;
                $pricePerNightPerNumberOfPersons[$availabilityWithPrice->date->format('Y-m-d')][$person][] = $pricePerNightData;
            }
        });

        foreach ($pricePerNightPerNumberOfPersons as $date => &$prices) {
            foreach ($prices as $person => &$data) {
                usort($data, function ($a, $b) {
                    return $a['netPricePerNight'] <=> $b['netPricePerNight'];
                });
            }
        }

        return $pricePerNightPerNumberOfPersons;
    }

    public function getDatesRange(): DatePeriod
    {
        $start = Availability::orderBy('date', 'DESC')->pluck('date')->first();
        $end = Availability::orderBy('date', 'ASC')->pluck('date')->first();
        $diff = $end->diff($start);
        $interval = DateInterval::createFromDateString('-1 day');

        return new DatePeriod($start, $interval, $diff->days);
    }

    private function getAvailableDepartureDates(): array
    {
        return Availability::where('departure_allowed', true)->pluck('date')->toArray();
    }
}
