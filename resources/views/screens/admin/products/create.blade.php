@section('title', 'Create Product')
@extends('layouts.admin.master')
@section('content')
<div class="container-fluid">
    <div class="edit-profile">
        <form class="card" id="createProductForm" action="#" method="POST" enctype="multipart/form-data">
            @csrf
            <div class="card-header">
                <div class="card-options">
                    <a class="card-options-collapse" href="#" data-bs-toggle="card-collapse"><i
                            class="fe fe-chevron-up"></i></a><a class="card-options-remove" href="#"
                        data-bs-toggle="card-remove"><i class="fe fe-x"></i></a>
                </div>
            </div>
            <div class="card-body">
                <div class="row custom-input">
                    <div class="col-sm-6 col-md-6">
                        <div class="mb-3">
                            <label class="form-label" for="name">Product Name <span class="text-danger">*</span></label>
                            <input class="form-control" id="name"
                                type="text" placeholder="Enter Product Name" name="name" />
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-6">
                        <div class="mb-3">
                            <label class="form-label" for="category">Category <span
                                    class="text-danger">*</span></label>
                            <input class="form-control" id="category"
                                type="text" placeholder="Enter Category" name="category" />
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-6">
                        <div class="mb-3">
                            <label class="form-label" for="price">Price <span class="text-danger">*</span></label>
                            <input class="form-control" id="price"
                                type="text" placeholder="Enter Price" name="price" />
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-6">
                        <div class="mb-3">
                            <label class="form-label" for="stock">Stock Quantity</label>
                            <input class="form-control" id="stock"
                                type="number" placeholder="Enter Stock Quantity" name="stock" />
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="mb-3">
                            <label class="form-label" for="image">Product Image</label>
                            <input class="form-control" id="image"
                                type="file" accept="image/*" name="image" />
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="mb-3">
                            <label class="form-label" for="description">Description</label>
                            <textarea class="form-control" id="description" rows="3"
                                placeholder="Enter Product Description" name="description"></textarea>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card-footer text-end">
                <button class="btn btn-primary" type="submit">
                    Create
                </button>
            </div>
        </form>
    </div>
</div>
@endsection

