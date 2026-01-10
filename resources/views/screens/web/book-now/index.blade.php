@extends('layouts.web.master')
@section('title', 'Book Now')
@section('content')
    <section class="inner-banner about-banner">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <h1 class="hd-lg">Book Now <span class="text-secondry-theme">{{$service->title}}</span></h1>
                </div>
            </div>
        </div>
    </section>
    <section class="book-now-sec sec-dark-bg sec-gap-y">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-6">
                  <div class="book-service-detail-wrrapper">
                    <div class="img-wrapper mb-20">
                        <img class="radius-30" src="{{asset('storage/' . $service->image)}}" alt="{{$service->title}}">
                    </div>
                    <div class="content">
                        <h3 class="secondry-font fs-40 mb-20 text-white fw-700">Service Name: <span class="text-secondry-theme">{{$service->title}}</span></h3>
                        <h4 class="secondry-font fs-20 mb-20 text-white fw-700">Service Category <span class="text-secondry-theme">{{$service->serviceCategory->name}}</span></h3>
                        <p class="para clamp-5 mb-20">{{$service->description}}</p>
                    </div>
                  </div>
                </div>
                <div class="col-lg-6">
                    <div class="form-wrapper glass">
                        <form method="POST" id="submit-form"  action="{{route('book-now.store', [$company->slug, $service->slug])}}">
                            @csrf
                            <div class="row">
                                <div class="col-12">
                                    <div class="d-flex align-items-center justify-content-between mb-20">
                                        <div>
                                            <h4 class="secondry-font fs-60 text-white fw-700">Book Service</h4>
                                            <p class="para">
                                                Book your service now and get the best service from our experts.
                                            </p>
                                        </div>
                                        <div>
                                            <div class="img-wrapper">
                                                <img src="http://localhost:8000/images/logo-02.png" style="max-width: 40px;" alt="Contact Us Image">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="field-wrapper mb-20">
                                        <input type="text" name="name" class="glass input-field" placeholder="Name">
                                    </div>
                                    <div class="field-wrapper mb-20">
                                        <input type="email" name="email" class="glass input-field" placeholder="Email">
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="field-wrapper mb-20">
                                        <input type="text" name="phone" class="glass input-field" placeholder="Phone">
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="field-wrapper mb-20">
                                        <textarea class="glass input-field" name="message" placeholder="Message" rows="5"></textarea>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <button class="bootstrap btn btn-secondary w-100 submit-btn" id="submit-btn">Send Message</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection

@push('scripts')
   @include('includes.ajax-requests.create-ajax');
@endpush