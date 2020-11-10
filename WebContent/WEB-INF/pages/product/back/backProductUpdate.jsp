<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>後台資料維護系統/山岳資料/[修改]]</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href='<c:url value="/backstage/css/backStage.css"/>'> 
<link rel="stylesheet" href='<c:url value="/mountain/back/backMountain.css"/>'>
</head>
<body>
	<div id="container1">
		<!-- 引入共同頁首 -->
		<jsp:include page="../../fragment/backTopNav.jsp"></jsp:include>
		
		<%-- <c:forEach var="peakName" items="${mountainBean}" varStatus="vs">
		</c:forEach> --%>
		
		<form action='<c:url value="/productBackStage/updateData"/>' class="newDataForm" enctype="multipart/form-data" method="post">
			<div >
				<c:if test="${ !empty result }">
					<div>
						<label for="itemBNo">編號 : &nbsp&nbsp(無法更改)</label>			
						<input type="text" name="itemBNo" value="${result.itemBNo}" readonly>
					</div>
					
					<div>
						<label for="stock"> 庫存量 : &nbsp(必填)&nbsp</label>			
						<input type="text" name="stock" value="${result.stock}" required>
					</div>
					
				</c:if>
			</div>
			<div >
				<div>
					<input type="submit" value="確認修改">
				</div>
				<div>
					<input type="button" value="返回上一頁" id="backPreviousPage">
				</div>
				
			</div>
		</form>
			
		
	</div>
	
	

</body>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" ></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" ></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" ></script>
	<script type="text/javascript" charset="UTF-8" src='<c:url value="/product/back/backProduct.js"/>'></script>
	<script>
		$(function(){
			$("#backPreviousPage").on("click",function(){
					window.history.go(-1)
				})
			})
	</script>

</html>