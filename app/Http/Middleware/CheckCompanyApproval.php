<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class CheckCompanyApproval
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        $user = auth()->user();
        $rolesById = $user->roles->first()->id;

        if ($rolesById == 4) {

            $company = $user->company;

            if (!$company || !$company->is_profile_completed) {
                return redirect()->route('company-profile.index')
                    ->with('error', 'Please complete your profile first.');
            }

            if (!$company->is_profile_approved) {
                return redirect()->route('admin.dashboard')
                    ->with('error', 'Your profile is pending approval.');
            }
        }

        return $next($request);
    }
}
