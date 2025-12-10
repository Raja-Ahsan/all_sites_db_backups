<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\CmsModulePermission;
use App\Models\CmsModule;

class CmsModulePermissions extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        CmsModulePermission::truncate();
        
        // Get modules by route_name to avoid hard-coded IDs
        $modules = [
            'dashboard' => CmsModule::where('route_name', 'admin.dashboard')->first(),
            'users' => CmsModule::where('route_name', 'users-module')->first(),
            'memberships' => CmsModule::where('route_name', 'memberships-module')->first(),
            'payments' => CmsModule::where('route_name', 'payments')->first(),
            'referrals' => CmsModule::where('route_name', 'referrals-module')->first(),
            'contractors' => CmsModule::where('route_name', 'contractors-module')->first(),
            'services' => CmsModule::where('route_name', 'services-module')->first(),
            'products' => CmsModule::where('route_name', 'products-module')->first(),
            'orders' => CmsModule::where('route_name', 'orders-module')->first(),
            'contractor_approval' => CmsModule::where('route_name', 'contractor-approval')->first(),
        ];
        
        // Get submenus by route_name
        $submenus = [
            'users.index' => CmsModule::where('route_name', 'users.index')->first(),
            'users.create' => CmsModule::where('route_name', 'users.create')->first(),
            'memberships.index' => CmsModule::where('route_name', 'memberships.index')->first(),
            'referrals.index' => CmsModule::where('route_name', 'referrals.index')->first(),
            'referrals.create' => CmsModule::where('route_name', 'referrals.create')->first(),
            'contractors.index' => CmsModule::where('route_name', 'contractors.index')->first(),
            'contractors.create' => CmsModule::where('route_name', 'contractors.create')->first(),
            'services.index' => CmsModule::where('route_name', 'services.index')->first(),
            'services.create' => CmsModule::where('route_name', 'services.create')->first(),
            'products.index' => CmsModule::where('route_name', 'products.index')->first(),
            'products.create' => CmsModule::where('route_name', 'products.create')->first(),
            'orders.index' => CmsModule::where('route_name', 'orders.index')->first(),
            'contractor-approval.index' => CmsModule::where('route_name', 'contractor-approval.index')->first(),
        ];
        
        $permissions = [
            // Super Admin Role 1
            ['role_id' => 1, 'module_id' => $modules['dashboard']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 0, 'is_delete' => 0], // Dashboard
            ['role_id' => 1, 'module_id' => $modules['users']->id ?? null, 'is_add' => 1, 'is_view' => 1, 'is_update' => 0, 'is_delete' => 0], // Users
            ['role_id' => 1, 'module_id' => $modules['memberships']->id ?? null, 'is_add' => 1, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 1], // Memberships
            ['role_id' => 1, 'module_id' => $modules['payments']->id ?? null, 'is_add' => 0, 'is_view' => 0, 'is_update' => 0, 'is_delete' => 0], // payments
            ['role_id' => 1, 'module_id' => $modules['referrals']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // referrals
            ['role_id' => 1, 'module_id' => $modules['contractors']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // contractors
            ['role_id' => 1, 'module_id' => $modules['services']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // services
            ['role_id' => 1, 'module_id' => $modules['products']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // products
            ['role_id' => 1, 'module_id' => $modules['orders']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // orders
            ['role_id' => 1, 'module_id' => $modules['contractor_approval']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // contractor approval
            // Submenus
            ['role_id' => 1, 'module_id' => $submenus['users.index']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // All Users (users.index)
            ['role_id' => 1, 'module_id' => $submenus['users.create']->id ?? null, 'is_add' => 0, 'is_view' => 0, 'is_update' => 0, 'is_delete' => 0], // Add User (users.create)
            ['role_id' => 1, 'module_id' => $submenus['memberships.index']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // All Memberships (memberships.index)
            ['role_id' => 1, 'module_id' => $submenus['referrals.index']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // All Referrals (referrals.index)
            ['role_id' => 1, 'module_id' => $submenus['referrals.create']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // Add Referral (referrals.create)
            ['role_id' => 1, 'module_id' => $submenus['contractors.index']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // All Contractors (contractors.index)
            ['role_id' => 1, 'module_id' => $submenus['contractors.create']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // Add Contractor (contractors.create)
            ['role_id' => 1, 'module_id' => $submenus['services.index']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // All Services (services.index)
            ['role_id' => 1, 'module_id' => $submenus['services.create']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // Add Service (services.create)
            ['role_id' => 1, 'module_id' => $submenus['products.index']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // All Products (products.index)
            ['role_id' => 1, 'module_id' => $submenus['orders.index']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // All Orders (orders.index)
            ['role_id' => 1, 'module_id' => $submenus['contractor-approval.index']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // All Contractor Approval (contractor-approval.index)
            // Submenus permissions end





            // contractor Role 2
            ['role_id' => 2, 'module_id' => $modules['dashboard']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 0, 'is_delete' => 0], // Dashboard
            ['role_id' => 2, 'module_id' => $modules['users']->id ?? null, 'is_add' => 0, 'is_view' => 0, 'is_update' => 0, 'is_delete' => 0], // Users
            ['role_id' => 2, 'module_id' => $modules['memberships']->id ?? null, 'is_add' => 1, 'is_view' => 0, 'is_update' => 0, 'is_delete' => 0], // Memberships
            ['role_id' => 2, 'module_id' => $modules['payments']->id ?? null, 'is_add' => 1, 'is_view' => 1, 'is_update' => 0, 'is_delete' => 0], // payments
            ['role_id' => 2, 'module_id' => $modules['referrals']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 0, 'is_delete' => 0], // referrals
            ['role_id' => 2, 'module_id' => $modules['contractors']->id ?? null, 'is_add' => 0, 'is_view' => 0, 'is_update' => 1, 'is_delete' => 0], // contractors
            ['role_id' => 2, 'module_id' => $modules['services']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // services
            ['role_id' => 2, 'module_id' => $modules['products']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // products
            ['role_id' => 2, 'module_id' => $modules['orders']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // orders
            ['role_id' => 2, 'module_id' => $modules['contractor_approval']->id ?? null, 'is_add' => 0, 'is_view' => 0, 'is_update' => 0, 'is_delete' => 0], // contractor approval

            // Submenus for contractor Role 2
            ['role_id' => 2, 'module_id' => $submenus['users.index']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 0, 'is_delete' => 0], // All Users
            ['role_id' => 2, 'module_id' => $submenus['memberships.index']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // All Memberships
            ['role_id' => 2, 'module_id' => $submenus['referrals.index']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // All Referrals
            ['role_id' => 2, 'module_id' => $submenus['contractors.index']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // All Contractors
            ['role_id' => 2, 'module_id' => $submenus['services.index']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // All Services
            ['role_id' => 2, 'module_id' => $submenus['products.index']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // All Products
            ['role_id' => 2, 'module_id' => $submenus['orders.index']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // All Orders
            ['role_id' => 2, 'module_id' => $submenus['contractor-approval.index']->id ?? null, 'is_add' => 0, 'is_view' => 0, 'is_update' => 0, 'is_delete' => 0], // All Contractor Approval (contractor-approval.index)

            // customer Role 3
            ['role_id' => 3, 'module_id' => $modules['dashboard']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 0, 'is_delete' => 0], // Dashboard
            ['role_id' => 3, 'module_id' => $modules['users']->id ?? null, 'is_add' => 0, 'is_view' => 0, 'is_update' => 0, 'is_delete' => 0], // Users
            ['role_id' => 3, 'module_id' => $modules['memberships']->id ?? null, 'is_add' => 1, 'is_view' => 0, 'is_update' => 1, 'is_delete' => 1], // Memberships
            ['role_id' => 3, 'module_id' => $modules['payments']->id ?? null, 'is_add' => 1, 'is_view' => 0, 'is_update' => 1, 'is_delete' => 1], // payments
            ['role_id' => 3, 'module_id' => $modules['referrals']->id ?? null, 'is_add' => 0, 'is_view' => 0, 'is_update' => 1, 'is_delete' => 0], // referrals
            ['role_id' => 3, 'module_id' => $modules['contractors']->id ?? null, 'is_add' => 0, 'is_view' => 0, 'is_update' => 1, 'is_delete' => 0], // contractors
            ['role_id' => 3, 'module_id' => $modules['services']->id ?? null, 'is_add' => 0, 'is_view' => 0, 'is_update' => 1, 'is_delete' => 0], // services
            ['role_id' => 3, 'module_id' => $modules['products']->id ?? null, 'is_add' => 0, 'is_view' => 0, 'is_update' => 1, 'is_delete' => 0], // products
            ['role_id' => 3, 'module_id' => $modules['orders']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // orders
            ['role_id' => 3, 'module_id' => $modules['contractor_approval']->id ?? null, 'is_add' => 0, 'is_view' => 0, 'is_update' => 0, 'is_delete' => 0], // contractor approval

            // Submenus for customer Role 3
            ['role_id' => 3, 'module_id' => $submenus['users.index']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 0, 'is_delete' => 0], // All Users
            ['role_id' => 3, 'module_id' => $submenus['memberships.index']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // All Memberships
            ['role_id' => 3, 'module_id' => $submenus['referrals.index']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // All Referrals
            ['role_id' => 3, 'module_id' => $submenus['contractors.index']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // All Contractors
            ['role_id' => 3, 'module_id' => $submenus['services.index']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // All Services
            ['role_id' => 3, 'module_id' => $submenus['products.index']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // All Products
            ['role_id' => 3, 'module_id' => $submenus['orders.index']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // All Orders
            ['role_id' => 3, 'module_id' => $submenus['contractor-approval.index']->id ?? null, 'is_add' => 0, 'is_view' => 0, 'is_update' => 0, 'is_delete' => 0], // All Contractor Approval (contractor-approval.index)

            // league contractor Role 4
            ['role_id' => 4, 'module_id' => $modules['dashboard']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 0, 'is_delete' => 0], // Dashboard
            ['role_id' => 4, 'module_id' => $modules['users']->id ?? null, 'is_add' => 0, 'is_view' => 0, 'is_update' => 0, 'is_delete' => 0], // Users
            ['role_id' => 4, 'module_id' => $modules['memberships']->id ?? null, 'is_add' => 0, 'is_view' => 0, 'is_update' => 0, 'is_delete' => 0], // Memberships
            ['role_id' => 4, 'module_id' => $modules['payments']->id ?? null, 'is_add' => 0, 'is_view' => 0, 'is_update' => 0, 'is_delete' => 0], // payments
            ['role_id' => 4, 'module_id' => $modules['referrals']->id ?? null, 'is_add' => 0, 'is_view' => 0, 'is_update' => 0, 'is_delete' => 0], // referrals
            ['role_id' => 4, 'module_id' => $modules['contractors']->id ?? null, 'is_add' => 1, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // contractors
            ['role_id' => 4, 'module_id' => $modules['services']->id ?? null, 'is_add' => 1, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 1], // services
            ['role_id' => 4, 'module_id' => $modules['products']->id ?? null, 'is_add' => 1, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 1], // products
            ['role_id' => 4, 'module_id' => $modules['orders']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // orders
            ['role_id' => 4, 'module_id' => $modules['contractor_approval']->id ?? null, 'is_add' => 0, 'is_view' => 0, 'is_update' => 0, 'is_delete' => 0], // contractor approval

            // Submenus for league contractor Role 4
            ['role_id' => 4, 'module_id' => $submenus['users.index']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 0, 'is_delete' => 0], // All Users
            ['role_id' => 4, 'module_id' => $submenus['contractors.index']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // All Contractors
            ['role_id' => 4, 'module_id' => $submenus['contractors.create']->id ?? null, 'is_add' => 1, 'is_view' => 1, 'is_update' => 0, 'is_delete' => 0], // Add Contractor
            ['role_id' => 4, 'module_id' => $submenus['services.index']->id ?? null, 'is_add' => 1, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 1], // All Services
            ['role_id' => 4, 'module_id' => $submenus['services.create']->id ?? null, 'is_add' => 1, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 1], // Add Service
            ['role_id' => 4, 'module_id' => $submenus['products.index']->id ?? null, 'is_add' => 1, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 1], // All Products
            ['role_id' => 4, 'module_id' => $submenus['orders.index']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // All Orders
            ['role_id' => 4, 'module_id' => $submenus['contractor-approval.index']->id ?? null, 'is_add' => 0, 'is_view' => 0, 'is_update' => 0, 'is_delete' => 0], // All Contractor Approval (contractor-approval.index)


            // individual contractor Role 5
            ['role_id' => 5, 'module_id' => $modules['dashboard']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 0, 'is_delete' => 0], // Dashboard
            ['role_id' => 5, 'module_id' => $modules['users']->id ?? null, 'is_add' => 0, 'is_view' => 0, 'is_update' => 0, 'is_delete' => 0], // Users
            ['role_id' => 5, 'module_id' => $modules['memberships']->id ?? null, 'is_add' => 1, 'is_view' => 0, 'is_update' => 1, 'is_delete' => 1], // Memberships
            ['role_id' => 5, 'module_id' => $modules['payments']->id ?? null, 'is_add' => 1, 'is_view' => 0, 'is_update' => 1, 'is_delete' => 1], // payments
            ['role_id' => 5, 'module_id' => $modules['referrals']->id ?? null, 'is_add' => 0, 'is_view' => 0, 'is_update' => 1, 'is_delete' => 0], // referrals
            ['role_id' => 5, 'module_id' => $modules['contractors']->id ?? null, 'is_add' => 0, 'is_view' => 0, 'is_update' => 1, 'is_delete' => 0], // contractors
            ['role_id' => 5, 'module_id' => $modules['services']->id ?? null, 'is_add' => 0, 'is_view' => 0, 'is_update' => 1, 'is_delete' => 0], // services
            ['role_id' => 5, 'module_id' => $modules['products']->id ?? null, 'is_add' => 0, 'is_view' => 0, 'is_update' => 1, 'is_delete' => 0], // products
            ['role_id' => 5, 'module_id' => $modules['orders']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // orders
            ['role_id' => 5, 'module_id' => $modules['contractor_approval']->id ?? null, 'is_add' => 0, 'is_view' => 0, 'is_update' => 0, 'is_delete' => 0], // contractor approval

            // Submenus for indi Role 5
            ['role_id' => 5, 'module_id' => $submenus['users.index']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 0, 'is_delete' => 0], // All Users
            ['role_id' => 5, 'module_id' => $submenus['memberships.index']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // All Memberships
            ['role_id' => 5, 'module_id' => $submenus['referrals.index']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // All Referrals
            ['role_id' => 5, 'module_id' => $submenus['contractors.index']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // All Contractors
            ['role_id' => 5, 'module_id' => $submenus['services.index']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // All Services
            ['role_id' => 5, 'module_id' => $submenus['products.index']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // All Products
            ['role_id' => 5, 'module_id' => $submenus['orders.index']->id ?? null, 'is_add' => 0, 'is_view' => 1, 'is_update' => 1, 'is_delete' => 0], // All Orders
            ['role_id' => 5, 'module_id' => $submenus['contractor-approval.index']->id ?? null, 'is_add' => 0, 'is_view' => 0, 'is_update' => 0, 'is_delete' => 0], // All Contractor Approval (contractor-approval.index)
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
