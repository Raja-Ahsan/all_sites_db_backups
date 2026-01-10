<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use App\Models\Company;
use App\Models\Service;
use App\Models\ServiceBooking;
use Illuminate\Http\Request;


class ServiceBookingController extends Controller
{
    public function create($company, $service)
    {
        $company = Company::where('slug', $company)->firstOrFail();
        $service = Service::with('serviceCategory')->where('slug', $service)
            ->where('company_id', $company->id)
            ->firstOrFail();
        return view('screens.web.book-now.index', compact('company', 'service'));
    }

    public function store(Request $request, $company, $service)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|email|max:255',
            'phone' => 'required|string|max:50',
            'message' => 'nullable|string',
        ]);
        $company = Company::where('slug', $company)->firstOrFail();

        $service = Service::where('slug', $service)
            ->where('company_id', $company->id)
            ->firstOrFail();

        ServiceBooking::create([
            'company_id'     => $company->id,
            'service_id'     => $service->id,
            'name'  => $validated['name'],
            'email' => $validated['email'],
            'phone' => $validated['phone'],
            'message' => $validated['message'] ?? null,
        ]);
        return response()->json([
            'success' => true,
            'message' => 'Service Successfully Booked',
        ]);
    }
}
