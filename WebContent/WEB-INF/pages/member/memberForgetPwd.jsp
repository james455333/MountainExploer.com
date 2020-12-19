<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>找回密碼</title>
</head>
<body>
	<div>
		<form action="<c:url value='/member/memberPwdFoundAction'/>" method="POST">
			<fieldset>
				<legend>請輸入註冊帳號與Email</legend>
				<div>
					<label>帳號：</label>
					<input type="text" name="account" class="account" placeholder="請輸入帳號"  autocomplete="off" required="required"/>
					<span class="antsp">${errors.msg}</span>
				</div>
				<div>
					<label>Email：</label>
					<input type="text" name="email" class="email" placeholder="請輸入Email" required="required"/>
					<span class="emsp">${errors.msg}</span>
				</div>
				<div>
					<input type="button" name="submit" class="submit" required="required" value="送出" />
					<input type="reset" name="reset" class="reset" value="清除"/>
				</div>
			</fieldset>
		</form>
	</div>

</body>
</html>