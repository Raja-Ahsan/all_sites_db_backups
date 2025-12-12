<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\ServiceCategory;

class ServiceCategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $serviceCategories = ServiceCategory::all();
        return view('screens.admin.services.services-categories', compact('serviceCategories'));
        
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('screens.admin.services.create-services-categories');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)

    {
        $request->validate([
            'name' => 'required|string|max:255',
        ]);

        $serviceCategory = ServiceCategory::create([
            'name'     => $request->name,
        ]);
        
        return response()->json([
            'success' => true,
            'message' => 'Service category created successfully',
            'redirect' => route('services-categories.index')
        ]);
    }

    public function update(Request $request, string $id)
    {
        $request->validate([
            'name' => 'required|string|max:255',
        ]);

        $serviceCategories = ServiceCategory::findOrFail($id);

        $serviceCategories->update([
            'name' => $request->name
        ]);

        return response()->json([
            'success' => true,
            'data' => $serviceCategories,
            'id' => $id,
            'message' => 'Service category updated successfully',
        ]);


    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $serviceCategory = ServiceCategory::find($id);

        $serviceCategory->delete();

        return response()->json([
            'success' => true,
            'message' => 'Service category deleted successfully',
            'data' => $serviceCategory,
            'id' => $id,
            'redirect' => route('services-categories.index')
        ]);
    }
}
