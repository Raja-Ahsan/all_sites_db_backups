@component('mail::message')
# Order Status Update

Hello **{{ $order->user->name ?? 'Customer' }}**,  
Your order status has been updated.

---

## **Order Details**

| Field | Information |
|:------|:-------------|
| **Order Serial No** | {{ $order->order_serial_no ?? 'N/A' }} |
| **Token** | {{ $order->token ?? 'N/A' }} |
| **Previous Status** | {{ $oldStatus ?? 'N/A' }} |
| **New Status** | **{{ $newStatus ?? 'N/A' }}** |
| **Order Date** | {{ optional($order->order_datetime)->format('d M Y, h:i A') ?? 'N/A' }} |
| **Delivery Time** | {{ $order->delivery_time ?? 'N/A' }} |
| **Total** | **${{ number_format($order->total ?? 0, 2) }}** |

---

@if($order->branch)
## **Branch Information**
**{{ $order->branch->name ?? '' }}**  
{{ $order->branch->address ?? '' }}  
{{ $order->branch->phone ?? '' }}
@endif

---

@if($order->user)
## 👤 **Customer Information**
**{{ $order->user->name ?? '' }}**  
 {{ $order->user->email ?? '' }}  
 {{ $order->user->country_code ?? '' }} {{ $order->user->phone ?? '' }}
@endif

---

@if($order->order_items && $order->order_items->count() > 0)
## **Order Items**
@foreach($order->order_items as $item)
**Cake #{{ $item->item_id }}** — ${{ number_format($item->total_price ?? 0, 2) }}

@php
    $variations = is_string($item->item_variations)
        ? json_decode($item->item_variations, true)
        : $item->item_variations;
    $variations = $variations ?? [];
@endphp

@if(!empty($variations))
@foreach($variations as $v)
> *{{ $v['variation_name'] ?? '' }}:* {{ $v['name'] ?? '' }}
@endforeach
@endif

@endforeach
@endif

---

Thank you for shopping with **{{ config('app.name') }}**!  
We’ll keep you updated as your order progresses.

@endcomponent
