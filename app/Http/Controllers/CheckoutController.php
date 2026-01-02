<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Package;
use App\Models\Subscription;
use App\Models\User;

class CheckoutController extends Controller
{
    public function show()
    {
        $package = Package::find(session('selected_package'));
        return view('checkout', compact('package'));
    }

    public function fakePayment()
    {
        $user = auth()->user();
        $package = Package::find(session('selected_package'));

        // Save subscription
        Subscription::create([
            'user_id' => $user->id,
            'package_id' => $package->id,
            'status' => 'active',
            'expiry_date' => now()->addMonth(),
        ]);

        // Remove old roles
        $user->syncRoles([]);

        // Assign role from package
        $user->assignRole($package->role_type);

        // If league contractor, create company record
        if ($package->role_type == config('roles.company')) {
            $user->company()->create([
                'contractor_limit' => $package->contractor_limit,
            ]);
        }

        session()->forget('selected_package');

        return redirect()->route('dashboard')
            ->with('success', 'Package purchased successfully');
    }
}
