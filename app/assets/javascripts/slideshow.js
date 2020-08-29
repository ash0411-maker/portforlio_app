$(function() {
    $('.slick-box').not('.slick-initialized').slick({
        dots: true,
        autoplay: true,
        centerMode: true,
        centerPadding: '10%',
        autoplaySpeed: 2000,
        variableWidth: true,
        responsive: [
            {
                breakpoint: 992,
                settings: {
                    fade: true,
                    dots: false,
                    centerMode: false,
                    centerPadding: '100%',
                    variableWidth: false
            }
            },
            {
                breakpoint: 768,
                settings: {
                    fade: true,
                    dots: false,
                    centerMode: false,
                    centerPadding: '100%',
                    variableWidth: false
                }
            }
        ]
    });
})