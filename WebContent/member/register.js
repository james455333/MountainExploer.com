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





//驗證帳號
function confirmAnt(confirmAnt){
    let confirmAntLen = AntVal.length;
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
            return false;
        }
    }else{
        return false;
    }
}


//比對帳號
function noSameAnt(noSameAnt){
	if(noSameAnt != null && noSameAnt.length != 0){
	    $.ajax({
	        method:"GET",
	        url:"/MountainExploer.com/member/checkAnt",
	        data:{account:noSameAnt},
	        dataType:"json",
	        success:function(data){
                if(data){
                    return true;
                }else{
                    return false;
                }
            }
	    })
	}
}


//驗證密碼
function confirmPwd(confirmPwd){
    let confirmPwdLen = PwdVal.length;
    let flag = false;

    if(confirmPwd == ""){
        Swal.fire({
            icon:"warning",
            title:"密碼不得為空"
        }).then(function(){
            
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
            return true;
        }else{
            return false;
        }
    }else{
        return false;
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
       return true;
    }else{
        return false;
    }
    
}


//驗證姓名
function chkName(chkName){
    let chkNameLen = chkName.length;
    let flag = false;

    if(chkName == ""){
        Swal.fire({
            icon:"warning",
            title:"姓名不得為空"
        }).then(function(){
            
        })
    }else if(chkNameLen >= 2){
        for(let i = 0; i < chkNameLen; i++){
            let ch = chkName.charCodeAt(i);
            if(ch >= 0x4e00 && ch <= 0x9fff){
                flag = true;
            }else{
                flag = false;
                break;
            }
        }

        if(flag){
            return true;
        }else{
            return false;
        }
    }else{
        Swal.fire({
            icon:"warning",
            title:"姓名至少兩個中文字元"
        }).then(function(){
            
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



