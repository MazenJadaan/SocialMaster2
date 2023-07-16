<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\User_profile>
 */
class User_profileFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition()
    {
        return [
            'job'=> fake()->jobTitle(),
            'study_place'=>fake()->address(),
            'place_stay'=>fake()->streetName(),
            'place_born'=>fake()->streetName(),
            'bio'=>fake()->text(),
            'followers_number'=>fake()->numberBetween(10,1000),
            'user_id'=>fake()->numberBetween(23,42)
        ];
    }
}
