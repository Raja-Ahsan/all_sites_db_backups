@component('mail::message')
# New Order Received!

Hello **{{ $order->user->name ?? 'Customer' }}**,  
Your order has been placed successfully.

---

## 🧾 **Order Details**

| Field | Information |
|:------|:-------------|
| **Order Serial No** | {{ $order->order_serial_no ?? 'N/A' }} |
| **Token** | {{ $order->token ?? 'N/A' }} |
| **Order Date** | {{ optional($order->order_datetime)->format('d M Y, h:i A') ?? 'N/A' }} |
| **Delivery Time** | {{ $order->delivery_time ?? 'N/A' }} |
| **Payment Method** | @if($order->payment_method == 1) Cash @elseif($order->payment_method == 2) Card @else Other @endif |
| **Payment Status** | {{ $order->payment_status == 5 ? 'Paid' : 'Unpaid' }} |
| **Order Status** | {{ $order->status == 4 ? 'Accepted' : 'Pending' }} |

---

## 👤 **Customer Information**

**Name:** {{ $order->user->name ?? 'N/A' }}  
**Email:** {{ $order->user->email ?? 'N/A' }}  
**Phone:** {{ $order->user->country_code ?? '' }} {{ $order->user->phone ?? 'N/A' }}

---

## **Branch Details**

**Branch:** {{ $order->branch->name ?? 'N/A' }}  
**Address:** {{ $order->branch->address ?? 'N/A' }}  
**City:** {{ $order->branch->city ?? '' }}, {{ $order->branch->state ?? '' }}  
**Phone:** {{ $order->branch->phone ?? '' }}

---

## **Order Items**

@if($order->order_items && $order->order_items->count() > 0)
| # | Item | Variations | Qty | Total |
|:--|:-----|:------------|:---:|------:|
@foreach($order->order_items as $index => $item)
@php
    // Handle JSON variations
    $variations = is_string($item->item_variations)
        ? json_decode($item->item_variations, true)
        : $item->item_variations;
    $variations = $variations ?? [];
@endphp
| {{ $index + 1 }} | **Cake #{{ $item->item_id }}** | 
@if(!empty($variations))
@foreach($variations as $v)
- {{ $v['variation_name'] ?? '' }}: {{ $v['name'] ?? '' }}<br>
@endforeach
@else
N/A
@endif | {{ $item->quantity ?? 1 }} | **${{ number_format($item->total_price ?? 0, 2) }}** |
@endforeach
@else
_No items found in this order._
@endif

---

## **Summary**

| Description | Amount |
|:-------------|-------:|
| Subtotal | ${{ number_format($order->subtotal ?? 0, 2) }} |
| Discount | ${{ number_format($order->discount ?? 0, 2) }} |
| Tax | ${{ number_format($order->total_tax ?? 0, 2) }} |
| Delivery Charge | ${{ number_format($order->delivery_charge ?? 0, 2) }} |
| **Total** | **${{ number_format($order->total ?? 0, 2) }}** |

---

Thanks for ordering from **{{ config('app.name') }}**!  
We’ll start preparing your order shortly.

@endcomponent
