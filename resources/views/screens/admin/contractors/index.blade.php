@section('title', 'All Contractors')
@extends('layouts.admin.master')
@section('content')
    <div class="container-fluid user-list-wrapper">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header card-no-border text-end">
                        {{-- <div class="card-header-right-icon">
                            <a class="btn btn-primary f-w-500" href="{{ route('contractors.create') }}"><i
                                    class="fa-solid fa-plus pe-2"></i>Add
                                Contractor</a>
                        </div> --}}
                    </div>
                    <div class="card-body pt-0 px-0">
                        <div class="list-product user-list-table">
                            <div class="table-responsive custom-scrollbar">
                                <table class="table" id="contractors-table">
                                    <thead>
                                        <tr>
                                            <th>
                                                <span class="c-o-light f-w-600">Name</span>
                                            </th>
                                            <th>
                                                <span class="c-o-light f-w-600">Email</span>
                                            </th>
                                            <th>
                                                <span class="c-o-light f-w-600">Company</span>
                                            </th>
                                            <th>
                                                <span class="c-o-light f-w-600">Phone</span>
                                            </th>
                                            <th>
                                                <span class="c-o-light f-w-600">Status</span>
                                            </th>
                                            <th>
                                                <span class="c-o-light f-w-600">Creation Date</span>
                                            </th>
                                            <th>
                                                <span class="c-o-light f-w-600">Actions</span>
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @forelse ($contractors as $contractor)
                                            <tr class="product-removes inbox-data">
                                                <td><a href="#!">{{ $contractor->name }}</a></td>
                                                <td>
                                                    <p>{{ $contractor->email }}</p>
                                                </td>
                                                <td>
                                                    <p>{{ ($contractor->company) ? $contractor->company->business_name : 'N/A' }}</p>
                                                </td>
                                                <td>
                                                    <p>{{ ($contractor->company) ? $contractor->company->phone : 'N/A' }}</p>
                                                </td>
                                                <td><span id="status-badge-{{ ($contractor->company) ? $contractor->company->id : 'N/A' }}"
                                                        class="badge {{ ($contractor->company) ? $contractor->company->is_active ? 'badge-light-success' : 'badge-light-warning' : 'badge-light-warning' }}">
                                                        {{ ($contractor->company) ? $contractor->company->is_active ? 'Active' : 'Inactive' : 'N/A' }}
                                                    </span></td>
                                                <td>
                                                    <p>{{ $contractor->created_at->format('d M Y') }}</p>
                                                </td>
                                                <td>
                                                    <div class="form-check form-switch form-check-inline custom-switch">
                                                        <input
                                                            class="form-check-input switch-primary check-size approve-toggle"
                                                            type="checkbox" role="switch"
                                                            data-id="{{ ($contractor->company) ? $contractor->company->id : 'N/A' }}"
                                                            {{ ($contractor->company) ? $contractor->company->is_active ? 'checked' : '' : '' }}>
                                                    </div>
                                                </td>
                                            </tr>
                                        @empty
                                            <tr>
                                                <td colspan="6" class="text-center">
                                                    <h3 class="pt-5">No @yield('title', 'Dashboard') Found</h3>
                                                </td>
                                            </tr>
                                        @endforelse
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
        $(document).on('change', '.approve-toggle', function() {

            let toggle = $(this); // save toggle reference
            let companyId = toggle.data('id');
            let newStatus = toggle.is(':checked') ? 1 : 0;

            // First Show Confirmation Popup
            Swal.fire({
                title: newStatus ? "Activate this contractor?" : "Deactivate this contractor?",
                icon: "warning",
                showCancelButton: true,
                confirmButtonText: "Yes, Continue",
                cancelButtonText: "Cancel",
            }).then((result) => {

                if (result.isConfirmed) {

                    // User clicked "Yes"
                    $.ajax({
                        url: "{{ route('company.toggleActive') }}",
                        type: "POST",
                        data: {
                            id: companyId,
                            status: newStatus,
                            _token: "{{ csrf_token() }}"
                        },
                        success: function(res) {

                            Swal.fire({
                                icon: "success",
                                title: "Success",
                                text: res.message,
                                timer: 1500
                            });

                            // setTimeout(() => {
                            //     window.location.href = "{{ route('contractors.index') }}";
                            // }, 1500);

                            // Update status badge
                            let badge = $('#status-badge-' + companyId);

                            if (newStatus == 1) {
                                badge.removeClass()
                                    .addClass('badge badge-light-success')
                                    .text('Acitve');
                            } else {
                                badge.removeClass()
                                    .addClass('badge badge-light-warning')
                                    .text('Inactive');
                            }
                        }
                    });

                } else {
                    // If cancelled → toggle ko wapis purani state me le aao
                    toggle.prop('checked', !newStatus);
                }

            });

        });
    </script>
@endpush
