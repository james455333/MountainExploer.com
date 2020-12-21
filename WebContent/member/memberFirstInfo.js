//驗證暱稱
// $(".ncName").on("blur", function(){
//     let NcVal = $.trim($(".ncName").val());
    
//     if(NcVal == ""){
//         $(".ncsp").html("<font color='red'>請輸入暱稱</font>");
//     }else{
//         $(".ncsp").html("");
//     }
// })


//驗證生日
$(".birDate").on("blur", function(){
    let BrVal = $.trim($(".birDate").val());
    let re = new RegExp(/^([0-9]{4})-([0-9]{2})-([0-9]{2})$/);
    let flag = false;

    if(BrVal !== ""){
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
    }else{
        $(".brsp").html("<font color='red'>請輸入生日日期</font>");
    }    
})

// /^([0-9]{2})-([0-9]{2})-([0-9]{4})$/


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



// /^[09]{2}\d{8}$/
