function CBGgetNewHeadline() {
    var headline_type = $("input[name=headline_type]:checked").attr('value');
    $.get('/home/generate','headline_type=' + headline_type)
}

window.onload = function(){
    $('#clickbaitme').click(CBGgetNewHeadline);
};

