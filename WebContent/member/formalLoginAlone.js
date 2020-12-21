//cookie
$(function(){
	$.ajax({
		method:"GET",
		url:"/MountainExploer.com/member/cookieSelect",
		dataType:"json",
		success:function(cookieMap){
			if(cookieMap.length != 0 || cookieMap != null){
				$.each(cookieMap, function(key, value){
					if(key == "rmAnt"){
						$(".account").val(value);
					}
					if(key == "rmPwd"){
						$(".password").val(value);
					}
					if(key == "rememberMe"){
						if(value != null){
							$(".rememberMe").prop("checked", true);
						}else{
							$(".rememberMe").prop("checked", false);
						}
					}
				})
			}
		}

	})
})


//登入
$(".submit").on("click", function(){
	let account = $(".account").val();
	let password = $(".password").val();
	let isChecked = $(".rememberMe").prop("checked");
	if(isChecked){
		var rm = "true";
	}else{
		var rm = null;
	}
	
	if(account == "" || password == ""){
		Swal.fire({
			icon:"error",
			title:"請輸入帳號密碼"
		}).then(function(){
			window.location.reload();
		})
	}else{

		$.ajax({
			method:"GET",
			url:"/MountainExploer.com/member/memberLogin",
			data:{
				account:account,
				password:password,
				rememberMe:rm
			},
			dataType:"json",
			success:function(data){
				if(data == 0){
					Swal.fire({
						icon:"error",
						title:"登入失敗",
						text:"帳號或密碼錯誤"
					}).then(function(){
						window.location.reload();
					})
				}else if(data == 100 || data == 120){
					Swal.fire({
						icon:"success",
						title:"登入成功"
					}).then(function(){
						window.location.href="/MountainExploer.com/member/memberInfoEntry";
					})
					
				}else if(data == 110 || data == 130){
					Swal.fire({
						icon:"success",
						title:"初次登入成功",
						text:"請繼續填寫認證資料"
					}).then(function(){
						window.location.href="/MountainExploer.com/member/memberFormalFirstInfoEntry";
					})
				}else if(data == 140 || data == 150){
					Swal.fire({
						icon:"warning",
						title:"登入失敗，帳號已被停權",
						text:"您的帳號已被停權，無法使用本系統"
					}).then(function(){
						window.location.href="/MountainExploer.com";
					})
				}else if(data == 160){
					Swal.fire({
						icon:"success",
						title:"管理員登入成功"
					}).then(function(){
						window.location.href="/MountainExploer.com/back";
					})
				}else{
					Swal.fire({
						icon:"error",
						title:"登入失敗",
						text:"帳號或密碼錯誤"
					}).then(function(){
						window.location.reload();
					})
				}

			},
			error:function(){
				Swal.fire({
					icon:"error",
					title:"登入出錯，請聯繫管理員"
				}).then(function(){
					window.location.href="/MountainExploer.com";
				})
			}
		})

	}

})



$(".userLog1").on("click", function(){
    let userNo1 = $(".userLog1").val();

    $.ajax({
        method:"GET",
        url:"/MountainExploer.com/member/FastLoginOne",
        data:{userLog1:userNo1},
        dataType:"json",
        success:function(flag){
            if(flag){
                window.location.href="/MountainExploer.com";
            }else{
                window.location.reload();
            }
        }
    })
})

$(".userLog2").on("click", function(){
    let userNo2 = $(".userLog2").val();

    $.ajax({
        method:"GET",
        url:"/MountainExploer.com/member/FastLoginTwo",
        data:{userLog2:userNo2},
        dataType:"json",
        success:function(flag){
            if(flag){
                window.location.href="/MountainExploer.com/member/memberInfoEntry";
            }else{
                window.location.reload();
            }
        }
    })
})

$(".adminLog").on("click", function(){
    let adminLog = $(".adminLog").val();

    $.ajax({
        method:"GET",
        url:"/MountainExploer.com/member/FastLoginAdmin",
        data:{adminLog:adminLog},
        dataType:"json",
        success:function(flag){
            if(flag){
                window.location.href="/MountainExploer.com/back";
            }else{
                window.location.reload();
            }
        }
    })
})


$(".userLog3").on("click", function(){
	$(".account").val("Asterius298");
	$(".password").val("DoingTest123");
	$(".rememberMe").prop("checked", true);
})


//FB第三方登入
		function statusChangeCallback(response){
			var accessToken = response.authResponse.accessToken;
			console.log(response.authResponse.accessToken);
			if(response.status === "connected"){
				FB.api("/me", "GET", {fields:"name,email"},function(response){
// 					window.location.href = "http://localhost:8080/MountainExploer.com/member/userInfo?userInfo=" + JSON.stringify(response);
					let name = response.name;
					let email = response.email;
					
					
					$.ajax({
						url:"/MountainExploer.com/member/userInfo",
						data:{
							name: name,
							email: email
						},
						dataType:"json",
						async:false,
						success:function(data){
							if(data == 1){
								window.location.href="/MountainExploer.com";								
								// Swal.fire({
								// 	title: "登入成功",
								// 	icon: "success"
								// }).then(function(){
								// })
							} else if(data == 2){
								window.location.href="/MountainExploer.com/member/socailInfoEntry";
								// Swal.fire({
								// 	title: "初次登入成功，請填寫會員資料",
								// 	icon: "success"
								// }).then(function(){
								// })
							}
						},
						
						error:function(){
							// Swal.fire({
							// 	title: "發生錯誤，登入失敗",
							// 	icon: "error"
							// });
							window.location.reload();
						}
					});
					document.getElementById("status").innerHTML = "Thanks for logging in, " + response.name + "!";
				});
			} else {
				document.getElementById("status").innerHTML = "Please log into this app.";
			}
		}
	
		
		
		
		function checkLoginState(){
			FB.getLoginStatus(function(response){
				statusChangeCallback(response);
			});
		}
		
		
		window.fbAsyncInit = function(){
			FB.init({
				appId: "446870700049080",
				cookie: true,
				xfbml: true,
				version: "v9.0"
			});
			
			FB.getLoginStatus(function(response){
				statusChangeCallback(response);
			});
		};
		

		
		function Del_FB_App(){
			FB.getLoginStatus(function(response){
				console.log(response);
				if(response.status === "connected"){
					FB.api("/me/permissions", "DELETE", function(response){
						console.log("刪除");
						console.log(response);
						FB.getLoginStatus(function(res){ }, true);
					});
				} else {
					console.log("無法刪除");
				}
			});
		}

// $(".test").on("click", function(){
//     swal({
//         title: "測試成功",
//         icon: "success"
//     })

// })