<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>後台資料維護系統/山岳資料</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href='<c:url value="/backstage/css/backStage.css"/>'> 
<link rel="stylesheet" href='<c:url value="/housecamp/css/back/backhousecamp.css"/>' >
</head>
<body>
	<div id="container1">
		<!-- 引入共同頁首 -->
		<jsp:include page="../../fragment/backTopNav.jsp"></jsp:include>
		<div id="searchBar">
			<div  class="searchSelect">
				<span>國家公園 :&nbsp </span>
				<select name="">
					<option value="">test1</option>
				</select>			
			</div>
			<div class="searchSelect">
				<span>路線名稱 :&nbsp </span>
				<select name="" >
					<option value="">test1</option>
				</select>
			</div >
			<div class="searchAll">
				<form>
				<input type="search" name="search1">
				<input type="submit" value="搜尋">
				</form>
			</div>
		</div>
		<div id="controller">
			<div>
				<form action="">
					<input type="search" name="searchInsert">
					<input type="button" src="#" value="新增">		
				</form>
			</div>
			<div>
				<form action="">
					<input type="search" name="searchInsert">
					<input type="button" src="#" value="修改">		
				</form>
			</div>
			<div>
				<form action="">
					<input type="search" name="searchInsert">
					<input type="button" src="#" value="刪除">		
				</form>
			</div>
		</div>
		<div id="mainContainer">
			<table class="table">
				<thead class="thead-light">
					<tr class="a_titleName">
						<th scope="col"><span class="tr_title">縣市</span></th>
						<th scope="col"><span class="tr_title">鄉鎮</span></th>
						<th scope="col"><span class="tr_title">營地名稱</span></th>
						<th scope="col"><span class="tr_title">網址</span></th>
					</tr>
				</thead>
				<tbody>
				  <tr>  
				   
				  	<c:forEach var="l" items="${camp_campname}"> 
				  	<form  action="<c:url value='/mountainHouseCampBack/updateCamp'></c:url>"method='post'>	
				    		<input type="hidden" name="updatacamp_id" size="10" value="${l.campid}">				    		
				    		<input type="text" name="updatecamp_city" size="10" value="${l.city}">
				    		<input type="text" name="updatecamp_town" size="10" value="${l.camptown}">
				    		<input type="text" name="updatecamp_name" size="20" value="${l.campname}">
				    		<input type="text" name="updatecamp_desc" size="50" value="${l.campdesc}">
				    	<input type="submit"  value="修改">
				    	</form>
				    	</c:forEach> 
				   
				    </tr>
			</table>
		</div>
		
	</div>

</body>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" ></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" ></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" ></script>
	<script type="text/javascript" charset="UTF-8" src='<c:url value="/housecamp/css/back/backhousecamp.js"/>'></script>
</html>