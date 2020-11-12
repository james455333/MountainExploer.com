<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>會員註冊</title>
</head>
<body>
	<h2>會員註冊</h2>
	<div>
		<form action="/member/memberRegister" method="POST">
			<fieldset>
				<legend>請填寫以下內容</legend>
				<div>
					<label>帳號：</label>
					<input type="text" id="account" name="account" placeholder="請輸入帳號"  autocomplete="off">
					<span id="Antsp"></span><br/>
				</div>
				<div>
					<label>密碼：</label>
					<input type="password" id="password" name="password" placeholder="請輸入密碼" >
					<span id="pwdsp"></span><br/>
				</div>
				<div>
					<label>密碼確認：</label>
					<input type="pwdCheck" id="pwdCheck" name="pwdCheck" placeholder="請再次輸入密碼">
					<span id="pwd2sp"></span>
				</div>
			</fieldset>
		</form>
	</div>
	
	
	

</body>
</html>