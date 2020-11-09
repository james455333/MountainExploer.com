<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Back Login</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" >
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> 
  <link rel="stylesheet" href='<c:url value="/backstage/css/backStage.css"/>'> 
</head>
<body>
	<h2>後台資料維護系統登入</h2>
	
	<div id="container1">
<%-- 	<jsp:include page=""></jsp:include> --%>
	<form action="<c:url value='/member/memberBackLogin'/>" method="POST">	
		<label>帳號：</label>
		<input type="text" id="account" name="account" />
		<span>${errors.account}${errors.msg}</span><br/>
		<label>密碼：</label>	
		<input type="text" id="password" name="password" />
		<span>${errors.password}${errors.msg}</span><br/>
		<div>
			<input type="submit" id="submit" name="submit" value="Login"/>
		</div>
	</form>
	</div>
</body>
</html>