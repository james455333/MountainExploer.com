<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width"/>
	<title>Google Login Test</title>
</head>
<body>
	<button type="button" id="btnSignIn">Google登入</button>
	<button type="button" id="btnDisconnect">斷連Google App</button>
	<hr/>
	
	<div id="content"></div>
	
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script type="text/javascript">
		let client_id = "578428677346-4jvc65cma0hl66a9vvv9ka9iijjh2l6a.apps.googleusercontent.com";
		//let api_key = "";
		//Javascript SDK無需API金鑰
		let discovery_docs = ["https://www.googleapis.com/discovery/v1/apis/people/v1/rest"];
	</script>
	<script async defer src="https://apis.google.com/js/api.js"
			onload="this.onload=function(){};GoogleClientInit()"
			onreadystatechange="if(this.readyState === 'complete') this.onload()">
	</script>
	
</body>
</html>