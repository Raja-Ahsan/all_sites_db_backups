{{-- @php
    $userRoleId = checkUser()->roles->first()->id;
@endphp --}}

<div class="sidebar-wrapper" data-sidebar-layout="stroke-svg">
    <div class="logo-wrapper">
        <a href="">
            <img class="img-fluid for-light" src="{{ asset('/images/logo.png') }}" alt="" style="max-width: 60px" />
            <img class="img-fluid for-dark" src="{{ asset('/images/logo.png') }}" alt=""
                style="max-width: 60px" />
        </a>
        <div class="back-btn"><i class="fa-solid fa-angle-left"></i></div>
        {{-- <div class="toggle-sidebar">
            <i class="status_toggle middle sidebar-toggle" data-feather="grid"></i>
        </div> --}}
    </div>
    {{-- <div class="logo-icon-wrapper">
        <a href="">
            <img class="img-fluid" src="{{ asset('/images/logo.png') }}" alt="" />
        </a>
    </div> --}}
    <nav class="sidebar-main">
        <div class="left-arrow" id="left-arrow">
            <i data-feather="arrow-left"></i>
        </div>
        <div id="sidebar-menu">
            <ul class="sidebar-links" id="simple-bar">
                <li class="back-btn">
                    {{-- <a href="">
                        <img class="img-fluid" src="{{ asset('images/logo.png') }}" alt="" />
                    </a> --}}
                    <div class="mobile-back text-end">
                        <span>Back</span><i class="fa-solid fa-angle-right ps-2" aria-hidden="true"></i>
                    </div>
                </li>
                <li class="pin-title sidebar-main-title">
                    <div>
                        <h6>Pinned</h6>
                    </div>
                </li>
                @php
                    $user = Auth::user();
                    $rolesById = $user->roles->first()->id;
                    $userRole = Auth::user()->roles->first();
                    $modules = $userRole ? dynamic_sidebar($userRole->id) : [];
                    $companyApproved = auth()->user()->company?->is_profile_approved ?? false;
                    $rolesById == 4;

                    $protectedRoutes = [
        'contractors.index',
        'contractors.create',
        'services.index',
        'services.create',
    ];
                @endphp

                @foreach ($modules as $module)
                    <li class="sidebar-list">
                        <i class="fa-solid fa-thumbtack"></i>
                        <a href="{{ Route::has($module->route_name) ? route($module->route_name) : 'javascript:void(0)' }}"
                            class="sidebar-link sidebar-title {{ !empty($module->children) ? '' : 'link-nav' }}">
                            <span class="theme-icons"><i class="{{ $module->icon }}"></i></span>
                            <span>{{ $module->name }}</span>
                            <div class="according-menu"><i class="fa-solid fa-angle-right"></i></div>
                        </a>
                        @if (!empty($module->children))
                            <ul class="sidebar-submenu">
                                @foreach ($module->children as $child)
                                @php
                                $isDisabled = (
                                    $rolesById == 4 &&                 // league contractor
                                    !$companyApproved &&              // company NOT approved
                                    in_array($child->route_name, $protectedRoutes) // protected route
                                );
                            @endphp
                                    <li>
                                        <a href="{{ $isDisabled ? 'javascript:void(0)' : route($child->route_name) }}"
                                            aria-disabled="{{ $isDisabled ? 'true' : 'false' }}">
                                             {{ $child->name }}
                                         </a>
                                    </li>
                                @endforeach
                            </ul>
                        @endif
                    </li>
                @endforeach
            </ul>
        </div>
        <div class="right-arrow" id="right-arrow">
            <i data-feather="arrow-right"></i>
        </div>
    </nav>
</div>
