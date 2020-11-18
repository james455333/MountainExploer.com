$(function () {
    $("#userShow").click(function () {
        $("#user").css("display", "block");
        $("#idCard").css("display", "none");
        $("#padLock").css("display", "none");
        $("#challenge").css("display", "none");

    });
});
$(function () {
    $("#idCardShow").click(function () {
        $("#user").css("display", "none");
        $("#idCard").css("display", "block");
        $("#padLock").css("display", "none");
        $("#challenge").css("display", "none");

    });
});
$(function () {
    $("#padlockShow").click(function () {
        $("#user").css("display", "none");
        $("#idCard").css("display", "none");
        $("#padLock").css("display", "block");
        $("#challenge").css("display", "none");

    });
});
$(function () {
    $("#challengeShow").click(function () {
        $("#user").css("display", "none");
        $("#idCard").css("display", "none");
        $("#padLock").css("display", "none");
        $("#challenge").css("display", "block");

    });
});