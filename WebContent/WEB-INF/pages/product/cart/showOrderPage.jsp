<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>購物頁面</title>
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
	<table class="order-table">
		<thead class="order-table-th">
			<tr>
				<!-- thead更改從這邊開始 -->
				<th scope="col">商品編號</th>
				<th scope="col">商品名稱</th>
				<th scope="col">價格</th>
				<th scope="col">數量</th>
				<th scope="col">小計</th>
				<th scope="col">修改/刪除</th>
				<!-- thead更改到這邊結束 -->
			</tr>
		</thead>

		<tbody class="order-table-tb">
			<!-- tbody更改從這邊開始 -->
			<c:forEach varStatus="vs" var="anEntry"
				items="${ShoppingCart.content}">
				<tr>
					<td>${anEntry.itemBasicSeqno}</td>
					<td>${anEntry.value.itemBasicName}</td>
					<td>${anEntry.value.unitPrice}</td>
					<td>${anEntry.value.amount}</td>
					<td>${anEntry.value.price * anEntry.value.discount * anEntry.value.amount}</td>
					<td>
						<div>
							<form action="<c:url value='/productBackStage/updateDataPage' />">
								<input type="text" name="itemBasicSeqno"
									value="${anEntry.value.itemBasicSeqno}" style="display: none;">
								<select name="newAmount">
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
								</select> <input type="submit" value="修改數量">
							</form>
						</div>
						<div>
							<form action="<c:url value='/productBackStage/deleteData' />">
								<input type="text" name="itemBasicSeqno"
									value="${anEntry.value.itemBasicSeqno}" style="display: none;">
								<input type="submit" value="刪除">
							</form>
						</div>
					</td>

				</tr>
			</c:forEach>


			<!-- tbody更改到這邊結束 -->
		</tbody>

	</table>
	<div>
		合計金額： <span>${subtotal}</span> 元
	</div>
	<TABLE border='1'>
		<TR>
			<TD width="265" align='center'><A
				href="<c:url value='../_03_listBooks/DisplayPageProducts?pageNo=${param.pageNo}' />">繼續購物</A>
			</TD>
			<TD width="265" align='center'><A
				href="<c:url value='../_03_listBooks/DisplayPageProducts?pageNo=${param.pageNo}' />">確認訂單</A>
			</TD>
			<TD width="265" align='center'><A
				href="<c:url value='../_03_listBooks/DisplayPageProducts?pageNo=${param.pageNo}' />">放棄購物</A>
			</TD>
			<!-- 			<TD width="265" align='center'><A -->
			<%-- 				href="<c:url value='checkout.do' />" --%>
			<%-- 				onClick="return Checkout(${subtotal});">送出訂單</A></TD> --%>
			<!-- 			<TD width="265" align='center'><A -->
			<%-- 				href="<c:url value='abort.do' />" onClick="return Abort();">放棄購物</A> --%>
			<!-- 			</TD> -->
		</TR>
	</TABLE>


	<!-- 每頁不同的內容到這邊結束 -->

	<footer id="footer">
		<a>全站導覽</a>
		<button id="demo1">確認demo1</button>
		<button id="demo2">錯誤demo2</button>
		<button id="demo3">確認提醒demo3</button>
		<button id="demo4">多重選項&提醒視窗demo4</button>
		<button id="demo5">Demo5</button>
		<button id="demo6">Demo6</button>



	</footer>
</body>
<script src="/MountainExploer.com/js/upLoadImg.js"></script>
<!-- 上傳頭像 -->
<script src="/MountainExploer.com/js/table.js"></script>
<script src="/MountainExploer.com/js/topBar.js"></script>
<script src="/MountainExploer.com/js/sweetalert.js"></script>
<!--sweet alert-->
<script src="/MountainExploer.com/js/includejsp.js"></script>
</html>