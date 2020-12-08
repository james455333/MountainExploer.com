<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>後台資料維護系統/訂單狀態</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href='<c:url value="/backstage/css/backStage.css"/>'>
<link rel="stylesheet"
	href='<c:url value="/mountain/back/backMountain.css"/>'>
<link rel="shortcut icon" type="image/png"
	href="<c:url value="/favicon.ico"/>" />
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>
<script type="text/javascript" charset="UTF-8"
	src='<c:url value="/product/back/backProduct.js"/>'></script>
<script>
	$(function() {
		$("#backPreviousPage").on("click", function() {
			window.history.go(-1)
		})
	})
</script>
</head>
<body>

	<!-- 	<div id="container1"> -->
	<div>
		<!-- 引入共同頁首 -->
		<jsp:include page="../../fragment/backTopNav.jsp"></jsp:include>
	</div>


	<!-- 呈現畫面 -->
	<div id="mainContainer">
		<!-- 顯示頁面 -->

		<!-- 顯示資料 -->
		<table border="1">
			<thead >
				<tr>
					<th colspan="6" align="center">訂單編號: ${orderId}</th>
				</tr>
				<tr>
					<!-- thead更改從這邊開始 -->
					<th align="center" width="120">商品編號</th>
					<!-- 				<th scope="col">商品名稱</th> -->
					<th align="center" width="120">圖片</th>
					<th align="center" width="120">單價</th>
					<th align="center" width="120">數量</th>
					<th align="center" width="120">折扣</th>
					<th align="center" width="120">小計</th>
					<!-- thead更改到這邊結束 -->
				</tr>
			</thead>
			<tbody class="order-table-tb">
				<!-- tbody更改從這邊開始 -->
				<c:forEach var="aBean" varStatus="stat" items="${OrderInfo}">
					<tr>
						<td><a
							href='<c:url value='/shop/productInfoEntry?no=${aBean.itemBasicSeqno}' />'>
								${aBean.itemBasicSeqno} </a></td>
						<td><img style="width: 100px; height: 100px;"
							src="<c:url value='/backstage/product/search/images?seqno=${aBean.itemBasicSeqno}' />">
						</td>
						<td>$${aBean.unitPrice}</td>
						<td>${aBean.amount}</td>
						<td>${aBean.discount}</td>
						<td>${aBean.unitPrice*aBean.discount*aBean.amount}元</td>
						<c:set var="subtotal"
							value="${ subtotal + aBean.unitPrice * aBean.discount * aBean.amount }" />
					</tr>
				</c:forEach>
				<tr>
					<td colspan="6" align="center"><input type="button"
						value="返回上一頁" id="backPreviousPage"></td>
				</tr>


				<!-- tbody更改到這邊結束 -->
			</tbody>



		</table>
</body>

</html>