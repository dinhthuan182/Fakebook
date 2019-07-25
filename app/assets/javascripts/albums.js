// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/


function clickCloseItem(){
  $(this).parent().parent().remove();
};

console.log($('.images').length);

$(document).ready(function(){
  $(".btn-upload").on("change", function(){
    console.log("load function");
    var preview = document.querySelector('.images');
    var files   = document.querySelector('input[type=file]').files;

    function readAndPreview(file) {
      if ( /\.(jpe?g|png|gif)$/i.test(file.name) ) {
        console.log("load function 3");
        var reader = new FileReader();
        reader.addEventListener("load", function () {
          var image = '<div class="float-left m-2"><div ng-repeat="file in imagefinaldata" class="img-wrp"><img src="' + this.result + '" class="size-my-photos"/><img class="btn-close-album m-1" src="/assets/close.png" onclick="clickCloseItem.call(this)" /></div></div>';
           $('.images').prepend(image);
        }, false);
        reader.readAsDataURL(file);
      };
    };

    if (files) {
      console.log("load function 2");
      [].forEach.call(files, readAndPreview);
    };
  });
});
