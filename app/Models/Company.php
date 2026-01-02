<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Company extends Model
{
    protected $guarded = ['id'];
    
    public function contractors()
    {
        return $this->hasMany(User::class, 'company_id');
    }

    public function user() {
        return $this->belongsTo(User::class);
    }

    public function services()
    {
        return $this->hasMany(Service::class, 'company_id');
    }

    
}
