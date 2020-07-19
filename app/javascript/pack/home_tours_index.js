$(function(){
    $(window).scroll(function (){
        $('.top-fadein').each(function(){
            var elemPos = $(this).offset().top;
            var scroll = $(window).scrollTop();
            var windowHeight = $(window).height();
            if (scroll > elemPos - windowHeight +80){
                $(this).addClass('top-scrollin');
            }
        });
    });
});