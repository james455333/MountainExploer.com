<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>後台資料維護系統/山岳資料/[新增]]</title>
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
		<c:if test="${ !empty errorMsg}">
			<script type="text/javascript" charset="UTF-8">
				alert("${errorMsg}")
			</script>
		</c:if>
		
		<form action='<c:url value="/backsatage/mountain/createMountainData"/>' class="newDataForm" enctype="multipart/form-data" method="post">
			<div id="updateForm">
				<div>
				* 為必填項目
				</div>
				<div>
					<label for="npName">* 國家公園名稱 : &nbsp&nbsp</label>			
					<input type="text" name="npName" required>
				</div>
				<div>
					<label for="routeName">* 路線名稱 : &nbsp&nbsp</label>			
					<input type="text" name="routeName" required>
				</div>
				<div>
					<label for="routeImg">* 路線圖檔案 : &nbsp&nbsp</label>			
					<input type="file" name="routeImg"  accept="image/*" required>
				</div>
				<div >
					<label for="routeDesp">* 路線介紹 : &nbsp&nbsp</label>			
					<textarea rows="2.5%" cols="50%" name="routeDesp" class="bigText" required></textarea>
				</div>
				<div >
					<label for="routeAdvice">* 建議路線 : &nbsp&nbsp</label>			
					<textarea rows="2.5%" cols="50%" name="routeAdvice" class="bigText" required></textarea>
				</div>
				<div >
					<label for="routeTraffic">* 交通資訊 : &nbsp&nbsp</label>			
					<textarea rows="2.5%" cols="50%" name="routeTraffic" class="bigText" required></textarea>
				</div>
			</div>
			<div id="new_confirm">
				<div>
					<input type="submit" value="確認新增">
				</div>
				<div>
				<input type="reset" value="清除">
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
	<script type="text/javascript" charset="UTF-8" src='<c:url value="/mountain/back/backMountain.js"/>'></script>
	<script>
		$(function(){
			$("#backPreviousPage").on("click",function(){
					window.history.go(-1)
				})
			})
	</script>
</html>