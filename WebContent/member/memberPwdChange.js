//舊密碼不得為空
$(".pwd").on("blur", function(){
    let OldPwdVal = $(".pwd").val();
    let OldPwdValLen = OldPwdVal.length;

    if(OldPwdVal == ""){
        $(".pwdsp").html("<font color='red'>請輸入舊密碼</font>");
    }else{
        $(".pwdsp").html("");
    }
})

//查詢密碼
$(".pwd").on("blur", function(){
    var userSeq = $.trim($(".seqno").val());
    var userPwd = $.trim($(".pwd").val());

    $.ajax({
        method:"GET",
        url:"/MountainExploer.com/member/checkPwd",
        data:{seqno:userSeq, password:userPwd},
        dataType:"json",
        success: function(response){
            if(response == true){
                $(".pwdsp").html("<font color='green'>舊密碼正確</font>");
            }else{
                $(".pwdsp").html("<font color='red'>舊密碼不正確</font>");
            }

        }
    })
})


//驗證密碼
$(".updatePwd").on("blur", function(){
    let PwdVal = $.trim($(".updatePwd").val());
    let PwdValLen = PwdVal.length;
    let flag = false;

    if(PwdVal == ""){
        $(".upsp").html("<font color='red'>請輸入密碼</font>");
    }else if(PwdValLen >= 8){
        let re = new RegExp(/[A-Za-z]+[0-9]/);
        let re2 = new RegExp(/[0-9]+[A-Za-z]/);
        if(PwdVal.match(re)){
            flag = true;
        }else if(PwdVal.match(re2)){
            flag = true;
        }else{
            flag = false;
        }

        if(flag){
            $(".upsp").html("<font color='green'>正確</font>");
        }else{
            $(".upsp").html("<font color='red'>密碼必須包含英文字母與數字</font>");
        }
    }else{
        $(".upsp").html("<font color='red'>密碼長度至少8個字元</font>");
    }
})


//比對密碼
$(".chkPwd").on("blur", function(){
    let ChkPwdVal = $.trim($(".chkPwd").val());
    let PwdVal = $.trim($(".updatePwd").val());
    let flag = false;

    if(ChkPwdVal == ""){
        $(".chksp").html("<font color='red'>請再次輸入新密碼</font>")
    }else if(ChkPwdVal != ""){
        if(ChkPwdVal == PwdVal){
            flag = true;
        }else{
            flag = false;
        }

        if(flag){
            $(".chksp").html("<font color='green'>正確</font>");
        }else{
            $(".chksp").html("<font color='red'>密碼不相符</font>");
        }
    }else{
        $(".chksp").html("<font color='red'>密碼驗證必須與先前輸入之密碼相同</font>");
    }
})
