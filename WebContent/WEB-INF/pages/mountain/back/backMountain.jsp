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
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" ></script>
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
			<form action="<c:url value='/mountainBackStage/backNPSearch?page=1&' />" method="get" id="scopeQueryNP">
				<div  class="searchSelect">
					<span>國家公園 :&nbsp</span>
					<select name="nationalPark" id="nPSelect">
						<c:forEach var="npBean" items="${npBean}" varStatus="vs">
							<option value="${npBean.id}">${npBean.name}</option>
						</c:forEach>
					</select>			
				</div>
				<div class="searchSelect">
					<input type="text" name="page" value="1" style="display: none;">
					<input type="text" name="showData" value="${showData}" style="display: none;">
					<input type="submit" value="國家公園查詢" class="npSubmit">
				</div>
			</form>
			<c:forEach var="npBean" items="${npBean}" varStatus="vsNP" >
				<c:choose>
					<c:when test="${vsNP.first}">
						<form action="<c:url value='/mountainBackStage/backRTSearch' />" method="get" class="scopeQuery">
							<div class="searchSelect">
								<span>路線名稱 :&nbsp</span>
									<select name="route" class="route" >
										<c:forEach var="peakBean" items="${navRTBean}" varStatus="vsRT">
											<c:if test="${ peakBean.npName == npBean.name}">
												<option value="${peakBean.seqno}">${peakBean.name}</option>
											</c:if>	
										</c:forEach>
									</select>
							</div >
							<div class="searchSelect">
								<input type="submit" value="特定路線查詢" class="rtSubmit">
							</div>
						</form>
					</c:when>
					<c:otherwise>
						<form action="<c:url value='/mountainBackStage/backRTSearch' />" method="get" class="scopeQuery" style="display: none;">
							<div class="searchSelect">
								<span>路線名稱 :&nbsp</span>
									<select name="route" class="route" >
										<c:forEach var="peakBean" items="${navRTBean}" varStatus="vsRT">
											<c:if test="${ peakBean.npName == npBean.name}">
												<option value="${peakBean.seqno}">${peakBean.name}</option>
											</c:if>	
										</c:forEach>
									</select>
							</div >
							<div class="searchSelect">
								<input type="submit" value="特定路線查詢" class="rtSubmit">
							</div>
						</form>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<!-- 
			<div class="searchAll">
				<form>
				<input type="search" name="search1">
				<input type="submit" value="搜尋">
				</form>
			</div> -->
		</div>
		
		<!-- 控制列 -->
		<div id="controller">
			<div>
				<a href='<c:url value="/mountainBackStage/createDataPage"/>'>新增資料</a>	
			</div>
			<div>
				<span>目前查詢資料總筆數 : ${totalData}</span>
			</div>
			<div>
				<form action="<c:url value='${controllerPath}'/>">
					<span>每頁顯示筆數 :</span>
					<select name="showData">
						<c:forEach var="selectShow" begin="1" end="5" varStatus="vs"> 
							<c:choose>
								<c:when test="${vs.count == showData}">
									<option value="${vs.count}" selected="selected">${vs.count}</option>
								</c:when>
								<c:otherwise>
									<option value="${vs.count}">${vs.count}</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select>
					<input name="nationalPark" value="${nationalPark}" style="display: none;"> 
					<input name="page" value="${page}" style="display: none;"> 
					<input type="submit" value="更改顯示">
					<span>預設為3筆</span>
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
				<c:forEach var="peakName" items="${mainBean}" varStatus="vs">
				    
				    <tr >
				    	<th>${peakName.seqno}</th>
				    	<td>${peakName.name}</td>
				    	<td>${peakName.npName}</td>
				    	<td>
				    		<img style="width:50px;height:50px;"src="<c:url value='/mountainBackStage/images?seqno=${peakName.seqno}' />" class="routeImg" name="rtImg${vs.index})" >
				    		<img src="<c:url value='/mountainBackStage/images?seqno=${peakName.seqno}' />" class="extendImg" name="rtImg${vs.index})">
				    	</td>
				    	<td><div style="width: 150px;height: 150px; overflow: auto;">${peakName.description}</div></td>
				    	<td><div style="width: 150px;height: 150px; overflow: auto;">${peakName.advice}</div></td>
				    	<td><div style="width: 150px;height: 150px; overflow: auto;">${peakName.traffic}</div></td>
				    	<td>
				    		<div>
				    			<form action="<c:url value='/mountainBackStage/updateDataPage' />">
				    				<input type="text" name="seqno" value="${peakName.seqno}" style="display: none;" readonly>
				    				<input type="submit" value="修改">
				    			</form>
				    		</div>
				    		<div>
				    			<form style="display: none;" action="<c:url value="/mountainBackStage/deleteData" />" id="deleteForm">
					    			<input type="text" name="deleteID" value="${peakName.seqno}"  readonly>
				    			</form>
				    			<input type="button" class="deleteButton" value="刪除">
				    		</div>
				    	</td>
				    </tr>
				    
				</c:forEach>
			</table>
			<!-- 頁數控制項 -->
			<div id="pageController">
				<div>
					<c:choose>
						<c:when test="${page>1}">
							<a href='<c:url value="${controllerPath}page=1&showData=${showData}" />'> 最前頁 </a>
						</c:when>
						<c:otherwise>
							<i> 最前頁 </i>
						</c:otherwise>
					</c:choose>
				</div>
				<div>
					<c:choose>
						<c:when test="${page>1}">
							<a href='<c:url value="${controllerPath}page=${page-1}&showData=${showData}" />'> 上一頁 </a>
						</c:when>
						<c:otherwise>
							<i> 前一頁 </i>
						</c:otherwise>
					</c:choose>
				</div>
				<div>
					<a> ${page} </a>
				</div>
				<div>
					<c:choose>
						<c:when test="${page<totalPage}">
							<a href='<c:url value="${controllerPath}page=${page+1}&showData=${showData}" />'> 下一頁 </a>
						</c:when>
						<c:otherwise>
							<i> 後一頁 </i>
						</c:otherwise>
					</c:choose>
				</div>
				<div>
					<c:choose>
						<c:when test="${page<totalPage}">
							<a href='<c:url value="${controllerPath}page=${totalPage}&showData=${showData}" />'> 最尾頁 </a>
						</c:when>
						<c:otherwise>
							<i > 最尾頁 </i>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div id="showPage">
				目前所在頁數 : ${page} / 總頁數 : ${totalPage} 
			</div>
			
			<!-- 刪除確認視窗 -->
			
		</div>
		
	</div>
	

</body>

	<script type="text/javascript" charset="UTF-8" src='<c:url value="/mountain/back/backMountain.js"/>'></script>
</html>