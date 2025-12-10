@section('title', 'Pending Contractors')
@extends('layouts.admin.master')
@section('content')
    <div class="container-fluid user-list-wrapper">
        <div class="row">
            <div class="col-12">
                <div class="card">
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
                                            {{-- <th>
                                                <span class="c-o-light f-w-600">Creation Date</span>
                                            </th> --}}
                                            <th>
                                                <span class="c-o-light f-w-600">Actions</span>
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @forelse ($pending as $item)
                                            <tr class="product-removes inbox-data">
                                                <td>{{ $item->user->name }}</td>
                                                <td>
                                                    <p>{{ $item->user->email }}</p>
                                                </td>
                                                <td>
                                                    <p>{{ $item->business_name }}</p>
                                                </td>
                                                <td>
                                                    <p>{{ $item->license }}</p>

                                                </td>
                                                <td><span class="badge badge-light-success">
                                                        {{ $item->is_profile_approved ? 'Approved' : 'Pending' }}
                                                    </span></td>
                                                {{-- <td>
                                                <p>15 Jan 2024, 10:30 AM</p>
                                            </td> --}}
                                                <td>
                                                    <div class="form-check form-switch form-check-inline custom-switch">
                                                        <input
                                                            class="form-check-input switch-primary check-size approve-toggle"
                                                            type="checkbox" role="switch" data-id="{{ $item->id }}"
                                                            {{ $item->is_profile_approved ? 'checked' : '' }}>
                                                    </div>
                                                </td>
                                            </tr>
                                           @empty
                                            <tr>
                                                <td colspan="6" class="text-center"><h3 class="pt-5">No @yield('title', 'Dashboard') Found</h3></td>
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
                title: newStatus ? "Approve this contractor?" : "Reject this contractor?",
                icon: "warning",
                showCancelButton: true,
                confirmButtonText: "Yes, Continue",
                cancelButtonText: "Cancel",
            }).then((result) => {

                if (result.isConfirmed) {

                    // User clicked "Yes"
                    $.ajax({
                        url: "{{ route('admin.contractor-approval.ajax') }}",
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

                            setTimeout(() => {
                                window.location.href = "{{ route('contractors.index') }}";
                            }, 1500);

                            // Update status badge
                            let badge = $('#status-badge-' + companyId);

                            if (newStatus == 1) {
                                badge.removeClass()
                                    .addClass('badge badge-light-success')
                                    .text('Approved');
                            } else {
                                badge.removeClass()
                                    .addClass('badge badge-light-warning')
                                    .text('Pending');
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
