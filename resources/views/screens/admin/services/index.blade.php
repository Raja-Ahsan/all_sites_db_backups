@section('title', 'All Services')
@extends('layouts.admin.master')
@section('content')
    <div class="container-fluid user-list-wrapper">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header card-no-border text-end">
                        <div class="card-header-right-icon">
                            <a class="btn btn-primary f-w-500" href="{{ route('services.create') }}"><i
                                    class="fa-solid fa-plus pe-2"></i>Add
                                Service</a>
                        </div>
                    </div>
                    <div class="card-body pt-0 px-0">
                        <div class="list-product user-list-table">
                            <div class="table-responsive custom-scrollbar">
                                <table class="table" id="services-table">
                                    <thead>
                                        <tr>
                                            <th>
                                                <span class="c-o-light f-w-600">Service Name</span>
                                            </th>
                                            <th>
                                                <span class="c-o-light f-w-600">Image</span>
                                            </th>
                                            <th>
                                                <span class="c-o-light f-w-600">Category</span>
                                            </th>
                                            {{-- <th>
                                                <span class="c-o-light f-w-600">Duration</span>
                                            </th> --}}
                                            <th>
                                                <span class="c-o-light f-w-600">Status</span>
                                            </th>
                                            <th>
                                                <span class="c-o-light f-w-600">Actions</span>
                                            </th>
                                        </tr>
                                    </thead>
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
    <script src="{{ asset('assets/js/crud-modal.js') }}"></script>
    <script>
        ajaxDelete('.ajax-delete', 'tr');
        ajaxUpdate('#crudForm', null, 'tr');

        function updateCategoryRow(category) {

            let row = $('tr[data-id="' + category.id + '"]');

            row.find('td:first p').text(category.name);

            row.find('.btn-edit').attr('data-name', category.name);

        }


        $(document).on('click', '.btn-edit', function() {

            let id = $(this).data('id');
            let name = $(this).attr('data-name');

            openCrudModal({
                title: "Edit Service Category",
                button: "Update",
                url: "/admin/services/categories/" + id,
                method: "PUT",
                fields: `
        <div class="mb-3">
            <label>Category Name</label>
            <input type="text" name="name" value="${name}" class="form-control">
        </div>
    `,
            });
        });

        $(function() {
            $('#services-table').DataTable({
                processing: true,
                serverSide: true,
                order: [],
                ajax: "{{ route('admin.services.getServicesData') }}",
                columns: [
                    {data: 'id', visible: false, searchable: false},
                    {
                        data: 'title'
                    },
                    {
                        data: 'category',
                        orderable: false
                    },
                    {
                        data: 'user',
                        orderable: false
                    },
                    {
                        data: 'action',
                        orderable: false,
                        searchable: false
                    },
                ]
            });
        });
    </script>
@endpush
