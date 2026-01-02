@section('title', 'All Orders')
@extends('layouts.admin.master')
@section('content')
    <div class="container-fluid user-list-wrapper">
        <div class="row">
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
@endsection

