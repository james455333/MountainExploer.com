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
		<form>
			<fieldset>
				<legend>${LoginOK.memberInfo.neck_name}的個人資料</legend>
				<div>
					<label>帳號：</label>
					<span>${LoginOK.account}</span><br/>
				</div>
				<div>
					<label>姓名：</label>
					<span>${LoginOK.name}</span><br/>
				</div>
				<div>
					<label>電話：</label>
					<span>${LoginOK.memberInfo.phone}</span><br/>
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
			</fieldset>
		</form>
	</div>

</body>
</html>