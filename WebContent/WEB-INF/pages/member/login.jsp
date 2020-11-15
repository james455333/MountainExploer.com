<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member Login</title>
</head>
<body>
	<h2>會員登入</h2>
	<div>
		<form action="<c:url value='/member/memberLogin'/>" method="POST">
			<div>
				<label>帳號：</label>
				<input type="text" id="account" name="account">
				<span>${errors.account}${errors.msg}</span><br/>
				<label>密碼：</label>
				<input type="password" id="password" name="password">
				<span>${errors.password}${errors.msg}</span><br/>
			</div>
			<div>
				<input type="submit" id="submit" name="submit" value="登入">
			</div>
		</form>
	</div>

</body>
</html>