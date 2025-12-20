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
        $request->validate(
            [
                'title' => 'required|string|max:255',
                'image' => 'required|image|mimes:jpg,jpeg,png,webp|max:2048',
                'service_category_id' => 'required|exists:service_categories,id',
            ],
            [
                'service_category_id.required' => 'The category field is required.',
            ]
        );

        $companyId = auth()->user()->company->id ?? null;

        $mainImagePath = null;
        if ($request->hasFile('image')) {
            $mainImagePath = $request->file('image')->store('services/main', 'public');
        }

        $service = Service::create([
            'title' => $request->title,
            'user_id' => auth()->user()->id,
            'company_id' => $companyId,
            'service_category_id' => $request->service_category_id,
            'duration' => $request->duration ?? 5,
            'description' => $request->description,
            'image' => $mainImagePath,
        ]);

        return response()->json([
            'success' => true,
            'message' => 'Service Created Successfully',
            'redirect' => route('services.index'),
        ]);
    }

    public function show($id) {
        $serviceCategories = ServiceCategory::all();
        $service = Service::with('serviceCategory')->find($id);
        return view('screens.admin.services.show', compact('service', 'serviceCategories'));
    }

    public function destroy($id)
    {
        $service = Service::find($id);
        $service->delete();
        return response()->json([
            'success' => true,
            'message' => 'Service Deleted Successfully',
        ]);
    }
}
