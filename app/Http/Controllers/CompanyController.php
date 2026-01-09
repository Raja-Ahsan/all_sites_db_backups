<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Company;
use Illuminate\Validation\Rule;
use Illuminate\Support\Str;


class CompanyController extends Controller
{
    public function index()
    {
        return view('screens.admin.complete-profile.index');
    }
    public function store(Request $request)
    {
        $slug = Str::slug($request->store_name);
        $company = Company::where('user_id', auth()->id())->first();
        $request->merge(['slug' => $slug]);

        $request->validate(
            [
                'business_name' => 'required|string|max:255',
                'license' => 'required|string|max:255',
                'insurance' => 'required|string|max:255',
                'phone' => 'required|string|max:255',
    
                'store_name' => ['required', 'string', 'max:255'],
    
                'slug' => [
                    Rule::unique('companies', 'slug')
                        ->ignore(optional($company)->id),
                ],
                'country' => 'required|string|max:100',
                'state'   => 'required|string|max:100',
                'city'    => 'required|string|max:100',
                'zip_code' => 'required|string|max:20',
                'street_address' => 'required|string|max:250',
                'store_img' => 'nullable|image|mimes:jpeg,png,jpg,webp|max:5120',
            ],
            [
                'slug.unique' => 'Store name already taken. Please choose another.',
            ]
        );




        if (!$company) {
            $company = new Company();
            $company->user_id = auth()->id();
        }

        $storeImage = null;
        if ($request->hasFile('store_img')) {
            $storeImage = $request->file('store_img')->store('stores', 'public');
        }

        $company->business_name = $request->business_name;
        $company->license = $request->license;
        $company->insurance = $request->insurance;
        $company->phone = $request->phone;
        $company->location = $request->location;
        $company->store_name = $request->store_name;
        $company->store_img = $storeImage;
        $company->country = $request->country;
        $company->state = $request->state;
        $company->city = $request->city;
        $company->zip_code = $request->zip_code;
        $company->street_address = $request->street_address;
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
