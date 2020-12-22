<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>訂單明細</title>
<link rel="stylesheet" href="/MountainExploer.com/css/other.css">
<link rel="stylesheet" href="/MountainExploer.com/css/font.css">
<link rel="stylesheet" href="/MountainExploer.com/css/style.css">
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
	<div class="container-fluid" style="padding: 0px;" include-html="/MountainExploer.com/forinclude/carousel.html">
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
			<li class="breadcrumb-item"><a href="/MountainExploer.com/shoppingcart/memberOrders">訂單查詢</a></li>
			<li class="breadcrumb-item active">訂單明細</li>
		</ol>
	</nav>
	<div class="div_ul d-flex">


		<!--table-->
		<table style="font-size: 20px" class="table table-striped">
			<thead class="col">

				<tr>
					<th colspan="6" style="font-size: 22px" align="center">訂單編號: ${orderId}</th>
				</tr>
				<tr>
					<!-- thead更改從這邊開始 -->
					<th scope="col" style="width: 20%;">商品編號</th>
					<th scope="col" style="width: 20%;">圖片</th>
					<th scope="col" style="width: 20%;">單價</th>
					<th scope="col" style="width: 10%;">數量</th>
					<th scope="col" style="width: 10%;">折扣</th>
					<th scope="col" style="width: 20%;">小計</th>
					<!-- thead更改到這邊結束 -->
				</tr>
			</thead>
			<tbody class="">

				<c:forEach var="aBean" varStatus="stat" items="${OrderInfo}">
					<tr>
						<td><a
							href='<c:url value='/shop/productInfoEntry?no=${aBean.itemBasicSeqno}' />'>
								${aBean.itemBasicSeqno}  </a></td>
						<td><img style="width: 125px; height: 125px;"
							src="<c:url value='/backstage/product/search/images?seqno=${aBean.itemBasicSeqno}' />">
						</td>
						<td>$${aBean.unitPrice}</td>
						<td>${aBean.amount}</td>
						<td>${aBean.discount}</td>
						<td>${aBean.unitPrice*aBean.discount*aBean.amount}元</td>
					</tr>
						<c:set var="subtotal"
							value="${ subtotal + aBean.unitPrice * aBean.discount * aBean.amount }" />
				</c:forEach>
				<tr>
					<TD colspan="6" style="font-size: 22px">訂單總額:    ${subtotal}   元</TD>
				</tr>
				<tr>
					<TD colspan="6"><button id="backPreviousPage"
							class="btn btn-success btn-lg btn-block far fa-list-alt m-3 p-3">
							返回會員訂單</button></TD>
				</tr>





			</tbody>
		</table>
	</div>


	<!-- 每頁不同的內容到這邊結束 -->

		<footer id="footer"
		include-html="/MountainExploer.com/forinclude/includeForFooter.html">
	</footer>
</body>
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