<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\TruckOrder>
 */
class TruckOrderFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'name'=> fake()->name(),
            'contact'=> fake()->e164PhoneNumber(),
            'company_name'=> fake()->name(),
            'description'=>fake()->sentence(),
            'size'=> "height: 8ft, width: 5ft, length: 10ft",
            'weight'=> ((string) fake()->numberBetween(0, 1000)).' Kg',
            'status'=> fake()->randomElement(['pending', 'in_progress', 'delivered']),
            'pickup_name'=> fake()->name(),
            'pickup_address'=> fake()->streetAddress(),
            'pickup_city'=> fake()->city(),
            'pickup_postal_code'=> fake()->postcode(),
            'pickup_contact'=> fake()->e164PhoneNumber(),
            'pickup_datetime'=> fake()->dateTime(),
            'destination_name'=> fake()->name(),
            'destination_address'=> fake()->streetAddress(),
            'destination_city'=> fake()->city(),
            'destination_postal_code'=> fake()->postcode(),
            'destination_contact'=> fake()->e164PhoneNumber(),
            'destination_datetime'=> fake()->dateTimeBetween('now', '+1 year'),
            'user_id'=> fake()->numberBetween(1, 10)
        ];
    }
}
