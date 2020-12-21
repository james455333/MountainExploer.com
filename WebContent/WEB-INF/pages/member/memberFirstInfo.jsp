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
				<legend>${Member.name}的認證資料</legend>
				<div style="display:none">
					<label>會員編號：</label>
					<span>${Member.seqno}</span><br/>
					<input type="text" name="seqno" value="${Member.seqno}">
					<label>身分組ID：</label>
					<span>${Member.memberStatus.seqno}</span>
					<input type="text" name="memberStatus.seqno" value="${Member.memberStatus.seqno}">
				</div>
<!-- 				<div> -->
<!-- 					<label>暱稱：</label> -->
<!-- 					<input type="text" id="ncName" class="ncName" name="memberInfo.neck_name" placeholder="請輸入暱稱" required="required"> -->
<!-- 					<span class="ncsp"></span> -->
<!-- 				</div> -->
				<div>
					<label>性別：</label>
					<input type="radio" name="memberInfo.gender" id="gender1" value="male">男
					<input type="radio" name="memberInfo.gender" id="gender2" value="female">女
					<input type="radio" name="memberInfo.gender" id="gender3" value="x">X
					<input type="radio" name="memberInfo.gender" id="gender4" value="mask">不透漏
				</div>
				<div>
					<label>生日：</label>
					<input type="text" id="birDate" class="birDate" name="memberInfo.birthday" placeholder="YYYY-MM-DD">
					<span class="brsp"></span><br/>
				</div>
				<div>
					<label>手機號碼：</label>
					<input type="text" id="phone" class="phone" name="memberInfo.phone" placeholder="09xxxxxxxx" required="required">
					<span class="phsp"></span><br/>
				</div>
				<div>
					<label>登山經驗</label>
					<input type="text" id="exp" class="exp" name="memberInfo.climb_ex" placeholder="請輸入登山經驗" required="required">
					<span class="expsp"></span>
				</div>
				<div>
					<input type="submit" id="submit" name="submit" value="送出">
					<input type="reset" id="reset" name="reset" value="清除">
				</div>
			</fieldset>
		</form>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script src="memberFirstInfo.js"></script>

</body>
</html>