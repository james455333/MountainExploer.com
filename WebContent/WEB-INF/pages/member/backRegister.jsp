<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Back Register</title>
</head>
<body>
	<h2>後台資料維護系統註冊</h2>
	<div>
	<form action="<c:url value='/member/memberBackRegister'/>" method="POST">	
		<div>
			<input type="submit" id="submit" name="submit" value="一鍵註冊"/>
		</div>
	</form>
	</div>

</body>
</html>