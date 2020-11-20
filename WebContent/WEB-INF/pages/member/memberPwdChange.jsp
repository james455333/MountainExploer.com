<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>更新密碼</title>
</head>
<body>
	<div>
		<form action="<c:url value='/member/memberPwdChangeAction'/>" method="POST">
		
			<fieldset>
				<legend>修改密碼</legend>
				<div style="display:none">
					<input type="text" class="seqno" name="seqno" value="${Member.seqno}">				
				</div>
				<div>
					<label>請輸入舊密碼：</label>
					<input type="password" class="pwd" name="password" required="required">
					<span class="pwdsp"></span>
				</div>
				<div>
					<label>請輸入新密碼：</label>
					<input type="password" class="updatePwd" name="updatePwd" required="required">
					<span class="upsp"></span>
				</div>
				<div>
					<label>請再次輸入新密碼：</label>
					<input type="password" class="chkPwd" name="chkPwd" required="required">
					<span class="chksp"></span>
				</div>
				<div>
					<input type="submit" class="submit" name="submit" value="送出">
				</div>
			</fieldset>
		</form>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script type="text/javascript" src="/MountainExploer.com/member/memberPwdChange.js"></script>
</body>
</html>