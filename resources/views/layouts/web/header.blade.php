<header class="header w-100 {{ isset($isHome) ? 'position-absolute' : '' }}">
    <div class="container">
        <div class="row justify-content-between align-items-center">
            <div class="col-lg-2 col-3">
                <div class="logo" data-aos="fade-right" data-aos-duration="800" data-aos-delay="0">
                    <img src="{{ asset('images/logo.png') }}" alt="logo">
                </div>
            </div>
            <div class="col-lg-6 col-1">
                <nav>
                    <ul class="primary-navs d-flex justify-content-between align-items-center gap-20">
                        <div class="close-icon">
                            <i class="fa-solid fa-xmark menu-toggle"></i>
                        </div>
                        <li data-aos="fade-down" data-aos-duration="600" data-aos-delay="100"><a
                                href="{{ route('home') }}">Home</a></li>
                        <li data-aos="fade-down" data-aos-duration="600" data-aos-delay="150"><a
                                href="{{ route('about') }}">About</a></li>
                        <li data-aos="fade-down" data-aos-duration="600" data-aos-delay="200"><a
                                href="{{ route('web.services.index') }}">Services</a></li>
                        <li data-aos="fade-down" data-aos-duration="600" data-aos-delay="250"><a
                                href="{{ route('packages.index') }}">Membership</a></li>
                        <li class="position-relative" data-aos="fade-down" data-aos-duration="600" data-aos-delay="300">
                            <a href="#" class="dropdown-menu-btn">Marketplace <i class="fa-solid fa-chevron-down"
                                    style="font-size: 0.7em; margin-left: 5px;"></i></a>
                            <div class="dropdown-menu-wrapper">
                                <ul>
                                    <li><a href="{{ route('marketplace') }}">Browse Contractors</a></li>
                                    <li><a href="{{ route('products') }}">All Products</a></li>
                                </ul>
                            </div>
                        </li>
                        <li data-aos="fade-down" data-aos-duration="600" data-aos-delay="350"><a
                                href="{{ route('referrals') }}">Referrals</a></li>
                    </ul>
                </nav>
            </div>
            <div class="col-lg-3 col-8 d-flex gap-20 justify-content-end align-items-center">
                <div class="d-flex align-items-center flex-grow-1 gap-30 justify-content-between"
                    @if (auth()->check()) style="max-width: max-content;"
                @else
                 style="max-width: 310px;" @endif
                    data-aos="fade-left" data-aos-duration="800" data-aos-delay="200">
                    <a href="{{ route('cart') }}"
                        class="position-relative cart-icon d-flex align-items-center justify-content-center"
                        data-aos="fade-left" data-aos-duration="600" data-aos-delay="250">
                        <i class="fa-solid fa-cart-shopping"></i>
                        <span class="cart-count">0</span>
                    </a>
                    @if (auth()->check())
                        <div class="profile-dropdown-wrapper position-relative">
                            <button class="profile-dropdown-btn">
                                @php
                                    $userRole = Auth::user()->roles->first();
                                    $roleName = $userRole ? $userRole->name : 'Customer';
                                @endphp
                                <span class="">
                                    {{ Auth::user()->name }}
                                </span>
                                <i class="fa-solid fa-angle-down"></i>
                            </button>
                            <div class="profile-dropdown-menu">
                                <ul>
                                    <li class="dropdown-item"><a class="dropdown-link"
                                            href="{{ route('admin.dashboard') }}">Dashboard</a></li>
                                    <li class="dropdown-item"><a class="dropdown-link"
                                            href="{{ route('profile') }}">Update Profile</a></li>
                                    <li class="dropdown-item">
                                        <a class="dropdown-link" href="{{ route('logout') }}"
                                            onclick="event.preventDefault(); document.getElementById('logout-form').submit();">
                                            Logout
                                        </a>

                                        <form id="logout-form" action="{{ route('logout') }}" method="POST"
                                            class="d-none">
                                            @csrf
                                        </form>

                                    </li>
                                </ul>
                            </div>
                        </div>
                    @else
                        <a href="{{ route('login') }}" class="bootstrap text-white" data-aos="fade-left"
                            data-aos-duration="600" data-aos-delay="300">Login</a>
                        <div class="join-now-btn position-relative" data-aos="fade-left" data-aos-duration="600"
                            data-aos-delay="400">
                            <a href="{{ route('register') }}" class="bootstrap header-btn">Join Now </a>
                            <div
                                class="circle-md bg-primary-theme join-now-arrow top-50 translate-middle-y position-absolute">
                                <span class="text-white fs-16"><i class="fa-solid fa-arrow-right"></i></span>
                            </div>
                        </div>
                    @endif
                </div>
                <div class="menu-icon" data-aos="fade-left" data-aos-duration="600" data-aos-delay="450">
                    <i class="fa-solid fa-bars menu-toggle"></i>
                </div>
            </div>
        </div>
    </div>
</header>
