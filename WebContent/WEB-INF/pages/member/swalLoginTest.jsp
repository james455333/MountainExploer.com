<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Swal Login Test</title>
 	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/sweetalert2@9.17.2/dist/sweetalert2.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
</head>
<body>
	<h2>跳窗登入測試</h2>
	<div>
		<input type="button" class="swalLogin" name="swalLogin" id="swalLogin" value="登入"/>
		<input type="button" class="test" value="標籤測試">
	</div>
	
<!-- 	<div> -->
<!-- 		<input type="text" class="account"> -->
<!-- 		<input type="text" class="password"> -->
<!-- 		<input type="button" class="submit" value="送出"> -->
<!-- 	</div> -->
	
	<a href="<c:url value='/member/seqnoList?mbSeqno=1000080'/>">點我</a>
	
	<button type="button" class="loginTest">測試</button>
	
	<button type="button" class="fakeDate">批量測試</button>
	
	<script src="swal2Test.js"></script>
</body>
</html>