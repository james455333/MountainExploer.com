<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>會員訂單查詢</title>
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
<!-- <script src="/MountainExploer.com/assets/js/main.js"></script> -->
<style type="text/css">
.table td {
	vertical-align: middle;
}
</style>

</head>
<body>
	<div class="container-fluid" style="padding: 0px;" include-html="/MountainExploer.com/forinclude/carousel.html"></div>
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
			<li class="breadcrumb-item active">訂單查詢</li>
		</ol>
	</nav>
	<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
	<div class="div_ul d-flex">


		<!--table-->
			<table style="font-size: 20px" class="table table-striped">
				<thead class="col">
					<tr>
						<th colspan="7"style="font-size: 25px" align="center">${Member.name}的訂購紀錄</th>
					</tr>
					<tr>
						<!-- thead更改從這邊開始 -->
						<th scope="col" style="width: 10%;">訂單編號</th>
						<th scope="col" style="width: 10%;">金額</th>
						<th scope="col" style="width: 10%;">收貨人</th>
						<th scope="col" style="width: 20%;">收貨地址</th>
						<th scope="col" style="width: 10%;">連絡電話</th>
						<th scope="col" style="width: 20%;">訂貨日期</th>
						<th scope="col" style="width: 20%;">出貨日期</th>
						<!-- thead更改到這邊結束 -->
					</tr>
				</thead>
				<tbody class="">

					<c:forEach var="anOrderBean" varStatus="stat"
						items="${MemberOrders}">
						<TR>
							<TD><a
								href='<c:url value='/shoppingcart/orderInfo?orderId=${anOrderBean.seqno}' />'>
									${anOrderBean.seqno} </a></TD>
							<TD>${anOrderBean.totalAmount}元</TD>
							<TD>${anOrderBean.receiver}</TD>
							<TD>${anOrderBean.shippingAddress}</TD>
							<TD>${anOrderBean.invoiceTitle}</TD>
							<TD>${anOrderBean.orderDate}</TD>
							<TD>${anOrderBean.shippingDate}</TD>
							<%-- 			<TD >${anOrderBean.cancelTag}</TD> --%>

						</TR>
					</c:forEach>
					<tr>
						<TD colspan="7" align="center"><a
							class="btn btn-success btn-lg btn-block fas fa-shopping-cart m-3 p-3"
							href="<c:url value='/shop/shoppingPage' />"> 繼續購物</a>
							</TD>
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
