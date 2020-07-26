$(function() {
    $('.order-tab li').click(function() {
        console.log("hello");
        var index = $('.order-tab li').index(this);
        $('.order-tab li').removeClass('order-active');
        $(this).addClass('order-active');
        if (index == 1) {
            $('.current_order').css('display','block');
            $('.finished_order').css('display','none');
        } else {
            $('.finished_order').css('display','block');
            $('.current_order').css('display','none');
        }
    });
});
