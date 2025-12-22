<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\CompanyContractor;
use Illuminate\Support\Facades\Mail;
use App\Mail\ContractorCredentialsMail;

class ContractorController extends Controller
{
    public function index()
    {
        $user = auth()->user();

        $query = User::whereHas('company', function ($q) {
            $q->where('is_profile_approved', true);
        });    

        if (! $user->hasRole('super_admin')) {
            $query->whereHas('companyContractor', function ($q) use ($user) {
                $q->where('company_id', $user->company->id);
            })
            ->where('id', '!=', $user->id);
        }
    
        $contractors = $query->get();

        return view('screens.admin.contractors.index', compact('contractors'));
    }
    public function create()
    {
        return view('screens.admin.contractors.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'name'  => 'required|string|max:255',
            'email' => 'required|email|unique:contractors,email',
            'phone' => 'nullable|string',
        ]);

        // auto generate password
        $plainPassword = generateRandomPassword();

        // create contractor
        $user = User::create([
            'name'     => $request->name,
            'email'    => $request->email,
            'phone'    => $request->phone,
            'password' => bcrypt($plainPassword),
        ]);

        CompanyContractor::create([
            'company_id' => auth()->user()->company->id,
            'user_id'    => $user->id,
        ]);

        // assign contractor role (Spatie)
        $user->assignRole('contractor');

        Mail::to($user->email)->send(new ContractorCredentialsMail($user, $plainPassword));
        // send email with login credentials
        // Mail::to($contractor->email)->send(new ContractorCredentialsMail($contractor, $plainPassword));

        return back()->with('success', 'Contractor created and credentials emailed successfully.');
    }
}
