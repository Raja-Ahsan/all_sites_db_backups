{{-- Usage: @include('components.web.product-card', ['product' => $product]) --}}

@props([
    'image' => asset('images/con-place-01.png'),
    'title' => 'Product Name',
    'description' => 'Product description here',
    'price' => '$0.00',
    'rating' => 5,
    'cartUrl' => route('cart'),
    'detailUrl' => route('product-detail'),
    'contractorImage' => null,
    'contractorName' => null,
    'showContractor' => false,
    'showRating' => true,
])

<div class="con-place-card-wrapper marketplace-card-wrapper">
    <div class="img-wrapper">
        <img src="{{ $image }}" alt="Product Image">
    </div>
    <div class="content-wrapper">
        @if($showContractor && $contractorName)
        <a href="#" class="d-flex align-items-center mb-20 gap-20 store-link-wrapper">
            <div class="services-profile-img position-relative">
                <img src="{{ $contractorImage ?? asset('images/resources-04.png') }}" alt="profile picture">
                <div class="online-badge-wrapper position-absolute"></div>
            </div>
            <div class="services-content-top-right">
                <h4 class="text-white secondry-font">{{ $contractorName }}</h4>
            </div>
        </a>
        @endif
        <h4 class="hd-lg hd-sm mb-10">{{ $title }}</h4>
        <p class="text-white mb-15 clamp-2">{{ $description }}</p>
        <div class="d-flex align-items-center justify-content-between mb-15">
            <span class="text-secondry-theme fs-20 fw-600">{{ $price }}</span>
            <div class="rating-stars text-secondry-theme">
                {{-- add rating default true  --}}
                @if($rating)
                @for($i = 1; $i <= 5; $i++)
                    @if($i <= $rating)
                        <i class="fa-solid fa-star"></i>
                    @else
                        <i class="fa-regular fa-star"></i>
                    @endif
                @endfor
                @endif
            </div>
        </div>
        <div class="d-flex align-items-center gap-10">
            <a href="{{ $cartUrl }}" class="bootstrap btn btn-outline btn-sm w-100">add to cart</a>
            <a href="{{ $detailUrl }}" class="bootstrap btn btn-outline btn-sm w-100">view detail</a>
        </div>
    </div>
</div>

