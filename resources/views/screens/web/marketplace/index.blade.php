@extends('layouts.web.master')
@section('title', 'Marketplace')
@section('content')
    <section class="inner-banner about-banner">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <h1 class="hd-lg">Marketplace</h1>
                </div>
            </div>
        </div>
    </section>

    <!-- Marketplace Section -->
    <section class="contractor-marketplace-sec sec-dark-bg sec-gap-y">
        <div class="container">
            <div class="row mb-40">
                <div class="col-8 text-center mx-auto">
                    <h2 class="hd-lg mb-20">
                        The Contractor Marketplace
                    </h2>
                    <p class="para">
                        Welcome to the League Marketplace — a trusted space where verified contractors can buy, sell, and
                        trade products and services within the professional community.
                    </p>
                </div>
            </div>
            <div class="row text-center text-md-start row-gap-40">
                <div class="col-lg-3 col-md-6">
                    <div class="con-place-card-wrapper marketplace-card-wrapper">
                        <div class="img-wrapper">
                            <img class="" src="{{ asset('images/con-place-01.png') }}"
                                alt="Contractor Marketplace Image">
                        </div>
                        <div class="content-wrapper">
                            <a href="" class="d-flex align-items-center mb-20 gap-20 store-link-wrapper">
                                <div class="services-profile-img position-relative">
                                    <img src="http://localhost:8000/images/resources-04.png" alt="profile picture">
                                    <div class="online-badge-wrapper position-absolute">
                                    </div>
                                </div>
                                <div class="services-content-top-right">
                                    <h4 class="text-white secondry-font">contractor name</h4>
                                </div>
                            </a>
                            <h4 class="hd-lg hd-sm mb-20">Tools & Equipment</h4>
                            <p class="text-white mb-20 clamp-2">Power tools, safety gear, rentals, and accessories</p>
                            <a href="{{ route('product-detail') }}" class="btn btn-outline btn-sm">view store</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="con-place-card-wrapper marketplace-card-wrapper">
                        <div class="img-wrapper">
                            <img class="" src="{{ asset('images/con-place-02.png') }}"
                                alt="Contractor Marketplace Image">
                        </div>
                        <div class="content-wrapper">
                            <a href="#" class="d-flex align-items-center mb-20 gap-20 store-link-wrapper">
                                <div class="services-profile-img position-relative">
                                    <img src="http://localhost:8000/images/resources-04.png" alt="profile picture">
                                    <div class="online-badge-wrapper position-absolute">
                                    </div>
                                </div>
                                <div class="services-content-top-right">
                                    <h4 class="text-white secondry-font">contractor name</h4>
                                </div>
                            </a>
                            <h4 class="hd-lg hd-sm mb-20">Building Materials</h4>
                            <p class="text-white mb-20 clamp-2">Lumber, concrete, paint, sealants, insulation</p>
                            <a href="" class="btn btn-outline btn-sm">view store</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="con-place-card-wrapper marketplace-card-wrapper">
                        <div class="img-wrapper">
                            <img class="" src="{{ asset('images/con-place-03.png') }}"
                                alt="Contractor Marketplace Image">
                        </div>
                        <div class="content-wrapper">
                            <a href="#" class="d-flex align-items-center mb-20 gap-20 store-link-wrapper">
                                <div class="services-profile-img position-relative">
                                    <img src="http://localhost:8000/images/resources-04.png" alt="profile picture">
                                    <div class="online-badge-wrapper position-absolute">
                                    </div>
                                </div>
                                <div class="services-content-top-right">
                                    <h4 class="text-white secondry-font">contractor name</h4>
                                </div>
                            </a>
                            <h4 class="hd-lg hd-sm mb-20">Professional Services</h4>
                            <p class="text-white mb-20 clamp-2">Accounting, insurance, marketing, and design</p>
                            <a href="" class="btn btn-outline btn-sm">view store</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="con-place-card-wrapper marketplace-card-wrapper">
                        <div class="img-wrapper">
                            <img class="" src="{{ asset('images/con-place-04.png') }}"
                                alt="Contractor Marketplace Image">
                        </div>
                        <div class="content-wrapper">
                            <a href="#" class="d-flex align-items-center mb-20 gap-20 store-link-wrapper">
                                <div class="services-profile-img position-relative">
                                    <img src="http://localhost:8000/images/resources-04.png" alt="profile picture">
                                    <div class="online-badge-wrapper position-absolute">
                                    </div>
                                </div>
                                <div class="services-content-top-right">
                                    <h4 class="text-white secondry-font">contractor name</h4>
                                </div>
                            </a>
                            <h4 class="hd-lg hd-sm mb-20">Technology & Software</h4>
                            <p class="text-white mb-20 clamp-2">Project management apps, invoicing tools, CRM systems</p>
                            <a href="" class="btn btn-outline btn-sm">view store</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="con-place-card-wrapper marketplace-card-wrapper">
                        <div class="img-wrapper">
                            <img class="" src="{{ asset('images/con-place-01.png') }}"
                                alt="Contractor Marketplace Image">
                        </div>
                        <div class="content-wrapper">
                            <a href="#" class="d-flex align-items-center mb-20 gap-20 store-link-wrapper">
                                <div class="services-profile-img position-relative">
                                    <img src="http://localhost:8000/images/resources-04.png" alt="profile picture">
                                    <div class="online-badge-wrapper position-absolute">
                                    </div>
                                </div>
                                <div class="services-content-top-right">
                                    <h4 class="text-white secondry-font">contractor name</h4>
                                </div>
                            </a>
                            <h4 class="hd-lg hd-sm mb-20">Tools & Equipment</h4>
                            <p class="text-white mb-20 clamp-2">Power tools, safety gear, rentals, and accessories</p>
                            <a href="" class="btn btn-outline btn-sm">view store</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="con-place-card-wrapper marketplace-card-wrapper">
                        <div class="img-wrapper">
                            <img class="" src="{{ asset('images/con-place-02.png') }}"
                                alt="Contractor Marketplace Image">
                        </div>
                        <div class="content-wrapper">
                            <a href="#" class="d-flex align-items-center mb-20 gap-20 store-link-wrapper">
                                <div class="services-profile-img position-relative">
                                    <img src="http://localhost:8000/images/resources-04.png" alt="profile picture">
                                    <div class="online-badge-wrapper position-absolute">
                                    </div>
                                </div>
                                <div class="services-content-top-right">
                                    <h4 class="text-white secondry-font">contractor name</h4>
                                </div>
                            </a>
                            <h4 class="hd-lg hd-sm mb-20">Building Materials</h4>
                            <p class="text-white mb-20 clamp-2">Lumber, concrete, paint, sealants, insulation</p>
                            <a href="" class="btn btn-outline btn-sm">view store</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="con-place-card-wrapper marketplace-card-wrapper">
                        <div class="img-wrapper">
                            <img class="" src="{{ asset('images/con-place-03.png') }}"
                                alt="Contractor Marketplace Image">
                        </div>
                        <div class="content-wrapper">
                            <a href="#" class="d-flex align-items-center mb-20 gap-20 store-link-wrapper">
                                <div class="services-profile-img position-relative">
                                    <img src="http://localhost:8000/images/resources-04.png" alt="profile picture">
                                    <div class="online-badge-wrapper position-absolute">
                                    </div>
                                </div>
                                <div class="services-content-top-right">
                                    <h4 class="text-white secondry-font">contractor name</h4>
                                </div>
                            </a>
                            <h4 class="hd-lg hd-sm mb-20">Professional Services</h4>
                            <p class="text-white mb-20 clamp-2">Accounting, insurance, marketing, and design</p>
                            <a href="" class="btn btn-outline btn-sm">view store</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="con-place-card-wrapper marketplace-card-wrapper">
                        <div class="img-wrapper">
                            <img class="" src="{{ asset('images/con-place-04.png') }}"
                                alt="Contractor Marketplace Image">
                        </div>
                        <div class="content-wrapper">
                            <a href="#" class="d-flex align-items-center mb-20 gap-20 store-link-wrapper">
                                <div class="services-profile-img position-relative">
                                    <img src="http://localhost:8000/images/resources-04.png" alt="profile picture">
                                    <div class="online-badge-wrapper position-absolute">
                                    </div>
                                </div>
                                <div class="services-content-top-right">
                                    <h4 class="text-white secondry-font">contractor name</h4>
                                </div>
                            </a>
                            <h4 class="hd-lg hd-sm mb-20">Technology & Software</h4>
                            <p class="text-white mb-20 clamp-2">Project management apps, invoicing tools, CRM systems</p>
                            <a href="" class="btn btn-outline btn-sm">view store</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection
