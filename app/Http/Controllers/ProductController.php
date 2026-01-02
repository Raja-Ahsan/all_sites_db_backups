<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ProductController extends Controller
{
    public function index() {
        return view('screens.admin.products.index');
    }
    public function create() {
        return view('screens.admin.products.create');
    }
}
