@extends('layouts.web.master')
@section('title', 'Forgot Password')
@section('content')

<main class="spotmee-main">
    <div class="px-5">
        <section class="hero-banner" style="background-image: url('{{ asset('images/banner-img.png') }}'); min-height: 85vh; padding-bottom: 100px;">
            <div class="absolute inset-0 bg-black/10"></div>
            
            <div class="auth-container-new">
                <div class="w-full max-w-[550px]" data-aos="fade-up">
                    <div class="form-wrapper !mt-0">
                        <form id="forgotPasswordForm" action="{{ url('/forgot-password') }}" method="POST">
                            @csrf
                            <div class="mb-10 text-center">
                                <h1 class="auth-title">Reset Password</h1>
                                <p class="auth-subtitle">
                                    Enter your email and we'll send you a link to reset your password.
                                </p>
                            </div>

                            <div class="mb-8">
                                <label for="email" class="auth-label">Email Address</label>
                                <input type="email" id="email" name="email" 
                                    class="auth-input"
                                    placeholder="Enter your email" required>
                            </div>

                            <button type="submit" class="cta-btn w-full mb-8 py-4">
                                <i class="fa-solid fa-paper-plane mr-2"></i> Send Reset Link
                            </button>

                            <div class="text-center">
                                <p class="auth-subtitle">
                                    Remember your password? 
                                    <a href="{{ route('login') }}" class="auth-link">Back to Login</a>
                                </p>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    </div>
</main>

@endsection

