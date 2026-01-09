<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;

class Company extends Model
{
    protected $guarded = ['id'];

    public function contractors()
    {
        return $this->hasMany(User::class, 'company_id');
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function services()
    {
        return $this->hasMany(Service::class, 'company_id');
    }

    protected static function booted()
    {
        static::saving(function ($company) {
            if ($company->isDirty('store_name')) {
                $company->slug = Str::slug($company->store_name);
            }
        });
    }
}
