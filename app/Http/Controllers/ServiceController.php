<?php

namespace App\Http\Controllers;

use App\Models\Service;
use App\Models\ServiceCategory;
use Illuminate\Http\Request;

class ServiceController extends Controller
{
    public function index()
    {
        $services = Service::with('serviceCategory')->get();
        return view('screens.admin.services.index', compact('services'));
    }
    public function create()
    {
        $serviceCategories = ServiceCategory::all();
        return view('screens.admin.services.create', compact('serviceCategories'));
    }

    public function store(Request $request)
    {

        $request->validate([
            'title' => 'required|string|max:255',
        ]);

        $companyId = auth()->user()->company->id ?? null;

        $service = Service::create([
            'title' => $request->title,
            'user_id' => auth()->user()->id,
            'company_id' => $companyId,
            'service_category_id' => $request->service_category_id,
            'duration' => $request->duration ?? 5,
            'description' => $request->description,
        ]);

        return response()->json([
            'success' => true,
            'message' => 'Service Created Successfully',
            'redirect' => route('services.index'),
        ]);
    }
}
