<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Service;
use App\Models\Company;

class ServiceController extends Controller
{
    public function index(Request $request)
    {
        $services = Service::with('serviceCategory', 'user')->paginate(12);

        if ($request->ajax()) {
            $view = view('screens.web.services.list', compact('services'))->render();
            return response()->json([
                'services' => $view,
                'next_page' => $services->currentPage() + 6,
                'last_page' => $services->lastPage()
            ]);
        }
        return view('screens.web.services.index', compact('services'));
    }

    public function show(Request $request, Company $company, $service)
    {
        $serviceDetail = Service::with([
            'serviceCategory',
            'user',
            'serviceImages',
            'company',
        ])
            ->where('company_id', $company->id)
            ->where('slug', $service)
            ->firstOrFail();

        $services = Service::with('serviceCategory', 'user')
            ->where('company_id', $serviceDetail->company_id)
            ->where('id', '!=', $serviceDetail->id)
            ->paginate(6);
        if ($request->ajax()) {
            return view('screens.web.services.list', compact('services'))->render();
        }
        return view('screens.web.services.show', compact('serviceDetail', 'services'));
    }
}
