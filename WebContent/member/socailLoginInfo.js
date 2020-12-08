//顯示註冊時間
$(function(){
    var myDate = new Date();
    var t = myDate.toLocaleDateString();

    $("#regDate").val(t);
    // $("#regDate").load("socailLoginInfo.jsp");
})

//防止預設值被清空
document.getElementById("reset").onclick = function(){
    let regDate = document.getElementById("regDate");
    regDate.defaultValue = regDate.value;
    let userAnt = document.getElementById("account");
    userAnt.defaultValue = userAnt.value;
    let userNm = document.getElementById("name");
    userNm.defaultValue = userNm.value;
    let userEm = document.getElementById("email");
    userEm.defaultValue = userEm.value;

    document.forms[0].reset();

}


//第三方登入資料儲存
$(".submit").on("click", function(){
    let userAnt = $.trim($(".account").val());
    let userNm = $.trim($(".name").val());
    let userEm = $.trim($(".email").val());
    let userStId = $.trim($(".statusId").val());
    let regDate = $.trim($(".regDate").val());

    $.ajax({
        method:"GET",
        url:"/MountainExploer.com/member/socailInfoAdd",
        data:{
            account:userAnt,
            name:userNm,
            email:userEm,
            statusId:userStId,
            regDate:regDate
        },
        dataType:"json",
        success:function(data){
            if(data){
                swal({
                    title: "註冊成功，請重新登入使用本系統",
                    icon: "success"
                });
                window.location.href="/MountainExploer.com/member/memberLoginEntry";
            }else{
                swal({
                    title: "註冊失敗，請聯絡管理員",
                    icon: "error"
                });
                window.location.href="/MountainExploer.com";
            }
        },
        error:function(){
            swal({
                title: "註冊失敗，請聯絡管理員",
                icon: "error"
            });
            window.location.href="/MountainExploer.com";
        }
    });
})