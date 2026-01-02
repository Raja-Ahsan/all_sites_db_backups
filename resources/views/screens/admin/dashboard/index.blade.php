{{-- super admin dashboard --}}

@section('title', 'Dashboard')
@extends('layouts.admin.master')
@section('content')
    <div class="container-fluid default-dashboard">
        <div class="row widget-grid">
            <div class="col-xxl-auto col-xl-3 col-sm-6 box-col-3">
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
                                <span class="f-light">Total Revenue</span>
                                <h4>
                                    <span class="">
                                        <span class="" data-target="">0</span>
                                    </span>
                                </h4>
                            </div>
                        </div>
                        {{-- <div class="font-success f-w-500">
                            <i class="bookmark-search me-1"></i><span class="txt-success">+50%</span>
                        </div> --}}
                    </div>
                </div>
            </div>
            <div class="col-xxl-auto col-xl-3 col-sm-6 box-col-3">
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
                                <span class="f-light">Total Products</span>
                                <h4>
                                    <span class="">
                                        <span class="" data-target="">0</span>
                                    </span>
                                </h4>
                            </div>
                        </div>
                        {{-- <div class="font-success f-w-500">
                            <i class="bookmark-search me-1"></i><span class="txt-success">+50%</span>
                        </div> --}}
                    </div>
                </div>
            </div>
            <div class="col-xxl-auto col-xl-3 col-sm-6 box-col-3">
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
                                <span class="f-light">Total Services</span>
                                <h4>
                                    <span class="">
                                        <span class="" data-target="">0</span>
                                    </span>
                                </h4>
                            </div>
                        </div>
                        {{-- <div class="font-success f-w-500">
                            <i class="bookmark-search me-1"></i><span class="txt-success">+50%</span>
                        </div> --}}
                    </div>
                </div>
            </div>
            <div class="col-xxl-auto col-xl-3 col-sm-6 box-col-3">
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
                                <span class="f-light">Total Referrals</span>
                                <h4>
                                    <span class="">
                                        <span class="" data-target="">0</span>
                                    </span>
                                </h4>
                            </div>
                        </div>
                        {{-- <div class="font-success f-w-500">
                            <i class="bookmark-search me-1"></i><span class="txt-success">+50%</span>
                        </div> --}}
                    </div>
                </div>
            </div>
            <div class="col-xxl-auto col-xl-3 col-sm-6 box-col-3">
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
                                <span class="f-light">Total Services</span>
                                <h4>
                                    <span class="">
                                        <span class="" data-target="">0</span>
                                    </span>
                                </h4>
                            </div>
                        </div>
                        {{-- <div class="font-success f-w-500">
                            <i class="bookmark-search me-1"></i><span class="txt-success">+50%</span>
                        </div> --}}
                    </div>
                </div>
            </div>
            <div class="col-xxl-auto col-xl-3 col-sm-6 box-col-3">
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
                                        <span class="" data-target="">0</span>
                                    </span>
                                </h4>
                            </div>
                        </div>
                        {{-- <div class="font-success f-w-500">
                            <i class="bookmark-search me-1"></i><span class="txt-success">+50%</span>
                        </div> --}}
                    </div>
                </div>
            </div>
        </div>
        <div class="row user-list-wrapper">
            <div class="col-12">
                <div class="card">
                    <div class="card-header card-no-border">
                        <h5>All Orders</h5>
                    </div>
                    <div class="card-body pt-0 px-0">
                        <div class="list-product user-list-table">
                            <div class="table-responsive custom-scrollbar">
                                <table class="table" id="orders-table">
                                    <thead>
                                        <tr>
                                            <th>
                                                <span class="c-o-light f-w-600">Order ID</span>
                                            </th>
                                            <th>
                                                <span class="c-o-light f-w-600">Customer Name</span>
                                            </th>
                                            <th>
                                                <span class="c-o-light f-w-600">Total Amount</span>
                                            </th>
                                            <th>
                                                <span class="c-o-light f-w-600">Status</span>
                                            </th>
                                            <th>
                                                <span class="c-o-light f-w-600">Order Date</span>
                                            </th>
                                            <th>
                                                <span class="c-o-light f-w-600">Actions</span>
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr class="product-removes inbox-data">
                                            <td><a href="#!">#ORD-001</a></td>
                                            <td>
                                                <p>John Doe</p>
                                            </td>
                                            <td>
                                                <p>$250.00</p>
                                            </td>
                                            <td><span class="badge badge-light-success">Completed</span></td>
                                            <td>
                                                <p>15 Jan 2024, 10:30 AM</p>
                                            </td>
                                            <td>
                                                <div class="common-align gap-2 justify-content-start">
                                                    <a class="square-white" href="#!">
                                                        <span><i class="fa-solid fa-eye"></i></span>
                                                    </a>
                                                    {{-- <a class="square-white" href="#!">
                                                        <span><i class="fa-solid fa-pen"></i></span>
                                                    </a> --}}
                                                </div>
                                            </td>
                                        </tr>
                                        <tr class="product-removes inbox-data">
                                            <td><a href="#!">#ORD-002</a></td>
                                            <td>
                                                <p>Jane Smith</p>
                                            </td>
                                            <td>
                                                <p>$180.50</p>
                                            </td>
                                            <td><span class="badge badge-light-warning">Processing</span></td>
                                            <td>
                                                <p>20 Jan 2024, 02:15 PM</p>
                                            </td>
                                            <td>
                                                <div class="common-align gap-2 justify-content-start">
                                                    <a class="square-white" href="#!">
                                                        <span><i class="fa-solid fa-eye"></i></span>
                                                    </a>
                                                    {{-- <a class="square-white" href="#!">
                                                        <span><i class="fa-solid fa-pen"></i></span>
                                                    </a> --}}
                                                </div>
                                            </td>
                                        </tr>
                                        <tr class="product-removes inbox-data">
                                            <td><a href="#!">#ORD-003</a></td>
                                            <td>
                                                <p>Mike Johnson</p>
                                            </td>
                                            <td>
                                                <p>$95.00</p>
                                            </td>
                                            <td><span class="badge badge-light-info">Pending</span></td>
                                            <td>
                                                <p>25 Jan 2024, 11:45 AM</p>
                                            </td>
                                            <td>
                                                <div class="common-align gap-2 justify-content-start">
                                                    <a class="square-white" href="#!">
                                                        <span><i class="fa-solid fa-eye"></i></span>
                                                    </a>
                                                    {{-- <a class="square-white" href="#!">
                                                        <span><i class="fa-solid fa-pen"></i></span>
                                                    </a> --}}
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
@endsection
