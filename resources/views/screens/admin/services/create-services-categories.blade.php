@section('title', 'Create Services Categories')
@extends('layouts.admin.master')
@section('content')
<div class="container-fluid">
    <div class="edit-profile">
        <form class="card ajax-form" id="createServiceForm" action="{{ route('services-categories.store') }}" method="POST">
            @csrf
            <div class="card-header">
                <div class="card-options">
                    <a class="card-options-collapse" href="#" data-bs-toggle="card-collapse"><i
                            class="fe fe-chevron-up"></i></a><a class="card-options-remove" href="#"
                        data-bs-toggle="card-remove"><i class="fe fe-x"></i></a>
                </div>
            </div>
            <div class="card-body">
                <div class="row custom-input">
                    <div class="col-12">
                        <div class="mb-3">
                            <label class="form-label" for="category_name">Category Name <span class="text-danger">*</span></label>
                            <input class="form-control" id="category_name"
                                type="text" placeholder="Enter Service Name" name="name" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="card-footer text-end">
                <button class="btn btn-primary" type="submit">
                    Create
                </button>
            </div>
        </form>
    </div>
</div>
@endsection
@push('scripts')
<script>
    ajaxCreate("{{ route('services-categories.index') }}");
</script>
@endpush

