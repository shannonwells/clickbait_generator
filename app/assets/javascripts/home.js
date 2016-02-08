function CBGgetNewHeadline(event) {
    var headlineType = $(this).attr('id');
  if ($(target).hasClass('active')) {
    return;
  }
  $.get('/home/generate',
        'headline_type=' + headlineType,
        onGetSuccess
       );
}

function onGetSuccess(xhr) {
  console.log(xhr);
}

window.onload = function(){
  $('#clickbait-buttons .btn-clickbait').click(CBGgetNewHeadline);
};
