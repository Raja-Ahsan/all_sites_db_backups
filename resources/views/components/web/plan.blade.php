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
    'features' => [],
    'url' => route('membership'),
])

<div class="pkg-wrapper glass">
    <h4 class="hd-lg hd-sm mb-20">{{$title}}</h4>
    <h4 class="hd-lg price-text mb-30">{{$price}}<span class="fs-30">/month</span></h4>
    <ul class="pkg-list position-relative">
        @foreach($features as $feature)
        <li class="pkg-list-item">{{$feature}}</li>
        @endforeach
    </ul>
    <a href="{{$url}}" class="btn btn-secondary w-100">Join Now</a>
</div>