@extends('layouts.web.master')
@section('title', 'Service Detail')
@section('content')

    <section class="inner-banner about-banner">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <h1 class="hd-lg">Service Detail</h1>
                </div>
            </div>
        </div>
    </section>

    <section class="service-detail-sec sec-dark-bg sec-gap-y">
        <div class="container">
            <div class="row row-gap-40 mb-30">
                <!-- Left Side - Image Slider -->
                <div class="col-lg-8">
                    <div class="service-detail-slider-wrapper">
                        <div class="service-detail-main-slider">
                            @if ($serviceDetail->serviceImages->count())
                                @foreach ($serviceDetail->serviceImages as $image)
                                    <div class="service-image-wrapper">
                                        <img src="{{ asset('storage/' . $image->images) }}" alt="Service Image"
                                            class="img-fluid rounded">
                                    </div>
                                @endforeach
                            @else
                                @if ($serviceDetail->image)
                                    <div class="">
                                        <img src="{{ asset(asset('storage/' . $serviceDetail->image)) }}" alt="">
                                    </div>
                                @endif
                            @endif
                        </div>
                    </div>
                </div>

                <!-- Right Side - Service Details Box -->
                <div class="col-lg-4">
                    <div class="service-details-box sec-bg-light radius-10 py-30 px-20">
                        {{-- <div class="service-details-item mb-20 d-flex align-items-center gap-15">
                            <div class="service-detail-icon circle-md bg-primary-theme">
                                <i class="fa-solid fa-clock text-white"></i>
                            </div>
                            <div>
                                <span class="text-white fs-16 fw-400">Delivery Days: <strong>0</strong></span>
                            </div>
                        </div>
                        <div class="service-details-item mb-20 d-flex align-items-center gap-15">
                            <div class="service-detail-icon circle-md bg-primary-theme">
                                <i class="fa-solid fa-rotate text-white"></i>
                            </div>
                            <div>
                                <span class="text-white fs-16 fw-400">Revisions: <strong>0</strong></span>
                            </div>
                        </div> --}}
                        <div class="service-details-item mb-30 d-flex align-items-center gap-15">
                            <div class="service-detail-icon circle-md bg-primary-theme">
                                <i class="fa-solid fa-check text-white"></i>
                            </div>
                            <div>
                                <span class="text-white fs-18 fw-600 secondry-font">{{ $serviceDetail->title }}</span>
                            </div>
                        </div>
                        <div class="service-details-actions d-flex flex-column gap-15">
                            <a href="{{ route('book-now') }}" class="bootstrap btn btn-primary w-100 text-center">
                                Book Appointment
                            </a>
                            <a href="tel:5551234567" class="bootstrap btn btn-outline w-100 text-center">
                                <i class="fa-solid fa-phone" style="margin-right: 8px;"></i> Call Now
                                {{ $serviceDetail->company->phone }}
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Contractor Information Section -->
            <div class="row row-gap-40">
                <div class="col-12">
                    <div class="contractor-info-wrapper">
                        <div class="contractor-header d-flex align-items-center gap-20 mb-30">
                            <div class="contractor-logo-wrapper position-relative">
                                <div
                                    class="contractor-logo circle-lg bg-primary-theme d-flex align-items-center justify-content-center">
                                    <i class="fa-solid fa-building text-white" style="font-size: 3rem;"></i>
                                </div>
                            </div>
                            <div>
                                <h3 class="text-white secondry-font fs-32 mb-5">{{ $serviceDetail->title }}
                                </h3>
                                <p class="text-white fs-14 opacity-75">{{ $serviceDetail->tagline }}</p>
                            </div>
                        </div>

                        <!-- Tabs Navigation -->
                        <ul class="nav nav-tabs mb-30" role="tablist">
                            <li class="nav-item" role="presentation">
                                <button class="nav-link active" id="overview-tab" data-bs-toggle="tab"
                                    data-bs-target="#overview" type="button" role="tab">
                                    Overview
                                </button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button class="nav-link" id="about-tab" data-bs-toggle="tab" data-bs-target="#about"
                                    type="button" role="tab">
                                    About Seller
                                </button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button class="nav-link" id="other-services-tab" data-bs-toggle="tab"
                                    data-bs-target="#other-services" type="button" role="tab">
                                    Other Services
                                </button>
                            </li>

                            <li class="nav-item" role="presentation">
                                <button class="nav-link" id="review-tab" data-bs-toggle="tab" data-bs-target="#review"
                                    type="button" role="tab">
                                    Review
                                </button>
                            </li>
                        </ul>

                        <!-- Tab Content -->
                        <div class="tab-content">
                            <!-- Overview Tab -->
                            <div class="tab-pane fade show active" id="overview" role="tabpanel">
                                <div class="overview-content">
                                    <p class="text-white fs-16 mb-20 para">
                                        {{ $serviceDetail->description }}
                                    </p>
                                </div>
                            </div>

                            <!-- Other Services Tab -->
                            <div class="tab-pane fade" id="other-services" role="tabpanel">
                                <div class="other-services-content">
                                    <div id="services-wrapper" class="row row-gap-40">
                                        @if ($services->isNotEmpty())
                                            @include('screens.web.services.list', [
                                                'services' => $services,
                                            ])
                                        @else
                                            <x-empty-state message="This contractor has no other services yet."
                                                subMessage="Please check back later." />
                                        @endif
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- About Seller Tab -->
                        <div class="tab-pane fade" id="about" role="tabpanel">
                            <div class="about-seller-content">
                                <div class="d-flex align-items-center gap-20 mb-30">
                                    <div
                                        class="seller-avatar circle-lg bg-primary-theme d-flex align-items-center justify-content-center">
                                        <span class="text-white fs-24 fw-600">DF</span>
                                    </div>
                                    <div>
                                        <a href="{{ route('store.index', $serviceDetail->company_id) }}"
                                            class="text-white secondry-font fs-24 mb-5">{{ $serviceDetail->company->store_name }}</a>
                                        <p class="text-white fs-16 mb-5">Seller: <span
                                                class="fw-600">{{ $serviceDetail->user->name }}</span></p>
                                        <div class="d-flex align-items-center gap-15">
                                            <p class="text-white fs-14 opacity-75 mb-0"><i
                                                    class="fa-solid fa-location-dot" style="margin-right: 5px;"></i>
                                                {{ $serviceDetail->company->country }}</p>
                                            <p class="text-white fs-14 opacity-75 mb-0">Member Since:
                                                {{ $serviceDetail->company->created_at->format('j M Y') }}</p>
                                        </div>
                                    </div>
                                </div>

                                {{-- <div class="seller-description">
                                        <h5 class="text-white secondry-font fs-18 mb-15">About</h5>
                                        <p class="text-white fs-16 mb-20 para">
                                            Diamond Fixers is a premier provider of home maintenance services. We are
                                            dedicated to delivering top-notch quality and ensuring customer satisfaction
                                            in every project we undertake.
                                        </p>
                                        <p class="text-white fs-16 para">
                                            With years of experience in the industry, our team is equipped to handle a
                                            wide variety of tasks with professionalism and care.
                                        </p>
                                    </div> --}}
                            </div>
                        </div>

                        <!-- Review Tab -->
                        <div class="tab-pane fade" id="review" role="tabpanel">
                            <div class="reviews-content">
                                <h4 class="text-white secondry-font fs-24 mb-20">Customer Reviews</h4>
                                <div class="review-item sec-bg-light radius-10 py-20 px-20 mb-20">
                                    <div class="d-flex align-items-center gap-15 mb-15">
                                        <div
                                            class="reviewer-avatar circle-md bg-primary-theme d-flex align-items-center justify-content-center">
                                            <span class="text-white fs-18 fw-600">JD</span>
                                        </div>
                                        <div>
                                            <h5 class="text-white fs-16 fw-600 mb-5">John Doe</h5>
                                            <div class="rating-stars text-secondry-theme">
                                                <i class="fa-solid fa-star"></i>
                                                <i class="fa-solid fa-star"></i>
                                                <i class="fa-solid fa-star"></i>
                                                <i class="fa-solid fa-star"></i>
                                                <i class="fa-solid fa-star"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <p class="text-white fs-14 para">
                                        Excellent service! The team was professional and completed the work on time.
                                        Highly recommended!
                                    </p>
                                </div>
                                <div class="review-item sec-bg-light radius-10 py-20 px-20 mb-20">
                                    <div class="d-flex align-items-center gap-15 mb-15">
                                        <div
                                            class="reviewer-avatar circle-md bg-primary-theme d-flex align-items-center justify-content-center">
                                            <span class="text-white fs-18 fw-600">JS</span>
                                        </div>
                                        <div>
                                            <h5 class="text-white fs-16 fw-600 mb-5">Jane Smith</h5>
                                            <div class="rating-stars text-secondry-theme">
                                                <i class="fa-solid fa-star"></i>
                                                <i class="fa-solid fa-star"></i>
                                                <i class="fa-solid fa-star"></i>
                                                <i class="fa-solid fa-star"></i>
                                                <i class="fa-regular fa-star"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <p class="text-white fs-14 para">
                                        Great quality work and fair pricing. Will definitely use their services again.
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
    </section>

    @push('scripts')
        <script>
            $(document).ready(function() {
                // Service Detail Main Slider

            });
        </script>
    @endpush

@endsection
