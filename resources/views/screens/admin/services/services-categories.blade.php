@section('title', 'All Services Categories')
@extends('layouts.admin.master')
@section('content')
    <div class="container-fluid user-list-wrapper">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header card-no-border text-end">
                        <div class="card-header-right-icon">
                            <a class="btn btn-primary f-w-500" href="{{ route('services-categories.create') }}"><i
                                    class="fa-solid fa-plus pe-2"></i>Add
                                Services Category</a>
                        </div>
                    </div>
                    <div class="card-body pt-0 px-0">
                        <div class="list-product user-list-table">
                            <div class="table-responsive custom-scrollbar">
                                <table class="table" id="services-table">
                                    <thead>
                                        <tr>
                                            <th>
                                                <span class="c-o-light f-w-600">Category Name</span>
                                            </th>
                                            <th>
                                                <span class="c-o-light f-w-600">Actions</span>
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach ($serviceCategories as $serviceCategory)
                                            <tr class="product-removes inbox-data" data-id="{{ $serviceCategory->id }}">
                                                <td>
                                                    <p>{{ $serviceCategory->name }}</p>
                                                </td>
                                                <td>
                                                    <div class="common-align gap-2 justify-content-start">
                                                        <a class="square-white" href="#!">
                                                            <span><i class="fa-solid fa-eye"></i></span>
                                                        </a>
                                                        <a class="square-white" href="#!">
                                                            <span><i class="fa-solid fa-pen"></i></span>
                                                        </a>
                                                        <form
                                                            action="{{ route('services-categories.destroy', $serviceCategory->id) }}"
                                                            method="POST">
                                                            @csrf
                                                            @method('DELETE')
                                                            <button type="submit" class="square-white ajax-delete">
                                                                <span><i class="fa-solid fa-trash"></i></span>
                                                            </button>
                                                        </form>
                                                    </div>
                                                </td>
                                            </tr>
                                        @endforeach
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
@push('scripts')
    <script>
        ajaxDelete('.ajax-delete', 'tr');
    </script>
@endpush