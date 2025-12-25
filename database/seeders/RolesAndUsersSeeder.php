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
        $adminRole = Role::firstOrCreate(
            ['name' => 'admin', 'guard_name' => 'web']
        );
        
        $userRole = Role::firstOrCreate(
            ['name' => 'user', 'guard_name' => 'web']
        );
        
        $contractorRole = Role::firstOrCreate(
            ['name' => 'contractor', 'guard_name' => 'web']
        );
        
        $leagueContractorRole = Role::firstOrCreate(
            ['name' => 'league_contractor', 'guard_name' => 'web']
        );
        
        $individualContractorRole = Role::firstOrCreate(
            ['name' => 'individual_contractor', 'guard_name' => 'web']
        );

        $admin = User::firstOrCreate(
            ['email' => 'admin@gmail.com'],
            [
                'name' => 'Super Admin',
                'password' => Hash::make('Admin@123'),
            ]
        );
        $admin->assignRole($adminRole);

        $user = User::firstOrCreate(
            ['email' => 'customer@gmail.com'],
            [
                'name' => 'Customer',
                'password' => Hash::make('Customer@123'),
            ]
        );
        $user->assignRole($userRole);

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
