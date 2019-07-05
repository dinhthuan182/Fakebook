// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

function showImagePhoto(){
  if(this.files && this.files[0])
  {
    var obj = new FileReader();
    obj.onload = function(data){
      $('.images').prepend('<div class="img float-left mt-2 mr-1"><div ng-repeat="file in imagefinaldata" class="img_wrp"><img src="' + data.target.result + '" class="imgResponsiveMax sizeMyPhotos" alt="" /><img class="btnClose m-1" src="/assets/close.png" onclick="clickClose.call(this)"style="width:30px; height: 30px" /></div></div>');
      $('.btnUpload').css({ display: "none" });
    }
    obj.readAsDataURL(this.files[0]);
  }
};
function clickClose(){
  $(this).parent().empty();
  $('.btnUpload').css({ display: "block" });
};
