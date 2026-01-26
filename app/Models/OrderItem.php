<?php

namespace App\Models;

use Spatie\MediaLibrary\HasMedia;
use Illuminate\Database\Eloquent\Model;
use Spatie\MediaLibrary\InteractsWithMedia;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Spatie\MediaLibrary\MediaCollections\Models\Media;

class OrderItem extends Model implements HasMedia
{
    use HasFactory, InteractsWithMedia;

    protected $table = "order_items";
    protected $fillable = [
        'order_id',
        'branch_id',
        'item_id',
        'quantity',
        'discount',
        'tax_name',
        'tax_rate',
        'tax_type',
        'tax_amount',
        'price',
        'custom_price',
        'item_variations',
        'item_extras',
        'instruction',
        'delivery_date',
        'delivery_time',
        'item_variation_total',
        'item_extra_total',
        'total_price',
        'attachment',
        'creator_type',
        'creator_id',
        'editor_type',
        'editor_id',
        'created_at',
        'updated_at'
    ];
    protected $casts = [
        'id'                   => 'integer',
        'order_id'             => 'integer',
        'branch_id'            => 'integer',
        'item_id'              => 'integer',
        'quantity'             => 'integer',
        'discount'             => 'decimal:6',
        'tax_name'             => 'string',
        'tax_rate'             => 'string',
        'tax_type'             => 'integer',
        'tax_amount'           => 'decimal:6',
        'price'                => 'decimal:6',
        'custom_price'         => 'decimal:6',
        'item_variations'      => 'array',
        'item_extras'          => 'array',
        'item_variation_total' => 'decimal:6',
        'item_extra_total'     => 'decimal:6',
        'total_price'          => 'decimal:6',
        'instruction'          => 'string',
        'delivery_date'        => 'date',
        'delivery_time'        => 'datetime:H:i',
        'attachment'           => 'string',
        'creator_type'         => 'string',
        'creator_id'           => 'integer',
        'editor_type'          => 'string',
        'editor_id'            => 'integer',
        'created_at'           => 'datetime',
        'updated_at'           => 'datetime'
    ];

    public function order()
    {
        return $this->belongsTo(Order::class, 'order_id', 'id');
    }
    public function orderItem()
    {
        return $this->belongsTo(Item::class, 'item_id', 'id')->withTrashed();
    }

    public function registerMediaConversions(Media $media = null): void
    {
        $this->addMediaConversion('thumb')->crop('crop-center', 168, 180)->keepOriginalImageFormat()->sharpen(10);
        $this->addMediaConversion('preview')->width(600)->keepOriginalImageFormat()->sharpen(10);
    }

    public function getAttachmentUrlAttribute(): string
    {
        if (!empty($this->getFirstMediaUrl('attachment'))) {
            return $this->getFirstMediaUrl('attachment');
        }
        return '';
    }

    public function getAttachmentThumbAttribute(): string
    {
        if (!empty($this->getFirstMediaUrl('attachment'))) {
            $attachment = $this->getMedia('attachment')->last();
            return $attachment->getUrl('thumb');
        }
        return '';
    }
}
