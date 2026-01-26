<?php

namespace App\Http\Resources;

use App\Enums\Ask;
use App\Libraries\AppLibrary;
use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Facades\Log;

class OrderDetailsResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param \Illuminate\Http\Request $request
     * @return array
     */
    public function toArray($request): array
    {
        // Debug: Log the order notes before returning
        Log::info('OrderDetailsResource debug:', [
            'order_id' => $this->id,
            'order_notes' => $this->order_notes,
            'order_notes_type' => gettype($this->order_notes),
            'order_notes_length' => strlen($this->order_notes ?? ''),
        ]);
        
        return [
            'id'                                  => $this->id,
            'order_serial_no'                     => $this->order_serial_no,
            'token'                               => $this->token,
            "subtotal_currency_price"             => AppLibrary::currencyAmountFormat($this->subtotal),
            "subtotal_without_tax_currency_price" => AppLibrary::currencyAmountFormat($this->subtotal - $this->total_tax),
            "discount_currency_price"             => AppLibrary::currencyAmountFormat($this->discount),
            "delivery_charge_currency_price"      => AppLibrary::currencyAmountFormat($this->delivery_charge),
            "total_currency_price"                => AppLibrary::currencyAmountFormat($this->total),
            "total_tax_currency_price"            => AppLibrary::currencyAmountFormat($this->total_tax),
            'order_type'                          => $this->order_type,
            'order_datetime'                      => AppLibrary::datetime($this->order_datetime),
            'order_date'                          => AppLibrary::date($this->order_datetime),
            'order_time'                          => AppLibrary::time($this->order_datetime),
            'delivery_date'                       => $this->orderItems->first()?->delivery_date ?
                AppLibrary::date($this->orderItems->first()->delivery_date) :
                ($this->is_advance_order == Ask::YES ? AppLibrary::increaseDate($this->order_datetime, 1) : AppLibrary::date($this->order_datetime)),
            'delivery_time'                       => $this->orderItems->first()?->delivery_time,
            'instruction'                         => $this->orderItems->first()?->instruction,
            'payment_method'                      => $this->payment_method,
            'payment_status'                      => $this->payment_status,
            'is_advance_order'                    => $this->is_advance_order,
            'preparation_time'                    => $this->preparation_time,
            'status'                              => $this->status,
            'status_name'                         => trans('orderStatus.' . $this->status),
            'reason'                              => $this->reason,
            'user'                                => new OrderUserResource($this->user?->load('roles', 'media')),
            'order_address'                       => new AddressResource($this->address),
            'branch'                              => new BranchResource($this->branch),
            'transaction'                         => new TransactionResource($this->transaction),
            'order_items'                         => OrderItemResource::collection($this->orderItems->load('orderItem')),
            'table_name'                          => $this->diningTable?->name,
            'pos_payment_method'                  => $this->pos_payment_method,
            'pos_payment_note'                    => $this->pos_payment_note,
            'pos_received_currency_amount'        => AppLibrary::currencyAmountFormat($this->pos_received_amount),
            'cash_back_amount'                    => $this->pos_received_amount - $this->total,
            'cash_back_currency_amount'           => AppLibrary::currencyAmountFormat($this->pos_received_amount - $this->total),
            'order_notes'                         => $this->order_notes,
        ];
    }
}