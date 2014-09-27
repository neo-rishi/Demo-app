$(document).on('ready page:load', function(){
  $('#drop4').dropdown();
  $('#search_users').dropdown();
  $("#showDiv").click(function(){
    $("#div1").css({ display: "block"});
  });

  $("#hideDiv").click(function(event){
    event.preventDefault();
    var datastring = $("#new_comment").serialize();
    $.post( $("#new_comment").attr('action'),datastring,function(data,status,xhr){}, "script"
    );
  });


  $("#show_follow_user a").click(function(event){
    id = $(this).attr("id")
    if(id==null){}
    else{
    event.preventDefault();
    alert($(this).attr("id"));
    $.get( $(this).attr("href"),{},function(data,status,xhr){ alert(status)}, "script");
    $("#row-"+id).remove();}
  });



  $("#hideDiv").click(function(){

    $("#div1").css({ display: "none"});
  });

  $('#allpost a:not(.comment)').click(function(){
    event.preventDefault();
      $.get( $(this).attr("href"),{},function(data,status,xhr){}, "script"
    );
  });

  $("#refresh_followings").click(function(event){
    event.preventDefault();
    var datastring = $(this).serialize();
    $.post($(this).attr("href"),datastring,function(data,status,xhr){}, "script"
    );
  });

  $("#user_follow_refresh").click(function(event){
    event.preventDefault();
    var datastring = $(this).serialize();
    $.post($(this).attr("href"),datastring,function(data,status,xhr){}, "script"
    );
  });

  $("#search_users").keypress(function(){
    var datastring = $('#search_users').val();
    data =
    $.post("/users/search_user", {data: datastring },function(data,status,xhr){}, "script");
  });

  // $("#postButton").click(function(event){
  //   $('#myModel').show();
  //   $('#post_title').focus();
  // });
  // $('.close').click(function(event){
  //   $('#post_title').focusout();
  //   $('#myModel').hide();
  // });
  // $('#closeModelB').click(function(event){
  //   $('#post_title').focusout();
  //   $('#myModel').hide();
  // });

   $("div i ").click(function(){
     var id = $(this).attr("id")
    $("#postinfo"+id).slideToggle();
  });
});






