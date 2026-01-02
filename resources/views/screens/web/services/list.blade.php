<div class="row row-gap-40">
    @foreach ($services as $service)
        <div class="col-lg-4">
            @include('components.web.service-card', [
                'image' => asset('storage/' . $service->image),
                'contractorImage' => asset('images/resources-04.png'),
                'contractorName' => $service->user->name ?? '-',
                'serviceName' => $service->title,
                'serviceCategoryName' => $service->serviceCategory->name ?? '-',
                'location' => $service->user->location ?? '-',
                'serviceDetailUrl' => route('services.detail', $service->id),
                'bookNowUrl' => route('book-now'),
                'showOnlineBadge' => false,
            ])
        </div>
    @endforeach
</div>

<div class="mt-4 text-center">
    {{ $services->links() }}
</div>