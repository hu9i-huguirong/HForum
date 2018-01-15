$(function () {
    $("#phone-login-a").click(function () {
        $("#phoneNum-div").show();
        $("#sms-div").show();
        $("#email-div").hide();
        $("#password-div").hide();
        $("#phone-login-a").hide();
        $("#email-login-a").show();
    });
    $("#email-login-a").click(function () {
        $("#phoneNum-div").hide();
        $("#sms-div").hide();
        $("#email-div").show();
        $("#password-div").show();
        $("#phone-login-a").show();
        $("#email-login-a").hide();
    });
});