// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/


$(document).ready(function(){
//nut like
  $('img.btn-like').click(function(){
    if($(this).attr('src')=="/assets/heart.png")
    {
      $(this).removeAttr("src");
      $(this).attr("src","/assets/like.png");
    }
    else
    {
      $(this).removeAttr("src");
      $(this).attr("src","/assets/heart.png");
    }
  });
//nut follow
  $('button#btnFollow').click(function(){
    if($(this).text() == "Follow"){
      $(this).html("<b>Following</b>");
      $(this).css("background-color", "#ffc107");
      $(this).css("border-color", "white");
      $(this).css("color", "white");
    }else{
      $(this).html("<b>Follow</b>");
      $(this).css("background-color", "white");
      $(this).css("border-color", "#ffc107");
      $(this).css("color", "#ffc107");
    }
  });
});
