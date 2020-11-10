<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>testAjax</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href='<c:url value="/backstage/css/backStage.css"/>'> 
<link rel="stylesheet" href='<c:url value="/mountain/back/backMountain.css"/>' >
<link rel="shortcut icon" type="image/png" href="<c:url value="/favicon.ico"/>"/>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" ></script>
<script src="testAjax.js" ></script>

</head>
<body>
	<div><button id="testAjax">測試顯示</button></div>
	
	<table class="table">
		<!-- 表格欄位名稱 -->
		<thead class="thead-light">
			<tr class="a_titleName">
				<th scope="col"><span class="tr_title">路線編號</span></th>
				<th scope="col"><span class="tr_title">路線名稱</span></th>
				<th scope="col"><span class="tr_title">國家公園名稱</span></th>
				<th scope="col"><span class="tr_title">路線預覽圖</span></th>
				<th scope="col"><span class="tr_title">路線介紹</span></th>
				<th scope="col"><span class="tr_title">建議路線</span></th>
				<th scope="col"><span class="tr_title">交通資訊</span></th>
				<th scope="col"><span class="tr_title">維護選項</span></th>
			</tr>
		</thead>
		<tbody>
				
				<!-- 資料內容 -->
		</tbody>
	</table>
	<script>
	
	
	</script>
</body>
</html>