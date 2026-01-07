<script>
    $(document).ready(function() {
        $('#load-more').on('click', function() {
            const button = $(this);
            const page = button.data('page');

            button.prop('disabled', true);

            $.ajax({
                url: `{{ route('web.services.index') }}?page=${page}`,
                type: 'GET',
                beforeSend: function() {
                    button.prop('disabled', true).text('').append(
                        '<div class="loader"></div>');
                },
                success: function(response) {
                    if (response.services.trim().length > 0) {

                        $('#services-wrapper').append(response.services);
                        button.data('page', response.next_page);

                        button.prop('disabled', false).text('Load More');

                        if (response.next_page > response.last_page) {
                            button.hide();
                        }
                    } else {
                        button.hide();
                    }
                },
                error: function(err) {
                    console.log('Failed to load more services');
                    button.prop('disabled', false).text(
                        'Load More');
                }
            });
        });
    });
</script>
