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
                $(".nmTr").find(".nmInp").val(item.name);


                $(".ncTr").find(".ncName").text(item.memberInfo.neck_name);
                $(".ncTr").find(".ncInp").val(item.memberInfo.neck_name);

                let gender = item.memberInfo.gender;
                if(gender == "male"){
                    $(".gnTr").find(".gender").text("男");
                    $(".gnTr").find("#gnInp1").prop("checked", true);
                }else if(gender == "female"){
                    $(".gnTr").find(".gender").text("女");
                    $(".gnTr").find("#gnInp2").prop("checked", true);
                }else if(gender == "x"){
                    $(".gnTr").find(".gender").text("X");
                    $(".gnTr").find("#gnInp3").prop("checked", true);
                }else if(gender == "mask"){
                    $(".gnTr").find(".mask").text("不透露");
                    $(".gnTr").find("#gnInp4").prop("checked", true);
                }
                
                $(".emTr").find(".email").text(item.email);
                $(".emTr").find(".emInp").val(item.email);

                $(".phTr").find(".phone").text(item.memberInfo.phone);
                $(".phTr").find(".phInp").val(item.memberInfo.phone);

                $(".gpTr").find(".group").text(item.memberStatus.name);
                
                $(".exTr").find(".exp").text(item.memberInfo.climb_ex);
                $(".exTr").find(".exInp").val(item.memberInfo.climb_ex);

                let birDate = item.memberInfo.birthday;
                if(birDate != null){
                    let birDateJS = new Date(birDate);
                    $(".brTr").find(".birDate").text(getFormattedDate(birDateJS));
                    $(".brTr").find(".brInp").val(getFormattedDate(birDateJS));

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
                        $(".otTr").find(".otInp").text(otherLs);
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

    return year + "-" + month + "-" + day;
}


//修改密碼
$(".updatePwdbtn").on("click", function(){
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

            if(confirmPwd(updatePwd) == false){
                Swal.showValidationMessage(`密碼必須包含大小寫英文字母與數字，可包含特殊字元!@#$%^&*`);
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
            
        }

    })
})


//驗證密碼
function confirmPwd(confirmPwd){
    let re = new RegExp(/[A-Za-z]+[0-9]/);
    let re2 = new RegExp(/[0-9]+[A-Za-z]/);
    let re3 = new RegExp(/[A-Za-z0-9]+[!@#$%^&*]/);
    let re4 = new RegExp(/[!@#$%^&*]+[A-Za-z0-9]/);
    let flag = false;

    if(confirmPwd.match(re)){
        flag = true;
        console.log("re");
    }else if(confirmPwd.match(re2)){
        flag = true;
        console.log("re2");
    }else if(confirmPwd.match(re3)){
        flag = true;
        console.log("re3");
    }else if(confirmPwd.match(re4)){
        flag = true;
        console.log("re4");
    }else{
        flag = false;
        console.log("false");
    }

    if(flag){
        return true;
    }else{
        return flag;
    }

}


//點擊修改會員資料按鈕
$(".updateInfobtn").on("click", function(){
    //toggle() 隱藏的顯示，顯示的隱藏
    $(".nmTr").find(".hiddeninp").toggle();
    $(".nmTr").find(".name").toggle();

    $(".ncTr").find(".hiddeninp").toggle();
    $(".ncTr").find(".ncName").toggle();

    $(".gnTr").find(".hiddeninp").toggle();
    $(".gnTr").find(".gender").toggle();

    $(".emTr").find(".hiddeninp").toggle();
    $(".emTr").find(".email").toggle();

    $(".exTr").find(".hiddeninp").toggle();
    $(".exTr").find(".exp").toggle();

    $(".otTr").find(".hiddeninp").toggle();
    $(".otTr").find(".other").toggle();

    $(".brTr").find(".hiddeninp").toggle();
    $(".brTr").find(".birDate").toggle();

    $(".btnAction").find("#updateInfobtn").toggle();
    $(".btnAction").find(".hiddeninp").toggle();
})


//修改會員資料
$(".updateAction").on("click", function(){
    let seqno = $(".seqno").val();


})