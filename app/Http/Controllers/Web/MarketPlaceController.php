<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class MarketPlaceController extends Controller
{
    public function index() {
        $user = current_user();
        $contractor = 
        return view('screens.web.marketplace.index');
    }
}
