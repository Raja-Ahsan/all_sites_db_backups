<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Service;
// use App\Models\ServiceCategory;
// use App\Models\ServiceImage;


class WebController extends Controller
{
    public function servicesIndex(Request $request)
    {
        $services = Service::with('serviceCategory', 'user')->paginate(9);
        if ($request->ajax()) {
            return view('screens.web.services.list', compact('services'))->render();
        }
        return view('screens.web.services.index', compact('services'));
    }

    public function servicesDetail(Request $request, $id)
    {
        $serviceDetail = Service::with([
            'serviceCategory',
            'user',
            'serviceImages',
            'company',
        ])->findOrFail($id);

        $services = Service::with('serviceCategory', 'user')
        ->where('company_id', $serviceDetail->company_id)
        ->where('id', '!=', $serviceDetail->id)
        ->paginate(6);
        // dd($serviceDetail->toArray());
        // die();
        if ($request->ajax()) {
            return view('screens.web.services.list', compact('services'))->render();
        }
        return view('screens.web.services.show', compact('serviceDetail', 'services'));
    }

    public function storeIndex(Request $request, $company)
    {
        $services = Service::with(['serviceCategory', 'user', 'serviceImages', 'company'])
            ->where('company_id', $company)
            ->paginate(6);
    
        abort_if($services->isEmpty(), 404);
    
        $storeDetail = $services->first();
    
        if ($request->ajax()) {
            return view('screens.web.services.list', compact('services'))->render();
        }
        // print_r($services->toArray());
        // die();
    
        return view('screens.web.store.index', compact('storeDetail', 'services'));
    }    
}
