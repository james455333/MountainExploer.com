<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>後台資料維護系統/商品資料</title>
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

<!-- 	<div id="container1"> -->
	<div>
		<!-- 引入共同頁首 -->
		<jsp:include page="../../fragment/backTopNav.jsp"></jsp:include>
	</div>

	<!-- 查詢列 -->
	<%-- 		<form action="<c:url value='/productBackStage/backFCSearch' />" --%>
	<!-- 			method="get"> -->
	<!-- 			<div> -->
	<!-- 				<span>主類別 :&nbsp</span> <select name="firstclass"> -->
	<%-- 					<c:forEach var="fcBean" items="${fcBean}" varStatus="vs"> --%>
	<%-- 						<option value="${fcBean.id}">${fcBean.name}</option> --%>
	<%-- 					</c:forEach> --%>
	<!-- 				</select> -->
	<!-- 			</div> -->
	<!-- 			<div> -->
	<!-- 				<input type="submit" value="主類別查詢"> -->
	<!-- 		</form> -->
	<!-- 	</div> -->
	<!-- 	<div> -->
	<%-- 		<form action="<c:url value='/productBackStage/backSCSearch' />" --%>
	<!-- 			method="get"> -->
	<!-- 			<div class="searchSelect"> -->
	<!-- 				<span>次分類 :&nbsp</span> <select name="secondclass"> -->
	<%-- 					<c:forEach var="scBean" items="${scBean}" varStatus="vsRT"> --%>
	<%-- 						<option value="${scBean.id}">${scBean.name}</option> --%>
	<%-- 					</c:forEach> --%>
	<!-- 				</select> -->
	<!-- 			</div> -->
	<!-- 			<div> -->
	<!-- 				<input type="submit" value="次分類查詢"> -->
	<!-- 			</div> -->
	<!-- 		</form> -->
	<div id="searchBar">
		<div class="searchSelect">
			<span>主類別 :&nbsp</span> <select name="firstclass" id="fcSelect">
			</select>
		</div>
		<div class="searchSelect">
			<input type="button" value="主類別查詢" class="fcSubmit">
		</div>
		<div class="searchSelect">
			<span>次類別 :&nbsp</span> <select name="secondclass" class="scSelect">
			</select>
		</div>
		<div class="searchSelect">
			<input type="button" value="次類別查詢" class="scSubmit">
		</div>
	</div>
	
	<div>
		<a href='<c:url value="/backstage/product/createDataPage"/>'>新增一筆資料</a>

	</div>
	
	<div>
	<span>價格區間 : </span>
		  <input  type="radio" name="radioGroup" id="radioA" value="1" checked="checked"/><label>0-1000元</label> 
          <input type="radio" name="radioGroup" id="radioB" value="2"/><label>1001-2000元</label>
          <input type="radio" name="radioGroup" id="radioC" value="3"/><label>2001-3000元</label>
          <input type="radio" name="radioGroup" id="radioD" value="4"/><label>3000元以上</label>
		 <button type="submit" class="priceSubmitButton">價格區間查詢</button>
	</div>
	<div >
					<input type="search" name="nameSelect" class="nameSelect">
					<input type="button" value="商品名稱查詢" class="nameSubmit">
				</div>

	<div>
		<span>資料筆數 : </span> <span id="totalData"> </span>
	</div>
	<div>
		<A id="demo3" href="<c:url value='/backstage/product/allOrders' />">訂單維護</A>

	</div>

	<!-- 呈現畫面 -->
	<div id="mainContainer">
		<!-- 顯示頁面 -->

		<!-- 顯示資料 -->
		<table class="table">
			<!-- 表格欄位名稱 -->
			<thead>
				<tr>
					<th scope="col"><span>產品編號</span></th>
					<th scope="col"><span>產品名稱</span></th>
					<th scope="col"><span>型號</span></th>
					<th scope="col"><span>主分類</span></th>
					<th scope="col"><span>次分類</span></th>
					<th scope="col"><span>圖片</span></th>
					<!-- 						<th scope="col"><span >敘述</span></th> -->
					<th scope="col"><span>價格</span></th>
					<th scope="col"><span>庫存</span></th>
					<th scope="col"><span>修改/刪除</span></th>
				</tr>
			</thead>
			<tbody>

				<!-- 資料內容 -->
				<%-- 				<c:forEach var="productBean" items="${productBean}" varStatus="vs"> --%>

				<!-- 					<tr> -->
				<%-- 						<th>${productBean.seqno}</th> --%>
				<%-- 						<td>${productBean.name}</td> --%>
				<%-- 						<td>${productBean.type}</td> --%>
				<%-- 						<td>${productBean.firstClass}</td> --%>
				<%-- 						<td>${productBean.secondClass}</td> --%>
				<!-- 						<td><img style="width: 50px; height: 50px;" -->
				<%-- 							src="<c:url value='/productBackStage/images?seqno=${productBean.seqno}' />" --%>
				<%-- 							class="routeImg" name="rtImg${vs.index})"> <img --%>
				<%-- 							src="<c:url value='/productBackStage/images?seqno=${productBean.seqno}' />" --%>
				<%-- 							class="extendImg" name="rtImg${vs.index})"></td> --%>
				<%-- 						<td><div style="width: 150px; height: 150px; overflow: auto;">${productBean.price}</div></td> --%>
				<%-- 						<td><div style="width: 150px; height: 150px; overflow: auto;">${productBean.stock}</div></td> --%>
				<!-- 						<td> -->
				<!-- 							<div> -->
				<!-- 								<form -->
				<%-- 									action="<c:url value='/productBackStage/updateDataPage' />"> --%>
				<%-- 									<input type="text" name="seqno" value="${productBean.seqno}" --%>
				<!-- 										style="display: none;"> <input type="submit" -->
				<!-- 										value="修改"> -->
				<!-- 								</form> -->
				<!-- 							</div> -->
				<!-- 							<div> -->
				<%-- 								<form action="<c:url value='/productBackStage/deleteData' />"> --%>
				<%-- 									<input type="text" name="deleteID" value="${productBean.seqno}" --%>
				<!-- 										style="display: none;"> <input type="submit" -->
				<!-- 										value="刪除"> -->
				<!-- 								</form> -->
				<!-- 							</div> -->
				<!-- 						</td> -->
				<!-- 					</tr> -->

				<%-- 				</c:forEach> --%>
				</tbody>
		</table>

		<!-- 頁數控制項 -->
		<div id="pageController">
			<div>
				<input id="firstPage" type="button" value="最前頁" name="1" disabled>
			</div>
			<div>
				<input id="previousPage" type="button" value="前一頁" name="" disabled>
			</div>
			<div>
				<i id="pageNo"></i>
			</div>
			<div>
				<input id="nextPage" type="button" value="下一頁" name="" disabled>
			</div>
			<div>
				<input id="lastPage" type="button" value="最尾頁" name="" disabled>
			</div>
		</div>

	</div>
</body>

</html>