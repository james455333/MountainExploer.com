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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" ></script>
</head>
<body>
	
	<div id="container1">
		<!-- 引入共同頁首 -->
		<jsp:include page="../../fragment/backTopNav.jsp"></jsp:include>
		
		
		
		<!-- 查詢列 -->
		<div id="searchBar">
			<form action="<c:url value='/mountainBackStage/backFCSearch?page=1&' />" method="get" id="scopeQueryNP">
				<div  class="searchSelect">
					<span>主類別 :&nbsp</span>
					<select name="firstclass" id="nPSelect">
						<c:forEach var="fcBean" items="${fcBean}" varStatus="vs">
							<option value="${fcBean.id}">${fcBean.name}</option>
						</c:forEach>
					</select>			
				</div>
				<div class="searchSelect">
					<input type="text" name="page" value="1" style="display: none;">
					<input type="submit" value="主類別查詢">
				</div>
			</form>
			<c:forEach var="fcBean" items="${fcBean}" varStatus="vsNP" >
				<c:choose>
					<c:when test="${vsNP.first}">
						<form action="<c:url value='/productBackStage/backSCSearch' />" method="get" class="scopeQuery">
							<div class="searchSelect">
								<span>次分類 :&nbsp</span>
									<select name="secondclass" class="secondclass" >
										<c:forEach var="scBean" items="${scBean}" varStatus="vsRT">
											<c:if test="${ scBean.firstClassId == fcBean.id}">
												<option value="${scBean.id}">${scBean.name}</option>
											</c:if>	
										</c:forEach>
									</select>
							</div >
							<div class="searchSelect">
								<input type="submit" value="次分類查詢">
							</div>
						</form>
					</c:when>
					<c:otherwise>
						<form action="<c:url value='/productBackStage/backSCSearch' />" method="get" class="scopeQuery" style="display: none;">
							<div class="searchSelect">
								<span>次分類 :&nbsp</span>
									<select name="secondclass" class="secondclass" >
										<c:forEach var="scBean" items="${scBean}" varStatus="vsRT">
											<c:if test="${ scBean.firstClassId == fcBean.id}">
												<option value="${scBean.id}">${scBean.name}</option>
											</c:if>	
										</c:forEach>
									</select>
							</div >
							<div class="searchSelect">
								<input type="submit" value="次分類查詢">
							</div>
						</form>
					</c:otherwise>
				</c:choose>
			</c:forEach>

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
						<th scope="col"><span class="tr_title">產品編號</span></th>
						<th scope="col"><span class="tr_title">產品名稱</span></th>
						<th scope="col"><span class="tr_title">型號</span></th>
						<th scope="col"><span class="tr_title">主分類</span></th>
						<th scope="col"><span class="tr_title">次分類</span></th>
						<th scope="col"><span class="tr_title">圖片</span></th>
<!-- 						<th scope="col"><span class="tr_title">敘述</span></th> -->
						<th scope="col"><span class="tr_title">價格</span></th>
						<th scope="col"><span class="tr_title">庫存</span></th>
						<th scope="col"><span class="tr_title">修改/刪除</span></th>
					</tr>
				</thead>
				<tbody>
				
				<!-- 資料內容 -->
				<c:forEach var="productBean" items="${productBean}" varStatus="vs">
				    
				    <tr >
				    	<th>${productBean.seqno}</th>
				    	<td>${productBean.name}</td>
				    	<td>${productBean.type}</td>
				    	<td>${productBean.firstClass}</td>
				    	<td>${productBean.secondClass}</td>
				    	<td>
				    		<img style="width:50px;height:50px;"src="<c:url value='/productBackStage/images?seqno=${productBean.seqno}' />" class="routeImg" name="rtImg${vs.index})" >
				    		<img src="<c:url value='/productBackStage/images?seqno=${productBean.seqno}' />" class="extendImg" name="rtImg${vs.index})">
				    	</td>
				    	<td><div style="width: 150px;height: 150px; overflow: auto;">${productBean.price}</div></td>
				    	<td><div style="width: 150px;height: 150px; overflow: auto;">${productBean.stock}</div></td>
				    	<td>
				    		<div>
				    			<form action="<c:url value='/productBackStage/updateDataPage' />">
				    				<input type="text" name="seqno" value="${productBean.seqno}" style="display: none;" readonly>
				    				<input type="submit" value="修改">
				    			</form>
				    		</div>
				    		<div>
				    			<input type="text" name="seqno" value="${productBean.seqno}" style="display: none;" readonly>
				    			<input type="button" class="deleteButton" value="刪除">
				    		</div>
				    	</td>
				    </tr>
				    
				</c:forEach>
			</table>
			
			<!-- 刪除確認視窗 -->
			
		</div>
		
	</div>
	</div>
	

</body>

	<script type="text/javascript" charset="UTF-8" src='<c:url value="/product/back/backProduct.js"/>'></script>
</html>