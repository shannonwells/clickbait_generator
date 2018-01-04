CBG = {
    getNewHeadline: function (event) {
        CBG.getHeadline($(this).attr('id'));
    },

    getBestOf: function (id) {
        $.get('/home/generate', {id: id}, CBG.onGetSuccess, "json");
    },

    getHeadline: function (headlineType) {
        $.get('/home/generate.json', {headline_type: headlineType}, CBG.onGetSuccess);
        CBG.resetLocationHash();
    },

    resetLocationHash: function () {
        location.hash = "";
    },

    setActiveButton: function(headline_type) {
        var $activeButton = $("#" + headline_type);
        $("#clickbait-buttons .button--clickbait").removeClass('active');
        $activeButton.addClass('active');
    },

    reTwit: function(headline) {
        var twit_html = [
            '<a href="https://twitter.com/share" class="twitter-share-button" data-url="http://clickbaitgenerator.herokuapp.com" data-text="',
            headline,
            '" data-via="ShannonEWells" data-size="large" data-count="none" data-hashtags="clickbaitgenerator"></a>'].join('');

        $("#init-twit").html(twit_html);
        twttr.widgets.load();
    },

    // maybe this will do something else later, like register analytics
    onGetSuccess: function (data, status, xhr, leaveHashAlone) {
        // clear the share modal link
        $(".ladom").html("");
        $("#headline").html(data.clickbait.headline);
        CBG.reTwit(data.clickbait.headline);
        CBG.setActiveButton(data.clickbait.type);
    },

    onShareSuccess: function (html) {
        var $modalDiv = $(".ladom");
        $(html).appendTo($modalDiv);
        $modalDiv.modal();
    },

    sharePermalink: function (event) {
        var $modalDiv = $(".ladom");
        var imageUrl = $("#headline-img").attr("href");
        event.preventDefault();
        if ($modalDiv.text() == "") {
            var headLine = $("#headline").text();
            var headlineType = "listicle";
            $.post("/clickbaits",
                { clickbait: {
                    headline: headLine,
                    headline_type: headlineType,
                }
            },
            CBG.onShareSuccess);
        } else {
            $modalDiv.modal();
        }
    }
}


window.onload = function () {
    $.ajaxSetup({
        headers: {
            'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
        }
    });
    $("a.clickbaits #clickbait-buttons .button--clickbait").click(function (event) {
        window.location = '/';
    });
    $('.home #clickbait-buttons .button--clickbait').click(CBG.getNewHeadline);
    $('#manual-ajax').click(CBG.sharePermalink);

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