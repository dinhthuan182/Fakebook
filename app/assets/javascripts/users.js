// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(function(){
  $("#loginForm").validate({
    rules: {
      "username": {
        required: true,
        maxlength: 255
      },
      "password": {
        required: true,
        validatePassword: true,
        maxlength: 64
      }
    },
    messages: {
      "username": {
        required: "Bắt buộc nhập username",
        maxlength: "Email tối đa 255 ký tự"
      },
      "password": {
        required: "Bắt buộc nhập password",
        maxlength: "Mật khẩu rối đa 64 ký tự"
      }
    }
  });
    // $.validator.addMethod("validatePassword", function (value, element) {
  //           return this.optional(element) || /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,16}$/i.test(value);
  //       }, "Hãy nhập password từ 8 đến 16 ký tự bao gồm chữ hoa, chữ thường và ít nhất một chữ số");
});