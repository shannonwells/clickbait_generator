function CBGgetNewHeadline(target) {
    if (target.hasClass('active')) {
        return;
    }
    var headlineType = $(this).getClass().split(' ')[1];
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

