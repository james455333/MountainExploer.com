<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>會員認證資料</title>
</head>
<body>
	<div>
		<form action="<c:url value="/member/memberFirstInfoInsert" />" method="POST">
			<fieldset>
				<legend>${LoginOK.name}的認證資料</legend>
				<div style="display:none">
					<label>帳號：</label>
					<span name="account">${LoginOK.account}</span><br/>
				</div>
				<div>
					<label>暱稱：</label>
					<input type="text" id="ncName" name="ncName" placeholder="請輸入暱稱">
				</div>
				<div>
					<label>性別：</label>
					<input type="radio" name="gender" id="gender1" value="male">男
					<input type="radio" name="gender" id="gender2" value="female">女
					<input type="radio" name="gender" id="gender3" value="x">X
				</div>
				<div>
					<label>生日：</label>
					<input type="text" id="birDate" name="birDate" placeholder="YYYY-MM-DD">
				</div>
				<div>
					<label>登山經驗</label>
					<input type="text" id="exp" name="exp" placeholder="請輸入登山經驗">
				</div>
				<div>
					<input type="submit" id="submit" name="submit" value="送出">
					<input type="reset" id="reset" name="reset" value="清除">
				</div>
			</fieldset>
		</form>
	</div>

</body>
</html>