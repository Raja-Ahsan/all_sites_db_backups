    @section('title', 'Create Service')
    @extends('layouts.admin.master')
    @section('content')
        <div class="container-fluid">
            <div class="edit-profile">
                <form class="card ajax-form dropzone" id="createServiceForm" action="{{ route('services.store') }}"
                    method="POST" enctype="multipart/form-data">
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
                                    <label class="form-label" for="name">Service Name <span
                                            class="text-danger">*</span></label>
                                    <input class="form-control" id="name" type="text"
                                        placeholder="Enter Service Name" name="title" />
                                </div>
                            </div>
                            <div class="col-sm-6 col-md-6">
                                <div class="mb-3">
                                    <label class="form-label" for="category">Category <span
                                            class="text-danger">*</span></label>
                                    <select class="form-select btn-square digits custom-scrollbar"
                                        name="service_category_id" id="">
                                        <option value="" selected>Select Category</option>
                                        @foreach ($serviceCategories as $serviceCategory)
                                            <option value="{{ $serviceCategory->id }}">{{ $serviceCategory->name }}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-6 col-md-6">
                                <div class="mb-3">
                                    <label class="form-label" for="image">Main Image <span
                                            class="text-danger">*</span></label>
                                    <input class="form-control" id="image" type="file" accept="image/*"
                                        placeholder="Upload Image" name="image" />
                                    <div class="mt-3">
                                        <img id="imagePreview" class="image-preview" src="" alt="Preview"
                                            style="width: 100px; height: 100px;">
                                    </div>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="mb-3">
                                    <label class="form-label">Gallery Images (Optional)</label>
                                    <div id="gallery_images" class="dropzone"></div> <!-- Dropzone.js container -->
                                </div>
                                <div class="d-flex flex-wrap gap-2 mt-2" id="galleryPreview"></div>
                            </div>
                            <div class="col-12">
                                <div class="mb-3">
                                    <label class="form-label" for="description">Description</label>
                                    <textarea class="form-control" id="description" rows="3" placeholder="Enter Service Description"
                                        name="description"></textarea>
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
    @push('scripts')
        <script>
            ajaxCreate("{{ route('services.index') }}");

            Dropzone.autoDiscover = false; // Disable auto discover

            $(document).ready(function() {
                // Initialize Dropzone for gallery images
                let myDropzone = new Dropzone("#gallery_images", {
                    autoProcessQueue: false,
                    url: "{{ route('services.store') }}", // Form action URL
                    paramName: "images[]", // The name of the file input field
                    // maxFiles: 5, // Limit to 5 files
                    // maxFilesize: 2, // Max file size in MB
                    acceptedFiles: 'image/*', // Accept only image files
                    addRemoveLinks: true, // Allow removal of uploaded files
                    dictDefaultMessage: "Drag and drop files here or click to upload",
                    dictMaxFilesExceeded: "You can upload a maximum of 5 images", // Show error message for max files
                    dictInvalidFileType: "Only image files are allowed", // Show error message for invalid file types
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr(
                            'content') // Add CSRF token to headers
                    },
                    // Success callback
                    success: function(file, response) {
                        console.log("File uploaded successfully");
                        // Optionally, add logic here to update image paths in your database if needed
                    },
                    // // Custom validation to prevent more than 5 files
                     removedfile: function(file) {
                        var filePreview = file.previewElement;
                        if (filePreview) {
                            filePreview.parentNode.removeChild(filePreview);
                        }
                    }
                });
            });
        </script>
    @endpush
