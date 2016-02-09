function CBGgetNewHeadline(target) {
    var headlineType = $(this).attr('id');
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

