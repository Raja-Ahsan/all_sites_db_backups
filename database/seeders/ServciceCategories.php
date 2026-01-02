<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\ServiceCategory;

class ServciceCategories extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        ServiceCategory::firstOrCreate([
            'name' => 'Plumbing',
        ]);
        ServiceCategory::firstOrCreate([
            'name' => 'Electrical',
        ]);
        ServiceCategory::firstOrCreate([
            'name' => 'Carpentry',
        ]);
        ServiceCategory::firstOrCreate([
            'name' => 'Painting',
        ]);
        ServiceCategory::firstOrCreate([
            'name' => 'Cleaning',
        ]);
        ServiceCategory::firstOrCreate([
            'name' => 'Gardening',
        ]);
        ServiceCategory::firstOrCreate([
            'name' => 'Other',
        ]);
    }
}
