<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>購物車頁面</title>
<link rel="stylesheet" href="/MountainExploer.com/css/other.css">
<link rel="stylesheet" href="/MountainExploer.com/css/index.css">
<link rel="stylesheet" href="/MountainExploer.com/css/style.css">
<link rel="stylesheet" href="/MountainExploer.com/css/font.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<!-- Font Awesome -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="/MountainExploer.com/member/userTop.js"></script>
<script src="/MountainExploer.com/assets/js/main.js"></script>
<style type="text/css">

.table td{
	vertical-align :middle;
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
			<li class="breadcrumb-item active">購物車</li>
		</ol>
	</nav>
	<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
	<div class="div_ul d-flex">
		<c:choose>
			<c:when test="${ShoppingCart.subtotal > 0}">
				<c:set var="subtotalMessage" value="金額小計:${ShoppingCart.subtotal} 元" />
				<c:set var="subtotal" value="${ShoppingCart.subtotal}" />
			</c:when>
			<c:otherwise>
				<c:set var="subtotalMessage" value="金額小計:  0 元" />
				<c:set var="subtotal" value="0" />
			</c:otherwise>
		</c:choose>
	
		<!--table-->
		<div class="col-3 ">
			<div>
				<FORM action="<c:url value='/shop/orderConfirmEntry' />"	>
					<button class="btn btn-lg btn-block btn-primary m-3 p-3"  type="submit">
						 <i class="fas fa-money-check-alt">  確認訂單</i>
					</button>
				</FORM>
			</div>
			<div>
				<a class="btn btn-success btn-lg btn-block fas fa-shopping-cart m-3 p-3" href="<c:url value='/shop/shoppingPage' />">  繼續購物</a>
			</div>
			<div>
				<a  class="fas fa-trash-alt btn  btn-lg btn-block btn btn-warning m-3 p-3" href="<c:url value='/shoppingcart/abort' />">  清空購物車</a>
			</div>
		</div>
		<div class="col-9">
			<table style="font-size:20px" class="table table-striped">
				<thead class="col">
					<tr>
						<th colspan="7" align="center">${Member.name}的購物車</th>
					</tr>
					<tr>
						<!-- thead更改從這邊開始 -->
						<th scope="col" style="width:35%;">商品名稱</th>
						<th scope="col" style="width:17.5%;">圖片</th>
						<th scope="col" style="width:15%;">價格</th>
						<th scope="col" style="width:7.5%;">數量</th>
						<th scope="col" style="width:10%;">小計</th>
						<th scope="col" style="width:20%;">修改</th>
						<!-- thead更改到這邊結束 -->
					</tr>
				</thead>
		
				<tbody  class="">
					<!-- tbody更改從這邊開始 -->
					<c:forEach varStatus="vs" var="anEntry"
						items="${ShoppingCart.content}">
						<tr>
							<td  align='center' valign="middle">
								<div class="d-flex w-100 align-items-center">
									<a style="font-size:20px" href='<c:url value='/shop/productInfoEntry?no=${anEntry.value.itemBasicSeqno}' />'>
										${anEntry.value.itemBasicName} 
									</a>
								</div>
							</td>
							<td><img style="width: 100px; height: 100px;"
								src="<c:url value='/backstage/product/search/images?seqno=${anEntry.value.itemBasicSeqno}' />">
							</td>
							<td>$${anEntry.value.unitPrice}</td>
							<td align="center">${anEntry.value.amount}</td>
							<td>${anEntry.value.unitPrice * anEntry.value.discount * anEntry.value.amount}元
								</td>
							<td class="m-3  p-3">
								<form action="<c:url value='/shoppingcart/modifyCartBean' />">
									<input type="hidden" name="itemBasicSeqno"
										value='${anEntry.value.itemBasicSeqno}' readonly> <select class="custom-select"
										name="newAmount">
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
										<option value="7">7</option>
										<option value="8">8</option>
										<option value="9">9</option>
										<option value="10">10</option>
									</select> <input class="input-group-prepend" type="submit" value="修改數量">
								</form>
								<form action="<c:url value='/shoppingcart/deleteCartBean' />">
									<input type="text" name="itemBasicSeqno"
										value="${anEntry.value.itemBasicSeqno}" style="display: none;">
									<input class="input-group-prepend" type="submit" value="刪除品項">
								</form>
							</td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="7" align="center">合計品項： ${ShoppingCart.itemNumber} 項</td>
					</tr>
					<tr>
						<td colspan="7" align="center">合計金額： ${subtotal} 元</td>
					</tr>
				</tbody>
			</table>
		</div>
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
</html>