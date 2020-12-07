<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id" content="578428677346-4jvc65cma0hl66a9vvv9ka9iijjh2l6a.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js" async defer></script>
<title>Google Login test</title>
</head>
<body>
	<div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div>
	<a href="/MountainExploer.com" onclick="signOut();">Sign Out</a>
	
	<script>
		function signOut(){
			var auth2 = gapi.auth2.getAuthInstance();
			auth2.signOut().then(function(){
				console.log("User signed out");
			});
		}
		
		function onSignIn(googleUser){
			var profile = googleUser.getBasicProfile();
			var id_token = googleUser.getAuthResponse().id_token;
			console.log("ID Token:" + id_token);
			var xhr = new XMLHttpRequest();
			xhr.open("POST", "http://localhost:8080/MountainExploer.com/member/googleVerify");
			xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			xhr.onload = function(){
				console.log("Signed in as:" + xhr.responseText);
			};
			xhr.send("idtokenstr = " + id_token);
		};
		
		
	</script>
</body>
</html>