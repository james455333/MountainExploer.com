<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>訂單資料填寫</title>
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
<script src="/MountainExploer.com/assets/js/main.js"></script>

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
			<li class="breadcrumb-item"><a href="/MountainExploer.com/shop/shoppingCartEntry">購物車</a></li>
			<li class="breadcrumb-item active">訂單資料填寫</li>
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
				<a
					class="btn btn-success btn-lg btn-block fas fa-shopping-cart m-3 p-3"
					href="<c:url value='/shop/shoppingPage' />"> 繼續購物</a>
			</div>
			<div>
				<a
					class="fas fa-trash-alt btn  btn-lg btn-block btn btn-warning m-3 p-3"
					href="<c:url value='/shoppingcart/abort' />"> 刪除訂單</a>
			</div>

		</div>
		<div class="col-9">
			<table style="font-size: 20px" class="table table-striped">
				<thead class="col">
					<tr>
						<th colspan="6" align="center">${Member.name}的訂單資訊</th>
					</tr>
					<tr>
						<!-- thead更改從這邊開始 -->
						<th scope="col" style="width: 40%;">商品名稱</th>
						<th scope="col" style="width: 17.5%;">圖片</th>
						<th scope="col" style="width: 20%;">價格</th>
						<th scope="col" style="width: 7.5%;">數量</th>
						<th scope="col" style="width: 20%;">小計</th>
						<!-- thead更改到這邊結束 -->
					</tr>
				</thead>



				<tbody class="">
					<!-- tbody更改從這邊開始 -->
					<c:forEach varStatus="vs" var="anEntry"
						items="${ShoppingCart.content}">
						<tr>
							<td align='center' valign="middle">
								<div class="d-flex w-100 align-items-center">
									<a style="font-size: 20px"
										href='<c:url value='/shop/productInfoEntry?no=${anEntry.value.itemBasicSeqno}' />'>
										${anEntry.value.itemBasicName} </a>
								</div>
							</td>
							<td><img style="width: 100px; height: 100px;"
								src="<c:url value='/backstage/product/search/images?seqno=${anEntry.value.itemBasicSeqno}' />">
							</td>
							<td>$${anEntry.value.unitPrice}</td>
							<td align="center">${anEntry.value.amount}</td>
							<td>${anEntry.value.unitPrice * anEntry.value.discount * anEntry.value.amount}元
							</td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="5">合計金額： <span>${subtotal}</span> 元
						</td>
					</tr>
					<FORM action="<c:url value='/shoppingcart/saveOrder' />"
						method="POST" class="regInfo-form">
						<tr>
							<td colspan="5"align="left">收貨人姓名： <input size="17.5" required type="text"
								id="name" name="receiver" pattern="^[\u4e00-\u9fa5_a-zA-Z]+$"
								placeholder="僅能輸入中文或英文">
							</td>
						</tr>
					<tr>
						<td colspan="5"align="left">收貨地址： <Input size="50" id="address"
							type="text" required name="shippingAddress" placeholder="請輸入收貨地址">
						</td>
					</tr>
					<tr>
						<td colspan="5" align="left">連絡電話： <input required size="15" type="text"
							id="cell" minlength="10" maxlength="10" pattern="^09[0-9]{8}"
							name="invoiceTitle" placeholder="範例 : 0912345678">
						</td>
					</tr>

					<TR>
						<TD colspan="5" align="center"><button id="submit" class="btn btn-lg btn-block btn-primary m-3 p-3" type="submit"
							><i class="fas fa-money-check-alt"> 送出訂單</i></button>
							</TD>
					</TR>

					</FORM>

				</tbody>
			</table>
					<div>
						<a id="fast" class="btn fas fa-magic"> 快速輸入</a>
					</div>
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
<script>
// $(function() {
// 	$("#submit").on("sucess", function() {
		
// 		Swal.fire({
// 			  title: 'Are you sure?',
// 			  text: "You won't be able to revert this!",
// 			  icon: 'warning',
// 			  showCancelButton: true,
// 			  confirmButtonColor: '#3085d6',
// 			  cancelButtonColor: '#d33',
// 			  confirmButtonText: 'Yes, delete it!'
// 			}).then((result) => {
// 			  if (result.isConfirmed) {
// 			    Swal.fire(
// 			      'Deleted!',
// 			      'Your file has been deleted.',
// 			      'success'
// 			    )
// 			  }
// 			})
// 	})
// })

	$(function() {
		$("#fast").on("click", function() {
			$('#name').val("資策會");
			$('#address').val("桃園市中壢區中大路");
			$('#cell').val("0912345678");
		})
	})
</script>
</html>