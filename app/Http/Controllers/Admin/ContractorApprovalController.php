<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Company;
use Illuminate\Support\Facades\Mail;
use App\Mail\CompanyApprovedMail;
use App\Notifications\CompanyApprovedNotification;


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

        if ($request->status == 1 && !$company->approval_notified) {

            $company->is_profile_approved = true;

            Mail::to($company->user->email)
                ->send(new CompanyApprovedMail($company));

            $company->user->notify(new CompanyApprovedNotification());


            $company->approval_notified = true;
        }

        $company->save();

        return response()->json([
            'success' => true,
            'message' => $request->status ? 'Profile Approved' : 'Profile Rejected'
        ]);
    }
}
