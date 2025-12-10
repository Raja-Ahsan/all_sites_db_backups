<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class CompanyContractor extends Model
{
    protected $guarded = ['id'];

    public function company()
    {
        return $this->belongsTo(Company::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
