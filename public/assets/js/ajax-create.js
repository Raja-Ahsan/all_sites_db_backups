function ajaxCreate(successRedirect = null) {
    $(document).on('submit', 'form.ajax-form', function (e) {
        e.preventDefault();

        let form = $(this);
        let formData = form.serialize();

        $.ajax({
            url: form.attr('action'),
            type: 'POST',
            data: formData,
            beforeSend: function () {
                form.find('button[type="submit"]').prop('disabled', true).text('Saving...');
            },
            success: function (response) {
                form.find('button[type="submit"]').prop('disabled', false).text('Save');
                form[0].reset();

                Swal.fire({
                    icon: 'success',
                    title: 'Success!',
                    text: response.message || 'Created successfully!',
                    showConfirmButton: false,
                    timer: 1500
                });

                if (successRedirect) {
                    setTimeout(() => {
                        window.location.href = successRedirect;
                    }, 1600);
                } else if (response.redirect) {
                    setTimeout(() => {
                        window.location.href = response.redirect;
                    }, 1600);
                } else if (typeof $('#dataTable').DataTable === 'function') {
                    $('#dataTable').DataTable().ajax.reload(null, false);
                }
            },
            error: function (xhr) {
                form.find('button[type="submit"]').prop('disabled', false).text('Create');

                if (xhr.status === 422) {
                    form.find('.invalid-feedback').remove();
                    form.find('.is-invalid').removeClass('is-invalid');
                    const errors = xhr.responseJSON.errors;
                    $.each(errors, function (key, messages) {
                        const input = form.find(`[name="${key}"]`);
                        if (input.length) {
                            input.addClass('is-invalid');
                            input.after(`<div class="invalid-feedback d-block">${messages[0]}</div>`);
                        }
                    });

                }
            }
        });
    });
}
