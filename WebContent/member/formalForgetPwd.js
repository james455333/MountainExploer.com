$(".submit").on("click", function(){
    let account = $(".account").val();
    let email = $(".email").val();

    if(!account || !email){
        Swal.fire({
            icon:"error",
            title:"尋找密碼失敗",
            text:"請輸入帳號與註冊時用的Email"
        }).then(function(){
            window.location.reload();
        })
    }else{
        $.ajax({
            method:"GET",
            url:"/MountainExploer.com/member/memberPwdFoundAction",
            data:{
                account:account,
                email:email
            },
            dataType:"json",
            success:function(data){
                if(data == 0){
                    Swal.fire({
                        icon:"error",
                        title:"尋找密碼失敗",
                        text:"您為第三方登入使用者，無法使用此功能"
                    }).then(function(){
                        window.location.href="/MountainExploer.com";
                    })
                }else if(data == 1){
                    Swal.fire({
                        icon:"success",
                        title:"密碼已發送",
                        text:"暫時密碼已發送到您的信箱，請盡快更新您的密碼"
                    }).then(function(){
                        window.location.href="/MountainExploer.com";
                    })
                }else if(data == 2){
                    Swal.fire({
                        icon:"error",
                        title:"信件發送失敗",
                        text:"帳號、Email錯誤或不存在"
                    }).then(function(){
                        window.location.reload();
                    })
                }else{
                    Swal.fire({
                        icon:"error",
                        title:"信件發送失敗",
                        text:"帳號、Email錯誤或不存在"
                    }).then(function(){
                        window.location.reload();
                    })
                }
            },
            error:function(){
                Swal.fire({
                    icon:"error",
                    title:"信件發送失敗",
                    text:"出現未知錯誤，請聯繫管理員"
                }).then(function(){
                    window.location.reload();
                })
            }
        })
    }
})

//快速輸入
$(".antpwd").on("click", function(){
    $(".account").val("Asterius298");
    $(".email").val("edwardareis@gmail.com");
})