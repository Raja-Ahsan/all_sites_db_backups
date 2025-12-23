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
      return view('screens.admin.dashboard.index', compact('user'));
   }
}
