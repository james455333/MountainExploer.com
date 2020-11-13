$("#account").on("blur", function(){
    var userAnt = $.trim($("#account").val());

    $.ajax({
        method:"GET",
        url:"/MountainExploer.com/member/checkAnt",
        data:{account:userAnt},
        dataType:"json",
        complete:function(msg){
            console.log(msg);
            if(eval("(" + msg.responseText + ")")){
                $("#Antsp").html("<font color='red'>帳號已經存在</font>")
            } else{
                $("#Antsp").html("<font color='blue'>帳號可以使用</font>");
            }
        }


    });
});