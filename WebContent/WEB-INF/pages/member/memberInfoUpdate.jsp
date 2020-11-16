<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>會員資料更新</title>
</head>
<body>
	<div>
		<form action="" method>
			<fieldset>
				<legend>修改個人資料</legend>
				<div style="display:none">
					<label>會員編號</label>
					<span name="seqno">${LoginOK.seqno}</span><br/>
				</div>
				<div>
					<label>暱稱：</label>
					<input type="text" id="ncName" name="ncName" value="${LoginOK.memberInfo.neck_name}"><br/>
				</div>
				<div>
					<label>姓名：</label>
					<input type="text" id="name" name="name" value="${LoginOK.name}"><br/>
				</div>
				<div>
					<label>性別：</label>
					<input type="radio" name="gender" id="gender" value="male">男
					<input type="radio" name="gender" id="gender" value="female">女
					<input type="radio" name="gender" id="gender" value="x">X
				</div>
			</fieldset>
		</form>
	</div>

</body>
</html>