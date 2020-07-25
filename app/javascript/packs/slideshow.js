const jQuery = require('jquery');
require('slick-carousel');
(function($) {
    $(function() {
        $('.theTarget').slick({
            dots: true,
        });
    })
})(jQuery);