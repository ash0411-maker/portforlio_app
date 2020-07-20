$(function() {
    $('.order-tab li').click(function() {
        var index = $('.order-tab li').index(this);
        $('.order-tab li').removeClass('order-active');
        $(this).addClass('order-active');
        // $('.area ul').removeClass('show').eq(index).addClass('show');
    });
});