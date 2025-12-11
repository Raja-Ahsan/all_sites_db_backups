<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\CmsModule;

class CmsModuleSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        CmsModule::truncate();

        // Parent modules
        $dashboard = CmsModule::firstOrCreate([
            'route_name' => 'admin.dashboard'
        ], [
            'name' => 'Dashboard',
            'icon' => 'fa-regular fa-house',
            'sort_order' => 1,
            'status' => 'active',
            'parent_id' => 0,
        ]);

        $users = CmsModule::firstOrCreate([
            'route_name' => 'users-module'
        ], [
            'name' => 'Users',
            'icon' => 'fa-solid fa-users',
            'sort_order' => 2,
            'status' => 'active',
            'parent_id' => 0,
        ]);

        $memberships = CmsModule::firstOrCreate([
            'route_name' => 'memberships-module'
        ], [
            'name' => 'Memberships',
            'icon' => 'fa-solid fa-users-gear',
            'sort_order' => 3,
            'status' => 'active',
            'parent_id' => 0,
        ]);

        $payments = CmsModule::firstOrCreate([
            'route_name' => 'payments'
        ], [
            'name' => 'Payments',
            'icon' => 'fa-solid fa-credit-card',
            'sort_order' => 4,
            'status' => 'active',
            'parent_id' => 0,
        ]);

        $referrals = CmsModule::firstOrCreate([
            'route_name' => 'referrals-module'
        ], [
            'name' => 'Referrals',
            'icon' => 'fa-solid fa-share-nodes',
            'sort_order' => 5,
            'status' => 'active',
            'parent_id' => 0,
        ]);

        $contractors = CmsModule::firstOrCreate([
            'route_name' => 'contractors-module'
        ], [
            'name' => 'Contractors',
            'icon' => 'fa-solid fa-user-tie',
            'sort_order' => 6,
            'status' => 'active',
            'parent_id' => 0,
        ]);

        $services = CmsModule::firstOrCreate([
            'route_name' => 'services-module'
        ], [
            'name' => 'Services',
            'icon' => 'fa-solid fa-screwdriver-wrench',
            'sort_order' => 7,
            'status' => 'active',
            'parent_id' => 0,
        ]);

        $products = CmsModule::firstOrCreate([
            'route_name' => 'products-module'
        ], [
            'name' => 'Products',
            'icon' => 'fa-solid fa-boxes-packing',
            'sort_order' => 8,
            'status' => 'active',
            'parent_id' => 0,
        ]);
        
        $orders = CmsModule::firstOrCreate([
            'route_name' => 'orders-module'
        ], [
            'name' => 'Orders',
            'icon' => 'fa-solid fa-list-ul',
            'sort_order' => 9,
            'status' => 'active',
            'parent_id' => 0,
        ]);

       

        // submenus 
        // users submenu start
        CmsModule::firstOrCreate([
            'route_name' => 'users.index'
        ], [
            'name' => 'All Users',
            'icon' => 'fa-solid fa-list-ul',
            'sort_order' => 1,
            'status' => 'active',
            'parent_id' => $users->id,
        ]);
        CmsModule::firstOrCreate([
            'route_name' => 'users.create'
        ], [
            'name' => 'Add User',
            'icon' => 'fa-solid fa-circle-plus',
            'sort_order' => 2,
            'status' => 'active',
            'parent_id' => $users->id,
        ]);

        // users submenu end
        CmsModule::firstOrCreate([
            'route_name' => 'memberships.index'
        ], [
            'name' => 'All Memberships',
            'icon' => 'fa-solid fa-list-ul',
            'sort_order' => 2,
            'status' => 'active',
            'parent_id' => $memberships->id,
        ]);

        CmsModule::firstOrCreate([
            'route_name' => 'referrals.index'
        ], [
            'name' => 'All Referrals',
            'icon' => 'fa-solid fa-list-ul',
            'sort_order' => 1,
            'status' => 'active',
            'parent_id' => $referrals->id,
        ]);
        CmsModule::firstOrCreate([
            'route_name' => 'referrals.create'
        ], [
            'name' => 'Add Referral',
            'icon' => 'fa-solid fa-share-nodes',
            'sort_order' => 2,
            'status' => 'active',
            'parent_id' => $referrals->id,
        ]);

        CmsModule::firstOrCreate([
            'route_name' => 'contractors.index'
        ], [
            'name' => 'All Contractors',
            'icon' => 'fa-solid fa-list-ul',
            'sort_order' => 1,
            'status' => 'active',
            'parent_id' => $contractors->id,
        ]);
        CmsModule::firstOrCreate([
            'route_name' => 'contractors.create'
        ], [
            'name' => 'Add Contractor',
            'icon' => 'fa-solid fa-user-tie',
            'sort_order' => 2,
            'status' => 'active',
            'parent_id' => $contractors->id,
        ]);

        CmsModule::firstOrCreate([
            'route_name' => 'services.index'
        ], [
            'name' => 'All Services',
            'icon' => 'fa-solid fa-list-ul',
            'sort_order' => 1,
            'status' => 'active',
            'parent_id' => $services->id,
        ]);
        CmsModule::firstOrCreate([
            'route_name' => 'services.create'
        ], [
            'name' => 'Add Service',
            'icon' => 'fa-solid fa-screwdriver-wrench',
            'sort_order' => 2,
            'status' => 'active',
            'parent_id' => $services->id,
        ]);

        CmsModule::firstOrCreate([
            'route_name' => 'services-categories.create'
        ], [
            'name' => 'Create Category',
            'icon' => 'fa-solid fa-list-ul',
            'sort_order' => 3,
            'status' => 'active',
            'parent_id' => $services->id,
        ]);
        CmsModule::firstOrCreate([
            'route_name' => 'services-categories.index'
        ], [
            'name' => 'All Categories',
            'icon' => 'fa-solid fa-list-ul',
            'sort_order' => 4,
            'status' => 'active',
            'parent_id' => $services->id,
        ]);
        CmsModule::firstOrCreate([
            'route_name' => 'products.index'
        ], [
            'name' => 'All Products',
            'icon' => 'fa-solid fa-boxes-packing',
            'sort_order' => 1,
            'status' => 'active',
            'parent_id' => $products->id,
        ]);

        CmsModule::firstOrCreate([
            'route_name' => 'products.create'
        ], [
            'name' => 'Add Product',
            'icon' => 'fa-solid fa-boxes-packing',
            'sort_order' => 2,
            'status' => 'active',
            'parent_id' => $products->id,
        ]);

        CmsModule::firstOrCreate([
            'route_name' => 'orders.index'
        ], [
            'name' => 'All Orders',
            'icon' => 'fa-solid fa-list-ul',
            'sort_order' => 1,
            'status' => 'active',
            'parent_id' => $orders->id,
        ]);

        CmsModule::firstOrCreate([
            'route_name' => 'contractor-approval.index'
        ], [
            'name' => 'Pending Contractors',
            'icon' => 'fa-solid fa-user-check',
            'sort_order' => 1,
            'status' => 'active',
            'parent_id' => $contractors->id,
        ]);

        
    }
}
