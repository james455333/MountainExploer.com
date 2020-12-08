<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>後台資料維護系統/訂單狀態</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href='<c:url value="/backstage/css/backStage.css"/>'> 
<link rel="stylesheet" href='<c:url value="/mountain/back/backMountain.css"/>' >
<link rel="shortcut icon" type="image/png" href="<c:url value="/favicon.ico"/>"/>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" ></script>
<script type="text/javascript" charset="UTF-8" src='<c:url value="/product/back/backProduct.js"/>'></script>
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
				<!-- thead更改從這邊開始 -->
				<th width="100">訂單編號</th>
				<th width="100">會員帳號</th>
				<th width="100">金額</th>
				<th width="100">收貨人</th>
				<th width="100">收貨地址</th>
				<th width="100">連絡電話</th>
				<th width="100">訂貨日期</th>
				<th width="100">出貨日期</th>
				<th width="100">訂單狀態</th>
				<th width="100">確認</th>
				<!-- thead更改到這邊結束 -->
			</tr>
		</thead>

		<c:forEach var="anOrderBean" varStatus="stat" items="${AllOrders}">
			<TR>
				<TD><a
					href='<c:url value='/backstage/product/orderInfo?orderId=${anOrderBean.seqno}' />'>
						${anOrderBean.seqno} </a></TD>
				<TD>${anOrderBean.memberBasic.account}</TD>
				<TD>${anOrderBean.totalAmount}元</TD>
				<TD>${anOrderBean.receiver}</TD>
				<TD>${anOrderBean.shippingAddress}</TD>
				<TD>${anOrderBean.invoiceTitle}</TD>
				<TD>${anOrderBean.orderDate}</TD>
				<TD>${anOrderBean.shippingDate}</TD>
				<TD>${anOrderBean.cancelTag}</TD>
				<TD>
					<div>
						<form action="<c:url value='/backstage/product/updateOrder' />">
							<input type="text" name="update" value="${anOrderBean.seqno}"
								style="display: none;"> <input type="submit" value="確認出貨">
						</form>
					</div>
					<div>
						<form action="<c:url value='/backstage/product/updateOrder' />">
							<input type="text" name="cancel" value="${anOrderBean.seqno}"
								style="display: none;"> <input type="submit" value="取消訂單">
						</form>
					</div>

				</TD>

			</TR>
		</c:forEach>
		<tr>
			<td colspan="10" align="center"><input type="button"
				value="返回上一頁" id="backPreviousPage"></td>
		</tr>



		<!-- tbody更改到這邊結束 -->
		</tbody>

	</table>

</body>

</html>