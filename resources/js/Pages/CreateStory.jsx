import React, { useState, useEffect } from 'react';
import { Head, useForm, usePage, router } from '@inertiajs/react';
import Layout from '@/Layouts/Layout';
import Swal from 'sweetalert2';
import ReactQuill from 'react-quill-new';
import 'react-quill-new/dist/quill.snow.css';

const CreateStory = ({ categories = [], flash }) => {
  const { auth } = usePage().props;
  const { data, setData, post, processing, errors, reset } = useForm({
    title: '',
    description: '',
    category: '',
    content: '',
    cover_image: null,
    backcover_image: null,
  });

  const [preview, setPreview] = useState({ cover_image: null, backcover_image: null });
  const [showHtml, setShowHtml] = useState(false);

  useEffect(() => {
    if (flash?.success) {
      Swal.fire({
        icon: 'success',
        title: flash.success,
        showConfirmButton: false,
        timer: 1500,
        confirmButtonColor: '#fea257',
        background: '#fff',
      });
    }
    if (flash?.error) {
      Swal.fire({
        icon: 'error',
        title: flash.error,
        showConfirmButton: true,
        confirmButtonColor: '#fea257',
        background: '#fff',
      });
    }
  }, [flash?.success, flash?.error]);

  const handleSubmit = (e) => {
    e.preventDefault();
    
    if (!auth?.user) {
      Swal.fire({
        icon: 'warning',
        title: 'Login Required',
        text: 'Please login to create a story.',
        showConfirmButton: true,
        confirmButtonColor: '#fea257',
      });
      router.visit('/login');
      return;
    }
    
    Swal.fire({
      title: 'Creating story...',
      allowOutsideClick: false,
      didOpen: () => {
        Swal.showLoading();
      }
    });
    
    post(route('user-dashboard.stories.store'), {
      preserveScroll: true,
      onSuccess: () => {
        reset();
        setPreview({ cover_image: null, backcover_image: null });
        Swal.fire({
          icon: 'success',
          title: 'Story created successfully!',
          text: 'Redirecting to category page...',
          showConfirmButton: false,
          timer: 1500,
          confirmButtonColor: '#fea257',
        });
      },
      onError: (errors) => {
        let errorMessage = 'Please check your input.';
        if (errors.title) errorMessage = errors.title;
        else if (errors.description) errorMessage = errors.description;
        else if (errors.category) errorMessage = errors.category;
        else if (errors.content) errorMessage = errors.content;
        else if (errors.cover_image) errorMessage = errors.cover_image;
        else if (errors.backcover_image) errorMessage = errors.backcover_image;
        
        Swal.fire({
          icon: 'error',
          title: 'Error creating story!',
          text: errorMessage,
          showConfirmButton: true,
          confirmButtonColor: '#fea257',
        });
      },
    });
  };

  const handleContentChange = (content) => {
    setData('content', content);
  };

  const handleImageChange = (e, field) => {
    if (e.target.files[0]) {
      setData(field, e.target.files[0]);
      setPreview((prev) => ({ ...prev, [field]: URL.createObjectURL(e.target.files[0]) }));
    }
  };

  return (
    <Layout headerClass="inner-header">
      <Head title="Create a story" />
      <section className="py-200 sec-bg">
        <div className="container">
          <div className="row mb-50">
            <div className="col-12 text-center">
              <div className="mb-20">
                <i className="fas fa-book-open fs-60 text-primary-theme mb-20"></i>
              </div>
              <h1 className="heading mb-10">Create a <span className="text-primary-theme">Story</span></h1>
              <p className="fs-20 mb-30 light-black">
                Share your imagination with the world
              </p>
            </div>
          </div>

          <div className="row">
            <div className="col-lg-10 mx-auto">
              <div className="card shadow-lg border-0" style={{ borderRadius: '20px', overflow: 'hidden' }}>
                <div className="card-body p-5">
                  <form onSubmit={handleSubmit} encType="multipart/form-data">
                    <div className="row mb-4">
                      <div className="col-md-6">
                        <label htmlFor="title" className="form-label fw-600 mb-2" style={{ color: '#333', fontSize: '16px' }}>
                          <i className="fas fa-heading me-2 text-primary-theme"></i>Story Title
                        </label>
                        <input
                          type="text"
                          className={`form-control ${errors.title ? 'is-invalid' : ''}`}
                          id="title"
                          value={data.title}
                          onChange={(e) => setData('title', e.target.value)}
                          placeholder="Enter your story title..."
                          style={{ 
                            padding: '12px 15px', 
                            borderRadius: '10px', 
                            border: '2px solid #e0e0e0',
                            fontSize: '16px',
                            transition: 'all 0.3s ease'
                          }}
                          onFocus={(e) => e.target.style.borderColor = '#fea257'}
                          onBlur={(e) => e.target.style.borderColor = '#e0e0e0'}
                        />
                        {errors.title && <div className="invalid-feedback d-block mt-2">{errors.title}</div>}
                      </div>
                      
                      <div className="col-md-6">
                        <label htmlFor="author" className="form-label fw-600 mb-2" style={{ color: '#333', fontSize: '16px' }}>
                          <i className="fas fa-user me-2 text-primary-theme"></i>Author
                        </label>
                        <input
                          type="text"
                          className="form-control"
                          id="author"
                          value={auth?.user?.username || ''}
                          disabled
                          readOnly
                          style={{ 
                            padding: '12px 15px', 
                            borderRadius: '10px', 
                            backgroundColor: '#f8f9fa',
                            border: '2px solid #e0e0e0',
                            fontSize: '16px',
                            cursor: 'not-allowed'
                          }}
                        />
                        <div className="form-text mt-2" style={{ fontSize: '14px', color: '#6c757d' }}>
                          <i className="fas fa-info-circle me-1"></i>Author is automatically set to your username
                        </div>
                      </div>
                    </div>
                    
                    <div className="row mb-4">
                      <div className="col-md-12">
                        <label htmlFor="category" className="form-label fw-600 mb-2" style={{ color: '#333', fontSize: '16px' }}>
                          <i className="fas fa-tags me-2 text-primary-theme"></i>Category
                        </label>
                        <select
                          className={`form-select ${errors.category ? 'is-invalid' : ''}`}
                          id="category"
                          value={data.category}
                          onChange={(e) => setData('category', e.target.value)}
                          style={{ 
                            padding: '12px 15px', 
                            borderRadius: '10px', 
                            border: '2px solid #e0e0e0',
                            fontSize: '16px',
                            transition: 'all 0.3s ease'
                          }}
                          onFocus={(e) => e.target.style.borderColor = '#fea257'}
                          onBlur={(e) => e.target.style.borderColor = '#e0e0e0'}
                        >
                          <option value="">Select a category</option>
                          {categories.map(category => (
                            <option key={category.id} value={category.id}>
                              {category.name}
                            </option>
                          ))}
                        </select>
                        {errors.category && <div className="invalid-feedback d-block mt-2">{errors.category}</div>}
                      </div>
                    </div>
                    
                    <div className="row mb-4">
                      <div className="col-md-12">
                        <label htmlFor="description" className="form-label fw-600 mb-2" style={{ color: '#333', fontSize: '16px' }}>
                          <i className="fas fa-align-left me-2 text-primary-theme"></i>Description
                        </label>
                        <textarea
                          className={`form-control ${errors.description ? 'is-invalid' : ''}`}
                          id="description"
                          rows={4}
                          value={data.description}
                          onChange={(e) => setData('description', e.target.value)}
                          placeholder="Write a brief description of your story..."
                          style={{ 
                            padding: '12px 15px', 
                            borderRadius: '10px', 
                            border: '2px solid #e0e0e0',
                            fontSize: '16px',
                            transition: 'all 0.3s ease',
                            resize: 'vertical'
                          }}
                          onFocus={(e) => e.target.style.borderColor = '#fea257'}
                          onBlur={(e) => e.target.style.borderColor = '#e0e0e0'}
                        />
                        {errors.description && <div className="invalid-feedback d-block mt-2">{errors.description}</div>}
                      </div>
                    </div>
                    
                    <div className="row mb-4">
                      <div className="col-md-6">
                        <label htmlFor="cover_image" className="form-label fw-600 mb-2" style={{ color: '#333', fontSize: '16px' }}>
                          <i className="fas fa-image me-2 text-primary-theme"></i>Cover Image
                        </label>
                        <div className="position-relative">
                          <input
                            type="file"
                            className={`form-control ${errors.cover_image ? 'is-invalid' : ''}`}
                            id="cover_image"
                            onChange={(e) => handleImageChange(e, 'cover_image')}
                            accept="image/*"
                            style={{ 
                              padding: '12px 15px', 
                              borderRadius: '10px', 
                              border: '2px solid #e0e0e0',
                              fontSize: '16px',
                              transition: 'all 0.3s ease'
                            }}
                          />
                        </div>
                        {errors.cover_image && <div className="invalid-feedback d-block mt-2">{errors.cover_image}</div>}
                        
                        {preview.cover_image && (
                          <div className="mt-3">
                            <div className="position-relative d-inline-block" style={{ borderRadius: '10px', overflow: 'hidden', boxShadow: '0 4px 6px rgba(0,0,0,0.1)' }}>
                              <img 
                                src={preview.cover_image} 
                                alt="Cover preview" 
                                style={{ 
                                  maxWidth: '250px', 
                                  maxHeight: '300px', 
                                  objectFit: 'cover',
                                  display: 'block'
                                }} 
                              />
                            </div>
                          </div>
                        )}
                      </div>
                      <div className="col-md-6">
                        <label htmlFor="backcover_image" className="form-label fw-600 mb-2" style={{ color: '#333', fontSize: '16px' }}>
                          <i className="fas fa-images me-2 text-primary-theme"></i>Back Cover Image
                        </label>
                        <div className="position-relative">
                          <input
                            type="file"
                            className={`form-control ${errors.backcover_image ? 'is-invalid' : ''}`}
                            id="backcover_image"
                            onChange={(e) => handleImageChange(e, 'backcover_image')}
                            accept="image/*"
                            style={{ 
                              padding: '12px 15px', 
                              borderRadius: '10px', 
                              border: '2px solid #e0e0e0',
                              fontSize: '16px',
                              transition: 'all 0.3s ease'
                            }}
                          />
                        </div>
                        {errors.backcover_image && <div className="invalid-feedback d-block mt-2">{errors.backcover_image}</div>}
                        
                        {preview.backcover_image && (
                          <div className="mt-3">
                            <div className="position-relative d-inline-block" style={{ borderRadius: '10px', overflow: 'hidden', boxShadow: '0 4px 6px rgba(0,0,0,0.1)' }}>
                              <img 
                                src={preview.backcover_image} 
                                alt="Back Cover preview" 
                                style={{ 
                                  maxWidth: '250px', 
                                  maxHeight: '300px', 
                                  objectFit: 'cover',
                                  display: 'block'
                                }} 
                              />
                            </div>
                          </div>
                        )}
                      </div>
                    </div>
                    
                    <div className="row mb-4">
                      <div className="col-md-12">
                        <div className="d-flex justify-content-between align-items-center mb-3">
                          <label htmlFor="content" className="form-label fw-600 mb-0" style={{ color: '#333', fontSize: '16px' }}>
                            <i className="fas fa-file-alt me-2 text-primary-theme"></i>Story Content
                          </label>
                          <button
                            type="button"
                            className="btn btn-sm"
                            onClick={() => setShowHtml(!showHtml)}
                            style={{ 
                              backgroundColor: '#f8f9fa', 
                              border: '1px solid #dee2e6',
                              color: '#495057',
                              borderRadius: '8px',
                              padding: '6px 15px',
                              fontSize: '14px',
                              transition: 'all 0.3s ease'
                            }}
                            onMouseEnter={(e) => {
                              e.target.style.backgroundColor = '#e9ecef';
                              e.target.style.borderColor = '#fea257';
                            }}
                            onMouseLeave={(e) => {
                              e.target.style.backgroundColor = '#f8f9fa';
                              e.target.style.borderColor = '#dee2e6';
                            }}
                          >
                            <i className={`fas ${showHtml ? 'fa-eye-slash' : 'fa-code'} me-1`}></i>
                            {showHtml ? 'Hide HTML' : 'Show HTML'}
                          </button>
                        </div>
                        
                        {showHtml ? (
                          <textarea
                            className={`form-control ${errors.content ? 'is-invalid' : ''}`}
                            value={data.content}
                            onChange={(e) => setData('content', e.target.value)}
                            rows={15}
                            placeholder="HTML content..."
                            style={{ 
                              padding: '15px', 
                              borderRadius: '10px', 
                              border: '2px solid #e0e0e0',
                              fontSize: '14px',
                              fontFamily: 'monospace',
                              transition: 'all 0.3s ease'
                            }}
                            onFocus={(e) => e.target.style.borderColor = '#fea257'}
                            onBlur={(e) => e.target.style.borderColor = '#e0e0e0'}
                          />
                        ) : (
                          <div className={errors.content ? 'is-invalid' : ''} style={{ borderRadius: '10px', overflow: 'hidden', border: '2px solid #e0e0e0' }}>
                            <ReactQuill
                              theme="snow"
                              value={data.content}
                              onChange={handleContentChange}
                              style={{ minHeight: '350px' }}
                            />
                          </div>
                        )}
                        {errors.content && <div className="invalid-feedback d-block mt-2">{errors.content}</div>}
                      </div>
                    </div>
                    
                    <div className="row mt-5">
                      <div className="col-12 d-flex justify-content-center">
                        <button 
                          type="submit" 
                          className="btn btn-lg px-5 py-3" 
                          disabled={processing}
                          style={{ 
                            backgroundColor: '#fea257', 
                            borderColor: '#fea257',
                            color: '#fff',
                            borderRadius: '12px',
                            fontSize: '18px',
                            fontWeight: '600',
                            boxShadow: '0 4px 15px rgba(254, 162, 87, 0.3)',
                            transition: 'all 0.3s ease',
                            minWidth: '200px'
                          }}
                          onMouseEnter={(e) => {
                            if (!processing) {
                              e.target.style.transform = 'translateY(-2px)';
                              e.target.style.boxShadow = '0 6px 20px rgba(254, 162, 87, 0.4)';
                            }
                          }}
                          onMouseLeave={(e) => {
                            e.target.style.transform = 'translateY(0)';
                            e.target.style.boxShadow = '0 4px 15px rgba(254, 162, 87, 0.3)';
                          }}
                        >
                          {processing ? (
                            <>
                              <i className="fas fa-spinner fa-spin me-2"></i>
                              Creating...
                            </>
                          ) : (
                            <>
                              <i className="fas fa-plus-circle me-2"></i>
                              Create Story
                            </>
                          )}
                        </button>
                      </div>
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
    </Layout>
  );
};

export default CreateStory;

