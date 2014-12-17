$('#edit_tab a[href="#edit_article"]').click(function (e) {
  e.preventDefault();
  console.log('edit_article tab1')
});
$('#edit_tab a[href="#preview_article"]').click(function (e) {
  e.preventDefault();
  //var t = { "body": $("#article_content").val() }
  t = {"body": $('#article_content').val()}
  $.ajax({
    url: "/articles/preview",
    data: JSON.stringify(t),
    type: 'post',
    dataType: "json",
    contentType: "application/json; charset=utf-8",
    success: function (r) {
      $('#preview_view').html(r.body);
    },
    error: function (r) {
      $('#preview_view').html('error');
    }
  })
});
