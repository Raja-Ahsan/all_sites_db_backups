<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Company;

class CompanyController extends Controller
{
    public function index()
    {
        return view('screens.admin.complete-profile.index');
    }
    public function store(Request $request)
    {
        $request->validate([
            'business_name' => 'required|string|max:255',
            'license' => 'required|string|max:255',
            'insurance' => 'required|string|max:255',
            'phone' => 'required|string|max:255',
            'location' => 'required|string',
            'store_name' => 'required|string|max:255',
        ]);

        $company = Company::where('user_id', auth()->id())->first();

        if (!$company) {
            $company = new Company();
            $company->user_id = auth()->id();
        }

        $company->business_name = $request->business_name;
        $company->license = $request->license;
        $company->insurance = $request->insurance;
        $company->phone = $request->phone;
        $company->location = $request->location;
        $company->store_name = $request->store_name;
        $company->is_profile_completed = true;
        $company->is_profile_approved = false;
        $company->is_active = true;


        $company->save();

        return response()->json([
            'success' => true,
            'message' => 'Company profile completed successfully'
        ]);
    }

    public function toggleActive(Request $request)
    {
        $company = Company::findOrFail($request->id);
        $company->is_active = $request->status;
        $company->save();

        return response()->json([
            'success' => true,
            'message' => $request->status ? 'Contractor activated' : 'Contractor deactivated'
        ]);
    }
}
