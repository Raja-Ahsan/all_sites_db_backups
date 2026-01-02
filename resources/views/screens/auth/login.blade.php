@extends('layouts.web.master')
@section('title', 'Login')
@section('content')

<main class="spotmee-main">
    <div class="px-5">
        <section class="hero-banner" style="background-image: url('{{ asset('images/banner-img.png') }}'); min-height: 85vh; padding-bottom: 100px;">
            <div class="absolute inset-0 bg-black/10"></div>
            
            <div class="auth-container-new">
                <div class="w-full max-w-[550px]" data-aos="fade-up">
                    <div class="form-wrapper !mt-0">
                        <form id="loginForm" action="{{ url('/login') }}" method="POST">
                            @csrf
                            <div class="mb-10 text-center">
                                <h1 class="auth-title">Welcome Back</h1>
                                <p class="auth-subtitle">
                                    Sign in to your account to continue
                                </p>
                            </div>

                            <div class="mb-6">
                                <label for="email" class="auth-label">Email Address</label>
                                <input type="email" id="email" name="email" 
                                    class="auth-input"
                                    placeholder="Enter your email" required>
                            </div>

                            <div class="mb-6">
                                <label for="password" class="auth-label">Password</label>
                                <input type="password" id="password" name="password" 
                                    class="auth-input"
                                    placeholder="Enter your password" required>
                            </div>

                            <div class="flex items-center justify-between mb-8">
                                <div class="flex items-center">
                                    <input type="checkbox" id="rememberMe" name="remember" 
                                        class="w-4 h-4 rounded border-gray-300 text-[#4682B4] focus:ring-[#4682B4]">
                                    <label for="rememberMe" class="ml-2 text-sm md:text-base text-gray-600 font-regular">Remember me</label>
                                </div>
                                <a href="{{ route('password.request') }}" class="text-sm md:text-base text-[#4682B4] font-semibold hover:underline">Forgot Password?</a>
                            </div>

                            <button type="submit" class="cta-btn w-full mb-8 py-4">
                                <i class="fa-solid fa-sign-in-alt mr-2"></i> Login
                            </button>

                            <div class="text-center">
                                <p class="auth-subtitle">
                                    Don't have an account? 
                                    <a href="{{ route('register') }}" class="auth-link">Join Now</a>
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

