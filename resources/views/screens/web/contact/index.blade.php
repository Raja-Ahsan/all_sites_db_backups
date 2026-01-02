@extends('layouts.web.master')
@section('title', 'Contact Us')
@section('content')

<!-- Contact Section -->
<section class="inner-banner about-banner">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <h1 class="hd-lg">Contact Us</h1>
            </div>
        </div>
    </div>
</section>

<section class="contact-us-sec sec-dark-bg sec-gap-y">
    <div class="container">
        <div class="row align-items-center row-gap-40">
            <!-- Left Side - Contact Information -->
            <div class="col-lg-6">
                <h2 class="hd-lg hd-md mb-40">Get In Touch</h2>
                <p class="para mb-40">
                    Have questions about membership, verification, or your account? Reach out to our team — we're happy to help.
                </p>
                
                <div class="d-flex flex-column row-gap-30 contact-info-left-content">
                    <!-- Email -->
                    <div class="d-flex align-items-center gap-20">
                        <div class="glass circle-md circle-lg bg-secondry-theme d-flex align-items-center justify-content-center">
                            <i class="fa-solid fa-envelope"></i>
                        </div>
                        <div>
                            <h4 class="hd-lg hd-sm mb-5">Email</h4>
                            <a href="mailto:support@leagueofcontractors.com" class="para contact-sec-card-item-link">
                                support@leagueofcontractors.com
                            </a>
                        </div>
                    </div>
                    
                    <!-- Phone -->
                    <div class="d-flex align-items-center gap-20">
                        <div class="glass circle-md circle-lg bg-secondry-theme d-flex align-items-center justify-content-center">
                            <i class="fa-solid fa-phone"></i>
                        </div>
                        <div>
                            <h4 class="hd-lg hd-sm mb-5">Phone</h4>
                            <a href="tel:+1234567890" class="para contact-sec-card-item-link">
                                +1 (234) 567-890
                            </a>
                        </div>
                    </div>
                    
                    <!-- Address -->
                    <div class="d-flex align-items-center gap-20">
                        <div class="glass circle-md circle-lg bg-secondry-theme d-flex align-items-center justify-content-center">
                            <i class="fa-solid fa-location-dot"></i>
                        </div>
                        <div>
                            <h4 class="hd-lg hd-sm mb-5">Address</h4>
                            <p class="para">
                                123 Main Street, Suite 100<br>
                                City, State 12345
                            </p>
                        </div>
                    </div>
                    
                    <!-- Hours -->
                    <div class="d-flex align-items-center gap-20">
                        <div class="glass circle-md circle-lg bg-secondry-theme d-flex align-items-center justify-content-center">
                            <i class="fa-solid fa-clock"></i>
                        </div>
                        <div>
                            <h4 class="hd-lg hd-sm mb-5">Business Hours</h4>
                            <p class="para">
                                Monday – Friday, 9AM – 5PM EST
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Right Side - Contact Form -->
            <div class="col-lg-6">
                <div class="form-wrapper glass">
                    <form action="">
                        <div class="row">
                            <div class="col-12">
                                <div class="d-flex align-items-center justify-content-between mb-20">
                                    <div>
                                        <h4 class="secondry-font fs-60 text-white fw-700">Send Message</h4>
                                        <p class="para">
                                            We're Here to Help.
                                        </p>
                                    </div>
                                    <div>
                                        <div class="img-wrapper">
                                            <img src="{{ asset('images/logo-02.png') }}" style="max-width: 40px;"
                                                alt="Contact Us Image">
                                        </div>
                                    </div>
                                </div>
                                <div class="field-wrapper mb-20">
                                    <input type="text" class="glass input-field" placeholder="Name">
                                </div>
                                <div class="field-wrapper mb-20">
                                    <input type="email" class="glass input-field" placeholder="Email">
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="field-wrapper mb-20">
                                    <input type="text" class="glass input-field" placeholder="Phone">
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="field-wrapper mb-20">
                                    <input type="text" class="glass input-field" placeholder="Subject">
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="field-wrapper mb-20">
                                    <textarea class="glass input-field" placeholder="Message" rows="5"></textarea>
                                </div>
                            </div>
                            <div class="col-12">
                                <button class="bootstrap btn btn-secondary w-100 submit-btn">Send Message</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>

@endsection

