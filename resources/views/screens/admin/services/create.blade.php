    @section('title', 'Create Service')
    @extends('layouts.admin.master')
    @section('content')
        <div class="container-fluid">
            <div class="edit-profile">
                <form class="card ajax-form" id="createServiceForm" action="{{route('services.store')}}" method="POST">
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
                            <div class="col-sm-6 col-md-6">
                                <div class="mb-3">
                                    <label class="form-label" for="name">Service Name <span
                                            class="text-danger">*</span></label>
                                    <input class="form-control" id="name" type="text"
                                        placeholder="Enter Service Name" name="title" />
                                </div>
                            </div>
                            <div class="col-sm-6 col-md-6">
                                <div class="mb-3">
                                    <label class="form-label" for="category">Category <span
                                            class="text-danger">*</span></label>
                                    {{-- <input class="form-control" id="category" type="text" placeholder="Enter Category"
                                        name="category" /> --}}
                                    <select class="form-select btn-square digits custom-scrollbar" name="service_category_id" id="">
                                        <option value="" selected>Select Category</option>
                                        @foreach ($serviceCategories as $serviceCategory)
                                            <option value="{{ $serviceCategory->id }}">{{ $serviceCategory->name }}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-6 col-md-6">
                                <div class="mb-3">
                                    <label class="form-label" for="price">Price <span
                                            class="text-danger">*</span></label>
                                    <input class="form-control" id="price" type="text" placeholder="Enter Price"
                                        name="price" />
                                </div>
                            </div>
                            <div class="col-sm-6 col-md-6">
                                <div class="mb-3">
                                    <label class="form-label" for="duration">Duration</label>
                                    <input class="form-control" id="duration" type="text"
                                        placeholder="Enter Duration (e.g., 2 hours)" name="duration" />
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="mb-3">
                                    <label class="form-label" for="description">Description</label>
                                    <textarea class="form-control" id="description" rows="3" placeholder="Enter Service Description"
                                        name="description"></textarea>
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
            ajaxCreate("{{ route('services.index') }}");
        </script>
    @endpush
