@section('title', 'All Memberships')
@extends('layouts.admin.master')
@section('content')
    <div class="container-fluid">
        <div class="col-12">
            <div class="card">
                <div class="card-body bottom-border-tab">
                    <ul class="nav nav-pills nav-primary" id="j-pills-tab" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" id="j-pills-active-tab" data-bs-toggle="pill"
                                href="#j-pills-active" role="tab" aria-controls="j-pills-active"
                                aria-selected="true">
                                Active Subscriptions
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="j-pills-expired-tab" data-bs-toggle="pill"
                                href="#j-pills-expired" role="tab" aria-controls="j-pills-expired"
                                aria-selected="false">
                                Expired Subscriptions
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="j-pills-pending-tab" data-bs-toggle="pill"
                                href="#j-pills-pending" role="tab" aria-controls="j-pills-pending"
                                aria-selected="false">
                                Pending Subscriptions
                            </a>
                        </li>
                    </ul>
                    <div class="tab-content" id="j-pills-tabContent">
                        <div class="tab-pane fade show active" id="j-pills-active" role="tabpanel"
                            aria-labelledby="j-pills-active-tab">
                            <div class="card-body px-0 pb-0">
                                <div class="user-header pb-2">
                                    <h6 class="fw-bold">Active Subscriptions:</h6>
                                </div>
                                <div class="user-content">
                                    <div class="table-responsive custom-scrollbar">
                                        <table class="table mb-0">
                                            <thead>
                                                <tr>
                                                    <th scope="col">#</th>
                                                    <th scope="col">User Name</th>
                                                    <th scope="col">Plan Name</th>
                                                    <th scope="col">Start Date</th>
                                                    <th scope="col">End Date</th>
                                                    <th scope="col">Amount</th>
                                                    <th scope="col">Status</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                @forelse ($memberships as $membership)
                                                <tr>
                                                    <th scope="row">1</th>
                                                    <td>John Doe</td>
                                                    <td>Premium Plan</td>
                                                    <td>2024-01-01</td>
                                                    <td>2024-12-31</td>
                                                    <td>$299.00</td>
                                                    <td><span class="badge bg-success">Active</span></td>
                                                </tr>    
                                                @empty
                                                    no memberships found
                                                @endforelse
                                                
                                                <tr>
                                                    <th scope="row">2</th>
                                                    <td>Jane Smith</td>
                                                    <td>Basic Plan</td>
                                                    <td>2024-02-15</td>
                                                    <td>2025-02-14</td>
                                                    <td>$99.00</td>
                                                    <td><span class="badge bg-success">Active</span></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="j-pills-expired" role="tabpanel"
                            aria-labelledby="j-pills-expired-tab">
                            <div class="card-body px-0 pb-0">
                                <div class="user-header pb-2">
                                    <h6 class="fw-bold">Expired Subscriptions:</h6>
                                </div>
                                <div class="user-content">
                                    <div class="table-responsive custom-scrollbar">
                                        <table class="table mb-0">
                                            <thead>
                                                <tr>
                                                    <th scope="col">#</th>
                                                    <th scope="col">User Name</th>
                                                    <th scope="col">Plan Name</th>
                                                    <th scope="col">Start Date</th>
                                                    <th scope="col">End Date</th>
                                                    <th scope="col">Amount</th>
                                                    <th scope="col">Status</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <th scope="row">1</th>
                                                    <td>Mike Johnson</td>
                                                    <td>Standard Plan</td>
                                                    <td>2023-06-01</td>
                                                    <td>2023-12-31</td>
                                                    <td>$199.00</td>
                                                    <td><span class="badge bg-danger">Expired</span></td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">2</th>
                                                    <td>Sarah Williams</td>
                                                    <td>Basic Plan</td>
                                                    <td>2023-03-10</td>
                                                    <td>2023-09-09</td>
                                                    <td>$99.00</td>
                                                    <td><span class="badge bg-danger">Expired</span></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="j-pills-pending" role="tabpanel"
                            aria-labelledby="j-pills-pending-tab">
                            <div class="card-body px-0 pb-0">
                                <div class="user-header pb-2">
                                    <h6 class="fw-bold">Pending Subscriptions:</h6>
                                </div>
                                <div class="user-content">
                                    <div class="table-responsive custom-scrollbar">
                                        <table class="table mb-0">
                                            <thead>
                                                <tr>
                                                    <th scope="col">#</th>
                                                    <th scope="col">User Name</th>
                                                    <th scope="col">Plan Name</th>
                                                    <th scope="col">Requested Date</th>
                                                    <th scope="col">Amount</th>
                                                    <th scope="col">Payment Status</th>
                                                    <th scope="col">Status</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <th scope="row">1</th>
                                                    <td>David Brown</td>
                                                    <td>Premium Plan</td>
                                                    <td>2024-01-15</td>
                                                    <td>$299.00</td>
                                                    <td><span class="badge bg-warning">Pending</span></td>
                                                    <td><span class="badge bg-warning">Pending</span></td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">2</th>
                                                    <td>Emily Davis</td>
                                                    <td>Standard Plan</td>
                                                    <td>2024-01-20</td>
                                                    <td>$199.00</td>
                                                    <td><span class="badge bg-info">Processing</span></td>
                                                    <td><span class="badge bg-warning">Pending</span></td>
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
    </div>
@endsection
