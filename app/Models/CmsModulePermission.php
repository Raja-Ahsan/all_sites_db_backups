<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class CmsModulePermission extends Model
{
    protected $table = 'cms_module_permission';

    protected $fillable = [
        'role_id',
        'module_id',
        'is_add',
        'is_view',
        'is_update',
        'is_delete',
        'name',
        'status',
    ];
}
