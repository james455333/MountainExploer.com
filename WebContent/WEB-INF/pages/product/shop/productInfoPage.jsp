<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品資訊</title>
<link rel="stylesheet" href="/MountainExploer.com/css/other.css">
<link rel="stylesheet" href="/MountainExploer.com/css/index.css">
<link rel="stylesheet" href="/MountainExploer.com/css/style.css">
<link rel="stylesheet" href="/MountainExploer.com/css/font.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/@sweetalert2/theme-bootstrap-4/bootstrap-4.css">

<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- sweetalert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="/MountainExploer.com/member/userTop.js"></script>
<style type="text/css">
.table td {
	vertical-align: middle;
}
</style>

</head>
<body>
	<div class="count1">
		<div class="count1_img">
			<img src="/MountainExploer.com/images/logo1.png">
			<hr>
			<h1 class="font"></h1>
			<!-- <a class="font">岳進者</a> -->
		</div>
	</div>
	<header>
		<nav class="navbar navbar-expand-lg navbar-light bg-light zline">
			<a class="navbar-brand" href="#"><img
				src="/MountainExploer.com/images/logo1.png" height="30%" width="30%"></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent"
				include-html="/MountainExploer.com/forinclude/includeForIndex.html"></div>
		</nav>
	</header>
	<nav class="">
		<ol class="breadcrumb p-4" style="font-size : 22.5px;" id="bc">
			<li class="breadcrumb-item"><a href="/MountainExploer.com">首頁</a></li>
			<li class="breadcrumb-item"><a href="/MountainExploer.com/shop/shoppingPage">岳進者精選</a></li>
			<li class="breadcrumb-item active">商品資訊</li>
		</ol>
	</nav>
	<div class="div_ul d-flex div shadow animate__animated  p-3 ">

		<div class="col-5 d-flex justify-content-center p-3">
			<div class="d-flex justify-content-center  m-1  ">
				<img style="width: 600px;border:groove"
					src="<c:url value='/backstage/product/search/images?seqno=${ProductBean.seqno}' />">
			</div>
		</div>

		<div style='font-size:20px' class="col-7 ">
			<!-- 每頁不同的內容從這裡開始 -->

			<div style='font-size:30px; height:150px 'class="m-3 d-flex justify-content-center border-bottom">${ProductBean.name}</div>
<%-- 			<div>${ProductBean.seqno}</div> --%>
			<div class="m-3 border-bottom">
			${ProductBean.firstClass}</div>
			<div class="m-3 border-bottom">
			${ProductBean.secondClass}
			</div>
			<div class="m-3 border-bottom">${ProductBean.type}</div>
			<div class="m-3 border-bottom">庫存量:     ${ProductBean.stock}</div>
			<div style='font-size:30px;height:70px' class="m-5 border-bottom">$${ProductBean.price}</div>
			<div style='font-size:25px;'>
				<form class="" action="/MountainExploer.com/shoppingcart/addShoppingCart">
					<input type="hidden" name="itemBasicSeqno" class=""
						value="${ProductBean.seqno}" readonly> <input
						type="hidden" name="itemBasicName" value="${ProductBean.name}"
						readonly> <input type="hidden" name="unitPrice"
						value="${ProductBean.price}" readonly> 選擇數量:  <select  class=""
						name="amount">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
					</select> <input type="submit" value="加入購物車"  class="btn btn-outline-succes" > 
				</form>
			</div>
		</div>

	</div >
	<br>
	<div style="width: 1000px" class="div_ul div shadow animate__animated">
		<div style="display:auto">${ProductBean.description}</div>
		<div>
			<input type="button" value="返回上一頁" id="backPreviousPage">
		</div>
	</div>



</body>
	<footer id="footer"
		include-html="/MountainExploer.com/forinclude/includeForFooter.html">
	</footer>
<script src="/MountainExploer.com/js/upLoadImg.js"></script>
<!-- 上傳頭像 -->
<script src="/MountainExploer.com/js/table.js"></script>
<script src="/MountainExploer.com/js/topBar.js"></script>
<!--sweet alert-->
<script src="/MountainExploer.com/js/includejsp.js"></script>
<script>
	$(function() {
		$("#backPreviousPage").on("click", function() {
			window.history.go(-1)
		})
	})
</script>