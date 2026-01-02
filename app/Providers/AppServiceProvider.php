<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;

// LOGIN REDIRECT
use Laravel\Fortify\Contracts\LoginResponse;
use App\Http\Responses\LoginResponse as CustomLoginResponse;

// REGISTER VIEW
use Laravel\Fortify\Contracts\RegisterViewResponse;
use App\Http\Responses\RegisterViewResponse as CustomRegisterViewResponse;

// REGISTER REDIRECT (THIS WAS MISSING)
use Laravel\Fortify\Contracts\RegisterResponse;
use App\Http\Responses\RegisterResponse as CustomRegisterResponse;

use Laravel\Fortify\Contracts\RequestPasswordResetLinkViewResponse;
use App\Http\Responses\ForgotPasswordViewResponse;

class AppServiceProvider extends ServiceProvider
{
    public function register(): void
    {
        // AFTER LOGIN REDIRECT
        $this->app->singleton(LoginResponse::class, CustomLoginResponse::class);

        // VIEW FOR REGISTER PAGE
        $this->app->singleton(RegisterViewResponse::class, CustomRegisterViewResponse::class);

        // AFTER REGISTER REDIRECT
        $this->app->singleton(RegisterResponse::class, CustomRegisterResponse::class);

        // Forgot Password View Response
        $this->app->singleton(
            RequestPasswordResetLinkViewResponse::class,
            ForgotPasswordViewResponse::class
        );
    }

    public function boot(): void
    {
        //
    }
}
