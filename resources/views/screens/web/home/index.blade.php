@extends('layouts.web.master')
@section('title', 'Home')
@section('content')
 
<main class="spotmee-main">
    <div class="px-5">
 <section
    class="hero-banner"
    style="background-image: url('{{ asset('images/banner-img.png') }}');">

    <div class="absolute inset-0 bg-black/10"></div>

    <div class="relative z-10 w-full max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex flex-col lg:flex-row items-start ">

            <!-- LEFT: Search Card -->
            <div class="w-full lg:w-1/2 flex justify-center lg:justify-start"
                 data-aos="fade-right">
                <div class="form-wrapper">
                    <h2 class="text-[20px] md:text-[30px] font-bold text-[var(--text-color)] mb-6"
                        data-aos="fade-up" data-aos-delay="100">
                        Find a home gym near you
                    </h2>

                    <div class="mb-5" data-aos="fade-up" data-aos-delay="200">
                        <label class="block text-[20px] font-regular mb-2">Location</label>
                        <input type="text" placeholder="Enter location or ZIP"
                            class="w-full bg-[#F3F4F6] rounded-lg px-5 py-3 outline-none focus:ring-2 focus:ring-[#4682B4]">
                    </div>

                    <div class="grid grid-cols-1 sm:grid-cols-2 gap-4 mb-6"
                         data-aos="fade-up" data-aos-delay="300">
                        <div>
                            <label class="block text-[20px] font-regular mb-2">Date</label>
                            <input type="date"
                                class="w-full bg-[#F3F4F6] rounded-lg px-5 py-3 outline-none focus:ring-2 focus:ring-[#4682B4]">
                        </div>
                        <div>
                            <label class="block text-[20px] font-regular mb-2">Time</label>
                            <input type="text" placeholder="Pick a time"
                                class="w-full bg-[#F3F4F6] rounded-lg px-5 py-3 outline-none focus:ring-2 focus:ring-[#4682B4]">
                        </div>
                    </div>

                    <button class="cta-btn w-full mb-4"
                            data-aos="zoom-in" data-aos-delay="400">
                        Find Gyms
                    </button>

                    <p class="text-center text-[18px] font-regular text-[var(--text-color)]"
                       data-aos="fade-up" data-aos-delay="500">
                        Private gyms near you. No memberships. No waiting.
                    </p>
                </div>
            </div>

            <!-- RIGHT: Content -->
            <div
                class="w-full lg:w-1/2 flex flex-col items-center lg:items-end "
                data-aos="fade-left">

                <h4
                    class="text-[30px] sm:text-[40px] font-bold leading-tight mb-8 max-w-[440px] mt-[50px] md:mt-[0px]"
                    data-aos="fade-up" data-aos-delay="150">
                    Find the Perfect
                    <span class="text-[var(--primary-color)]">Private Gym</span> Near You
                </h4>

                <div class="flex flex-col sm:flex-row gap-4 w-full max-w-[440px]"
                     data-aos="fade-up" data-aos-delay="300">
                    <a href="#" class="cta-btn">
                        Book a Gym
                    </a>
                    <a href="#"
                        class="px-8 py-3 border-2 border-[#333333] rounded-full text-lg text-center hover:bg-black hover:text-white transition">
                        Become a Host
                    </a>
                </div>

            </div>

        </div>
    </div>

</section>
</div>


    <!-- How It Works Section -->
<section class="container mx-auto px-4 py-16 sm:px-6">
    <h2 class="text-center text-[30px] md:text-[40px] font-bold text-[#333333] mb-16 leading-[1.1]"
        data-aos="fade-up">
        How <span class="text-[#4682B4]">SPOTMEE</span><br>Works
    </h2>

    <div class="grid grid-cols-1 md:grid-cols-3 gap-8 lg:gap-12">
        <!-- Step 1 -->
        <div class="flex flex-col"
             data-aos="fade-up" data-aos-delay="100">
            <div class="mb-4 w-full">
                <img src="{{ asset('images/work-img-1.png') }}" alt="Find Home Gyms Near You" class="spotmee-card-img">
            </div>
            <div class="flex flex-col items-start">
                <span class="step">Step 1</span>
                <h3 class="md-title mb-2">Find Home Gyms Near You</h3>
                <p class="md-para">
                    Find verified home gyms nearby. Filter by equipment, workout type, ratings, and availability.
                </p>
            </div>
        </div>

        <!-- Step 2 -->
        <div class="flex flex-col"
             data-aos="fade-up" data-aos-delay="250">
            <div class="mb-4 w-full">
                <img src="{{ asset('images/work-img-2.png') }}" alt="Select Date & Book Now" class="spotmee-card-img">
            </div>
            <div class="flex flex-col items-start">
                <span class="inline-block bg-[#4682B4] text-[#FFFFFF] rounded-full px-4 py-1 mb-2 text-sm font-semibold">Step 2</span>
                <h3 class="md-title mb-2">Select Date & Book Now</h3>
                <p class="md-para">
                    Select a date and time, and book your session easily no commitments required.
                </p>
            </div>
        </div>

        <!-- Step 3 -->
        <div class="flex flex-col"
             data-aos="fade-up" data-aos-delay="400">
            <div class="mb-4 w-full ">
                <img src="{{ asset('images/work-img-3.png') }}" alt="Work Out Your Way" class="spotmee-card-img">
            </div>
            <div class="flex flex-col items-start">
                <span class="step">Step 3</span>
                <h3 class="md-title mb-2">Work Out Your Way</h3>
                <p class="md-para">
                    Enjoy a clean, private workout. No crowds, no waiting—just you and your goals.
                </p>
            </div>
        </div>
    </div>
</section>

    <!-- Popular Gym Section -->
    <section class="container mx-auto px-4 py-10 sm:px-6 lg:px-8">
        <div class="flex flex-col md:flex-row items-end justify-between mb-8 md:mb-12 gap-6">
            <div data-aos="fade-up">
                <h2 class="heading">
                    Popular <span class="text-[#4682B4]">Gyms</span> Near You
                </h2>
                <p class="text-[#333333] text-base md:text-lg">
                    Handpicked private home gyms with top-tier equipment, <br class="md:block hidden"> great reviews, and instant booking options.
                </p>
            </div>
            
            <!-- Custom Navigation Arrows -->
            <div class="flex gap-3 hidden md:flex" data-aos="fade-left">
                <button class="gym-prev w-12 h-12 rounded-full border bg-[#A4A4A4] border-gray-300 flex items-center justify-center text-[#fff] hover:bg-[#4682B4] hover:text-white hover:border-[#4682B4] transition-all focus:outline-none">
                    <i class="fas fa-chevron-left"></i>
                </button>
                <button class="gym-next w-12 h-12 rounded-full bg-[#4682B4] flex items-center justify-center text-white hover:bg-[#3a6d96] transition-all focus:outline-none shadow-md">
                    <i class="fas fa-chevron-right"></i>
                </button>
            </div>
        </div>

        <!-- Slider -->
        <div class="gym-slider -mx-3" data-aos="fade-up" data-aos-delay="100">
            <!-- Card 1 -->
            <div class="gym-card" data-aos="zoom-in" data-aos-delay="150">
                <div class="gym-card-main">
                    <div class="relative aspect-w-4 aspect-h-3 h-[300px]">
                        <img src="{{ asset('images/popular-gym-img-001.png') }}" class="gym-card-img" alt="The Strength Studio">
                    </div>
                    <div class="pt-5 pb-2">
                        <div class="flex justify-between items-start mb-1">
                            <h3 class="md-title">The Strength Studio</h3>
                            <div class="flex items-center gap-1">
                                <i class="fas fa-star text-yellow-400 text-sm"></i>
                                <span class="rating">4.9</span>
                            </div>
                        </div>
                        <p class="md-para-slider">Private Garage Gym</p>
                        
                        <div class="flex items-center gap-2 text-gray-600 text-[18px] mb-2">
                            <i class="fas fa-map-marker-alt text-[#4682B4]"></i>
                            <span class="text-[#333333] text-[18px] font-regular">Dallas, TX • 1.2 miles away</span>
                        </div>
                        
                         <div class="price">
                            $18/hour
                        </div>
                    </div>
                </div>
            </div>

            <!-- Card 2 -->
            <div class="gym-card" data-aos="zoom-in" data-aos-delay="250">
                <div class="gym-card-main">
                    <div class="relative aspect-w-4 aspect-h-3 h-[300px]">
                        <img src="{{ asset('images/popular-gym-img-002.png') }}" class="gym-card-img" alt="The Cardio Loft">
                    </div>
                    <div class="pt-5 pb-2">
                        <div class="flex justify-between items-start mb-1">
                            <h3 class="md-title">The Cardio Loft</h3>
                            <div class="flex items-center gap-1">
                                <i class="fas fa-star text-yellow-400 text-sm"></i>
                                <span class="rating">4.8</span>
                            </div>
                        </div>
                        <p class="md-para-slider">Modern Home Fitness Room</p>
                        
                        <div class="flex items-center gap-2 text-gray-600 text-sm mb-2">
                            <i class="fas fa-map-marker-alt text-[#4682B4]"></i>
                            <span class="text-[#333333] text-[18px] font-regular">Austin, TX • 3.4 miles away</span>
                        </div>
                        
                         <div class="price">
                            $15/hour
                        </div>
                    </div>
                </div>
            </div>

            <!-- Card 3 -->
            <div class="gym-card" data-aos="zoom-in" data-aos-delay="350">
                <div class="gym-card-main">
                    <div class="relative aspect-w-4 aspect-h-3 h-[300px]">
                        <img src="{{ asset('images/popular-gym-img-003.png') }}" class="gym-card-img" alt="Ironclad Elite Gym">
                    </div>
                    <div class="pt-5 pb-2">
                        <div class="flex justify-between items-start mb-1">
                            <h3 class="md-title">Ironclad Elite Gym</h3>
                            <div class="flex items-center gap-1">
                                <i class="fas fa-star text-yellow-400 text-sm"></i>
                                <span class="rating">5.0</span>
                            </div>
                        </div>
                        <p class="md-para-slider">Basement Training Space</p>
                        
                        <div class="flex items-center gap-2 text-gray-600 text-sm mb-2">
                            <i class="fas fa-map-marker-alt text-[#4682B4]"></i>
                            <span class="text-[#333333] text-[18px] font-regular">Houston, TX • 2.0 miles away</span>
                        </div>
                        
                             <div class="price">
                            $22/hour
                        </div>
                    </div>
                </div>
            </div>

            <!-- Card 4 -->
            <div class="gym-card" data-aos="zoom-in" data-aos-delay="450">
                <div class="gym-card-main">
                    <div class="relative aspect-w-4 aspect-h-3 h-[300px]">
                        <img src="{{ asset('images/popular-gym-img-004.png') }}" class="gym-card-img" alt="ZenFlex Pilates">
                    </div>
                    <div class="pt-5 pb-2">
                        <div class="flex justify-between items-start mb-1">
                            <h3 class="md-title truncate">ZenFlex Pilates Studio</h3>
                            <div class="flex items-center gap-1">
                                <i class="fas fa-star text-yellow-400 text-sm"></i>
                                <span class="rating">4.9</span>
                            </div>
                        </div>
                        <p class="md-para-slider">Core Studio</p>
                        
                        <div class="flex items-center gap-2 text-gray-600 text-sm mb-2">
                            <i class="fas fa-map-marker-alt text-[#4682B4]"></i>
                            <span class="text-[#333333] text-[18px] font-regular">Miami, FL • 0.9 miles away</span>
                        </div>
                        
                               <div class="price">
                            $20/hour
                        </div>
                    </div>
                </div>
            </div>

            <!-- Card 5 -->
            <div class="gym-card" data-aos="zoom-in" data-aos-delay="550">
                <div class="gym-card-main">
                    <div class="relative aspect-w-4 aspect-h-3 h-[300px]">
                        <img src="{{ asset('images/popular-gym-img-001.png') }}" class="gym-card-img" alt="Titan Fitness">
                    </div>
                    <div class="pt-5 pb-2">
                        <div class="flex justify-between items-start mb-1">
                            <h3 class="md-title">Titan Fitness</h3>
                            <div class="flex items-center gap-1">
                                <i class="fas fa-star text-yellow-400 text-sm"></i>
                                <span class="rating">4.7</span>
                            </div>
                        </div>
                        <p class="md-para-slider">Heavy Lifting Zone</p>
                        
                        <div class="flex items-center gap-2 text-gray-600 text-sm mb-2">
                            <i class="fas fa-map-marker-alt text-[#4682B4]"></i>
                            <span class="text-[#333333] text-[18px] font-regular">Chicago, IL • 2.5 miles away</span>
                        </div>
                        
                          <div class="price">
                            $16/hour
                        </div>
                    </div>
                </div>
            </div>

            <!-- Card 6 -->
            <div class="gym-card" data-aos="zoom-in" data-aos-delay="650">
                <div class="gym-card-main">
                    <div class="relative aspect-w-4 aspect-h-3 h-[300px]">
                        <img src="{{ asset('images/popular-gym-img-002.png') }}" class="gym-card-img" alt="Urban Yoga Space">
                    </div>
                    <div class="pt-5 pb-2">
                        <div class="flex justify-between items-start mb-1">
                            <h3 class="md-title">Urban Yoga Space</h3>
                            <div class="flex items-center gap-1">
                                <i class="fas fa-star text-yellow-400 text-sm"></i>
                                <span class="rating">4.9</span>
                            </div>
                        </div>
                        <p class="md-para-slider">Peaceful Retreat</p>
                        
                        <div class="flex items-center gap-2 text-gray-600 text-sm mb-2">
                            <i class="fas fa-map-marker-alt text-[#4682B4]"></i>
                            <span class="text-[#333333] text-[18px] font-regular">Seattle, WA • 1.8 miles away</span>
                        </div>
                        
                        <div class="price">
                            $25/hour</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- View All Button -->
        <div class="text-center mt-8"  data-aos="fade-up" data-aos-delay="500">
            <a href="#" class="cta-btn">
                View All Gyms
            </a>
        </div>
    </section>

  <!-- Why People Love SPOTMEE -->
<section class="container mx-auto px-4 py-10 sm:px-6 lg:px-8 mb-16">
    <div class="text-center mb-16" data-aos="fade-up">
        <h2 class="heading">
            Why People Love<br>
            <span class="text-[#4682B4]">SPOTMEE</span>
        </h2>
        <p class="text-[#333333] text-[20px] font-regular max-w-xl mx-auto"
           data-aos="fade-up" data-aos-delay="150">
            Discover why thousands choose private home<br class="hidden md:block">
            gyms over crowded public spaces.
        </p>
    </div>

    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8 lg:gap-12 text-center">
        <!-- Item 1 -->
        <div class="spotmee-card"
             data-aos="zoom-in" data-aos-delay="100">
            <div class="spotmee-card-icon">
                <img src="{{ asset('images/icon-1.png') }}" class="w-12 h-12 object-contain" alt="Private & Safe">
            </div>
            <div class="mb-3">
                <span class="spotmee-card-span">
                    Private & Safe
                </span>
            </div>
            <h3 class="md-title mb-3 leading-[1.1]">
                Work out alone <br> and enjoy it!
            </h3>
            <p class="md-para-spotmee">
                Have a stress-free workout in a clean, private gym. No crowds or distractions.
            </p>
        </div>

        <!-- Item 2 -->
        <div class="spotmee-card"
             data-aos="zoom-in" data-aos-delay="250">
            <div class="spotmee-card-icon">
                <img src="{{ asset('images/icon-2.png') }}" class="w-12 h-12 object-contain" alt="Affordable & Flexible">
            </div>
            <div class="mb-3">
                <span class="inline-block bg-[#4682B4] text-white text-xs font-semibold px-4 py-1.5 rounded-full">
                    Affordable & Flexible
                </span>
            </div>
            <h3 class="md-title mb-3 leading-[1.1]">
                Pay Only for the <br> Time You Need.
            </h3>
            <p class="md-para-spotmee">
                No contracts or memberships. Book hourly sessions with transparent pricing.
            </p>
        </div>

        <!-- Item 3 -->
        <div class="spotmee-card"
             data-aos="zoom-in" data-aos-delay="400">
            <div class="spotmee-card-icon">
                <img src="{{ asset('images/icon-3.png') }}" class="w-12 h-12 object-contain" alt="Quality Equipment">
            </div>
            <div class="mb-3">
                <span class="spotmee-card-span">
                    Quality Equipment
                </span>
            </div>
            <h3 class="md-title mb-3 leading-[1.1]">
                Premium Equipment for <br> Every Workout Style.
            </h3>
            <p class="md-para-spotmee">
                Locate gyms with squat racks, cables, and treadmills, maintained by trusted hosts.
            </p>
        </div>

        <!-- Item 4 -->
        <div class="spotmee-card"
             data-aos="zoom-in" data-aos-delay="550">
            <div class="spotmee-card-icon">
                <img src="{{ asset('images/icon-4.png') }}" class="w-12 h-12 object-contain" alt="Verified Hosts">
            </div>
            <div class="mb-3">
                <span class="spotmee-card-span">
                    Verified Hosts
                </span>
            </div>
            <h3 class="md-title mb-3 leading-[1.1]">
                Trusted, Reviewed, <br> and Screened Hosts.
            </h3>
            <p class="md-para-spotmee">
                Hosts are verified and rated by users for a safe, reliable fitness experience.
            </p>
        </div>
    </div>

    <!-- CTA Button -->
    <div class="text-center mt-16"
         data-aos="fade-up" data-aos-delay="700">
        <a href="#" class="cta-btn">
            Get Started
        </a>
    </div>
</section>


   <!-- Earn Money With Your Home Gym -->
<section class="container mx-auto px-4 py-10">
    <div class="grid grid-cols-1 lg:grid-cols-2 gap-12 lg:gap-20 items-center">
        
        <!-- Left Side: Content -->
        <div class="flex flex-col items-start order-2 lg:order-1"
             data-aos="fade-right">
            <h2 class="heading"
                data-aos="fade-up" data-aos-delay="100">
                <span class="text-[#4682B4]">Earn Money</span> With<br>
                Your Home Gym
            </h2>

            <div class="space-y-4 mb-8">
                <!-- List Items -->
                <div class="flex items-center gap-3"
                     data-aos="fade-up" data-aos-delay="200">
                    <div class="list-div">
                        <i class="fas fa-check"></i>
                    </div>
                    <span class="list-span">Share your space.</span>
                </div>
                <div class="flex items-center gap-3"
                     data-aos="fade-up" data-aos-delay="300">
                    <div class="list-div">
                        <i class="fas fa-check"></i>
                    </div>
                    <span class="list-span">Support your community.</span>
                </div>
                <div class="flex items-center gap-3"
                     data-aos="fade-up" data-aos-delay="400">
                    <div class="list-div">
                        <i class="fas fa-check"></i>
                    </div>
                    <span class="list-span">Unlock new income.</span>
                </div>
            </div>

            <p class="text-[#333333] text-[20px] font-regular leading-relaxed mb-6 max-w-md"
               data-aos="fade-up" data-aos-delay="500">
                List your fitness space with SPOTMEE. Add photos, set pricing, and accept bookings. We connect you with users seeking quality workout spaces.
            </p>

            <a href="#"
               class="inline-block bg-[#4682B4] text-white font-regular text-[20px] px-8 py-3 rounded-full hover:bg-[#3a6d96] transition-all shadow-lg hover:shadow-blue-500/30 mb-6"
               data-aos="zoom-in" data-aos-delay="600">
                Start Hosting
            </a>

            <p class="text-[#333333] text-[18px] max-w-xs leading-relaxed"
               data-aos="fade-up" data-aos-delay="700">
                Join hundreds of hosts earning monthly income with spaces they already own.
            </p>
        </div>

        <!-- Right Side: Image -->
        <div class="order-1 lg:order-2"
             data-aos="fade-left">
            <img src="{{ asset('images/earn-money-right-img.png') }}" alt="Earn Money With Your Home Gym" class="w-full h-auto">
        </div>

    </div>
</section>


  <!-- Community & Discussions -->
<section class="container mx-auto px-4 py-16 sm:px-6 lg:px-8 mb-10">
    <div class="text-center mb-12" data-aos="fade-up">
        <h2 class="heading">
            Community & <br>
            <span class="text-[#4682B4]">Discussions</span>
        </h2>
        <p class="text-[#333333] text-[20px]"
           data-aos="fade-up" data-aos-delay="150">
            Where fitness lovers, hosts, and users come together.
        </p>
    </div>

    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 lg:gap-8 mb-12">
        <!-- Card 1 -->
        <div class="flex flex-col"
             data-aos="fade-up" data-aos-delay="100">
            <div class="mb-4 aspect-w-16 aspect-h-10">
                <img src="{{ asset('images/community-img-001.png') }}" class="community-img" alt="Real Conversations">
            </div>
            <h3 class="md-title mb-2">Real Conversations</h3>
            <p class="text-[#333333] text-[18px] leading-[1.4]">
                Join active discussions, share ideas, and talk to others on similar fitness journeys.
            </p>
        </div>

        <!-- Card 2 -->
        <div class="flex flex-col"
             data-aos="fade-up" data-aos-delay="250">
            <div class="mb-4 aspect-w-16 aspect-h-10">
                <img src="{{ asset('images/community-img-002.png') }}" class="community-img" alt="Share Your Journey">
            </div>
            <h3 class="md-title mb-2">Share Your Journey</h3>
            <p class="text-[#333333] text-[18px] leading-[1.4]">
                Post your workout stories, progress moments, and inspire others in the community.
            </p>
        </div>

        <!-- Card 3 -->
        <div class="flex flex-col"
             data-aos="fade-up" data-aos-delay="400">
            <div class="mb-4 aspect-w-16 aspect-h-10">
                <img src="{{ asset('images/community-img-003.png') }}" class="community-img" alt="Expert Tips & Guides">
            </div>
            <h3 class="md-title mb-2">Expert Tips & Guides</h3>
            <p class="text-[#333333] text-[18px] leading-[1.4]">
                Explore fitness insights from hosts, trainers, and experienced athletes.
            </p>
        </div>

        <!-- Card 4 -->
        <div class="flex flex-col"
             data-aos="fade-up" data-aos-delay="550">
            <div class="mb-4 aspect-w-16 aspect-h-10">
                <img src="{{ asset('images/community-img-004.png') }}" class="community-img" alt="Connect With Hosts">
            </div>
            <h3 class="md-title mb-2">Connect With Hosts</h3>
            <p class="text-[#333333] text-[18px] leading-[1.4]">
                Build real connections with home gym owners and local fitness enthusiasts.
            </p>
        </div>
    </div>

    <!-- CTA Button -->
    <div class="text-center"
         data-aos="fade-up" data-aos-delay="700">
        <a href="#" class="cta-btn">
            Visit Blog
        </a>
    </div>
</section>
<div class="px-5">
 <!-- Your Perfect Workout -->
<section class="relative w-full h-[600px] bg-cover bg-center rounded-[15px]"
    style="background-image: url('{{ asset('images/perfect.png') }}');">

    <div class="relative z-10 w-full h-full flex">
        <div class="absolute top-6 left-6 md:top-12 md:left-12"
             data-aos="fade-right">
            <h2 class="heading mb-6"
                data-aos="fade-up" data-aos-delay="100">
                Your <span class="text-[#4682B4]">Perfect Workout </span><br>
                Space Is Just a Click Away.
            </h2>

            <div class="mt-10" data-aos="zoom-in" data-aos-delay="250">
                <a href="#" class="cta-btn">
                    Get Started
                </a>
            </div>
        </div>
    </div>
</section>
</div>



</main>
@endsection
 
@push('scripts')

@endpush