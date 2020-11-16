<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>後台資料維護系統/中山小屋修改</title>
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
						<th scope="col"><span class="tr_title">國家公園</span></th>
						<th scope="col"><span class="tr_title">山屋名稱</span></th>
						<th scope="col"><span class="tr_title">山屋床位</span></th>
						<th scope="col"><span class="tr_title">山屋營地位</span></th>
						<th scope="col"><span class="tr_title">高度 / 海拔</span></th>
					</tr>
				</thead>
				<tbody>
				  <c:forEach var="k" items="${jumpupdatename}"> 
				<tr>  
				 <div>				 
				  	<form  action="<c:url value='/mountainHouseBack/updateHouse'></c:url>"method="post">	
 				    	<td><input type="hidden" name="update_park" value="${k.nationalPark.name}">${k.nationalPark.name}</td>	  
				    	<td><input type="text" name="update_name" size="20" value="${k.name}"> 	</td>
				    	<td><input type="text" name="update_bed" size="20" value="${k.bed}"> 	</td>
				    	<td><input type="text" name="update_camp" size="50" value="${k.camp}"> 	</td>
				    	<td><input type="text" name="update_height" size="50" value="${k.height}"> 	</td>				    	
				    	<td><input type="hidden" name="update_id" size="10" value="${k.housebasicid}">	</td> 			    		
				    	<td><input type="submit"  value="修改"></td>
				    </form>
				 </div>
				</tr> 
				    	</c:forEach> 
			</table>
		</div>
		
	</div>

</body>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" ></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" ></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" ></script>
	<script type="text/javascript" charset="UTF-8" src='<c:url value="/housecamp/css/back/backhousecamp.js"/>'></script>
</html>