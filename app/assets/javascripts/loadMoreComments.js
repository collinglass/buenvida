$( document ).ready(function() {
  $('.more-comments').click( function() {
    $(this).on('ajax:success', function(event, data, status, xhr) {
      var memoryId = $(this).data("memory-id");
      $("#comments_" + memoryId).html(data);
      $("#comments-paginator-" + memoryId).html("<a id='more-comments' data-memory-id=" + memoryId
        + "data-type='html' data-remote='true' href='/posts/" + memoryId
        + "/comments>show more comments</a>");
    });
  });
});