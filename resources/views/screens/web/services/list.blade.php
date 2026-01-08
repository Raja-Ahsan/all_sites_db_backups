@foreach ($services as $service)
    <div class="col-lg-4">
        @include('components.web.service-card', [
            'image' => asset('storage/' . $service->image),
            'contractorImage' => $service->user->profile_img 
            ? asset('storage/' . $service->user->profile_img) 
            : asset('images/placeholders/profile.png'),
            'contractorName' => $service->user->name ?? '-',
            'storeName' => $service->company->store_name ?? '-',
            'serviceName' => $service->title,
            'serviceCategoryName' => $service->serviceCategory->name ?? '-',
            'location' => $service->company->city . ' ' . $service->company->street_address ?? '-',
            'serviceDetailUrl' => route('services.detail', [$service->company->slug, $service->slug]),
            'bookNowUrl' => route('book-now'),
            'showOnlineBadge' => false,
        ])
    </div>
@endforeach