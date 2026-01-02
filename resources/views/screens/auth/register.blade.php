@extends('layouts.web.master')
@section('title', 'Join')
@section('content')

<main class="spotmee-main">
    <div class="px-5">
        <section class="hero-banner" style="background-image: url('{{ asset('images/banner-img.png') }}'); min-height: 90vh; padding-bottom: 50px; ">
            <div class="absolute inset-0 bg-black/10"></div>
            
            <div class="auth-container-new">
                <div class="w-full max-w-[700px]" data-aos="fade-up">
                    <div class="form-wrapper !mt-0">
                        <form id="joinForm" action="{{ url('/register') }}" method="POST">
                            @csrf
                            <div class="mb-10 text-center">
                                <h1 class="auth-title">Create Account</h1>
                                <p class="auth-subtitle">
                                    Join SPOTMEE and start your fitness journey
                                </p>
                            </div>

                            <div class="grid grid-cols-1 md:grid-cols-2 gap-5">
                                <div class="mb-5 md:col-span-2">
                                    <label for="firstName" class="auth-label">Full Name</label>
                                    <input type="text" id="firstName" name="name" 
                                        class="auth-input" 
                                        placeholder="Enter your full name" required>
                                </div>

                                <div class="mb-5">
                                    <label for="email" class="auth-label">Email Address</label>
                                    <input type="email" id="email" name="email" 
                                        class="auth-input"
                                        placeholder="Enter your email" required>
                                </div>

                                <div class="mb-5">
                                    <label for="phone" class="auth-label">Phone Number</label>
                                    <input type="tel" id="phone" name="phone" 
                                        class="auth-input"
                                        placeholder="Enter your phone number" required>
                                </div>

                                <div class="mb-5">
                                    <label for="password" class="auth-label">Password</label>
                                    <input type="password" id="password" name="password" 
                                        class="auth-input"
                                        placeholder="Create a password" required>
                                </div>

                                <div class="mb-5">
                                    <label for="password_confirmation" class="auth-label">Confirm Password</label>
                                    <input type="password" id="password_confirmation" name="password_confirmation"
                                        class="auth-input" 
                                        placeholder="Confirm password" required>
                                </div>
                            </div>

                            <div class="mb-8">
                                <div class="flex items-start">
                                    <input type="checkbox" id="agreeTerms" name="agreeTerms" required
                                        class="mt-1.5 w-4 h-4 rounded border-gray-300 text-[#4682B4] focus:ring-[#4682B4]">
                                    <label for="agreeTerms" class="ml-2 text-sm md:text-base text-gray-600 font-regular">
                                        I agree to the <a href="#" class="text-[#4682B4] font-semibold hover:underline">Terms & Conditions</a> 
                                        and <a href="#" class="text-[#4682B4] font-semibold hover:underline">Privacy Policy</a>
                                    </label>
                                </div>
                            </div>

                            <button type="submit" class="cta-btn w-full mb-8 py-4">
                                <i class="fa-solid fa-user-plus mr-2"></i> Join Now
                            </button>

                            <div class="text-center">
                                <p class="auth-subtitle">
                                    Already have an account? 
                                    <a href="{{ route('login') }}" class="auth-link">Login</a>
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

