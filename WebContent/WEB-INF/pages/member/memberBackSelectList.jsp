<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member Back List</title>
</head>
<body>
	<h2>會員資料檢索</h2>
	<form action="<c:url value='/memberBack/memberBackSelect'/>" method="post">
		<div>
			<label>總覽查詢：</label>
			<input type="submit" id="selectAll" name="selectAll" value="會員資料查詢" />
		</div>
	</form>
	<form action="<c:url value='/memberBack/memberBackOne'/>" method="post">
		<div>
			<label>單筆查詢：</label>
			<input type="text" id="account" name="account" placeholder="請輸入會員帳號" />	
			<input type="submit" id="selectOne" name="selectOne" value="查詢" />
		</div>
	</form>
	<form action="<c:url value='/memberBack/memberUpdateA'/>" method="post">
		<div>
			<label>修改會員資料</label>
			<input type="text" id="account2" name="account2" placeholder="請輸入會員帳號" />
			<input type="submit" id="updateA" name="updateA" value="修改"/>
			<input type="reset" id="reset" name="reset" value="清除"/>
		</div>
	</form>
		<div>
			<table>
			<c:forEach var="info" items="${mbList}">
				<tr>
					<th>會員編號</th>
					<th>會員帳號</th>
<!-- 						<th>會員密碼</th> -->
					<th>會員姓名</th>
					<th>會員性別</th>
					<th>會員暱稱</th>
					<th>會員生日</th>
					<th>電子郵件</th>
					<th>登山經驗</th>
					<th>會員身分組</th>
					<th>註冊時間</th>
				</tr>
				<tr>
					<td>${info.seqno}</td>
					<td>${info.account}</td>
<%-- 						<td>${mbList.password}</td> --%>
					<td>${info.name}</td>
					<td>${info.memberInfo.gender}</td>
					<td>${info.memberInfo.neck_name}</td>
					<td>${info.memberInfo.birthday}</td>
					<td>${info.email}</td>
					<td>${info.memberInfo.climb_ex}</td>
					<td>${info.memberStatus.name}</td>
					<td>${info.reg_Date}</td>
				</tr>
			</c:forEach>
			</table>
		</div>
	
	
	
</body>
</html>