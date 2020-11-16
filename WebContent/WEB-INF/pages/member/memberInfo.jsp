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
		<form action="<c:url value="/member/memberInfoEntry"/>" method="POST">
			<fieldset>
				<legend>${LoginOK.memberInfo.neck_name}的個人資料</legend>
				<div>
					<label>帳號：</label>
					<span>${LoginOK.account}</span><br/>
				</div>
				<div>
					<label>暱稱</label>
					<span>${LoginOK.memberInfo.neck_name}</span><br/>
				</div>
				<div>
					<label>姓名：</label>
					<span>${LoginOK.name}</span><br/>
				</div>
				<div>
					<label>性別：</label>
					<span>${LoginOK.memberInfo.gender}</span><br/>
				</div>
				<div>
					<label>生日：</label>
					<span>${LoginOK.memberInfo.birthday}</span><br/>
				</div>
				<div>
					<label>電話：</label>
					<span>${LoginOK.memberInfo.phone}</span><br/>
				</div>
				<div>
					<label>登山經驗：</label>
					<span>${LoginOK.memberInfo.climb_ex}</span><br/>
				</div>
				<div>
					<label>身分組：</label>
					<span>
						<c:if test="${LoginOK.memberStatus.seqno eq 100}">
							一般會員
						</c:if>
						<c:if test="${LoginOK.memberStatus.seqno eq 120}">
							登山嚮導						
						</c:if>
					</span><br/>
				</div>
				<div>
					<label>個人簡介：</label>
					<span>${LoginOK.memberInfo.other}</span><br/>
				</div>
				<div>
					<input type="submit" id="submit" name="submit" value="修改會員資料">
				</div>
			</fieldset>
		</form>
	</div>

</body>
</html>