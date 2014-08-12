$(document).on('ready page:load', function(){
    $('#drop4').dropdown();
    $("#message").click(function(event){
    event.preventDefault();
    var datastring = $("#new_message").serialize();
    $.post($("#new_message").attr('action'), datastring, function(data,status,xhr){}, "script"
    );
  });
});