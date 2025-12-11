<?php

use Illuminate\Foundation\Application;
use Illuminate\Foundation\Configuration\Exceptions;
use Illuminate\Foundation\Configuration\Middleware;
use App\Providers\FortifyServiceProvider;

return Application::configure(basePath: dirname(__DIR__))
    ->withProviders([
        FortifyServiceProvider::class,
    ])
    ->withRouting(
        web: __DIR__ . '/../routes/web.php',
        commands: __DIR__ . '/../routes/console.php',
        health: '/up',
    )
    ->withMiddleware(function (Middleware $middleware): void {
        $middleware->alias([
            'role' => \App\Http\Middleware\RoleMiddleware::class,
            'permission' => \App\Http\Middleware\PermissionMiddleware::class,
            'role_or_permission' => \App\Http\Middleware\RoleOrPermissionMiddleware::class,
            'company.approved' => \App\Http\Middleware\CheckCompanyApproval::class,
            'admin.middleware' => \App\Http\Middleware\AdminMiddleware::class,
        ]);
        
    })
    ->withExceptions(function (Exceptions $exceptions): void {
        //
    })->create();
