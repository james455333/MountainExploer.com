`<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>會員資料更新</title>
<script src="//code.jquery.com/jquery-3.5.1.js"></script>
</head>
<body>
	<div>
		<form action="<c:url action='/member/memberInfoUpdate'/>" method="POST">
			<fieldset>
				<legend>修改個人資料</legend>
				<div style="display:none">
					<label>會員編號</label>
					<span name="seqno">${LoginOK.seqno}</span><br/>
				</div>
				<div>
					<label>密碼：</label>
					<input type="password" id="pwd" name="pwd" value="${LoginOK.password}">
					<span class="pwdsp"></span><br/>
				</div>
				<div>
					<label>暱稱：</label>
					<input type="text" id="ncName" name="ncName" value="${LoginOK.memberInfo.neck_name}"><br/>
				</div>
				<div>
					<label>姓名：</label>
					<input type="text" id="name" name="name" value="${LoginOK.name}">
					<span class="nmsp"></span><br/>
				</div>
				<div>
					<label>性別：</label>
					<input type="radio" name="gender" id="gender" value="male">男
					<input type="radio" name="gender" id="gender" value="female">女
					<input type="radio" name="gender" id="gender" value="x">X
				</div>
				<div>
					<label>生日：</label>
					<input type="text" id="birDate" name="birDate" value="${LoginOK.memberInfo.birthday}">
					<span class="brsp"></span><br/>
				</div>
				<div>
					<label>手機號碼：</label>
					<input type="text" id="phone" name="phone" value="${LoginOK.memberInfo.phone}">
					<span class="phsp"></span><br/>
				</div>
				<div>
					<label>Email：</label>
					<input type="email" id="email" name="email" value="${LoginOK.email}">
					<span class="emsp"></span><br/>
				</div>
				<div>
					<label>登山經驗：</label>
					<input type="text" id="exp" name="exp" value="${LoginOK.memberInfo.climb_ex}"><br/>
				</div>
				<div>
					<label>個人簡介：</label>
					<input type="text" id="other" name="other" value="${LoginOK.memberInfo.other}"><br/>
				</div>
			</fieldset>
		</form>
	</div>
	<script src="memberInfoUpdate.js"></script>

</body>
</html>