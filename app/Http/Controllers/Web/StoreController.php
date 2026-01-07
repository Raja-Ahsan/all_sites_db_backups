<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Service;
use App\Models\Company;

class StoreController extends Controller
{
    public function Index(Request $request, Company $company)
    {
        $services = Service::with(['serviceCategory', 'user', 'serviceImages', 'company'])
            ->where('company_id', $company->id)
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
