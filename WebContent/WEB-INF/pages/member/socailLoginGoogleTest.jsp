<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id" content="578428677346-4jvc65cma0hl66a9vvv9ka9iijjh2l6a.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js" async defer></script>
<title>Google socailLogin Test</title>
</head>
<body>
<%-- 	<form action="<c:url value='/member/googleVerify'/>" method="POST"> --%>
	<div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div>
	<a href="" onclick="signOut();">Sign Out</a>
<!-- 	</form> -->
	
	
	<script>
		function onSignIn(googleUser){
			var profile = googleUser.getBasicProfile();
			var id_token = googleUser.getAuthResponse().id_token;
			console.log("ID Token:" + id_token);
			
			var xhr = new XMLHttpRequest();
			xhr.open("POST", "http://gntina.iok.la/member/googleVerify");
			xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			xhr.onload = function(){
				console.log("Signed in as:" + xhr.responseText);
			};
			xhr.send("idtokenstr=" + id_token);
		};
	
		function signOut(){
			var auth2 = gapi.auth2.getAuthInstance();
			auth2.singOut().then(function(){
				console.log("User signed out.")
			});
		}
	
	
	</script>

</body>
</html>