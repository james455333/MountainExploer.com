//驗證姓名
$(".name").on("blur", function(){
    let NmVal = $.trim($(".name").val());
    let NmeValLen = NmVal.length;
    let flag = false;

    if(NmVal == ""){
        $(".nmsp").html("<font color='red'>請輸入姓名</font>");
    }else if(NmeValLen >= 2){
        for(let i = 0; i < NmeValLen; i++){
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


//驗證生日
$(".birDate").on("blur", function(){
    let BrVal = $.trim($(".birDate").val());
    let re = new RegExp(/^([0-9]{4})-([0-9]{2})-([0-9]{2})$/);
    let flag = false;

    if(BrVal.match(re)){
        flag = true;
    }else{
        flag = false;
    }

    if(flag){
        $(".brsp").html("<font color='green'>正確</font>");
    }else{
        $(".brsp").html("<font color='red'>日期格式不正確</font>");
    }
})


//驗證電話
$(".phone").on("blur", function(){
    let PhVal = $.trim($(".phone").val());
    let PhValLen = PhVal.length;
    let flag = false;

    if(PhVal == ""){
        $(".phsp").html("<font color='red'>請輸入手機號碼</font>");
    }else if(PhValLen == 10){
        let re = new RegExp(/^[09]{2}\d{8}$/);
        if(PhVal.match(re)){
            flag = true;
        }else{
            flag = false;
        }

        if(flag){
            $(".phsp").html("<font color='green'>正確</font>");
        }else{
            $(".phsp").html("<font color='red'>手機號碼格式不正確</font>");
        }
    }else{
        $(".phsp").html("<font color='red'>手機號碼應包含10個數字字元</font>");
    }
})


//驗證Email
$(".email").on("blur", function(){
    let EmVal = $.trim($(".email").val());
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
            $(".emsp").html("<font color='red'>電子郵件格式不正確</font>");
        }
    }
})

 