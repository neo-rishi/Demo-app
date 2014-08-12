$(document).on('ready page:load', function(){
  $('#drop4').dropdown();
  $("#showDiv").click(function(){
    $("#div1").css({ display: "block"});
  });

  $("#hideDiv").click(function(event){
    event.preventDefault();
    var datastring = $("#new_comment").serialize();
    $.post( $("#new_comment").attr('action'),datastring,function(data,status,xhr){}, "script"
    );
  });
  $("#hideDiv").click(function(){

    $("#div1").css({ display: "none"});
  });

  $('#allpost a').click(function(){
    event.preventDefault();
      $.get( $(this).attr("href"),{},function(data,status,xhr){}, "script"
    );
  });
});



