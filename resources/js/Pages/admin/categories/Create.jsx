import React, { useState, useEffect } from 'react';
import { Head, useForm } from '@inertiajs/react';
import DashboardLayout from '../../../Layouts/DashboardLayout';
import Swal from 'sweetalert2';
import {
  CButton,
  CCard,
  CCardBody,
  CCardHeader,
  CCol,
  CForm,
  CFormInput,
  CFormLabel,
  CRow,
} from '@coreui/react';

const Create = ({ flash }) => {
  const { data, setData, post, processing, errors, reset } = useForm({
    name: '',
  });

  // Handle flash messages with SweetAlert
  useEffect(() => {
    if (flash?.success) {
      Swal.fire({
        icon: 'success',
        title: flash.success,
        showConfirmButton: false,
        timer: 1500,
        confirmButtonColor: '#FEA257',
        background: '#fff',
        customClass: {
          popup: 'swal2-custom-popup',
          title: 'swal2-custom-title',
          content: 'swal2-custom-content'
        }
      });
    }
    if (flash?.error) {
      Swal.fire({
        icon: 'error',
        title: flash.error,
        showConfirmButton: false,
        timer: 2000,
        confirmButtonColor: '#dc3545',
        background: '#fff',
        customClass: {
          popup: 'swal2-custom-popup',
          title: 'swal2-custom-title',
          content: 'swal2-custom-content'
        }
      });
    }
  }, [flash]);

  const handleSubmit = (e) => {
    e.preventDefault();
    post(route('admin-dashboard.categories.store'), {
      onSuccess: () => {
        reset();
      },
    });
  };

  return (
    <DashboardLayout>
      <Head title="Create Category" />
      <CRow>
        <CCol xs={12}>
          <CCard className="mb-4">
            <CCardHeader>
              <strong>Create New Category</strong>
            </CCardHeader>
            <CCardBody>
              <CForm onSubmit={handleSubmit}>
                <CRow className="mb-3">
                  <CCol md={12}>
                    <CFormLabel htmlFor="name">Category Name *</CFormLabel>
                    <CFormInput
                      type="text"
                      id="name"
                      name="name"
                      value={data.name}
                      onChange={(e) => setData('name', e.target.value)}
                      placeholder="e.g., Sci-Fi, Fantasy, Mystery"
                      className={errors.name ? 'is-invalid' : ''}
                    />
                    {errors.name && (
                      <div className="invalid-feedback">{errors.name}</div>
                    )}
                    <div className="form-text">
                      Enter the category name (e.g., Sci-Fi, Fantasy, Mystery)
                    </div>
                  </CCol>
                </CRow>

                <div className="d-flex justify-content-end gap-3">
                  <CButton
                    color="secondary"
                    onClick={() => window.history.back()}
                    disabled={processing}
                  >
                    Cancel
                  </CButton>
                  <CButton
                    type="submit"
                    color="primary"
                    disabled={processing}
                    style={{ backgroundColor: '#fea257', borderColor: '#fea257' }}
                  >
                    {processing ? 'Creating...' : 'Create Category'}
                  </CButton>
                </div>
              </CForm>
            </CCardBody>
          </CCard>
        </CCol>
      </CRow>
    </DashboardLayout>
  );
};

export default Create;

