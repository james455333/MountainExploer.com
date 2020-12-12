$(function(){
    $.ajax({
        method:"GET",
        url:"/MountainExploer.com/back/member/cookieSelect",
        dataType:"json",
        success:function(cookieMap){
            if(cookieMap.length != 0 || cookieMap.length != null){
                $.each(cookieMap, function(key, value){
                    if(key == "rmAnt"){
                        $(".account").val(value);
                    }
                    if(key == "rmPwd"){
                        $(".password").val(value);
                    }
                    if(key == "rememberMe"){
                        if(value != null){
                            $(".rememberMe").prop("checked", true);
                        }else{
                            $(".rememberMe").prop("checked", false);
                        }
                    }
                })
            }
        }
    })
})


$(".submit").on("click", function(){
    let account = $(".account").val();
    let password = $(".password").val();
    let isChecked = $(".rememberMe").prop("checked");

    if(account == "" || password == ""){
        Swal.fire({
            icon:"error",
            title:"登入失敗",
            text:"請輸入帳號和密碼"
        }).then(function(){
            window.location.reload();
        })
    }else{
        if(isChecked){
            var rm = "true";
        }else{
            var rm = "";
        }

        $.ajax({
            method:"GET",
            url:"/MountainExploer.com/back/member/loginAction",
            data:{
                account:account,
                password:password,
                rm:rm
            },
            dataType:"json",
            success:function(data){
                if(data){
                    Swal.fire({
                        icon:"success",
                        title:"登入成功"
                    }).then(function(){
                        window.location.href="/MountainExploer.com/back";
                    })
                }else{
                    Swal.fire({
                        icon:"error",
                        title:"登入失敗"
                    }).then(function(){
                        window.location.reload();
                    })
                }
            },
            error:function(){
                Swal.fire({
                    icon:"error",
                    title:"登入出現問題"
                }).then(function(){
                    window.location.reload();
                })
            }

        })
    }
})