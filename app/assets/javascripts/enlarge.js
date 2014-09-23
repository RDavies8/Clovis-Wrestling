/* Created by Ryan on 9/4/14. */

(function(windown, document, undefined) {
    var $articleImg = $('.img-blog');
    $articleImg.bind('click', function(event) {
        alert("TEST");
    })
})(this, this.document)

function enlarge(id) {
    var $img = $('#article-image');
    var $display = $('<div></div>').attr('id', 'enlarged-display');
    var $pageWrapper = $('.page-wrapper');

    var $displayImage = $('<img></img>').attr.
    $display.after($displayImage);
    $pageWrapper.after($display);
}