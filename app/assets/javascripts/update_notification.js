$(document).ready(function() {
  $('#search').on('keydown', function(e) {
    if (e.keyCode == 13) {
      e.preventDefault();
    }
  });

  $(document).on('click', '.unread', function() {
    var id = $(this).children(0).attr('id');
    $.ajax({
      url: '/notifications/update',
      data: {'unread': id},
      method: 'PUT',
      dataType: 'JSON',
    });
  });
});
