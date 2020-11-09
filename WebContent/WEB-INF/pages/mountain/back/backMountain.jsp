<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>後台資料維護系統/山岳資料</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href='<c:url value="/backstage/css/backStage.css"/>'> 
<link rel="stylesheet" href='<c:url value="/mountain/back/backMountain.css"/>' >
<link rel="shortcut icon" type="image/png" href="<c:url value="/favicon.ico"/>"/>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" ></script>
<script type="text/javascript" charset="UTF-8" src='<c:url value="/mountain/back/backMountain.js"/>'></script>
</head>
<body>
	
	
	
	<div id="container1">
		<!-- 引入共同頁首 -->
		<jsp:include page="../../fragment/backTopNav.jsp"></jsp:include>
		
		<%-- <c:forEach var="peakName" items="${mountainBean}" varStatus="vs">
		</c:forEach> --%>
		<!-- 測尋錯誤訊息 -->
		<c:choose>
			<c:when test="${ !empty errors}">
				<script type="text/javascript" charset="UTF-8">
					var errors = ${errors.msg};
				</script>
			</c:when>
			<c:otherwise>
				<script type="text/javascript">
					var errors = null;
				</script>
			</c:otherwise>
		</c:choose>
		
		
		<!-- 測尋結果訊息 -->
		<c:choose>
			<c:when test="${ !empty result}">
				<script type="text/javascript" charset="UTF-8">
					var result = "${result}";
				</script>
			</c:when>
			<c:otherwise>
				<script type="text/javascript" charset="UTF-8">
					var result = null;
				</script>
			</c:otherwise>
		</c:choose>
		<!-- 查詢列 -->
		<div id="searchBar">
			<div  class="searchSelect">
				<span>國家公園 :&nbsp</span>
				<select name="nationalPark" id="nPSelect">
				</select>			
			</div>
			<div class="searchSelect">
				<input type="button" value="國家公園查詢" class="npSubmit">
			</div>
			<div class="searchSelect">
				<span>路線名稱 :&nbsp</span>
					<select name="route" class="route" >
					</select>
				</div >
			<div class="searchSelect">
				<input type="button" value="特定路線查詢" class="rtSubmit">
			</div>
		</div>
		
		<!-- 控制列 -->
		<div id="controller">
			<div>
				<a href='<c:url value="/backstage/mountain/createDataEntry"/>'>新增資料</a>	
			</div>
			<div>
				<span>目前查詢資料總筆數 : </span>
				<span id="totalData"> </span>
			</div>
			<div>
				<form action="<c:url value='${controllerPath}'/>">
					<span>每頁顯示筆數 :</span>
					<span id="showData"></span>
					<select name="showData">
						<c:forEach var="selectShow" begin="1" end="10" varStatus="vs"> 
							<c:choose>
								<c:when test="${vs.count == 3}">
									<option value="${vs.count}" selected="selected">${vs.count}</option>
								</c:when>
								<c:otherwise>
									<option value="${vs.count}">${vs.count}</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select>
					<input type="button" value="更改顯示(尚未實作AJAX作法)" id="changeShowData">
				</form>
			</div>
		
		<!-- 呈現畫面 -->
		</div>
		<div id="mainContainer">
			<!-- 顯示頁面 -->
			
			<!-- 顯示資料 -->
			<table class="table">
				<!-- 表格欄位名稱 -->
				<thead class="thead-light">
					<tr class="a_titleName">
						<th scope="col"><span class="tr_title">路線編號</span></th>
						<th scope="col"><span class="tr_title">路線名稱</span></th>
						<th scope="col"><span class="tr_title">國家公園名稱</span></th>
						<th scope="col"><span class="tr_title">路線預覽圖</span></th>
						<th scope="col"><span class="tr_title">路線介紹</span></th>
						<th scope="col"><span class="tr_title">建議路線</span></th>
						<th scope="col"><span class="tr_title">交通資訊</span></th>
						<th scope="col"><span class="tr_title">維護選項</span></th>
					</tr>
				</thead>
				<tbody>
				<!-- 資料內容 -->
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
					<input id ="nextPage" type="button" value="下一頁" name="" disabled>
				</div>
				<div>
					<input id="lastPage" type="button" value="最尾頁" name="" disabled>
				</div>
			</div>
			
		</div>
		
	</div>
	

</body>

	
</html>