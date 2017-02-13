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

function addCsrf(xhr) {
    xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));
}

function onShareSuccess(html) {
    var $modalDiv = $(".ladom");
    $("<div class=''>FOO</div>").appendTo($modalDiv);
    $modalDiv.modal();
};


window.onload = function () {
    $.ajaxSetup({
        headers: {
            'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
        }
    });
    getHeadline('listicle');
    $('#clickbait-buttons .btn-clickbait').click(CBGgetNewHeadline);
    $('#manual-ajax').click(function(event){
        var $modalDiv = $(".ladom");
        event.preventDefault();
        if ($modalDiv.text() == "") {
            var headLine = $("#headline").text();
            var headlineType = "listicle";
            $.post("/clickbaits",
                { clickbait: { headline: headLine, headline_type: headlineType }},
                onShareSuccess);
        } else {
            $modalDiv.modal();
        }
    });

    // rainbow as a color generates random rainbow colros
    // count determines number of sparkles
    // overlap allows sparkles to migrate... watch out for other dom elements though.
    $(".sparkley").sparkleh({
        color: "rainbow",
        count: 100,
        overlap: 20
    });
};
