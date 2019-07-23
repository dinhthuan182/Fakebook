// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

function showImageAlbum() {
  if (this.files && this.files[0]) {
    for (var i = 0; i < this.files.length; i++) {
      var reader = new FileReader();
      reader.onload = function(data){
      $('.images').prepend('<div class="float-left mt-2 mr-1"><div ng-repeat="file in imagefinaldata" class="img-wrp"><img src="' + data.target.result + '" class="size-my-photos" alt="" /><img class="btn-close-album m-1" src="/assets/close.png" onclick="clickCloseA.call(this)" /></div></div>');
      };
      reader.readAsDataURL(this.files[i]);
    }
  }
};

function clickCloseA(){
  $(this).parent().parent().remove();
};



$(function(){
  $(".upload-image").on("change", function(){
    var preview = document.querySelector('.images');
    var files   = document.querySelector('input[type=file]').files;

    function readAndPreview(file) {
      if ( /\.(jpe?g|png|gif)$/i.test(file.name) ) {
        var reader = new FileReader();
        reader.addEventListener("load", function () {
          var image = new Image();
          image.height = 230;
          image.width = 230;
          image.title = file.name;
          image.src = this.result;
          preview.prepend(image);
        }, false);
        reader.readAsDataURL(file);
      }
    }

    if (files) {
      [].forEach.call(files, readAndPreview);
    }
  })
})