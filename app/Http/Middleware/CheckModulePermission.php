<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use App\Models\CmsModulePermission;
use Illuminate\Support\Facades\Auth;

class CheckModulePermission
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next, $moduleName): Response
    {

        $user = Auth::user();

        if (!$user) {
            return redirect()->route('login');
        }

        $module = \App\Models\CmsModule::where('route_name', $moduleName)->first();

        if (!$module) {
            return redirect()->route('login');
        }

        $perm = CmsModulePermission::where('role_id', $user->roles->first()->id)
            ->where('module_id', $module->id)
            ->first();

        if (!$perm || !$perm->is_view) {
            return redirect()->route('login');
        }
        return $next($request);
    }
}
