<?php

namespace App\Http\Responses;

use Laravel\Fortify\Contracts\RequestPasswordResetLinkViewResponse;

class ForgotPasswordViewResponse implements RequestPasswordResetLinkViewResponse
{
    public function toResponse($request)
    {
        return view('screens.auth.forgot-password');
    }
}
