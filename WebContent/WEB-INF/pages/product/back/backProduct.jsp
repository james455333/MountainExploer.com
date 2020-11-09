<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>後台資料維護系統/山岳資料</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href='<c:url value="/backstage/css/backStage.css"/>'>
<link rel="stylesheet"
	href='<c:url value="/mountain/back/backMountain.css"/>'>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>
</head>
<body>

	<div id="container1">
		<!-- 引入共同頁首 -->
		<jsp:include page="../../fragment/backTopNav.jsp"></jsp:include>
		<form action="<c:url value='/productBackStage/backFCSearch' />"
			method="get">
			<div>
				<span>主類別 :&nbsp</span> <select name="firstclass">
					<c:forEach var="fcBean" items="${fcBean}" varStatus="vs">
						<option value="${fcBean.id}">${fcBean.name}</option>
					</c:forEach>
				</select>
			</div>
			<div>
				<input type="submit" value="主類別查詢">
		</form>
	</div>
	<div>
		<form action="<c:url value='/productBackStage/backSCSearch' />"
			method="get">
			<div class="searchSelect">
				<span>次分類 :&nbsp</span> <select name="secondclass">
					<c:forEach var="scBean" items="${scBean}" varStatus="vsRT">
						<option value="${scBean.id}">${scBean.name}</option>
					</c:forEach>
				</select>
			</div>
			<div>
				<input type="submit" value="次分類查詢">
			</div>
		</form>

	</div>
	<div>
		 <a	href='<c:url value="/productBackStage/createDataPage"/>'>新增一筆資料</a>

	</div>

	<!-- 呈現畫面 -->
	<div id="mainContainer">
		<!-- 顯示頁面 -->

		<!-- 顯示資料 -->
		<table class="table">
			<!-- 表格欄位名稱 -->
			<thead >
				<tr >
					<th scope="col"><span >產品編號</span></th>
					<th scope="col"><span >產品名稱</span></th>
					<th scope="col"><span >型號</span></th>
					<th scope="col"><span >主分類</span></th>
					<th scope="col"><span >次分類</span></th>
					<th scope="col"><span >圖片</span></th>
					<!-- 						<th scope="col"><span >敘述</span></th> -->
					<th scope="col"><span >價格</span></th>
					<th scope="col"><span >庫存</span></th>
					<th scope="col"><span >修改/刪除</span></th>
				</tr>
			</thead>
			<tbody>

				<!-- 資料內容 -->
				<c:forEach var="productBean" items="${productBean}" varStatus="vs">

					<tr>
						<th>${productBean.seqno}</th>
						<td>${productBean.name}</td>
						<td>${productBean.type}</td>
						<td>${productBean.firstClass}</td>
						<td>${productBean.secondClass}</td>
						<td><img style="width: 50px; height: 50px;"
							src="<c:url value='/productBackStage/images?seqno=${productBean.seqno}' />"
							class="routeImg" name="rtImg${vs.index})"> <img
							src="<c:url value='/productBackStage/images?seqno=${productBean.seqno}' />"
							class="extendImg" name="rtImg${vs.index})"></td>
						<td><div style="width: 150px; height: 150px; overflow: auto;">${productBean.price}</div></td>
						<td><div style="width: 150px; height: 150px; overflow: auto;">${productBean.stock}</div></td>
						<td>
							<div>
								<form action="<c:url value='/productBackStage/updateDataPage' />">
									<input type="text" name="seqno" value="${productBean.seqno}"
										style="display: none;"> <input type="submit"
										value="修改">
								</form>
							</div>
							<div >
								<form action="<c:url value='/productBackStage/deleteData' />">
									<input type="text" name="deleteID" value="${productBean.seqno}"
										style="display: none;" > <input type="submit"
										value="刪除">
								</form>
							</div>
						</td>
					</tr>

				</c:forEach>
		</table>

		<!-- 刪除確認視窗 -->

	</div>
</body>

<script type="text/javascript" charset="UTF-8"
	src='<c:url value="/product/back/backProduct.js"/>'></script>
</html>