//顯示註冊時間
$(function(){
    var myDate = new Date();
    var t = myDate.toLocaleDateString();

    $("#regDate").val(t);
    // $("#regDate").load("formalRegister.jsp");
})


//防止註冊時間被清空
document.getElementById("reset").onclick = function(){
    let regDate = document.getElementById("regDate");
    regDate.defaultValue = regDate.value;
    document.forms[0].reset();
}


//註冊
$(".send").on("click", function(){
    let account = $(".account").val();
    let password = $.trim($(".pwd").val());
    let name = $(".name").val();
    let ncName = $(".ncName").val();
    let email = $(".email").val();
    let statusId = $(".statusId").val();
    let regDate = $(".regDate").val();

    if(rsCheck()){
        
            $.ajax({
                method:"GET",
                url:"/MountainExploer.com/member/memberRegister",
                data:{
                    account:account,
                    password:password,
                    ncName:ncName,
                    name:name,
                    email:email,
                    statusId:statusId,
                    regDate:regDate
                },
                dataType:"json",
                success:function(data){
                    if(data){
                        Swal.fire({
                            icon:"success",
                            title:"註冊成功，請重新登入"
                        }).then(function(){
                            window.location.href="/MountainExploer.com/member/memberLoginEntry";
                        })
                    }else{
                        Swal.fire({
                            icon:"error",
                            title:"註冊失敗"
                        })
                    }
                },
                error:function(){
                    Swal.fire({
                        icon:"error",
                        title:"註冊失敗",
                        text:"帳號重複或資料格式錯誤"
                    })
                }
            })
        
    }else{
        Swal.fire({
            icon:"warning",
            title:"註冊資料有誤，請重新註冊"
        })
    }
})


function rsCheck(){
    let account = $(".account").val();
    let antChk = $("#account").val();
    let password = $.trim($(".pwd").val());
    let chkPwd = $.trim($(".chkPwd").val());
    let name = $(".name").val();
    let ncName = $(".ncName").val();
    let email = $(".email").val();

    if(confirmAnt(account) == true && confirmPwd(password) == true && comparPwd(password, chkPwd) == true && chkName(name) == true && chkEmail(email) == true && chkNcName(ncName) == true){
        console.log("true");
        return true;            
    }else{
        console.log("false");
        return false;
    }
    
}


//blur
$(".account").on("blur", function(){
    let account = $(".account").val();
    if(confirmAnt(account)){
        $(".Antsp").html("<font color='green'>正確</font>");
    }else{
        $(".Antsp").html("<font color='red'>帳號格式不正確</font>");
    }  
})

$(".account").on("blur", function(){
    let account = $(".account").val();
    sameAnt(account);
})

$(".pwd").on("blur", function(){
    let password = $.trim($(".pwd").val());
    if(confirmPwd(password)){
        $(".pwdsp").html("<font color='green'>正確</font>");
    }else{
        $(".pwdsp").html("<font color='red'>密碼格式不正確</font>");
    }
})

$(".chkPwd").on("blur", function(){
    let password = $.trim($(".pwd").val());
    let chkPwd = $.trim($(".chkPwd").val());
    if(comparPwd(password, chkPwd)){
        $(".chksp").html("<font color='green'>正確</font>");
    }else{
        $(".chksp").html("<font color='red'>密碼不相符</font>");
    }
})

$(".name").on("blur", function(){
    let name = $(".name").val();
    if(chkName(name)){
        $(".nmsp").html("<font color='green'>正確</font>");
    }else{
        $(".nmsp").html("<font color='red'>姓名不得為空，且至少2個字元</font>");
    }
})

$(".ncName").on("blur", function(){
    let ncName = $(".ncName").val();
    if(ncName.length >= 2){
        $(".ncsp").html("<font color='green'>正確</font>");
    }else{
        $(".ncsp").html("<font color='red'>暱稱不得為空，且至少2個字元</font>");
    }
})

$(".email").on("blur", function(){
    let email = $(".email").val();
    if(chkEmail(email)){
        $(".emsp").html("<font color='green'>正確</font>");
    }else{
        $(".emsp").html("<font color='red'>Email格式錯誤</font>");
    }
})

//登山嚮導提醒
$(".statusId").change(function(){
	Swal.fire({
		icon:"warning",
		title:"登山嚮導註冊提示",
		html:`<p>登山嚮導需寄送相關文件證明，經人工審核後方可完成認證程序。<p><p style="color:red;font-weight:bold">本系統客服：mountainexploer@gmail.com</p>`
	})
	
})


//驗證帳號
function confirmAnt(confirmAnt){
    let confirmAntLen = confirmAnt.length;
    let flag = false;

    if(confirmAnt == ""){
        Swal.fire({
            icon:"warning",
            title:"帳號不得為空"
        })
    }else if(confirmAntLen >= 6){
        let re = new RegExp(/[A-Za-z]+[0-9]/);
        let re2 = new RegExp(/[0-9]+[A-Za-z]/);
        if(confirmAnt.match(re)){
            flag = true;
        }else if(confirmAnt.match(re2)){
            flag = true;
        }else{
            flag = false;
        }
        if(flag){
            return true;
        }else{
            Swal.fire({
                icon:"warning",
                title:"帳號格式不符"
            })
        }
    }else{
        Swal.fire({
            icon:"warning",
            title:"帳號長度至少6個字元"
        })
    }
}


//比對帳號
function sameAnt(sameAnt){
    $.ajax({
        method:"GET",
        url:"/MountainExploer.com/member/checkAnt",
        data:{account:sameAnt},
        dataType:"json",
        success:function(data){
            console.log(data);
            if(data){
                $("#chkAntsp").html("<font color='green'>帳號可以使用</font>");
            }else{
                $("#chkAntsp").html("<font color='red'>帳號重複</font>");
            }
        }
    })
	
}


//驗證密碼
function confirmPwd(confirmPwd){
    let confirmPwdLen = confirmPwd.length;
    let flag = false;

    if(confirmPwd == ""){
        Swal.fire({
            icon:"warning",
            title:"密碼不得為空"
        })
    }else if(confirmPwdLen >= 8){
        let re = new RegExp(/[A-Za-z]+[0-9]/);
        let re2 = new RegExp(/[0-9]+[A-Za-z]/);
        let re3 = new RegExp(/[A-Za-z0-9_] + [!@#$%^&*]/);
        let re4 = new RegExp(/[!@#$%^&*] + [A-Za-z0-9_]/);
        if(confirmPwd.match(re)){
            flag = true;
        }else if(confirmPwd.match(re2)){
            flag = true;
        }else if(confirmPwd.match(re3)){
            flag = true;
        }else if(confirmPwd.match(re4)){
            flag = true;
        }else{
            flag = false;
        }
        
        if(flag){
            console.log("true");
            return true;
        }else{
            console.log("false");
            Swal.fire({
                icon:"warning",
                title:"密碼格式不符"
            })
        }
    }else{
        Swal.fire({
            icon:"warning",
            title:"密碼長度至少8個字元"
        })
    }
}

//比對密碼
function comparPwd(Pwd1, Pwd2){
    let flag = false;
    
    if(Pwd1 == Pwd2){
        flag = true;
    }else{
        flag = false;
    }

    if(flag){
        console.log("true");
       return true;
    }else{
        console.log("false");
        Swal.fire({
            icon:"warning",
            title:"密碼不相符"
        })
    }
    
}


//驗證姓名
function chkName(chkName){
    let chkNameLen = chkName.length;

    if(chkName == ""){
        Swal.fire({
            icon:"warning",
            title:"姓名不得為空"
        })
    }else if(chkNameLen >= 2){
        return true;
    }else{
        Swal.fire({
            icon:"warning",
            title:"姓名長度至少2個字元"
        })
    }
}


//驗證暱稱
function chkNcName(chkNcName){
    let chkNcNameLen = chkNcName.length;
    if(chkNcName == ""){
        Swal.fire({
            icon:"warning",
            title:"暱稱不得為空"
        })
    }else if(chkNcNameLen >= 2){
        return true;
    }else{
        Swal.fire({
            icon:"warning",
            title:"暱稱至少2個字元"
        })
    }
}

//驗證Email
function chkEmail(chkEmail){
    let chkEmailLen = chkEmail.length;
    let flag = false;

    if(chkEmail == ""){
        Swal.fire({
            icon:"warning",
            title:"Email不得為空"
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
            Swal.fire({
                icon:"warning",
                title:"Email格式不符"
            })
        }
    }
}



