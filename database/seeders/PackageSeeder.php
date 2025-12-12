<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Package;

class PackageSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Package::firstOrCreate([
            'name' => 'Basic Member',
            'role_type' => 'individual_contractor',
            'contractor_limit' => null,
            'price' => 20,
        ]);
        
        Package::firstOrCreate([
            'name' => 'Pro Member',
            'role_type' => 'individual_contractor',
            'contractor_limit' => null,
            'price' => 49,
        ]);
        
        Package::firstOrCreate([
            'name' => 'Elite Member',
            'role_type' => 'league_contractor',
            'contractor_limit' => 10,
            'price' => 99,
        ]);
    }
}
