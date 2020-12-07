<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FB Login Test</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js"></script>
</head>
<body>
	<!-- The JS SDK Login Button -->
	
	<fb:login-button 
  		scope="public_profile,email"
  		onlogin="checkLoginState();">
	</fb:login-button>
	<div id="status"></div><!-- 登入狀態顯示 -->
	<div>
		撤銷登入：<input type="button" value="Disconnect App" onclick="Del_FB_App()" />
	</div>
	<div id="content"></div>
	
	<!-- Load the JS SDK asynchronously -->
	<script>
		
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
							window.location.href="/MountainExploer.com";
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
		
	</script>


</body>
</html>