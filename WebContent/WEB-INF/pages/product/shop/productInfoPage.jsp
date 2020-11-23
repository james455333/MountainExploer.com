<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>後台資料維護系統/商品資料/[修改]]</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href='<c:url value="/backstage/css/backStage.css"/>'> 
<link rel="stylesheet" href='<c:url value="/mountain/back/backMountain.css"/>' >
<link rel="shortcut icon" type="image/png" href="<c:url value="/favicon.ico"/>"/>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" ></script>
<script type="text/javascript" charset="UTF-8" src='<c:url value="/product/back/backProduct.js"/>'></script>
</head>
<body>
	<div id="container1">
		<!-- 引入共同頁首 -->
		<jsp:include page="../../fragment/backTopNav.jsp"></jsp:include>

		<%-- <c:forEach var="peakName" items="${mountainBean}" varStatus="vs">
		</c:forEach> --%>

		<form action='<c:url value="/backstage/product/updateData"/>'
			class="newDataForm" enctype="multipart/form-data" method="post">
			<div>
<%-- 				<c:if test="${ !empty result }"> --%>
					<div>
						<label for="itemBasicSeqno">編號 :</label> <input
							type="text" name="itemBasicSeqno" value="${itemInfo.itemBasicSeqno}" readonly>
					</div>
					<div>
						<label for="name"> 產品名稱: </label> <input type="text"
							name="name" value="${itemBasic.name}" readonly>
					</div>
					<div>
						<label for="type"> 型號: </label> <input type="text"
							name="type" value="${itemInfo.type}" readonly>
					</div>
					<div>
						<label for="price"> 價格: </label> <span 
							name="price" value="${itemInfo.price}" ></span>
					</div>
					<div>
						<label for="stock"> 庫存量 :</label> <input
							type="text" name="stock" value="${itemInfo.stock}" readonly>
					</div>
					<div>
						<img style="width: 50px; height: 50px;"
							src="<c:url value='/backstage/product/search/images?seqno=${itemInfo.itemBasicSeqno}' />"	>
						<br> 
				
					</div>
					<div>
						<label for="price"> 價格:</label> <input type="text"
							name="price" value="${itemInfo.description}" readonly>
					</div>


			</div>
			<div>
				<div>
					<input type="button" value="返回上一頁" id="backPreviousPage">
				</div>

			</div>
		</form>


	</div>



</body>

<script>
	$(function() {
		$("#backPreviousPage").on("click", function() {
			window.history.go(-1)
		})
	})
</script>

</html>