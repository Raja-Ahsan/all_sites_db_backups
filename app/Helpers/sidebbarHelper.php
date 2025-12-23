<?php
use App\Models\CmsModule;
use App\Models\CmsModulePermission;

use Illuminate\Support\Facades\Auth;


if (!function_exists('dynamic_sidebar')) {
    function dynamic_sidebar(string $panel = 'user') {

        return CmsModule::with('children')
        ->where('parent_id',0)
            ->where('status', 'active')
            ->where('panel', $panel)
            ->orderBy('sort_order')
            ->get();
    }
}