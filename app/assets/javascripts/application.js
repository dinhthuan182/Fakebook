// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require jquery-ui/widgets/sortable
//= require activestorage
//= require turbolinks
//= require_tree .
//= require bootstrap

$(document).ready(function(){
//nut like
  $('img.btnLike').click(function(){
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

//nut change anh dai dien
document.querySelector("html").classList.add('js');
function showImage(){
  if(this.files && this.files[0])
  {
    var obj = new FileReader();
    obj.onload = function(data){
      var image = document.getElementById("image");
      image.src = data.target.result;
      image.style.display = "block"
    }
    obj.readAsDataURL(this.files[0]);
  }
}

