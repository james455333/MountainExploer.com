$("#account").on("blur", checkIsExist);
    function checkIsExist(){
        var userAnt = $.trim($("#account").val());

        $.ajax({
            method:"GET",
            url:"<c:url value='/member/checkAnt'>",
            data:{account:userAnt},
            dataType:"json",
            complete:function(msg){
                console.log(msg);
                if(eval("(" + msg.responseText + ")")){
                    $("#Antsp").html("<font color='red'>帳號已存在</font>");
                } else{
                    $("#Antsp").html("帳號可以使用")
                }
            }
        })
    }


$("input[name='account']").on("blur", function(){

    let AntVal = $("input[name='account']").val();
    let AntValLen = AntVal.length;
    let flag = false;

    if(AntVal == ""){
        $(".Antsp").html("<font color='red'>請輸入帳號</font>")
    } else if(AntValLen >= 6){
        for(let i = 0; i < AntValLen; i++){
           let re = new RegExp(/[A-Za-z]+[0-9]/);
           let re2 = new RegExp(/[0-9]+[A-Za-z]/);
           if(AntVal.match(re)){
               flag = true;
           }else if(AntVal.match(re2)){
               flag = true;
           }else{
               flag = false;
           }
        }
        if(flag){
            $(".Antsp").html("正確")
        } else {
            $(".Antsp").html("<font color='red'>帳號必須包含英文與數字</font>");
        }
    }else{
        $(".Antsp").html("<font color='red'>帳號長度最少6個字元</font>")
    }
})
