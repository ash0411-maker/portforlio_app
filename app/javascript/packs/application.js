// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require('jquery')
import "cocoon";


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
//= require bootstrap-sprockets


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


// ハンバンガーメニュー
$(function() {
    $('.menu-trigger').on('click', function(event) {
        $(this).toggleClass('active');
        $('#sp-menu').fadeToggle();
        event.preventDefault();
    });
});