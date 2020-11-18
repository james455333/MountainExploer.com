<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>會員個人資料</title>
</head>
<body>
	<div>
		<form action="<c:url value='/member/memberInfoUpdateChange'/>" method="POST">
			<fieldset>
				<legend>${Member.memberInfo.neck_name}的個人資料</legend>
				<div style="display:none">
					<input type="text" name="seqno" value="${Member.seqno}">
				</div>
				<div>
					<label>帳號：</label>
					<span>${Member.account}</span><br/>
					<input type="hidden" name="account" value="${Member.account}">
				</div>
				<div>
					<label>密碼：</label>
					<input type="hidden" name="password" value="${Member.password}">
				</div>
				<div>
					<label>暱稱</label>
					<span>${Member.memberInfo.neck_name}</span><br/>
					<input type="hidden" name="memberInfo.neck_name" value="${Member.memberInfo.neck_name}">
				</div>
				<div>
					<label>姓名：</label>
					<span>${Member.name}</span><br/>
					<input type="hidden" name="name" value="${Member.name}">
				</div>
				<div>
					<label>性別：</label>
					<span>${Member.memberInfo.gender}</span><br/>
					<input type="hidden" name="memberInfo.gender" value="${Member.memberInfo.gender}">
				</div>
				<div>
					<label>生日：</label>
					<span>${Member.memberInfo.birthday}</span><br/>
					<input type="hidden" name="memberInfo.birthday" value="${Member.memberInfo.birthday}">
				</div>
				<div>
					<label>手機號碼：</label>
					<span>${Member.memberInfo.phone}</span><br/>
					<input type="hidden" name="memberInfo.phone" value="${Member.memberInfo.phone}">
				</div>
				<div>
					<label>登山經驗：</label>
					<span>${Member.memberInfo.climb_ex}</span><br/>
					<input type="hidden" name="memberInfo.climb_ex" value="${Member.memberInfo.climb_ex}">
				</div>
				<div>
					<label>身分組：</label>
					<span>
						<c:if test="${Member.memberStatus.seqno eq 100}">
<!-- 							<input type="hidden" name="memberStatus.seqno" value="Member.memberStatus.seqno"> -->
							一般會員
						</c:if>
						<c:if test="${Member.memberStatus.seqno eq 120}">
<!-- 							<input type="hidden" name="memberStatus.seqno" value="Member.memberStatus.seqno"> -->
							登山嚮導						
						</c:if>
					</span><br/>
				</div>
				<div>
					<label>個人簡介：</label>
					<span>${Member.memberInfo.other}</span><br/>
					<input type="hidden" name="memberInfo.other" value="${Member.memberInfo.other}">
				</div>
				<div>
					<input type="submit" id="submit" name="submit" value="修改會員資料">
				</div>
			</fieldset>
		</form>
	</div>
	

</body>
</html>