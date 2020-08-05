$(function() {
    $('.slick-box').slick({
        dots: true,
        centerMode: true,
        centerPadding: '10%',
        autoplay: true,
        autoplaySpeed: 2000,
        responsive: [
            {
                breakpoint: 992,
                settings: {
                arrows: false,
                centerMode: false,
                centerPadding: '0px',
                slidesToShow: 1
            }
            },
            {
                breakpoint: 768,
                settings: {
                    dots: false,
                    autoplay: true,
                    fade: true,
                    centerMode: false,
                    centerPadding: '0px'
                }
            }
        ]
    });
})

