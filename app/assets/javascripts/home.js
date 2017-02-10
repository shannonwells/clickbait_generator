function CBGgetNewHeadline(event) {
    getHeadline($(this).attr('id'));
}

function getHeadline(headlineType) {
    $.get('/home/generate',
        'headline_type=' + headlineType,
        onGetSuccess
    );
}

function onGetSuccess(xhr) {
    console.log(xhr);
}

window.onload = function () {
    getHeadline('listicle');
    $('#clickbait-buttons .btn-clickbait').click(CBGgetNewHeadline);

    // default is varying levels of transparent white sparkles
    // $(".sparkley:first").sparkleh();

    // rainbow as a color generates random rainbow colros
    // count determines number of sparkles
    // overlap allows sparkles to migrate... watch out for other dom elements though.
    $(".sparkley").sparkleh({
        color: "rainbow",
        count: 100,
        overlap: 20
    });

    // here we create fuscia sparkles within the element
    // $(".sparkley").sparkleh({
    //     count: 80,
    //     color: ["#ff0080", "#ff0080", "#0000FF"]
    // });


    // Scintillate-in-place
    // $(".sparkley").sparkleh({
    //     count: 30,
    //     color: "rainbow",
    //     speed: 0.1
    // });


    // an array can be passed, too for colours
    // for an image, the image needs to be fully loaded to set
    // the canvas to it's height/width.
    // speed allows us to control... the ... velocity
    $("#image").imagesLoaded(function () {
        $(".img").sparkleh({
            count: 25,
            color: ["#f3edc4", "#253943", "#659e3f"],
            speed: 0.4
        });
    });
};
