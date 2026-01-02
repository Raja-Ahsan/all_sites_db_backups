<?php 

namespace App\Http\Responses;

use Laravel\Fortify\Contracts\LoginResponse as LoginResponseContract;

class LoginResponse implements LoginResponseContract
{
    public function toResponse($request)
    {
        $user = auth()->user();
        $role = $user->getRoleNames()->first();

        if (!$role) {
            return redirect('/');
        }

        // if ($role === 'admin') {
        //     return redirect()->to('/admin/dashboard');
        // }

        if ($user->hasRole(config('roles.admin'))) {
            return redirect('/admin');
        }
        if ($user->hasRole(config('roles.user'))) {
            return redirect('/');
        }
        if ($user->hasRole(config('roles.company'))) {
            return redirect('/admin');
        }

        return redirect('/');
    }
}

?>