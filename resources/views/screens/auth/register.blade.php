@extends('layouts.web.master')
@section('title', 'Join')
@section('content')

<section class="inner-banner about-banner">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <h1 class="hd-lg">Join the League</h1>
            </div>
        </div>
    </div>
</section>

<section class="join-sec sec-dark-bg sec-gap-y">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-8 col-md-10">
                <div class="form-wrapper glass">
                    <form id="joinForm" action="{{ url('/register') }}" method="POST">
                        @csrf
                        <div class="row">
                            <div class="col-12">
                                <div class="d-flex align-items-center justify-content-between mb-30">
                                    <div>
                                        <h4 class="secondry-font fs-60 text-white fw-700 mb-10">Create Account</h4>
                                        <p class="para">
                                            Join the League of Contractors and start building your network
                                        </p>
                                    </div>
                                    <div>
                                        <div class="img-wrapper">
                                            <img src="{{ asset('images/logo-02.png') }}" style="max-width: 40px;" alt="Logo">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-12 mb-20">
                                <div class="field-wrapper">
                                    <label for="firstName" class="text-white fs-14 mb-10 d-block">Full Name</label>
                                    <input type="text" id="firstName" name="name" class="glass input-field" placeholder="John" required>
                                </div>
                            </div>
                            <div class="col-12 mb-20">
                                <div class="field-wrapper">
                                    <label for="email" class="text-white fs-14 mb-10 d-block">Email Address</label>
                                    <input type="email" id="email" name="email" class="glass input-field" placeholder="your.email@example.com" required>
                                </div>
                            </div>

                            <div class="col-12 mb-20">
                                <div class="field-wrapper">
                                    <label for="phone" class="text-white fs-14 mb-10 d-block">Phone Number</label>
                                    <input type="tel" id="phone" name="phone" class="glass input-field" placeholder="+1 (555) 123-4567" required>
                                </div>
                            </div>

                            <div class="col-md-6 mb-20">
                                <div class="field-wrapper">
                                    <label for="password" class="text-white fs-14 mb-10 d-block">Password</label>
                                    <input type="password" id="password" name="password" class="glass input-field" placeholder="Create a password" required>
                                </div>
                            </div>

                            <div class="col-md-6 mb-20">
                                <div class="field-wrapper">
                                    <label for="password_confirmation" class="text-white fs-14 mb-10 d-block">Confirm Password</label>
                                    <input type="password" id="password_confirmation" name="password_confirmation" class="glass input-field" placeholder="Confirm your password" required>
                                </div>
                            </div>

                            {{-- <div class="col-12 mb-20">
                                <div class="field-wrapper">
                                    <label for="licenseNumber" class="text-white fs-14 mb-10 d-block">License Number</label>
                                    <input type="text" id="licenseNumber" name="licenseNumber" class="glass input-field" placeholder="Enter your contractor license number">
                                </div>
                            </div> --}}

                            {{-- <div class="col-12 mb-20">
                                <div class="field-wrapper">
                                    <label for="companyName" class="text-white fs-14 mb-10 d-block">Company Name</label>
                                    <input type="text" id="companyName" name="companyName" class="glass input-field" placeholder="Your company name">
                                </div>
                            </div> --}}

                            <div class="col-12 mb-20">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="agreeTerms" name="agreeTerms" required>
                                    <label class="form-check-label text-white fs-14" for="agreeTerms">
                                        I agree to the <a href="#" class="text-secondry-theme">Terms & Conditions</a> and <a href="#" class="text-secondry-theme">Privacy Policy</a>
                                    </label>
                                </div>
                            </div>

                            <div class="col-12 mb-20">
                                <button type="submit" class="bootstrap btn btn-primary w-100 submit-btn">
                                    <i class="fa-solid fa-user-plus me-10"></i> Join
                                </button>
                            </div>

                            <div class="col-12 text-center">
                                <p class="text-white fs-14 mb-10">
                                    Already have an account? 
                                    <a href="{{ route('login') }}" class="text-secondry-theme fw-600">Login</a>
                                </p>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>

@endsection

