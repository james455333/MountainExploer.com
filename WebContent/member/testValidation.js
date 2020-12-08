$(function(){
    $("#rgForm").validate({
        rules:{
            account: {
                required: true,
                minlength: 6
            },
            pwd: {
                required: true,
                minlength: 8
            },
            chkPwd: {
                required: true,
                minlength: 8,
                equalTo: "#Pwd"
            },
            name: {
                required: true,
                minlength: 2
            },
            email: {
                required: true,
                email: true
            },
            statusId: {
                required: true,
            }
        },
        messages: {
            account: {
                required: "請輸入帳號",
                minlength: "帳號長度至少6個字元"
            },
            pwd: {
                required: "請輸入密碼",
                minlength: "密碼長度至少8個字元"
            },
            chkPwd: {
                required: "請再次輸入密碼",
                minlength: "密碼長度至少8個字元",
                equalTo: "密碼不相符"
            },
            name: {
                required: "請輸入姓名",
                minlength: "姓名長度至少2個字元"
            },
            email: {
                required: "請輸入Email",
                email: "Email格式錯誤"
            },
            statusId: {
                required: "此為必選選項",
            }
        }
    });
});