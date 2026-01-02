<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Package;

class PackageController extends Controller
{
    public function index()
    {
        $packages = Package::all();
        return view('screens.web.packages.index', compact('packages'));
    }

    public function select(Package $package)
    {
        session(['selected_package' => $package->id]);
        // return redirect()->route('checkout');
        return response()->json([
            'success' => true,
            'package' => $package
        ]);
    }
}
