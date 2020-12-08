$(".submit").on("click", function(){
    if(errors != null){
       swal({
           title: "登入失敗",
           icon: "error"
       });
    }else{
        swal({
            title: "登入成功",
            icon: "success"
        });
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
                window.location.href="/MountainExploer.com/member/memberInfoEntry";
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
                window.location.href="/MountainExploer.com/backStageEntry";
            }else{
                window.location.reload();
            }
        }
    })
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
								swal({
									title: "登入成功",
									icon: "success"
								});
								window.location.href="/MountainExploer.com";								
							} else if(data == 2){
								swal({
									title: "初次登入成功，請填寫會員資料",
									icion: "sucess"
								});
								window.location.href="";
							}
						},
						
						error:function(){
							swal({
								title: "發生錯誤，登入失敗",
								icon: "success"
							});
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