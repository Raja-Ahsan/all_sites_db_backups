@section('title', 'Complete Profile')
@extends('layouts.admin.master')
@section('content')
    <div class="container-fluid">
        <div class="edit-profile">
            <form class="card ajax-form" action={{ route('company-profile.store') }} method="POST">
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
                                <input type="hidden" name="user_id" value="{{ auth()->user()->id }}">
                                <label class="form-label" for="business_name">Business Name
                                </label>
                                <input class="form-control @error('business_name') is-invalid @enderror" id="business_name"
                                    type="text" placeholder="Enter Business Name" name="business_name" />
                                @error('business_name')
                                    <span class="text-danger">{{ $message }}</span>
                                @enderror
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-6">
                            <div class="mb-3">
                                <label class="form-label" for="license">License</label>
                                <input class="form-control @error('license') is-invalid @enderror" id="license"
                                    type="text" placeholder="Enter License Number" name="license" />
                                @error('license')
                                    <span class="text-danger">{{ $message }}</span>
                                @enderror
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-6">
                            <div class="mb-3">
                                <label class="form-label" for="insurance">Insurance</label><input
                                    class="form-control @error('insurance') is-invalid @enderror" id="insurance"
                                    type="text" placeholder="Enter insurance Number" name="insurance" />
                                @error('insurance')
                                    <span class="text-danger">{{ $message }}</span>
                                @enderror
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-6">
                            <div class="mb-3">
                                <label class="form-label" for="phone">Phone</label>
                                <input class="form-control @error('phone') is-invalid @enderror" id="phone"
                                    type="text" placeholder="Enter Phone Number" name="phone" />
                                @error('phone')
                                    <span class="text-danger">{{ $message }}</span>
                                @enderror
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="mb-3">
                                <label class="form-label" for="location">Location</label>
                                <input class="form-control @error('location') is-invalid @enderror" id="location"
                                    type="text" placeholder="Enter Location" name="location" />
                                @error('location')
                                    <span class="text-danger">{{ $message }}</span>
                                @enderror
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="mb-3">
                                <label class="form-label" for="store_name">Store Name</label>
                                <input class="form-control @error('store_name') is-invalid @enderror" id="store_name"
                                    type="text" placeholder="Enter Store Name" name="store_name" />
                                @error('store_name')
                                    <span class="text-danger">{{ $message }}</span>
                                @enderror
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
    @push('scripts')
        <script>
            ajaxCreate("{{ route('admin.dashboard') }}");
        </script>
    @endpush
@endsection
