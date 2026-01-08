<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;

class MarketPlaceController extends Controller
{
    public function index()
    {
        $user = current_user();
        $contractors = User::where(function ($query) {
            $query->where('is_individual_contractor', 1)
                ->orWhere('is_league_contractor', 1);
        })
            ->whereHas('company', function ($query) {
                $query->where('is_profile_approved', true);
            })
            ->with('company')
            ->get();
        return view('screens.web.marketplace.index', compact('contractors'));
    }
}
