<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ReferralController extends Controller
{
    public function index() {
        return view('screens.admin.referrals.index');
    }
    // public function create() {
    //     return view('screens.admin.referrals.create');
    // }
}
