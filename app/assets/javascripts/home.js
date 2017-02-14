CBG = {
    getNewHeadline: function(event) {
        CBG.getHeadline($(this).attr('id'));
    },

    getBestOf: function(id) {
        $.get('/home/generate', { id: id }, CBG.onGetSuccess );
    },

    getHeadline: function(headlineType) {
        $.get('/home/generate', { headline_type: headlineType }, CBG.onGetSuccess);
        CBG.resetLocationHash();
    },

    resetLocationHash: function() {
        location.hash = "";
    },

    onGetSuccess: function(data, status, xhr, leaveHashAlone) {
        // maybe this will do something else later, like register analytics
        return true;
    },

    onShareSuccess: function(html) {
        var $modalDiv = $(".ladom");
        $(html).appendTo($modalDiv);
        $modalDiv.modal();
    }
}


window.onload = function () {
    $.ajaxSetup({
        headers: {
            'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
        }
    });
    $("a.clickbaits #clickbait-buttons .btn-clickbait").click(function(event) {
        window.location = '/';
    });
    $('.home #clickbait-buttons .btn-clickbait').click(CBG.getNewHeadline);
    $('#manual-ajax').click(function(event){
        var $modalDiv = $(".ladom");
        event.preventDefault();
        if ($modalDiv.text() == "") {
            var headLine = $("#headline").text();
            var headlineType = "listicle";
            $.post("/clickbaits",
                   { clickbait: { headline: headLine, headline_type: headlineType }},
                   CBG.onShareSuccess);
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

    // fetch best_of if the anchor tag is present
    if (location.hash) {
        CBG.getBestOf(location.hash.substr(1));
    } else if ($('.home #headline').length) {
        CBG.getHeadline('listicle');
    }
};
