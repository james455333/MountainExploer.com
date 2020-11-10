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
			
			<label>單筆查詢：</label>
			<input type="text" id="account" name="account" value="請輸入會員帳號" />	
			<input type="submit" id="selectOne" name="selectOne" value="查詢" />
		</div>
		<div>
			<table>
			<c:forEach var="info" items="${mbList}">
				<tr>
					<th>會員編號</th>
					<th>會員帳號</th>
<!-- 						<th>會員密碼</th> -->
					<th>會員姓名</th>
					<th>會員地址</th>
					<th>電子郵件</th>
					<th>會員電話</th>
					<th>登山經驗</th>
					<th>會員身分組</th>
					<th>購物總額</th>
					<th>未付款餘額</th>
				</tr>
				<tr>
					<td>${info.memberId}</td>
					<td>${info.account}</td>
<%-- 						<td>${mbList.password}</td> --%>
					<td>${info.name}</td>
					<td>${info.address}</td>
					<td>${info.email}</td>
					<td>${info.tel}</td>
					<td>${info.exp}</td>
					<td>${info.groupId}</td>
					<td>${info.totalAmt}</td>
					<td>${info.unpaid_amount}</td>
					<td>${info.memberImage}</td>
					<td>				
						<input type="submit" id="update" name="updateA" value="修改"/>
					</td>
				</tr>
			</c:forEach>
			</table>
		</div>
	</form>
	
	
</body>
</html>