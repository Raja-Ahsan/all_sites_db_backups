<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\CmsModulePermission;
use App\Models\CmsModule;
use Spatie\Permission\Models\Role;

class CmsModulePermissions extends Seeder
{
    /**
     * Run the database seeds.
     */

    public function run(): void
    {
        CmsModulePermission::truncate();

        // Get modules by route_name to avoid hard-coded IDs
        $adminRole = Role::firstOrCreate(['name' => config('roles.admin')]);
        $userRole = Role::firstOrCreate(['name' => config('roles.user')]);
        $leagueContractorRole = Role::firstOrCreate(['name' => config('roles.company')]);
        $modules = [
            'dashboard' => CmsModule::where('route_name', 'admin.dashboard')->first(),
            'users' => CmsModule::where('route_name', 'users-module')->first(),
            'hosts' => CmsModule::where('route_name', 'hosts-module')->first(),
            'memberships' => CmsModule::where('route_name', 'memberships-module')->first(),
            'payments' => CmsModule::where('route_name', 'payments')->first(),
            'referrals' => CmsModule::where('route_name', 'referrals-module')->first(),
            'contractors' => CmsModule::where('route_name', 'contractors-module')->first(),
            'services' => CmsModule::where('route_name', 'services-module')->first(),
            'services-categories.create' => CmsModule::where('route_name', 'services-categories.create')->first(),
            'services-categories.index' => CmsModule::where('route_name', 'services-categories.index')->first(),
            'products' => CmsModule::where('route_name', 'products-module')->first(),
            'orders' => CmsModule::where('route_name', 'orders-module')->first(),
            'contractor_approval' => CmsModule::where('route_name', 'contractor-approval')->first(),
        ];

        // Get submenus by route_name
        $submenus = [
            'users.index' => CmsModule::where('route_name', 'users.index')->first(),
            'users.create' => CmsModule::where('route_name', 'users.create')->first(),
            'hosts.index' => CmsModule::where('route_name', 'hosts.index')->first(),
            'hosts.create' => CmsModule::where('route_name', 'hosts.create')->first(),
            'memberships.index' => CmsModule::where('route_name', 'memberships.index')->first(),
            'referrals.index' => CmsModule::where('route_name', 'referrals.index')->first(),
            'referrals.create' => CmsModule::where('route_name', 'referrals.create')->first(),
            'contractors.index' => CmsModule::where('route_name', 'contractors.index')->first(),
            'contractors.create' => CmsModule::where('route_name', 'contractors.create')->first(),
            'services.index' => CmsModule::where('route_name', 'services.index')->first(),
            'services.create' => CmsModule::where('route_name', 'services.create')->first(),
            'services-categories.create' => CmsModule::where('route_name', 'services-categories.create')->first(),
            'services-categories.index' => CmsModule::where('route_name', 'services-categories.index')->first(),
            'products.index' => CmsModule::where('route_name', 'products.index')->first(),
            'products.create' => CmsModule::where('route_name', 'products.create')->first(),
            'orders.index' => CmsModule::where('route_name', 'orders.index')->first(),
            'contractor-approval.index' => CmsModule::where('route_name', 'contractor-approval.index')->first(),
        ];

        $permissions = [
            // admin modules
            ['role_id' => $adminRole->id, 'module_id' => $modules['dashboard']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 0, 'is_delete' => 0], // Dashboard
            ['role_id' => $adminRole->id, 'module_id' => $modules['users']->id ?? null, 'is_add' => 1, 'is_view' => 1, 'is_update' => 0, 'is_delete' => 0], // Users
            ['role_id' => $adminRole->id, 'module_id' => $modules['hosts']->id ?? null, 'is_add' => 1, 'is_view' => 1, 'is_update' => 0, 'is_delete' => 0], // Hosts
            ['role_id' => $adminRole->id, 'module_id' => $modules['memberships']->id ?? null, 'is_add' => 1, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // Memberships
            ['role_id' => $adminRole->id, 'module_id' => $modules['payments']->id ?? null, 'is_add' => 0, 'is_view' => 0, 'is_update' => 0, 'is_delete' => 0], // payments
            ['role_id' => $adminRole->id, 'module_id' => $modules['referrals']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // referrals
            ['role_id' => $adminRole->id, 'module_id' => $modules['contractors']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // contractors
            ['role_id' => $adminRole->id, 'module_id' => $modules['services']->id ?? null, 'is_add' => 1, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // services
            ['role_id' => $adminRole->id, 'module_id' => $modules['products']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // products
            ['role_id' => $adminRole->id, 'module_id' => $modules['orders']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // orders
            ['role_id' => $adminRole->id, 'module_id' => $modules['contractor_approval']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // contractor approval
            // Submenus
            ['role_id' => $adminRole->id, 'module_id' => $submenus['users.index']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // All Users (users.index)
            ['role_id' => $adminRole->id, 'module_id' => $submenus['users.create']->id ?? null, 'is_add' => 0, 'is_view' => 0, 'is_update' => 0, 'is_delete' => 0], // Add User (users.create)
            ['role_id' => $adminRole->id, 'module_id' => $submenus['hosts.index']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 0, 'is_delete' => 0],
            ['role_id' => $adminRole->id, 'module_id' => $submenus['hosts.create']->id ?? null, 'is_add' => 0, 'is_view' => 0, 'is_update' => 0, 'is_delete' => 0],
            ['role_id' => $adminRole->id, 'module_id' => $submenus['memberships.index']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // All Memberships (memberships.index)
            ['role_id' => $adminRole->id, 'module_id' => $submenus['referrals.index']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // All Referrals (referrals.index)
            ['role_id' => $adminRole->id, 'module_id' => $submenus['referrals.create']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // Add Referral (referrals.create)
            ['role_id' => $adminRole->id, 'module_id' => $submenus['contractors.index']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // All Contractors (contractors.index)
            ['role_id' => $adminRole->id, 'module_id' => $submenus['contractors.create']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // Add Contractor (contractors.create)
            ['role_id' => $adminRole->id, 'module_id' => $submenus['services.index']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // All Services (services.index)
            ['role_id' => $adminRole->id, 'module_id' => $submenus['services.create']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // Add Service (services.create)
            ['role_id' => $adminRole->id, 'module_id' => $modules['services-categories.create']->id ?? null, 'is_add' => 1, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // services categories
            ['role_id' => $adminRole->id, 'module_id' => $modules['services-categories.index']->id ?? null, 'is_add' => 1, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // all services categories
            ['role_id' => $adminRole->id, 'module_id' => $submenus['products.index']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // All Products (products.index)
            ['role_id' => $adminRole->id, 'module_id' => $submenus['products.create']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // Add Product (products.create)
            ['role_id' => $adminRole->id, 'module_id' => $submenus['orders.index']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // All Orders (orders.index)
            ['role_id' => $adminRole->id, 'module_id' => $submenus['contractor-approval.index']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // All Contractor Approval (contractor-approval.index)

            // user modules
            ['role_id' => $userRole->id, 'module_id' => $modules['dashboard']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 0, 'is_delete' => 0], // Dashboard
            ['role_id' => $userRole->id, 'module_id' => $modules['users']->id ?? null, 'is_add' => 0, 'is_view' => 0, 'is_update' => 0, 'is_delete' => 0], // Users
            ['role_id' => $userRole->id, 'module_id' => $modules['hosts']->id ?? null, 'is_add' => 1, 'is_view' => 1, 'is_update' => 0, 'is_delete' => 0], // Hosts
            ['role_id' => $userRole->id, 'module_id' => $modules['memberships']->id ?? null, 'is_add' => 0, 'is_view' => 0, 'is_update' => 1, 'is_delete' => 0], // Memberships
            ['role_id' => $userRole->id, 'module_id' => $modules['payments']->id ?? null, 'is_add' => 0, 'is_view' => 0, 'is_update' => 0, 'is_delete' => 0], // payments
            ['role_id' => $userRole->id, 'module_id' => $modules['referrals']->id ?? null, 'is_add' => 0, 'is_view' => 0, 'is_update' => 1, 'is_delete' => 0], // referrals
            ['role_id' => $userRole->id, 'module_id' => $modules['contractors']->id ?? null, 'is_add' => 0, 'is_view' => 0, 'is_update' => 1, 'is_delete' => 0], // contractors
            ['role_id' => $userRole->id, 'module_id' => $modules['services']->id ?? null, 'is_add' => 1, 'is_view' => 0, 'is_update' => 1, 'is_delete' => 0], // services
            ['role_id' => $userRole->id, 'module_id' => $modules['products']->id ?? null, 'is_add' => 0, 'is_view' => 0, 'is_update' => 1, 'is_delete' => 0], // products
            ['role_id' => $userRole->id, 'module_id' => $modules['orders']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // orders
            ['role_id' => $userRole->id, 'module_id' => $modules['contractor_approval']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // contractor approval
            // Submenus
            ['role_id' => $userRole->id, 'module_id' => $submenus['users.index']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // All Users (users.index)
            ['role_id' => $userRole->id, 'module_id' => $submenus['users.create']->id ?? null, 'is_add' => 0, 'is_view' => 0, 'is_update' => 0, 'is_delete' => 0], // Add User (users.create)
            ['role_id' => $userRole->id, 'module_id' => $modules['hosts.index']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 0, 'is_delete' => 0], // Hosts
            ['role_id' => $userRole->id, 'module_id' => $modules['hosts.create']->id ?? null, 'is_add' => 0, 'is_view' => 0, 'is_update' => 0, 'is_delete' => 0], // Hosts
            ['role_id' => $userRole->id, 'module_id' => $submenus['memberships.index']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // All Memberships (memberships.index)
            ['role_id' => $userRole->id, 'module_id' => $submenus['referrals.index']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // All Referrals (referrals.index)
            ['role_id' => $userRole->id, 'module_id' => $submenus['referrals.create']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // Add Referral (referrals.create)
            ['role_id' => $userRole->id, 'module_id' => $submenus['contractors.index']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // All Contractors (contractors.index)
            ['role_id' => $userRole->id, 'module_id' => $submenus['contractors.create']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // Add Contractor (contractors.create)
            ['role_id' => $userRole->id, 'module_id' => $submenus['services.index']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // All Services (services.index)
            ['role_id' => $userRole->id, 'module_id' => $submenus['services.create']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // Add Service (services.create)
            ['role_id' => $userRole->id, 'module_id' => $modules['services-categories.create']->id ?? null, 'is_add' => 1, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // services categories
            ['role_id' => $userRole->id, 'module_id' => $modules['services-categories.index']->id ?? null, 'is_add' => 1, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // all services categories
            ['role_id' => $userRole->id, 'module_id' => $submenus['products.index']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // All Products (products.index)
            ['role_id' => $userRole->id, 'module_id' => $submenus['products.create']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // Add Product (products.create)
            ['role_id' => $userRole->id, 'module_id' => $submenus['orders.index']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // All Orders (orders.index)
            ['role_id' => $userRole->id, 'module_id' => $submenus['contractor-approval.index']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // All Contractor Approval (contractor-approval.index)


            // user modules
            ['role_id' => $leagueContractorRole->id, 'module_id' => $modules['dashboard']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 0, 'is_delete' => 0], // Dashboard
            ['role_id' => $leagueContractorRole->id, 'module_id' => $modules['users']->id ?? null, 'is_add' => 0, 'is_view' => 0, 'is_update' => 0, 'is_delete' => 0], // Users
            ['role_id' => $leagueContractorRole->id, 'module_id' => $modules['hosts']->id ?? null, 'is_add' => 1, 'is_view' => 1, 'is_update' => 0, 'is_delete' => 0], // Hosts
            ['role_id' => $leagueContractorRole->id, 'module_id' => $modules['memberships']->id ?? null, 'is_add' => 0, 'is_view' => 0, 'is_update' => 1, 'is_delete' => 0], // Memberships
            ['role_id' => $leagueContractorRole->id, 'module_id' => $modules['payments']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 0, 'is_delete' => 0], // payments
            ['role_id' => $leagueContractorRole->id, 'module_id' => $modules['referrals']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // referrals
            ['role_id' => $leagueContractorRole->id, 'module_id' => $modules['contractors']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // contractors
            ['role_id' => $leagueContractorRole->id, 'module_id' => $modules['services']->id ?? null, 'is_add' => 1, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // services
            ['role_id' => $leagueContractorRole->id, 'module_id' => $modules['products']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // products
            ['role_id' => $leagueContractorRole->id, 'module_id' => $modules['orders']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // orders
            ['role_id' => $leagueContractorRole->id, 'module_id' => $modules['contractor_approval']->id ?? null, 'is_add' => 0, 'is_view' => 0, 'is_update' => 1, 'is_delete' => 0], // contractor approval
            // Submenus
            ['role_id' => $leagueContractorRole->id, 'module_id' => $submenus['users.index']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // All Users (users.index)
            ['role_id' => $leagueContractorRole->id, 'module_id' => $submenus['users.create']->id ?? null, 'is_add' => 0, 'is_view' => 0, 'is_update' => 0, 'is_delete' => 0], // Add User (users.create)
            ['role_id' => $leagueContractorRole->id, 'module_id' => $modules['hosts.index']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 0, 'is_delete' => 0], // Hosts
            ['role_id' => $leagueContractorRole->id, 'module_id' => $modules['hosts.create']->id ?? null, 'is_add' => 0, 'is_view' => 0, 'is_update' => 0, 'is_delete' => 0], // Hosts
            ['role_id' => $leagueContractorRole->id, 'module_id' => $submenus['memberships.index']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // All Memberships (memberships.index)
            ['role_id' => $leagueContractorRole->id, 'module_id' => $submenus['referrals.index']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // All Referrals (referrals.index)
            ['role_id' => $leagueContractorRole->id, 'module_id' => $submenus['referrals.create']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // Add Referral (referrals.create)
            ['role_id' => $leagueContractorRole->id, 'module_id' => $submenus['contractors.index']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // All Contractors (contractors.index)
            ['role_id' => $leagueContractorRole->id, 'module_id' => $submenus['contractors.create']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // Add Contractor (contractors.create)
            ['role_id' => $leagueContractorRole->id, 'module_id' => $submenus['services.index']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // All Services (services.index)
            ['role_id' => $leagueContractorRole->id, 'module_id' => $submenus['services.create']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // Add Service (services.create)
            ['role_id' => $leagueContractorRole->id, 'module_id' => $modules['services-categories.create']->id ?? null, 'is_add' => 1, 'is_view' => 0, 'is_update' => 1, 'is_delete' => 0], // services categories
            ['role_id' => $leagueContractorRole->id, 'module_id' => $modules['services-categories.index']->id ?? null, 'is_add' => 1, 'is_view' => 0, 'is_update' => 1, 'is_delete' => 0], // all services categories
            ['role_id' => $leagueContractorRole->id, 'module_id' => $submenus['products.index']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // All Products (products.index)
            ['role_id' => $leagueContractorRole->id, 'module_id' => $submenus['products.create']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // Add Product (products.create)
            ['role_id' => $leagueContractorRole->id, 'module_id' => $submenus['orders.index']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // All Orders (orders.index)
            ['role_id' => $leagueContractorRole->id, 'module_id' => $submenus['contractor-approval.index']->id ?? null, 'is_add' => 0, 'is_view' => 0, 'is_update' => 1, 'is_delete' => 0], // All Contractor Approval (contractor-approval.index)
        ];

        foreach ($permissions as $perm) {
            // Skip if module not found
            if ($perm['module_id'] === null) {
                continue;
            }

            CmsModulePermission::firstOrCreate(
                [
                    'role_id' => $perm['role_id'],
                    'module_id' => $perm['module_id']
                ],
                $perm
            );
        }
    }
}
