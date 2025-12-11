<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ServiceController extends Controller
{
    public function index() {
        return view('screens.admin.services.index');
    }
    public function create() {
        return view('screens.admin.services.create');
    }

    
    

}
