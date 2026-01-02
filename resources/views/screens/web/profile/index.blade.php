@extends('layouts.web.master')
@section('title', 'Profile')
@section('content')

<!-- Banner Section -->
<section class="inner-banner about-banner">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <h1 class="hd-lg">Profile</h1>
            </div>
        </div>
    </div>
</section>

<section class="profile-sec sec-dark-bg sec-gap-y">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-8 col-md-10">
                <div class="form-wrapper glass">
                    <form id="profileForm" action="{{ route('user-profile-information.update') }}" method="POST">
                        @csrf
                        @method('PUT')
                        <div class="row">
                            <div class="col-12">
                                <div class="d-flex align-items-center justify-content-between mb-30">
                                    <div>
                                        <h4 class="secondry-font fs-60 text-white fw-700 mb-10">Update Profile</h4>
                                        <p class="para">
                                            Update your account profile information
                                        </p>
                                    </div>
                                    <div>
                                        <div class="img-wrapper">
                                            <img src="{{ asset('images/logo-02.png') }}" style="max-width: 40px;" alt="Logo">
                                        </div>
                                    </div>
                                </div>

                                @if (session('status') === 'profile-information-updated')
                                    <div class="alert alert-success mb-20" role="alert">
                                        Profile updated successfully!
                                    </div>
                                @endif

                                @if ($errors->updateProfileInformation->any())
                                    <div class="alert alert-danger mb-20" role="alert">
                                        <ul class="mb-0">
                                            @foreach ($errors->updateProfileInformation->all() as $error)
                                                <li>{{ $error }}</li>
                                            @endforeach
                                        </ul>
                                    </div>
                                @endif

                                <div class="field-wrapper mb-20">
                                    <label for="name" class="text-white fs-14 mb-10 d-block">Full Name</label>
                                    <input type="text" id="name" name="name" class="glass input-field" 
                                        value="{{ old('name', auth()->user()->name) }}" 
                                        placeholder="Enter your full name" required>
                                </div>

                                <div class="field-wrapper mb-20">
                                    <label for="email" class="text-white fs-14 mb-10 d-block">Email Address</label>
                                    <input type="email" id="email" name="email" class="glass input-field" 
                                        value="{{ old('email', auth()->user()->email) }}" 
                                        placeholder="your.email@example.com" required>
                                </div>

                                <div class="field-wrapper mb-20">
                                    <button type="submit" class="bootstrap btn btn-primary w-100 submit-btn">
                                        <i class="fa-solid fa-save me-10"></i> Update Profile
                                    </button>
                                </div>

                                <div class="text-center">
                                    <p class="text-white fs-14 mb-10">
                                        <a href="{{ route('home') }}" class="text-secondry-theme fw-600">Back to Home</a>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>

@endsection

