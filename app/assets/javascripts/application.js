// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require bootstrap-sprockets
//= require jquery.validate
//= require turbolinks
//= require_tree .

$(document).ready(function(){
  $('#new_product').click(function(){
    $('.new_product').toggle()
  });
});

$(document).on("turbolinks:load",function(){
  document.getElementById("my_audio").play();
})

// ===== Scroll to Top ==== 
$(window).scroll(function() {
  if ($(this).scrollTop() >= 100) {        // If page is scrolled more than 50px
      $('#back-to-top').fadeIn(1000);    // Fade in the arrow
  } else {
      $('#back-to-top').fadeOut(1000);   // Else fade out the arrow
  }
});
$('#back-to-top').click(function() {      // When arrow is clicked
  $('html, body').animate({scrollTop : 0},500);
  return false;
});