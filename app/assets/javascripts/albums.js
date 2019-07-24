// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/


function clickCloseA(){
  $(this).parent().parent().remove();
};

$(document).ready(function(){
  $(".btn-upload").on("change", function(){
    console.log("load function");
    var preview = document.querySelector('.images');
    var files   = document.querySelector('input[type=file]').files;

    function readAndPreview(file) {
      if ( /\.(jpe?g|png|gif)$/i.test(file.name) ) {
        var reader = new FileReader();
        reader.addEventListener("load", function () {
          var image = '<div class="float-left mt-2 mr-1"><div ng-repeat="file in imagefinaldata" class="img-wrp"><img src="' + this.result + '" class="size-my-photos"/><img class="btn-close-album m-1" src="/assets/close.png" onclick="clickCloseA.call(this)" /></div></div>';
           $('.images').prepend(image);
        }, false);
        reader.readAsDataURL(file);
      };
    };

    if (files) {
      [].forEach.call(files, readAndPreview);
    };
  });
});
