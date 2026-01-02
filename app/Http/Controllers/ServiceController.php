<?php

namespace App\Http\Controllers;

use App\Models\Service;
use App\Models\ServiceCategory;
use Illuminate\Http\Request;
use App\Models\ServiceImage;
use App\Models\User;
use Illuminate\Support\Facades\Storage;


class ServiceController extends Controller
{
    
    public function userIndex()
    {
        $services = Service::with('serviceCategory', 'user')->get();
        return view('screens.web.services.index', compact('services'));
    }

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
            'images' => 'nullable|array|max:5',
            'image' => 'required|image|mimes:jpg,jpeg,png,webp|max:2048',
            'service_category_id' => 'required|exists:service_categories,id',
        ]);

        $companyId = auth()->user()->company->id ?? null;

        // Handle main image upload
        $mainImagePath = null;
        if ($request->hasFile('image')) {
            $mainImagePath = $request->file('image')->store('services/main', 'public');
        }

        if ($request->hasFile('images') && count($request->file('images')) > 5) {
            return response()->json([
                'success' => false,
                'message' => 'You can upload a maximum of 5 gallery images.',
            ], 422); // Return error with 422 status code
        }

        // Create the service
        $service = Service::create([
            'title' => $request->title,
            'user_id' => auth()->user()->id,
            'company_id' => $companyId,
            'service_category_id' => $request->service_category_id,
            'duration' => $request->duration ?? 5,
            'description' => $request->description,
            'image' => $mainImagePath,
        ]);

        // Handle gallery images upload
        if ($request->hasFile('images')) {
            foreach ($request->file('images') as $image) {
                $path = $image->store('services/gallery', 'public');
                ServiceImage::create([
                    'service_id' => $service->id,
                    'images' => $path,
                ]);
            }
        }


        return response()->json([
            'success' => true,
            'message' => 'Service Created Successfully',
            'redirect' => route('services.index'),
        ]);
    }

    public function edit($id)
    {
        $service = Service::with('serviceCategory')->find($id);
        $serviceCategories = ServiceCategory::all();
        return view('screens.admin.services.edit', compact('service', 'serviceCategories'));
    }

    public function update(Request $request, $id)
    {
        // Validate input
        $request->validate([
            'title' => 'required|string|max:255',
            'service_category_id' => 'required|exists:service_categories,id',
            'images' => 'nullable|array|max:5',
            'images.*' => 'image|mimes:jpg,jpeg,png,webp|max:2048', // Validate image types and sizes
        ]);

        $service = Service::findOrFail($id);

        // Update the service
        $service->update($request->only(['title', 'service_category_id', 'description']));

        // If there are new images, delete old ones and store the new ones
        if ($request->has('images')) {
            foreach ($request->file('images') as $image) {
                $path = $image->store('services/gallery', 'public');
                ServiceImage::create([
                    'service_id' => $service->id,
                    'images' => $path,
                ]);
            }
        }
        return redirect()->route('services.index')->with('success', 'Service Updated Successfully');
    }

    public function deleteImage(Request $request)
    {
        $request->validate([
            'image_id' => 'required|exists:service_images,id',
        ]);

        // Find the image by ID
        $image = ServiceImage::findOrFail($request->image_id);

        // Delete the image file from storage
        Storage::disk('public')->delete($image->images);

        // Delete the record from the database
        $image->delete();

        return response()->json([
            'success' => true,
            'message' => 'Image deleted successfully.',
        ]);
    }

    public function show($id)
    {
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
