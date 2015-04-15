$(".clickbaitme").click(function(){
    $.get({
        url: 'generate',
        success: CBGshowHeadline
    });
});

function CBGgetNewHeadline() {

}

function CBGshowHeadline(xhr) {
    $(".headline").text('FOOBAR')
}