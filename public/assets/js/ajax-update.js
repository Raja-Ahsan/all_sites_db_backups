function ajaxUpdate(formSelector, successRedirect = null) {
    $(document).on('submit', 'form.ajax-form', formSelector, function(e) {
        e.preventDefault();
        let form = $(this);
        let formData = form.serialize();

        $.ajax({
            url: form.attr('action'),
            type: 'PUT',
            data: formData,
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            beforeSend: function() {
                form.find('button[type="submit"]').prop('disabled', true).text('Updating...');
            },
            success: function(response) {
                form.find('button[type="submit"]').prop('disabled', false).text('Update');
                Swal.fire({
                    icon: 'success',
                    title: 'Updated!',
                    text: response.message || 'Updated successfully!',
                    showConfirmButton: false,
                    timer: 1500,
                });

                if (successRedirect) {
                    setTimeout(() => {
                        window.location.href = successRedirect;
                    }, 1600);
                }
            },
            error: function(xhr) {
                form.find('button[type="submit"]').prop('disabled', false).text('Update');
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
