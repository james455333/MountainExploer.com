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
<script src="https://code.jquery.com/jquery-3.5.1.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" ></script>
<script type="text/javascript" charset="UTF-8" src='<c:url value="/mountain/back/update.js"/>'></script>
</head>
<body>
	<div id="container1">
		<!-- 引入共同頁首 -->
		<jsp:include page="../../fragment/backTopNav.jsp"></jsp:include>
		
		<%-- <c:forEach var="peakName" items="${mountainBean}" varStatus="vs">
		</c:forEach> --%>
		
		<form action='<c:url value="/backsatage/mountain/updateData"/>' class="newDataForm" enctype="multipart/form-data" method="post">
			<div id="updateForm">
				<c:if test="${ !empty mainBean }">
					<div>
						<label for="routeNum">路線編號 : &nbsp&nbsp(無法更改)</label>			
						<input type="text" name="routeNum" value="${mainBean.seqno}" readonly>
					</div>
					<div>
						<label for="npName">國家公園名稱 : &nbsp&nbsp</label>
							<select name="npID">
								<c:forEach var="npBean" items="${npBean}">
									<c:choose>
										<c:when test="${defaultNP == npBean.id}">
											<option value="${npBean.id}" selected="selected">${npBean.name}</option>
										</c:when>
										<c:otherwise>
											<option value="${npBean.id}">${npBean.name}</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</select>			
					</div>
					<div>
						<label for="routeName"> * 路線名 : &nbsp(此欄位不得為空)&nbsp</label>			
						<input type="text" name="routeName" value="${mainBean.name}" required>
					</div>
					<div>
						<label>現存路線圖檔案 : &nbsp&nbsp</label>
					</div>
					<div>
						<img class="routeImg" src="<c:url value='/backstage/mountain/search/images?seqno=${mainBean.seqno}' />">	<br>			
						<img class="extendImg" src="<c:url value='/backstage/mountain/search/images?seqno=${mainBean.seqno}' />">	<br>			
					</div>
					<div>
						<label for="routeImg">修改圖上傳 : &nbsp&nbsp</label>
						<div style="display: none;"></div>
						<input type="file" name="routeImg"  accept="image/*" >
					</div>
					<div >
						<label for="routeDesp">路線介紹 : &nbsp&nbsp</label>			
						<textarea rows="3.5%" cols="75%" name="routeDesp" class="bigText">${mainBean.description}</textarea>
					</div>
					<div >
						<label for="routeAdvice">建議路線 : &nbsp&nbsp</label>			
						<textarea rows="3.5%" cols="75%" name="routeAdvice" class="bigText">${mainBean.advice}</textarea>
					</div>
					<div >
						<label for="routeTraffic">交通資訊 : &nbsp&nbsp</label>			
						<textarea rows="3.5%" cols="75%" name="routeTraffic" class="bigText">${mainBean.traffic}</textarea>
					</div>
				</c:if>
			</div>
			<div id="new_confirm">
				<div>
					<input type="submit" value="確認修改">
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
	
	<script>
		$(function(){
			$("#backPreviousPage").on("click",function(){
					window.history.go(-1)
				})
			})
	</script>

</html>