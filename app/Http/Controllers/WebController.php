<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\Service;
// use App\Models\ServiceCategory;
// use App\Models\ServiceImage;


class WebController extends Controller
{
    public function servicesIndex()
    {
        $services = Service::with('serviceCategory', 'user')->get();
        return view('screens.web.services.index', compact('services'));
    }
}
