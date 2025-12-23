<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use Spatie\Permission\Models\Role;

class RolesAndUsersSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $superAdminRole = Role::firstOrCreate(['name' => 'super_admin']);
        $customerRole = Role::firstOrCreate(['name' => 'customer']);
        $contractorRole = Role::firstOrCreate(['name' => 'contractor']);
        $leagueContractorRole = Role::firstOrCreate(['name' => 'league_contractor']);
        $individualContractorRole = Role::firstOrCreate(['name' => 'individual_contractor']);

        $superAdmin = User::firstOrCreate(
            ['email' => 'admin@gmail.com'],
            [
                'name' => 'Super Admin',
                'password' => Hash::make('Admin@123'),
            ]
        );
        $superAdmin->assignRole($superAdminRole);

        $customer = User::firstOrCreate(
            ['email' => 'customer@gmail.com'],
            [
                'name' => 'Customer',
                'password' => Hash::make('Customer@123'),
            ]
        );
        $customer->assignRole($customerRole);

        $contractor = User::firstOrCreate(
            ['email' => 'contractor@gmail.com'],
            [
                'name' => 'Contractor User',
                'password' => Hash::make('Contractor@123'),
            ]
        );
        $contractor->assignRole($contractorRole);

        

        $leagueContractor = User::firstOrCreate(
            ['email' => 'leaguecontractor@gmail.com'],
            [
                'name' => 'League Contractor',
                'password' => Hash::make('LeagueContractor@123'),
            ]
        );
        $leagueContractor->assignRole($leagueContractorRole);


        $individualContractor = User::firstOrCreate(
            ['email' => 'individualcontractor@gmail.com'],
            [
                'name' => 'Individual Contractor',
                'password' => Hash::make('IndividualContractor@123'),
            ]
        );
        $individualContractor->assignRole($individualContractorRole);
        
    }
}
