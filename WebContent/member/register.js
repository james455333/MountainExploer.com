$(".account").on("blur", function(){
    let AntVal = $(".account").val();
    let AntValLen = AntVal.length;
    let flag = false;

    if(AntVal == ""){
        $(".Antsp").html("<font color='red'>請輸入帳號</font>");
    }else if(AntValLen >= 6){
        let re = new RegExp(/[A-Za-z]+[0-9]/);
        let re2 = new RegExp(/[0-9]+[A-Za-z]/);
        if(AntVal.match(re)){
            flag = true;
        }else if(AntVal.match(re2)){
            flag = true;
        }else{
            flag = false;
        }
        if(flag){
            $(".Antsp").html("<font color='green'>正確</font>");
        }else{
            $(".Antsp").html("<font color='red'>帳號長度必須包含英文字母和數字</font>");
        }
    }else{
        $(".Antsp").html("<font color='red'>帳號長度至少6個字元</font>");
    }
});


$("#chkAnt").on("click", function(){
    var userAnt = $.trim($("#account").val());

    $.ajax({
        method:"GET",
        url:"/MountainExploer.com/member/checkAnt",
        data:{account:userAnt},
        dataType:"json",
        complete:function(msg){
            console.log(msg);
            if(eval("(" + msg.responseText + ")")){
                $("#chksp").html("<font color='red'>帳號已經存在</font>")
            } else{
                $("#chksp").html("<font color='green'>帳號可以使用</font>");
            }
        }
    })
});


$(".pwd").on("blur", function(){
    let PwdVal = $(".pwd").val();
    let PwdValLen = PwdVal.length;
    let flag = false;

    if(PwdVal == ""){
        $(".pwdsp").html("<font color='red'>請輸入密碼</font>");
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
            $(".pwdsp").html("<font color='green'>正確</font>");
        }else{
            $(".pwdsp").html("<font color='red'>密碼必須包含英文字母與數字</font>");
        }
    }else{
        $(".pwdsp").html("<font color='red'>密碼長度至少8個字元</font>");
    }
});


$(".name").on("blur", function(){
    let NmVal = $(".name").val();
    let NmValLen = NmVal.length;
    let flag = false;

    if(NmVal == ""){
        $(".nmsp").html("<font color='red'>請輸入姓名</font>");
    }else if(NmValLen >= 2){
        for(let i = 0; i < NmValLen; i++){
            let ch = NmVal.charCodeAt(i);
            if(ch >= 0x4e00 && ch <= 0x9fff){
                flag = true;
            }else{
                flag = false;
                break;
            }
        }

        if(flag){
            $(".nmsp").html("<font color='green'>正確</font>");
        }else{
            $(".nmsp").html("<font color='red'>請輸入中文字元</font>");
        }
    }else{
        $(".nmsp").html("<font color='red'>姓名長度至少2個中文字元</font>");
    }
})


$(".email").on("blur", function(){
    let EmVal = $(".email").val();
    let EmValLen = EmVal.length;
    let flag = false;

    if(EmVal == ""){
        $(".emsp").html("<font color='red'>請輸入電子郵件</font>");
    }else if(EmValLen >= 5){
        let re = new RegExp(/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/);
        if(EmVal.match(re)){
            flag = true;
        }else{
            flag = false;
        }

        if(flag){
            $(".emsp").html("<font color='green'>正確</font>");
        }else{
            $(".emsp").html("<font color='red'>電子郵件格式不正確</font>")
        }
    }
})


$(".rgtime").on("click", function(){
    
})