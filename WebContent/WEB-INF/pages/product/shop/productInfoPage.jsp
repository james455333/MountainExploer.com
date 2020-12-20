<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>商品資訊</title>
<link rel="stylesheet" href="/MountainExploer.com/css/other.css">
<link rel="stylesheet" href="/MountainExploer.com/css/font.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>

<body>
	<div class="count1">
		<div class="count1_img">
			<img src="/MountainExploer.com/images/logo1.png">
			<hr>
			<h1 class="font">可能改成輪播</h1>
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
	<div class="div_ul">
		<div class="secNavbar">
			<nav>
				<ul class="second_nav">
					<!-- 更改內容從這邊開始 -->
				</ul>
			</nav>
		</div>
		<div class="div_li1">
			<a></a>
		</div>
		<div class="div_li3">
			<a></a>
		</div>
		<div class="div_li2">
			<!-- 每頁不同的內容從這裡開始 -->
			<div class="searchBar">
				<nav>
					<ul class="third_nav">
					</ul>
				</nav>


			</div>

			<div class="secDivContent">
				<div>
					<!--<a href='<c:url value="/shop/shoppingCartEntry"/>'>查看購物車</a>-->
					 <a href='<c:url value="/shop/shoppingCartEntry"/>'><button type="button" class="btn btn-outline-dark">查看購物車</button></a> 
				</div>
				<div>
					<!--<a href='<c:url value="/shoppingcart/memberOrders"/>'>查看訂單</a>-->
					<a href='<c:url value="/shoppingcart/memberOrders"/>'></a>
						<button type="button" class="btn btn-outline-dark">查看訂單</button>
				</div>
				<!--table-->
				<table class="order-table">
					<thead class="order-table-th">
						<tr>
							<!-- thead更改從這邊開始 -->
							<th colspan="2" scope="col">
								<form action="/MountainExploer.com/shoppingcart/addShoppingCart">
									<input type="hidden" name="itemBasicSeqno"
										value="${ProductBean.seqno}" readonly> <input
										type="hidden" name="itemBasicName" value="${ProductBean.name}"
										readonly> <input type="hidden" name="unitPrice"
										value="${ProductBean.price}" readonly> 選擇數量<select
										name="amount">
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
									</select> <input id="demo1" type="submit" value="加入購物車">
								</form>
							</th>

							<!-- thead更改到這邊結束 -->
						</tr>
					</thead>

					<tbody class="order-table-tb">
						<!-- tbody更改從這邊開始 -->
						<tr>
							<td colspan="2"><img style="width: 400px"
								src="<c:url value='/backstage/product/search/images?seqno=${ProductBean.seqno}' />">
							</td>
						</tr>
						<tr>
							<td width="25">商品編號:</td>
							<td>${ProductBean.seqno}</td>
						</tr>
						<tr>
							<td>商品名稱 :</td>
							<td>${ProductBean.name}</td>
						</tr>
						<tr>
							<td>主類別 :</td>
							<td>${ProductBean.firstClass}</td>
						</tr>
						<tr>
							<td>次類別 :</td>
							<td>${ProductBean.secondClass}</td>
						</tr>
						<tr>
							<td>型號 :</td>
							<td>${ProductBean.type}</td>
						</tr>
						<tr>
							<td>價格 :</td>
							<td>$${ProductBean.price}</td>
						</tr>
						<tr>
							<td>庫存 :</td>
							<td>${ProductBean.stock}</td>
						</tr>
						<tr>
							<td colspan="2">介紹 : ${ProductBean.description}</td>
						</tr>
						<tr>
							<td colspan="2"><input type="button" value="返回上一頁"
								id="backPreviousPage"></td>
						</tr>


						<!-- tbody更改到這邊結束 -->
					</tbody>

					<div id="container1">
						<!-- 引入共同頁首 -->

						<div></div>
				</table>

			</div>




			<!-- 每頁不同的內容到這邊結束 -->
		</div>
	</div>

	<footer id="footer">
		<a>全站導覽</a>
		<!-- <button id="demo1">確認demo1</button>
		<button id="demo2">錯誤demo2</button>
		<button id="demo3">確認提醒demo3</button>
		<button id="demo4">多重選項&提醒視窗demo4</button>
		<button id="demo5">Demo5</button>
		<button id="demo6">Demo6</button> -->



	</footer>
</body>
<script src="/MountainExploer.com/js/upLoadImg.js"></script>
<!-- 上傳頭像 -->
<script src="/MountainExploer.com/js/table.js"></script>
<script src="/MountainExploer.com/js/topBar.js"></script>
<script src="/MountainExploer.com/js/sweetalert.js"></script>
<!--sweet alert-->
<script src="/MountainExploer.com/js/includejsp.js"></script>
<script>
	$(function() {
		$("#backPreviousPage").on("click", function() {
			window.history.go(-1)
		})
	})
</script>

</html>