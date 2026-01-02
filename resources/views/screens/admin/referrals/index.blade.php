@section('title', 'All Referrals')
@extends('layouts.admin.master')
@section('content')
    <div class="container-fluid user-list-wrapper">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header card-no-border text-end">
                        {{-- <div class="card-header-right-icon">
                            <a class="btn btn-primary f-w-500" href="{{ route('referrals.create') }}"><i
                                    class="fa-solid fa-plus pe-2"></i>Add
                                Referral</a>
                        </div> --}}
                    </div>
                    <div class="card-body pt-0 px-0">
                        <div class="list-product user-list-table">
                            <div class="table-responsive custom-scrollbar">
                                <table class="table" id="referrals-table">
                                    <thead>
                                        <tr>
                                            <th>
                                                <span class="c-o-light f-w-600">#</span>
                                            </th>
                                            <th>
                                                <span class="c-o-light f-w-600">Referrer Name</span>
                                            </th>
                                            <th>
                                                <span class="c-o-light f-w-600">Referred User</span>
                                            </th>
                                            <th>
                                                <span class="c-o-light f-w-600">Referral Code</span>
                                            </th>
                                            <th>
                                                <span class="c-o-light f-w-600">Commission</span>
                                            </th>
                                            <th>
                                                <span class="c-o-light f-w-600">Status</span>
                                            </th>
                                            <th>
                                                <span class="c-o-light f-w-600">Referral Date</span>
                                            </th>
                                            <th>
                                                <span class="c-o-light f-w-600">Actions</span>
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr class="product-removes inbox-data">
                                            <td>1</td>
                                            <td><a href="#!">John Doe</a></td>
                                            <td>
                                                <p>Jane Smith</p>
                                            </td>
                                            <td>
                                                <span class="badge badge-light-info">REF-2024-001</span>
                                            </td>
                                            <td>
                                                <p>$50.00</p>
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
                                                    <a class="square-white" href="#!">
                                                        <span><i class="fa-solid fa-pen"></i></span>
                                                    </a>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr class="product-removes inbox-data">
                                            <td>2</td>
                                            <td><a href="#!">Mike Johnson</a></td>
                                            <td>
                                                <p>Sarah Williams</p>
                                            </td>
                                            <td>
                                                <span class="badge badge-light-info">REF-2024-002</span>
                                            </td>
                                            <td>
                                                <p>$75.00</p>
                                            </td>
                                            <td><span class="badge badge-light-warning">Pending</span></td>
                                            <td>
                                                <p>20 Jan 2024, 02:15 PM</p>
                                            </td>
                                            <td>
                                                <div class="common-align gap-2 justify-content-start">
                                                    <a class="square-white" href="#!">
                                                        <span><i class="fa-solid fa-eye"></i></span>
                                                    </a>
                                                    <a class="square-white" href="#!">
                                                        <span><i class="fa-solid fa-pen"></i></span>
                                                    </a>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr class="product-removes inbox-data">
                                            <td>3</td>
                                            <td><a href="#!">David Brown</a></td>
                                            <td>
                                                <p>Emily Davis</p>
                                            </td>
                                            <td>
                                                <span class="badge badge-light-info">REF-2024-003</span>
                                            </td>
                                            <td>
                                                <p>$100.00</p>
                                            </td>
                                            <td><span class="badge badge-light-success">Completed</span></td>
                                            <td>
                                                <p>25 Jan 2024, 11:45 AM</p>
                                            </td>
                                            <td>
                                                <div class="common-align gap-2 justify-content-start">
                                                    <a class="square-white" href="#!">
                                                        <span><i class="fa-solid fa-eye"></i></span>
                                                    </a>
                                                    <a class="square-white" href="#!">
                                                        <span><i class="fa-solid fa-pen"></i></span>
                                                    </a>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr class="product-removes inbox-data">
                                            <td>4</td>
                                            <td><a href="#!">Robert Wilson</a></td>
                                            <td>
                                                <p>Lisa Anderson</p>
                                            </td>
                                            <td>
                                                <span class="badge badge-light-info">REF-2024-004</span>
                                            </td>
                                            <td>
                                                <p>$25.00</p>
                                            </td>
                                            <td><span class="badge badge-light-danger">Cancelled</span></td>
                                            <td>
                                                <p>28 Jan 2024, 09:20 AM</p>
                                            </td>
                                            <td>
                                                <div class="common-align gap-2 justify-content-start">
                                                    <a class="square-white" href="#!">
                                                        <span><i class="fa-solid fa-eye"></i></span>
                                                    </a>
                                                    <a class="square-white" href="#!">
                                                        <span><i class="fa-solid fa-pen"></i></span>
                                                    </a>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr class="product-removes inbox-data">
                                            <td>5</td>
                                            <td><a href="#!">James Taylor</a></td>
                                            <td>
                                                <p>Maria Garcia</p>
                                            </td>
                                            <td>
                                                <span class="badge badge-light-info">REF-2024-005</span>
                                            </td>
                                            <td>
                                                <p>$60.00</p>
                                            </td>
                                            <td><span class="badge badge-light-info">In Progress</span></td>
                                            <td>
                                                <p>30 Jan 2024, 04:30 PM</p>
                                            </td>
                                            <td>
                                                <div class="common-align gap-2 justify-content-start">
                                                    <a class="square-white" href="#!">
                                                        <span><i class="fa-solid fa-eye"></i></span>
                                                    </a>
                                                    <a class="square-white" href="#!">
                                                        <span><i class="fa-solid fa-pen"></i></span>
                                                    </a>
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