<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Member's Info</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" >
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> 
  <link rel="stylesheet" href='<c:url value="/backstage/css/backStage.css"/>'> 
</head>
<body>
	<c:if test="${ !empty result }">
		<script type="text/javascript" charset="UTF-8">
			alert("${result}")
		</script>
	</c:if>
	<c:if test="${ !empty error}">
		<script type="text/javascript" charset="UTF-8">
			alert("${error}")
		</script>
	</c:if>
	
	<jsp:include page="../fragment/backTopNav.jsp"></jsp:include>
	
	<div id="container1">
		<h2>更新會員資料</h2>
	<form action="<c:url value='/memberBack/memberUpdate'/>" method="post">
		<div id="container1">
			<table>
			<c:forEach var="info" items="${mbList}">
				<tr>
					<th>會員編號</th>
					<th>會員帳號</th>
<!-- 						<th>會員密碼</th> -->
					<th>會員姓名</th>
					<th>會員性別</th>
					<th>會員暱稱</th>
					<th>電子郵件</th>
					<th>會員身分組</th>
				</tr>
				<tr>
					<td>
						<input type="text" id="seqno" name="seqno" readonly value="${info.seqno}"/>
					</td>
					<td>
						<input type="text" name="account" value="${info.account}"/>
					</td>
<%-- 						<td>${mbList.password}</td> --%>
					<td>
						<input type="text" name="name" value="${info.name}"/>
					</td>
					<td>
						<input type="text" name="gender" value="${info.memberInfo.gender}"/>
					</td>
					<td>
						<input type="text" name="neckName" value="${info.memberInfo.neck_name}"/>
					</td>
					<td>
						<input type="text" name="email" value="${info.email}"/>
					</td>
					<td>
						<input type="text" name="statusSeqno" value="${info.memberStatus.seqno}"/>
					</td>
					<td>
						<input type="submit" id="update" name="updateB" value="儲存"/>
						<input type="reset" id="reset" name="reset" value="清除"/>		
					</td>
				</tr>
			</c:forEach>
			</table>
		</div>
	</form>
	<form action="<c:url value='/memberBack/memberGoBack'/>" method="post">
		<div>
			<input type="submit" id="goBack" name="goBack" value="返回查詢"/>
		</div>
	</form>
	
	</div>
	
	
	
	

</body>
</html>