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
      $user = auth()->user();
      if ($user->hasRole(config('roles.admin'))) {
         $users = User::where('id', '!=', $user->id)->with('roles')->get();
        return view('screens.admin.dashboard.admin', compact('users'));
      }
      if ($user->hasRole(config('roles.user'))) {
        return view('screens.admin.dashboard.user');
      }
      if ($user->hasRole(config('roles.company'))) {
        return view('screens.admin.dashboard.league-contractor');
      }

      abort(403, 'No dashboard assigned to this role');
   }
}
