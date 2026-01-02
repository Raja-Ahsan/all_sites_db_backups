<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Package;
use App\Models\Subscription;


class CheckoutPurchaseController extends Controller
{
    public function fakePayment()
    {
        $user = auth()->user();
        $packageId = session('selected_package');

        if (!$packageId) {
            return back()->with('error', 'No package selected.');
        }

        if (!auth()->check()) {
            session(['selected_package' => $packageId]);
            return redirect()->route('register');
        }

        $package = Package::find($packageId);

        // Create subscription
        Subscription::create([
            'user_id' => $user->id,
            'package_id' => $package->id,
            'status' => 'active',
            'expiry_date' => now()->addMonth()
        ]);

        // Assign correct spatie role
        $user->syncRoles([]);
        $user->assignRole($package->role_type);
        
        $user->is_league_contractor = $package->role_type === 'league_contractor';
        $user->save();
    
        // THEN: company logic
        if ($package->role_type === 'league_contractor') {
            $company = $user->company;
    
            if ($company) {
                $company->contractor_limit = $package->contractor_limit;
                $company->save();
            }
            // agar company nahi hai to yahan create bhi kar sakte ho (optional)
        }

        session()->forget('selected_package');

        return redirect()->route('admin.dashboard')->with('success', 'Membership activated!');
    }
}
