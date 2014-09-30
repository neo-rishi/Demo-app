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
// require turbolinks
//= require jquery_ujs
//= require jquery-ui.min
//= require twitter/bootstrap
//= require autocomplete-rails
//= require_tree .
$(document).ready(function(){
  postGlobal = 0;
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
  $("#post_new").click(function(event){
    event.preventDefault();
    $('#post_title').focusout();
    $('#myModel').hide();
    var datastring = $("#new_post").serialize();
    $.post( $("#new_post").attr('action'),datastring,function(data,status,xhr){}, "script"
    );
  });
  $(".comment").click(function(event){
    event.preventDefault();
    postGlobal = $(this).attr('href');
    $('#post_modal').modal('toggle')
   });

  $(".new_comment").click(function(event){
    var text = $('.get_comment').text();
    $('.get_comment').empty();
    $.post( '/posts/'+postGlobal+'/comments',{comment: {content: text}},function(data,status,xhr){}, "script"
    );
   });
  $(".read_comment").click(function(event){
    // event.preventDefault();
    $('#read_comment_modal').modal('toggle')
    // $.get('/posts/'+postGlobal+'/read_comments', {}, function(data,status,xhr){}, "script");
   });
});


