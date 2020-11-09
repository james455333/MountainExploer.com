<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test Response</title>
</head>
<body>

<form action="<c:url value='/mountainBackStage/responseTest'/>">
	<input type="text" name="actSeqno" value="40010" readonly>
	<input type="text" name="memberSeqno" value="1000000" readonly>
	<input type="text" name="memberName" value="郭靖" readonly>
	<input type="text" name="response">
	<input type="submit" value="送出"> 
</form>

</body>
</html>