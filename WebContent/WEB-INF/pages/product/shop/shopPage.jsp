<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>購物頁面</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href='<c:url value="/backstage/css/backStage.css"/>'> 
<link rel="stylesheet" href='<c:url value="/mountain/back/backMountain.css"/>' >
<link rel="shortcut icon" type="image/png" href="<c:url value="/favicon.ico"/>"/>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" ></script>
<script type="text/javascript" charset="UTF-8" src='<c:url value="/product/shop/shop.js"/>'></script>
</head>
<body>

<!-- 	<div id="container1"> -->
	<div>
		<!-- 引入共同頁首 -->
		<jsp:include page="../../fragment/backTopNav.jsp"></jsp:include>
	</div>

	
	<div id="searchBar">
		<div class="searchSelect">
			<span>主類別 :&nbsp</span> <select name="firstclass" id="fcSelect">
			</select>
		</div>
		<div class="searchSelect">
			<input type="button" value="主類別查詢" class="fcSubmit">
		</div>
		<div class="searchSelect">
			<span>次類別 :&nbsp</span> <select name="secondclass" class="scSelect">
			</select>
		</div>
		<div class="searchSelect">
			<input type="button" value="次類別查詢" class="scSubmit">
		</div>
	</div>
	
	<div>
		<span>資料筆數 : </span> <span id="totalData"> </span>
	</div>

	<!-- 呈現畫面 -->
	<div id="mainContainer">
		<!-- 顯示頁面 -->

		<!-- 顯示資料 -->
		<table class="table">
			<!-- 表格欄位名稱 -->
			<thead>
				<tr>
<!-- 					<th scope="col"><span>產品編號</span></th> -->
					<th scope="col"><span>產品名稱</span></th>
					<th scope="col"><span>型號</span></th>
					<th scope="col"><span>圖片</span></th>
					<th scope="col"><span >敘述</span></th>
					<th scope="col"><span>價格</span></th>
					<th scope="col"><span>數量</span></th>
					<th scope="col"><span>加入購物車</span></th>
				</tr>
			</thead>
			<tbody>

				<!-- 資料內容 -->
				</tbody>
		</table>

		<!-- 頁數控制項 -->
		<div id="pageController">
			<div>
				<input id="firstPage" type="button" value="最前頁" name="1" disabled>
			</div>
			<div>
				<input id="previousPage" type="button" value="前一頁" name="" disabled>
			</div>
			<div>
				<i id="pageNo"></i>
			</div>
			<div>
				<input id="nextPage" type="button" value="下一頁" name="" disabled>
			</div>
			<div>
				<input id="lastPage" type="button" value="最尾頁" name="" disabled>
			</div>
		</div>

	</div>
</body>

</html>