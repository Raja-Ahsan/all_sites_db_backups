<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Company;

class ContractorApprovalController extends Controller
{
    public function index()
    {
        $pending = Company::where('is_profile_completed', true)
            ->where('is_profile_approved', false)
            ->with('user')
            ->get();

        return view('screens.admin.contractor-approval.index', compact('pending'));
    }

    public function ajaxToggle(Request $request)
    {
        $company = Company::findOrFail($request->id);

        $company->is_profile_approved = $request->status;
        $company->save();

        return response()->json([
            'success' => true,
            'message' => $request->status ? 'Profile Approved' : 'Profile Rejected'
        ]);
    }
}
