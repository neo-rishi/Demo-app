  // This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery

//= require jquery_ujs
//= require jquery-ui.min
//= require twitter/bootstrap
//= require turbolinks
//= require autocomplete-rails
//= require_tree .
$(document).ready(function(){
  $('#drop4').dropdown();
  $("#postButton").click(function(event){
    $('#myModel').show();
    $('#post_title').focus();
  });
  $('.close').click(function(event){
    $('#post_title').focusout();
    $('#myModel').hide();
  });
  $('#closeModelB').click(function(event){
    $('#post_title').focusout();
    $('#myModel').hide();
  });


});