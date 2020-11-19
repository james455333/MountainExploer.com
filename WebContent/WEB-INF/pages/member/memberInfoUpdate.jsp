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
		<form action="<c:url value='/member/memberInfoUpdate'/>" method="POST">
			<fieldset>
				<legend>修改個人資料</legend>
				<div style="display:none">
					<label>會員編號</label>
					<input type="hidden" name="seqno" value="${Member.seqno}">
				</div>
<!-- 				<div> -->
<!-- 					<label>密碼：</label> -->
<%-- 					<input type="password" id="pwd" class="pwd" name="password" value="${Member.password}" required="required"> --%>
<!-- 					<span class="pwdsp"></span><br/> -->
<!-- 				</div> -->
				<div>
					<label>密碼驗證：</label>
					<input type="password" class="chkPwd" placeholder="請再次輸入密碼" required="required">
					<span class="chksp"></span><br/>
				</div>
				<div>
					<label>暱稱：</label>
					<input type="text" id="ncName" class="ncName" name="memberInfo.neck_name" value="${Member.memberInfo.neck_name}" required="required"><br/>
				</div>
				<div>
					<label>姓名：</label>
					<input type="text" id="name" class="name" name="name" value="${Member.name}" required="required">
					<span class="nmsp"></span><br/>
				</div>
				<div>
					<label>性別：</label>
					<input type="radio" name="memberInfo.gender" id="gender1" value="male">男
					<input type="radio" name="memberInfo.gender" id="gender2" value="female">女
					<input type="radio" name="memberInfo.gender" id="gender3" value="x">X
				</div>
				<div>
					<label>生日：</label>
					<input type="text" id="birDate" class="birDate" name="memberInfo.birthday" class="${Member.memberInfo.birthday}">
					<span class="brsp"></span><br/>
				</div>
				<div>
					<label>手機號碼：</label>
					<input type="text" id="phone" class="phone" name="memberInfo.phone" value="${Member.memberInfo.phone}" required="required">
					<span class="phsp"></span><br/>
				</div>
				<div>
					<label>Email：</label>
					<input type="email" id="email" class="email" name="email" value="${Member.email}" required="required">
					<span class="emsp"></span><br/>
				</div>
				<div>
					<label>登山經驗：</label>
					<input type="text" id="exp" class="exp" name="memberInfo.climb_ex" value="${Member.memberInfo.climb_ex}" required="required"><br/>
				</div>
				<div>
					<label>個人簡介：</label>
					<input type="text" id="other" name="memberInfo.other" value="${Member.memberInfo.other}"><br/>
				</div>
			</fieldset>
		</form>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script src="memberInfoUpdate.js"></script>

</body>
</html>