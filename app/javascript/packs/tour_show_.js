import 'jquery-ujs/src/rails';

$(function(){
    $(window).scroll(function (){
        $('.guide-body-title').each(function(){
            var elemPos = $(this).offset().top;
            var scroll = $(window).scrollTop();
            var windowHeight = $(window).height();
            if (scroll > elemPos - windowHeight +80){
                $(this).addClass('tour-scrollin');
            }
        });
    });
});