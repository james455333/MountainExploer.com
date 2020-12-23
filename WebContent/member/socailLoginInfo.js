//顯示註冊時間
$(function(){
    var myDate = new Date();
    var t = myDate.toLocaleDateString();

    $("#regDate").val(t);
    // $("#regDate").load("socailLoginInfo.jsp");
})

//防止預設值被清空
document.getElementById("reset").onclick = function(){
    let regDate = document.getElementById("regDate");
    regDate.defaultValue = regDate.value;
    let userAnt = document.getElementById("account");
    userAnt.defaultValue = userAnt.value;
    let userNm = document.getElementById("name");
    userNm.defaultValue = userNm.value;
    let userEm = document.getElementById("email");
    userEm.defaultValue = userEm.value;

    document.forms[0].reset();

}


//登山嚮導提醒
$(".statusId").change(function(){
	Swal.fire({
		icon:"warning",
		title:"登山嚮導註冊提示",
		html:`<p>登山嚮導需寄送相關文件證明，經人工審核後方可完成認證程序。<p><p style="color:red;font-weight:bold">本系統客服：mountainexploer@gmail.com</p>`
	})
	
})


//測試
// $(".testBt").on("click", function(){
// 	swal({
// 		title: "測試成功",
// 		icon: "success"
// 	});
// })


//第三方登入資料儲存
$(".submit").on("click", function(){
    let userAnt = $.trim($(".account").val());
    let userNm = $.trim($(".name").val());
    let userEm = $.trim($(".email").val());
	let userStId = $.trim($(".statusId").val());
	let ncName = $.trim($(".ncName").val());
	let exp = $(".exp").val();
    let regDate = $.trim($(".regDate").val());

	$.ajax({
		method:"GET",
	    url:"/MountainExploer.com/member/socailInfoAdd",
	    data:{
			account:userAnt,
			name:userNm,
	        email:userEm,
			statusId:userStId,
			ncName:ncName,
			exp:exp,
	        regDate:regDate
		},
	    dataType:"json",
	    success:function(data){
			if(data){
				Swal.fire({
					title: "註冊成功，請重新登入使用本系統",
	                icon: "success"
	            }).then(function(){
					window.location.href="/MountainExploer.com/member/memberLoginEntry";
				})
	        }else{
	            Swal.fire({
	                title: "註冊失敗，請聯絡管理員",
	                icon: "error"
	            }).then(function(){
					window.location.href="/MountainExploer.com";
				})
	        }
	    },
	    error:function(){
			console.log("error");
	        Swal.fire({
				title: "註冊失敗，請聯絡管理員",
	            icon: "error"
	        }).then(function(){
				window.location.href="/MountainExploer.com";
			})
	    }
	});
	
})

$(".fastRg").on("click", function(){
	$(".ncName").val("刺客");
	$(".exp").val("3個月");
})