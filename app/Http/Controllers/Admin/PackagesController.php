<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Package;
use Illuminate\Http\Request;
use Inertia\Inertia;

class PackagesController extends Controller
{
    // auto generate packages in stripe 
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return Inertia::render('admin/packages/Index', [
            'packages' => Package::paginate(10)
        ]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return Inertia::render('admin/packages/Create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $data = $request->validate([
            'name' => 'required|string',
            'badge' => 'nullable|string',
            'price_cents' => 'nullable|integer|min:0',
            'words_limit' => 'nullable|integer|min:0',
            'stories_limit' => 'nullable|integer|min:0',
            'interval' => 'nullable|string|in:monthly,yearly',
            'features' => 'nullable|array',
            'stripe_price_id' => 'required|string',
            'is_active' => 'boolean',
        ]);
        
        // Ensure features is always an array
        if (isset($data['features'])) {
            $data['features'] = is_array($data['features']) ? $data['features'] : [];
        } else {
            $data['features'] = [];
        }
        
        // Set default values
        $data['is_active'] = $data['is_active'] ?? true;
        
        Package::create($data);
        return redirect()->route('admin-dashboard.packages.index')
    ->with('success', 'Package created successfully.');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $package = Package::findOrFail($id);
        
        return Inertia::render('admin/packages/Show', [
            'package' => $package
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        $package = Package::findOrFail($id);
        
        return Inertia::render('admin/packages/Edit', [
            'package' => $package
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Package $package)
    {
        $data = $request->validate([
            'name' => 'required|string',
            'badge' => 'nullable|string',
            'price_cents' => 'nullable|integer|min:0',
            'interval' => 'nullable|string',
            'words_limit' => 'nullable|integer',
            'stories_limit' => 'nullable|integer',
            'features' => 'nullable|array',
            'stripe_price_id' => 'required|string',
            'is_active' => 'nullable|boolean',
        ]);
        
        // Ensure features is always an array
        if (isset($data['features'])) {
            $data['features'] = is_array($data['features']) ? $data['features'] : [];
        } else {
            $data['features'] = [];
        }
        
        $package->update($data);
        return back()->with('success', 'Package updated successfully.');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Package $package)
    {
        $package->delete();
        return back()->with('success', 'Package deleted successfully.');
    }
}
