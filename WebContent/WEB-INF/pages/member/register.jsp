<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>會員註冊</title>
<script src="https://code.jquery.com/jquery-3.5.1.js" ></script>
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
					<span id="Antsp" class="Antsp"></span><br/>
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
				<div>
					<label>姓名：</label>
					<input type="text" id="name" name="name" placeholder="請輸入姓名">
					<span id="nmsp"></span>
				</div>
				<div>
					<label>身分組選擇</label>
					<input type="radio" id="statusId" name="statusId" value="110">一般會員
					<input type="radio" id="statusId" name="statusId" value="130">登山嚮導
				</div>
				<div>
					<label>註冊時間</label>
				</div>
			</fieldset>
		</form>
	</div>
	
	
	

</body>
</html>