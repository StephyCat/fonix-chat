$(function() {
  $('#new_channel_message').on('ajax:success', () => {
    $(this).find('input[type="text"]').val('');
  });
});
