const jQuery = require('jquery');
require('slick-carousel');
(function($) {
    $(function() {
        $('.theTarget').slick({
            dots: true,
            autoplay: true,
            fade: true,
            autoplaySpeed: 2000
        });
    })
})(jQuery);