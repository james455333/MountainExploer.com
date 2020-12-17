$(function(){
    let seqno = $(".seqno").val();
    $.ajax({
        method:"GET",
        url:"/MountainExploer.com/member/selectSgInfoAction",
        data:{seqno:seqno},
        dataType:"json",
        success:function(mbList){
            $.each(mbList, function(index, item){
                $(".acTr").find(".account").text(item.account);
                $(".nmTr").find(".name").text(item.name);
                $(".ncTr").find(".ncName").text(item.memberInfo.neck_name);
                let gender = item.memberInfo.gender;
                if(gender == "male"){
                    $(".gnTr").find(".gender").text("男");
                }else if(gender == "female"){
                    $(".gnTr").find(".gender").text("女");
                }else if(gender == "x"){
                    $(".gnTr").find(".gender").text("X");
                }else if(gender == "mask"){
                    $(".gnTr").find(".mask").text("不透露");
                }
                
                $(".emTr").find(".email").text(item.email);
                $(".gpTr").find(".group").text(item.memberStatus.name);
                $(".exTr").find(".exp").text(item.memberInfo.climb_ex);

                let birDate = item.memberInfo.birthday;
                if(birDate != null){
                    let birDateJS = new Date(birDate);
                    $(".brTr").find(".birDate").text(getFormattedDate(birDateJS));
                }

                let regDate = item.reg_Date;
                let regDateJS = new Date(regDate);
                $(".rgTr").find(".regDate").text(getFormattedDate(regDateJS));

                let imgMb = item.memberInfo.img_name;
                if(imgMb != null){
                    let imgMbNm = item.memberInfo.img_name
                    $(".userFile").attr("src", "/MountainExploer.com/images/" + imgMbNm);
                }

            })
            $.ajax({
                method:"GET",
                url:"/MountainExploer.com/member/memberOther",
                data:{seqno:seqno},
                contentType:"application/json; charset=UTF-8",
                dataType:"json",
                success:function(otherLs){
                    if(otherLs != null){
                        $(".otTr").find(".other").text(otherLs);
                    }
                }

            })
            
        }
    })
})


//日期轉換
function getFormattedDate(date){
    let year = date.getFullYear();
    let month = (1 + date.getMonth()).toString().padStart(2, "0");
    let day = date.getDate().toString().padStart(2, "0");

    return year + "/" + month + "/" + day;
}


//修改密碼
$(".updatePwd").on("click", function(){
    let seqno = $(".seqno").val();
    Swal.fire({
        title:"修改密碼",
        html:`<div>
                <input type="password" class="swal2-input pwd" placeholder="請輸入舊密碼">
                <input type="password" class="swal2-input updatePwd" placeholder="請輸入新密碼">
                <input type="password" class="swal2-input chkPwd" placeholder="請再次輸入新密碼">
                </div>`,
        confirmButtonText:"確認修改",
        confirmButtonColor:"#3085d6",
        focusCancel:true,
        showCancelButton:true,
        cancelButtonText:"取消",
        cancelButtonColor:"#FF5151",
        preConfirm:function(){
            const oldPwd = Swal.getPopup().querySelector(".pwd").value;
            const updatePwd = Swal.getPopup().querySelector(".updatePwd").value;
            const chkPwd = Swal.getPopup().querySelector(".chkPwd").value;
            if(!oldPwd || !updatePwd || !chkPwd){
                Swal.showValidationMessage(`請輸入舊密碼與新密碼`);
            }

            if(updatePwd != chkPwd){
                Swal.showValidationMessage(`驗證密碼與新密碼不相符`);
            }

            return{
                pwd:oldPwd,
                updatePwd:updatePwd,
                chkPwd:chkPwd
            }
        }
    }).then(function(result){
        if(result.isConfirmed){
            let oldPwd = $(".pwd").val();
            let updatePwd = $(".updatePwd").val();
            $.ajax({
                method:"GET",
                url:"/MountainExploer.com/member/checkPwd",
                data:{
                    seqno:seqno,
                    password:oldPwd
                },
                dataType:"json",
                success:function(res){
                    if(res){
                        $.ajax({
                            method:"GET",
                            url:"/MountainExploer.com/member/memberPwdChangeAction",
                            data:{
                                seqno:seqno,
                                password:oldPwd,
                                updatePwd:updatePwd
                            },
                            dataType:"json",
                            success:function(data){
                                if(data){
                                    Swal.fire({
                                        icon:"success",
                                        title:"密碼修改成功"
    
                                    }).then(function(){
                                        window.location.reload();
                                    })
                                }else{
                                    Swal.fire({
                                        icon:"error",
                                        title:"密碼修改失敗",
                                        text:"請重試一次或聯絡管理員"
                                    }).then(function(){
                                        window.location.reload();
                                    })
                                }
                            },
                            error:function(){
                                Swal.fire({
                                    icon:"error",
                                    title: "出現錯誤",
                                    text:"請聯絡管理員"
                                }).then(function(){
                                    window.location.reload();
                                })
                            }
    
                        })
                    }else{
                        Swal.fire({
                            icon:"error",
                            title:"舊密碼錯誤",
                            text:"請重新輸入"
                        }).then(function(){
                            window.location.reload();
                        })
                    }
                },
                error:function(){
                    Swal.fire({
                        icon:"error",
                        title: "出現錯誤",
                        text:"請聯絡管理員"
                    }).then(function(){
                        window.location.reload();
                    })
                }
    
            })

        }else{
            window.location.reload();
        }

    })
})


//驗證密碼
function confirmPwd(password){
    

}