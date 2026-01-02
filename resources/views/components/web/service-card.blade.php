@props([
    'image' => asset('images/hero-bg.png'),
    'contractorImage' => null,
    'contractorName' => null,
    'serviceName' => null,
    'serviceCategoryName' => null,
    'location' => 'Midland,Texas-79701',
    'serviceDetailUrl' => route('service-detail'),
    'bookNowUrl' => route('book-now'),
    'showOnlineBadge' => true,
    'showContractorInfo' => true,
])

<div class="services-list-wrapper">
    <div class="services-card-wrapper sec-bg-light radius-10">
        <div class="img-wrapper">
            <img src="{{ $image }}" alt="service-image">
        </div>
        <div class="services-content py-20 px-20">
            <div class="services-content-top">
                @if($showContractorInfo && $contractorImage && $contractorName)
                <a href="{{ route('store') }}" class="d-flex align-items-center mb-20 gap-20 store-link-wrapper">
                    <div class="services-profile-img position-relative">
                        <img src="{{ $contractorImage }}" alt="profile picture">
                        @if($showOnlineBadge)
                        <div class="online-badge-wrapper position-absolute"></div>
                        @endif
                    </div>
                    <div class="services-content-top-right">
                        <h4 class="text-white secondry-font">{{ $contractorName }}</h4>
                    </div>
                </a>
                @endif
                @if($serviceName)
                <h4 class="fs-20 fw-300 text-white mb-20">{{ $serviceName }}</h4>
                @endif
                @if($serviceCategoryName)
                <h4 class="fs-14 fw-300 text-secondry-theme mb-20">{{ $serviceCategoryName }}</h4>
                @endif
                <h4 class="fs-14 fw-300 text-white mb-20">
                    <span><i class="fa-solid fa-location-dot"></i></span> {{ $location }}
                </h4>
                <div class="d-flex align-items-center gap-10">
                    <a href="{{ $serviceDetailUrl }}" class="bootstrap btn btn-outline btn-sm">View Detail</a>
                    <a href="{{ $bookNowUrl }}" class="bootstrap btn btn-outline btn-sm">Book Now</a>
                </div>
            </div>
        </div>
    </div>
</div>

