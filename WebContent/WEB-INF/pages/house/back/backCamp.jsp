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
			<div class="searchAll">
				<form action="<c:url value='/mountainCampBack/selectAll'></c:url>"method='get'>		
				<input  type="submit" value="全部觀看">
				</form>
			</div>
			<div  class="searchSelect">
			<form action="<c:url value='/mountainCampBack/selectArea'></c:url>"method='post'>	
				<span>縣市 :&nbsp </span>
				<input type="text" name="selectarea"> 
                <input type="submit" value="查詢" >				
				</form>			
			</div>
			<div class="searchSelect">
			<form action="<c:url value='/mountainCampBack/selectCounties'></c:url>"method='post'>	
				<span>鄉鎮 :&nbsp </span>
				<input type="text" name="selectcounties"> 
                <input type="submit" value="查詢" >	
                </form>	
			</div >
			<div class="searchName">
				<form action="<c:url value='/mountainCampBack/selectCamp'></c:url>"method='post'>	
				<span>營地名稱 :&nbsp </span>
				<input type="text" name="selectcampname"> 
                <input type="submit" value="查詢" >	
				</form>
			</div>
		</div>
		<div id="controller">
			<div>
				<form action="<c:url value='/mountainCampBack/inserjump'></c:url>"method='get'>	
				
					<input type="submit" src="#" name="" value="新增">		
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
						<th scope="col"><span class="tr_title">編號</span></th>
						<th scope="col"><span class="tr_title">縣市</span></th>
						<th scope="col"><span class="tr_title">鄉鎮</span></th>
						<th scope="col"><span class="tr_title">營地名稱</span></th>
						<th scope="col"><span class="tr_title">網址</span></th>
						
					</tr>
				</thead>
				<tbody>
				<!-- 查詢全部 -->
				<c:forEach var="i" items="${camp_all}">
				    <tr >	
			    
				      <td>${i.campbasicid}</td>			      
				      <td>${i.counties.area.name}</td>
				      <td>${i.counties.name}</td>
				      <td> ${i.name}</td>
				      <td><a href="${i.url}">${i.url}</a></td> 
				      
				    </tr>	    
				 </c:forEach>
				<!-- 查詢縣市 -->
				 
				 <c:forEach var="j" items="${camp_area}">
				    <tr >	
				      <td>${j.counties.camp.campbasicid}</td>		      
				      <td>${j.name}</td>
				      <td>${j.counties.name}</td>
				      <td> ${j.counties.camp.name}</td>
				      <td><a href="${j.counties.camp.url}">${j.counties.camp.url}</a></td>   
				     
				    </tr>
				 </c:forEach>
				 <!-- 查詢鄉鎮 -->				
				 
				 <c:forEach var="k" items="${camp_counties}">
				    <tr >
				      <td>${k.camp.campbasicid}</td>			      
				      <td>${k.area.name}</td>
				      <td>${k.name}</td>
				      <td> ${k.camp.name}</td>
				      <td><a href="${k.camp.url}">${k.camp.url}</a></td>   
				     
				    </tr>
				 </c:forEach>
				 <!-- 查詢營地 -->
				 <c:forEach var="l" items="${camp_campname}">
				    <tr >	
				      <td>${l.campbasicid}</td>		      
				      <td>${l.counties.area.name}</td>
				      <td>${l.counties.name}</td>
				      <td> ${l.name}</td>
				      <td><a href="${l.url}">${l.url}</a></td>  
				     
				      
				   </tr>
				 </c:forEach>
				 
				  <c:forEach var="m" items="${lookupdate}">
				    <tr >	
				      <td>${m.campid}</td>		      
				      <td>${m.city}</td>
				      <td>${m.camptown}</td>
				      <td> ${m.campname}</td>
				      <td><a href="${m.campdesc}">${m.campdesc}</a></td>  
				     </tr>
				 </c:forEach>
				 
				 <c:forEach var="n" items="${lookinser}">
				    <tr >	
				      <td>${n.campid}</td>		      
				      <td>${n.city}</td>
				      <td>${n.camptown}</td>
				      <td> ${n.campname}</td>
				      <td><a href="${n.campdesc}">${n.campdesc}</a></td>  
				     </tr>
				 </c:forEach>
				 
				 
			</table>
		</div>
		
	</div>

</tbody>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" ></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" ></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" ></script>
	<script type="text/javascript" charset="UTF-8" src='<c:url value="/housecamp/css/back/backhousecamp.js"/>'></script>
</html>