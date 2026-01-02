{{-- super admin dashboard --}}

@section('title', 'Dashboard')
@extends('layouts.admin.master')
@section('content')
    <div class="container-fluid default-dashboard">
        <div class="row widget-grid">
            <div class="col-xxl-auto col-xl-3 col-sm-6 box-col-3">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="card widget-1">
                            <div class="card-body">
                                <div class="widget-content">
                                    <div class="widget-round secondary">
                                        <div class="bg-round">
                                            <svg>
                                                <use href="{{ asset('/assets/libs/svg/icon-sprite.svg#c-revenue') }}"></use>
                                            </svg><svg class="half-circle svg-fill">
                                                <use href="{{ asset('/assets/libs/svg/icon-sprite.svg#halfcircle') }}">
                                                </use>
                                            </svg>
                                        </div>
                                    </div>
                                    <div>
                                        <span class="f-light">Total Orders</span>
                                        <h4>
                                            <span class="">
                                                {{-- data-target="{{ $blogCount }}">{{ $blogCount }}</span> --}}
                                            </span>
                                        </h4>
                                    </div>
                                </div>
                                <div class="font-success f-w-500">
                                    <i class="bookmark-search me-1" ></i><span
                                        class="txt-success">+50%</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            {{-- <div class="col-xxl-auto col-xl-3 col-sm-6 box-col-3">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="card widget-1">
                            <div class="card-body">
                                <div class="widget-content">
                                    <div class="widget-round warning">
                                        <div class="bg-round">
                                            <svg>
                                                <use href="{{ asset('/assets/libs/svg/icon-sprite.svg#c-profit') }}"></use>
                                            </svg><svg class="half-circle svg-fill">
                                                <use href="{{ asset('/assets/libs/svg/icon-sprite.svg#halfcircle') }}">
                                                </use>
                                            </svg>
                                        </div>
                                    </div>
                                    <div>
                                        <span class="f-light">Total Users</span>
                                        <h4>
                                            <span class="counter" data-target="80">0</span>%
                                        </h4>
                                    </div>
                                </div>
                                <div class="font-danger f-w-500">
                                    <i class="bookmark-search me-1" data-feather="trending-down"></i><span
                                        class="txt-danger">-20%</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-12">
                            <div class="card widget-1">
                                <div class="card-body">
                                    <div class="widget-content">
                                        <div class="widget-round primary">
                                            <div class="bg-round">
                                                <svg class="fill-primary">
                                                    <use href="{{ asset('/assets/libs/svg/icon-sprite.svg#c-invoice') }}">
                                                    </use>
                                                </svg><svg class="half-circle svg-fill">
                                                    <use href="{{ asset('/assets/libs/svg/icon-sprite.svg#halfcircle') }}">
                                                    </use>
                                                </svg>
                                            </div>
                                        </div>
                                        <div>
                                            <span class="f-light">Pending Submittals</span>
                                            <h4 class="counter" data-target="10905">0</h4>
                                        </div>
                                    </div>
                                    <div class="font-success f-w-500">
                                        <i class="bookmark-search me-1" data-feather="trending-up"></i><span
                                            class="txt-success">+50%</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xxl-auto col-xl-3 col-sm-6 box-col-3">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="card widget-1">
                            <div class="card-body">
                                <div class="widget-content">
                                    <div class="widget-round warning">
                                        <div class="bg-round">
                                            <svg>
                                                <use href="{{ asset('/assets/libs/svg/icon-sprite.svg#c-profit') }}"></use>
                                            </svg><svg class="half-circle svg-fill">
                                                <use href="{{ asset('/assets/libs/svg/icon-sprite.svg#halfcircle') }}">
                                                </use>
                                            </svg>
                                        </div>
                                    </div>
                                    <div>
                                        <span class="f-light">Global Projects</span>
                                        <h4>
                                            <span class="counter" data-target="80">0</span>%
                                        </h4>
                                    </div>
                                </div>
                                <div class="font-danger f-w-500">
                                    <i class="bookmark-search me-1" data-feather="trending-down"></i><span
                                        class="txt-danger">-20%</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-12">
                            <div class="card widget-1">
                                <div class="card-body">
                                    <div class="widget-content">
                                        <div class="widget-round primary">
                                            <div class="bg-round">
                                                <svg class="fill-primary">
                                                    <use href="{{ asset('/assets/libs/svg/icon-sprite.svg#c-invoice') }}">
                                                    </use>
                                                </svg><svg class="half-circle svg-fill">
                                                    <use href="{{ asset('/assets/libs/svg/icon-sprite.svg#halfcircle') }}">
                                                    </use>
                                                </svg>
                                            </div>
                                        </div>
                                        <div>
                                            <span class="f-light">System Alerts</span>
                                            <h4 class="counter" data-target="10905">0</h4>
                                        </div>
                                    </div>
                                    <div class="font-success f-w-500">
                                        <i class="bookmark-search me-1" data-feather="trending-up"></i><span
                                            class="txt-success">+50%</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xxl-auto col-xl-3 col-sm-6 box-col-3">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="card widget-1">
                            <div class="card-body">
                                <div class="widget-content">
                                    <div class="widget-round warning">
                                        <div class="bg-round">
                                            <svg>
                                                <use href="{{ asset('/assets/libs/svg/icon-sprite.svg#c-profit') }}"></use>
                                            </svg><svg class="half-circle svg-fill">
                                                <use href="{{ asset('/assets/libs/svg/icon-sprite.svg#halfcircle') }}">
                                                </use>
                                            </svg>
                                        </div>
                                    </div>
                                    <div>
                                        <span class="f-light">Total Revenue</span>
                                        <h4>
                                            <span class="">$0</span>
                                        </h4>
                                    </div>
                                </div>
                                <div class="font-danger f-w-500">
                                    <i class="bookmark-search me-1" data-feather="trending-down"></i><span
                                        class="txt-danger">-20%</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div> --}}
        </div>
    </div>
@endsection
