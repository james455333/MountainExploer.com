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
                    $(".gnTr").find(".gender").text("不透露");
                    $(".gnTr").find("#gnInp4").prop("checked", true);
                }
                
                $(".emTr").find(".email").text(item.email);
                $(".emTr").find(".emInp").val(item.email);

                let phone = item.memberInfo.phone;
                if(phone == null){
                    $(".phTr").find(".phone").text("尚未填寫");
                    $(".phTr").find(".phInp").val("尚未填寫");
                }else{
                    $(".phTr").find(".phone").text(phone);
                    $(".phTr").find(".phInp").val(phone);
                }

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
                    // let imgMbNm = item.memberInfo.img_name;
                    let imgMbSrc = "/MountainExploer.com/member/showUserImg?seqno=" + item.seqno;
                    // $(".userFile").attr("src", "/MountainExploer.com/images/" + imgMbNm);
                    $(".userFile").attr("src", imgMbSrc);
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
                <button type="button" class="btn btn-info disabled quick">快速輸入</button>
                </div>`,
        confirmButtonText:"確認修改",
        confirmButtonColor:"#3085d6",
        focusCancel:true,
        showCancelButton:true,
        cancelButtonText:"取消",
        cancelButtonColor:"#FF5151",
        didOpen:function(){
            $(".quick").on("click", function(){
                $(".updatePwd").val("DoingTest123");
                $(".chkPwd").val("DoingTest123");
            })
        },
        preConfirm:function(){
            const oldPwd = Swal.getPopup().querySelector(".pwd").value;
            const updatePwd = Swal.getPopup().querySelector(".updatePwd").value;
            const chkPwd = Swal.getPopup().querySelector(".chkPwd").value;
            if(!oldPwd || !updatePwd || !chkPwd){
                Swal.showValidationMessage(`請輸入舊密碼與新密碼`);
            }

            if(confirmPwd(updatePwd) == false){
                Swal.showValidationMessage(`密碼長度至少8個字元，且必須包含大小寫英文字母與數字，可包含特殊字元!@#$%^&*`);
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
    let pwdLen = confirmPwd.length;
    let re = new RegExp(/[A-Za-z]+[0-9]/);
    let re2 = new RegExp(/[0-9]+[A-Za-z]/);
    let re3 = new RegExp(/[A-Za-z0-9_]+[!@#$%^&*]/);
    let re4 = new RegExp(/[!@#$%^&*]+[A-Za-z0-9_]/);
    let flag = false;

    if(pwdLen >= 8){
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
            return false;
        }
    }else{
        return false
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

    $(".phTr").find(".hiddeninp").toggle();
    $(".phTr").find(".phone").toggle();

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
    let name = $(".nmTr").find(".nmInp").val();
    let ncName = $(".ncTr").find(".ncInp").val();
    let gender = $(".gnTr").find(".gnInp:checked").val();
    let email = $(".emTr").find(".emInp").val();
    let phone = $(".phTr").find(".phInp").val();
    let exp = $(".exTr").find(".exInp").val();
    let other = $(".otTr").find(".otInp").val();
    let birDate = $(".brTr").find(".brInp").val();

    if(ncName != "" && chkEmail(email) == true && chkPhone(phone) == true && chkBirDate(birDate) == true && exp != ""){

        $.ajax({
            method:"GET",
            url:"/MountainExploer.com/member/memberInfoUpdateAction",
            data:{
                seqno:seqno,
                name:name,
                ncName:ncName,
                gender:gender,
                email:email,
                phone:phone,
                exp:exp,
                other:other,
                birDate:birDate
            },
            dataType:"json",
            success:function(data){
                if(data){
                    Swal.fire({
                        icon:"success",
                        title:"修改成功"
                    }).then(function(){
                        window.location.reload();
                    })
                }else{
                    Swal.fire({
                        icon:"error",
                        title:"修改失敗",
                        text:"請重試一次或聯絡管理員"
                    }).then(function(){
                        window.location.reload();
                    })
                }
            },
            error:function(){
                Swal.fire({
                    icon:"error",
                    title:"出現錯誤",
                    text:"請聯絡管理員"
                })
            }
    
        })
    }else if(ncName == ""){
        Swal.fire({
            icon:"warning",
            title:"請填寫暱稱"
        })
    }else if(chkEmail(email) ==  false){
        Swal.fire({
            icon:"warning",
            title:"Email格式錯誤"
        })
    }else if(chkPhone(phone) == false){
        Swal.fire({
            icon:"warning",
            title:"手機格式錯誤"
        })
    }else if(chkBirDate(birDate) == false){
        Swal.fire({
            icon:"warning",
            title:"日期格式錯誤"
        })
    }else if(exp == ""){
        Swal.fire({
            icon:"warning",
            title:"請填寫登山經驗"
        })
    }
    

})

//取消更新
$(".reset").on("click", function(){
    window.location.reload();
})


//click
$(".textUpdate").on("click", function(){
    $(".otInp").val("夢尋綺星長空盡");
})

//驗證姓名
// function chkName(chkName){
//     let chkNameLen = chkName.length;
//     let flag = false;

//     if(chkName == ""){
//         Swal.fire({
//             icon:"warning",
//             title:"姓名不得為空"
//         }).then(function(){

//         })
//     }else if(chkNameLen >= 2){
//         for(let i = 0; i < chkNameLen; i++){
//             let ch = chkName.charCodeAt(i);
//             if(ch >= 0x4e00 && ch <= 0x9fff){
//                 flag = true;
//             }else{
//                 flag = false;
//                 break;
//             }
//         }

//         if(flag){
//             return true;
//         }else{
//             return false;
//         }
//     }else{
//         Swal.fire({
//             icon:"warning",
//             title:"姓名至少兩個中文字元"
//         }).then(function(){
//             e.preventDefault()
//         })
//     }
// }


//驗證Email
function chkEmail(chkEmail){
    let chkEmailLen = chkEmail.length;
    let flag = false;

    if(chkEmail == ""){
        Swal.fire({
            icon:"warning",
            title:"Email不得為空"
        }).then(function(){
            
        })
    }else if(chkEmailLen >= 5){
        let re = new RegExp(/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/);
        if(chkEmail.match(re)){
            flag = true;
        }else{
            flag = false;
        }

        if(flag){
            return true;
        }else{
            return false;
        }
    }
}


//驗證手機
function chkPhone(chkPhone){
    let chkPhoneLen = chkPhone.length;
    let flag = false;

    if(chkPhone == ""){
        Swal.fire({
            icon:"warning",
            title:"手機不得為空"
        })
    }else if(chkPhoneLen == 10){
        let re = new RegExp(/^[09]{2}\d{8}$/);
        if(chkPhone.match(re)){
            flag = true;
        }else{
            flag = false;
        }

        if(flag){
            return true;
        }else{
            return false;
        }
    }else{
        Swal.fire({
            icon:"warning",
            title:"需填入10位數的手機號碼"
        })
    }
}


//驗證生日
function chkBirDate(chkBirDate){
    let re = new RegExp(/^([0-9]{4})-([0-9]{2})-([0-9]{2})$/);
    let flag = false;

    if(chkBirDate.match(re)){
        flag = true;
    }else{
        flag = false;
    }

    if(flag){
        return true;
    }else{
        return false;
    }
}


//上傳圖片
$(".userFile").on("click", function(){
    $(".hiddenImg").toggle();
})

$(".updateImg").on("click", function(){
    if($(".userImg").val() != null){
        Swal.fire({
            icon:"warning",
            title:"圖片上傳中"
        }).then(function(){
            $("#imgForm").submit();
        })
    }else{
        Swal.fire({
            icon:"error",
            title:"上傳失敗",
            text:"請重試一次或聯絡管理員"
        })
    }

})

