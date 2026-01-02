# Web Components

Reusable components for web pages.

## Service Card Component

### Usage:
```blade
@include('components.web.service-card', [
    'image' => asset('images/hero-bg.png'),
    'contractorImage' => asset('images/resources-04.png'),
    'contractorName' => 'H&D MASONRY',
    'serviceName' => 'MASONRY',
    'location' => 'Midland, Texas - 79701',
    'serviceDetailUrl' => route('service-detail'),
    'bookNowUrl' => route('book-now'),
    'showOnlineBadge' => true,
])
```

### Parameters:
- `image` - Service image URL (default: hero-bg.png)
- `contractorImage` - Contractor profile image (default: resources-04.png)
- `contractorName` - Contractor name
- `serviceName` - Service category name
- `location` - Service location
- `serviceDetailUrl` - URL to service detail page
- `bookNowUrl` - URL to book now page
- `showOnlineBadge` - Show online badge (default: true)

## Product Card Component

### Usage:
```blade
@include('components.web.product-card', [
    'image' => asset('images/con-place-01.png'),
    'title' => 'Power Drill Set',
    'description' => 'Professional grade power drill set',
    'price' => '$299.99',
    'rating' => 5,
    'detailUrl' => route('product-detail'),
    'contractorImage' => asset('images/resources-04.png'),
    'contractorName' => 'H&D MASONRY',
    'showContractor' => false,
])
```

### Parameters:
- `image` - Product image URL (default: con-place-01.png)
- `title` - Product title
- `description` - Product description
- `price` - Product price
- `rating` - Rating (1-5) (default: 5)
- `detailUrl` - URL to product detail page
- `contractorImage` - Contractor profile image (optional)
- `contractorName` - Contractor name (optional)
- `showContractor` - Show contractor info (default: false)

