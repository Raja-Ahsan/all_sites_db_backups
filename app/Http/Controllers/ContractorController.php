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
        $user = current_user();

        // $query = User::whereHas('company', function ($q) {
        //     $q->where('is_profile_approved', true);
        // });
        // $query = User::query()->with('company'); 
        // if ($user->hasRole(config('roles.admin'))) { 
        //     $query->whereHas('roles', function ($q) { 
        //         $q->where('name', config('roles.contractor')); 
        //     }); 
        // } else { 
        //     $query->where('created_by', $user->id);
        // }
        if ($user->hasRole(config('roles.admin'))) {
            $contractors = User::with(['roles', 'company'])
                ->where('id', '!=', $user->id)
                ->whereHas('roles', function ($q) {
                    $q->whereIn('name', [
                        config('roles.contractor'),
                        config('roles.company'),
                    ]);
                })
                ->paginate(10);
        } else {
            $contractors = User::with(['roles', 'company'])
                ->where('id', '!=', $user->id)
                ->where('created_by', $user->id)
                ->paginate(10);
        }

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
            'email' => 'required|email|unique:users,email',
            'phone' => 'nullable|string',
        ]);

        // auto generate password
        $plainPassword = generateRandomPassword();

        // create contractor
        $user = User::create([
            'name'     => $request->name,
            'email'    => $request->email,
            'phone'    => $request->phone,
            'created_by' => auth()->user()->id,
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
