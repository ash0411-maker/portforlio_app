$(function(){
    $(window).scroll(function (){
        $('.guide-body-title').each(function(){
            let elemPos = $(this).offset().top;
            let scroll = $(window).scrollTop();
            let windowHeight = $(window).height();
            if (scroll > elemPos - windowHeight +80){
                $(this).addClass('tour-scrollin');
            }
        });
    });
});