<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Admin\DashboardController as AdminDashboardController;
use App\Http\Controllers\MembershipController;
use App\Http\Controllers\UsersController;
use App\Http\Controllers\ContractorController;
use App\Http\Controllers\ServiceController;
use App\Http\Controllers\ReferralController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\PackageController;
use App\Http\Controllers\CheckoutPurchaseController;
use App\Http\Controllers\CompanyController;
use App\Http\Controllers\Admin\ContractorApprovalController as AdminContractorApprovalController;
use App\Http\Controllers\Admin\ServiceCategoryController as AdminServiceCategoryController;
// Web Routes
Route::get(
    '/',
    fn() => view('screens.web.home.index', ['isHome' => true])
)->name('home');

Route::get(
    '/about',
    fn() => view('screens.web.about.index')
)->name('about');

Route::get(
    '/contact',
    fn() => view('screens.web.contact.index')
)->name('contact');

Route::get('/services', [ServiceController::class, 'userIndex'])->name('services');

Route::get(
    '/services/show',
    fn() => view('screens.web.services.show')
)->name('service-detail');

Route::get(
    '/referrals',
    fn() => view('screens.web.referrals.index')
)->name('referrals');

Route::get(
    '/marketplace',
    fn() => view('screens.web.marketplace.index')
)->name('marketplace');

Route::get(
    '/store',
    fn() => view('screens.web.store.index')
)->name('store');

Route::get(
    '/products',
    fn() => view('screens.web.products.index')
)->name('products');

Route::get(
    '/product-detail',
    fn() => view('screens.web.products.show')
)->name('product-detail');

Route::get(
    '/book-now',
    fn() => view('screens.web.book-now.index')
)->name('book-now');

Route::get(
    '/cart',
    fn() => view('screens.web.cart.index')
)->name('cart');

Route::get(
    '/checkout',
    fn() => view('screens.web.checkout.index')
)->name('checkout');

Route::get(
    '/profile',
    fn() => view('screens.web.profile.index')
)->middleware('auth')->name('profile');

Route::get('/memberships', [PackageController::class, 'index'])->name('packages.index');

Route::get('/select-plan/{package}', [PackageController::class, 'select'])->name('package.select');

Route::get('/checkout', [CheckoutPurchaseController::class, 'show'])->name('checkout');
Route::post('/fake-payment', [CheckoutPurchaseController::class, 'fakePayment'])->name('fake.payment');

// admin routes
Route::prefix('admin')->middleware('auth')->group(function () {
    Route::get('/', [AdminDashboardController::class, 'index'])->name('admin.dashboard');
   
    Route::post('/users', [UsersController::class, 'store'])->name('users.store');
    Route::post('/hosts', [UsersController::class, 'index'])->name('hosts.index');
    Route::get('/hosts', function() {
        return view('screens.admin.hosts.index');
    })->name('hosts.index');
    Route::get('/memberships', [MembershipController::class, 'index'])->name('memberships.index');
    Route::middleware(['auth', 'company.approved'])->group(function () {
        Route::get('/contractors', [ContractorController::class, 'index'])->name('contractors.index');
        Route::get('/contractors/create', [ContractorController::class, 'create'])->name('contractors.create');
        Route::post('/contractors', [ContractorController::class, 'store'])->name('contractors.store');
        Route::get('/services/create', [ServiceController::class, 'create'])->name('services.create');
        Route::post('/services', [ServiceController::class, 'store'])->name('services.store');
        Route::get('/services/edit/{id}', [ServiceController::class, 'edit'])->name('services.edit');
        Route::put('/services/update/{id}', [ServiceController::class, 'update'])->name('services.update');
        Route::delete('/services/{id}', [ServiceController::class, 'destroy'])->name('services.destroy');
    });
    Route::get('/services', [ServiceController::class, 'index'])->name('services.index');
    Route::post('/services/delete-image', [ServiceController::class, 'deleteImage'])->name('services.deleteImage');
    Route::middleware(['auth', 'admin.middleware'])->group(function () {
        Route::get('/users', [UsersController::class, 'index'])->name('users.index');
        Route::get('/users/create', [UsersController::class, 'create'])->name('users.create');
       
        Route::get('/services/categories/create', [AdminServiceCategoryController::class, 'create'])->name('services-categories.create');
        Route::get('/services/categories', [AdminServiceCategoryController::class, 'index'])->name('services-categories.index');
        Route::post('/services/categories', [AdminServiceCategoryController::class, 'store'])->name('services-categories.store');
        Route::delete('/services/categories/{id}', [AdminServiceCategoryController::class, 'destroy'])->name('services-categories.destroy');
        Route::put('/services/categories/{id}', [AdminServiceCategoryController::class, 'update'])->name('services-categories.update');
    });
    Route::get('/referrals', [ReferralController::class, 'index'])->name('referrals.index');
    Route::get('/referrals/create', [ReferralController::class, 'create'])->name('referrals.create');
    Route::get('/products', [ProductController::class, 'index'])->name('products.index');
    Route::get('/products/create', [ProductController::class, 'create'])->name('products.create');
    Route::get('/orders', [OrderController::class, 'index'])->name('orders.index');
    Route::get('/complete-profile', [CompanyController::class, 'index'])->name('company-profile.index');
    Route::post('/complete-profile', [CompanyController::class, 'store'])->name('company-profile.store');
    Route::get('/contractor-approval', [AdminContractorApprovalController::class, 'index'])->name('contractor-approval.index');
    Route::post('/admin/contractor-approval/toggle', [AdminContractorApprovalController::class, 'ajaxToggle'])->name('admin.contractor-approval.ajax');
    Route::post('/company/toggle-active', [CompanyController::class, 'toggleActive'])->name('company.toggleActive');
});


// auth routes



Route::get('/route-clear', function () {
    Artisan::call('route:clear');
    Artisan::call('view:clear');
    Artisan::call('cache:clear');
    Artisan::call('config:clear');
    Artisan::call('config:cache');
    $cache = 'Route cache cleared <br /> View cache cleared <br /> Cache cleared <br /> Config cleared <br /> Config cache cleared';
    return $cache;
});
