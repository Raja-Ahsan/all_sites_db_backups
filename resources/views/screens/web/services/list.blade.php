@foreach ($services as $service)
    <div class="col-lg-4">
        @include('components.web.service-card', [
            'image' => asset('storage/' . $service->image),
            'contractorImage' => asset('images/resources-04.png'),
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
{{-- <div class="mt-4 text-center">
    {{ $services->links() }}
</div> --}}
