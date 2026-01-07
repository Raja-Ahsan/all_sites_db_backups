<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use App\Models\CompanyContractor;



class DashboardController extends Controller
{
    public function index()
   {
      $user = current_user();
      if ($user->hasRole(config('roles.admin'))) {
         $users = User::where('id', '!=', $user->id)->with('roles')->get();
        return view('screens.admin.dashboard.admin', compact('users'));
      }
      if ($user->hasRole(config('roles.user'))) {
        return view('screens.admin.dashboard.user');
      }
      if ($user->hasRole(config('roles.league_contractor'))) {
        $totalContractors = $user->createdUsers->count();
        $totalServices = $user->company->services->count();
        return view('screens.admin.dashboard.league-contractor', compact('totalContractors', 'totalServices'));
      }

      abort(403, 'No dashboard assigned to this role');
   }
}
