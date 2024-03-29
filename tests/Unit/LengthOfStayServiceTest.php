<?php

namespace Tests\Unit;

use App\Models\Availability;
use App\Models\Price;
use App\Services\LengthOfStayService;
use DatePeriod;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Date;
use Tests\TestCase;

class LengthOfStayServiceTest extends TestCase
{
    use RefreshDatabase;

    public function testGetAvailabilitiesWithPrices(): void
    {
        $price1 = new Price();
        $price1->property_id = 1;
        $price1->duration = 2;
        $price1->amount = 10000;
        $price1->currency = 'EUR';
        $price1->persons = '2|4';
        $price1->weekdays = '0|1|2|3|4|5|6';
        $price1->minimum_stay = 1;
        $price1->maximum_stay = 21;
        $price1->extra_person_price = 1000;
        $price1->extra_person_price_currency = 'EUR';
        $price1->period_from = '2023-03-01';
        $price1->period_till = '2023-03-10';
        $price1->version = '1';
        $price1->save();

        $price2 = new Price();
        $price2->property_id = 1;
        $price2->duration = 1;
        $price2->amount = 6000;
        $price2->currency = 'EUR';
        $price2->persons = '1';
        $price2->weekdays = '0|1|2|3|4|5|6';
        $price2->minimum_stay = 1;
        $price2->maximum_stay = 21;
        $price2->extra_person_price = 1000;
        $price2->extra_person_price_currency = 'EUR';
        $price2->period_from = '2023-03-11';
        $price2->period_till = '2023-03-20';
        $price2->version = '1';
        $price2->save();

        $availability1 = new Availability();
        $availability1->property_id = 1;
        $availability1->date = '2023-03-01';
        $availability1->quantity = 1;
        $availability1->arrival_allowed = true;
        $availability1->departure_allowed = true;
        $availability1->minimum_stay = 1;
        $availability1->maximum_stay = 21;
        $availability1->version = 1;
        $availability1->save();

        $availability2 = new Availability();
        $availability2->property_id = 1;
        $availability2->date = '2023-03-22';
        $availability2->quantity = 1;
        $availability2->arrival_allowed = true;
        $availability2->departure_allowed = true;
        $availability2->minimum_stay = 1;
        $availability2->maximum_stay = 21;
        $availability2->version = 1;
        $availability2->save();

        $lengthOfStayServiceInstance = new LengthOfStayService();
        $results = $lengthOfStayServiceInstance->getAvailabilitiesWithPrices();
        $this->assertInstanceOf(Collection::class, $results);
        $this->assertCount(1, $results);

        $availabilityWithPrice = $results->first();

        $this->assertEquals(5000, $availabilityWithPrice->pricePerNight);
        $this->assertEquals(2, $availabilityWithPrice->duration);
        $this->assertTrue($availabilityWithPrice->arrival_allowed);
        $this->assertGreaterThan(0, $availabilityWithPrice->quantity);
        $this->assertGreaterThanOrEqual($availabilityWithPrice->period_from, $availabilityWithPrice->date);
        $this->assertLessThanOrEqual($availabilityWithPrice->period_till, $availabilityWithPrice->date);
    }

    public function testGetDatesRange(): void
    {
        $availability1 = new Availability();
        $availability1->property_id = 1;
        $availability1->date = '2023-03-22';
        $availability1->quantity = 1;
        $availability1->arrival_allowed = true;
        $availability1->departure_allowed = true;
        $availability1->minimum_stay = 1;
        $availability1->maximum_stay = 21;
        $availability1->version = 1;
        $availability1->save();

        $availability2 = new Availability();
        $availability2->property_id = 1;
        $availability2->date = '2023-03-01';
        $availability2->quantity = 1;
        $availability2->arrival_allowed = true;
        $availability2->departure_allowed = true;
        $availability2->minimum_stay = 1;
        $availability2->maximum_stay = 21;
        $availability2->version = 1;
        $availability2->save();

        $lengthOfStayServiceInstance = new LengthOfStayService();
        $result = $lengthOfStayServiceInstance->getDatesRange();
        $this->assertInstanceOf(DatePeriod::class, $result);

        $this->assertTrue($result->getStartDate()->equalTo($availability1->date));
    }

    public function testGetPricePerNightPerNumberOfPersonsReturnsCollection()
    {
        $availabilitiesWithPrices = collect();

        $lengthOfStayServiceInstance = new LengthOfStayService();
        $result = $lengthOfStayServiceInstance->getPricePerNightPerNumberOfPersons($availabilitiesWithPrices);

        $this->assertIsArray($result);
    }

    public function testGetPricePerNightPerNumberOfPersonsReturnsCorrectPricePerNightData()
    {
        $availabilitiesWithPrices = collect([
            (object) [
                'duration' => 1,
                'period_till' => '2023-03-09',
                'date' => Date::createFromFormat('Y-m-d', '2023-03-06'),
                'minimum_stay' => 2,
                'persons' => '2|3',
                'pricePerNight' => 100,
                'extra_person_price' => 50,
            ],
        ]);

        $lengthOfStayServiceInstance = new LengthOfStayService();
        $result = $lengthOfStayServiceInstance->getPricePerNightPerNumberOfPersons($availabilitiesWithPrices);

        $this->assertIsArray($result);
        $this->assertEquals(1, count($result));
        $this->assertArrayHasKey('2023-03-06', $result);

        $this->assertIsArray($result['2023-03-06']);
        $this->assertEquals(2, count($result['2023-03-06']));
        $this->assertArrayHasKey('2', $result['2023-03-06']);
        $this->assertArrayHasKey('3', $result['2023-03-06']);

        $this->assertIsArray($result['2023-03-06']['2']);
        $this->assertEquals(1, count($result['2023-03-06']['2']));

        $this->assertIsArray($result['2023-03-06']['2'][0]);
        $this->assertEquals(6, count($result['2023-03-06']['2'][0]));
        $this->assertEquals(100, $result['2023-03-06']['2'][0]['pricePerNight']);
        $this->assertEquals(3, $result['2023-03-06']['2'][0]['maxLength']);
        $this->assertEquals(2, $result['2023-03-06']['2'][0]['minimumStay']);

        $this->assertIsArray($result['2023-03-06']['3']);
        $this->assertEquals(1, count($result['2023-03-06']['3']));

        $this->assertIsArray($result['2023-03-06']['3'][0]);
        $this->assertEquals(6, count($result['2023-03-06']['3'][0]));
        $this->assertEquals(150, $result['2023-03-06']['3'][0]['pricePerNight']);
        $this->assertEquals(3, $result['2023-03-06']['3'][0]['maxLength']);
        $this->assertEquals(2, $result['2023-03-06']['3'][0]['minimumStay']);
    }
}
