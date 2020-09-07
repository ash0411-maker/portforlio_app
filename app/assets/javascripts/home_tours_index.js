$(function(){
    $(window).scroll(function (){
        $('.top-fadein').each(function(){
            let elemPos = $(this).offset().top;
            let scroll = $(window).scrollTop();
            let windowHeight = $(window).height();
            if (scroll > elemPos - windowHeight +80){
                $(this).addClass('top-scrollin');
            }
        });
    });
});