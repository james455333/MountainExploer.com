<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品資訊</title>
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

			<div>
					<div>
						<label >商品編號 :</label> ${ProductBean.seqno}
					</div>
					<div>
						<label >商品名稱 :</label> ${ProductBean.name}
					</div>
					<div>
						<label >主類別 :</label> ${ProductBean.firstClass}
					</div>
					<div>
						<label >次類別 :</label> ${ProductBean.secondClass}
					</div>
					<div>
						<label >型號 :</label> ${ProductBean.type}
					</div>
					<div>
						<label >價格 :</label> ${ProductBean.price}
					</div>
					<div>
						<label >庫存 :</label> ${ProductBean.stock}
					</div>
					<div>
						<label >介紹 :</label> ${ProductBean.description}
					</div>
					<div>
						<img src="<c:url value='/backstage/product/search/images?seqno=${ProductBean.seqno}' />"	>
					</div>
					


			</div>
			<div>
				<div>
					<input type="button" value="返回上一頁" id="backPreviousPage">
				</div>

			</div>


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