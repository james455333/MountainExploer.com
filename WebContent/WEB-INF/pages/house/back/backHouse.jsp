<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>後台資料維護系統/山岳資料</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="../../backstage/css/backStage.css"> 
<link rel="stylesheet" href="bakcMountain.css">
</head>
<body>
	<div id="container1">
		<!-- 引入共同頁首 -->
		<jsp:include page="../../fragment/backTopNav.jsp"></jsp:include>
		<div id="searchBar">
			<div class="searchAll">
				<form action="<c:url value='DemoMountainHouseServletAction'></c:url>"method='post'>		
				<input name="selectAll" type="submit" value="全部觀看">
				</form>
			</div>
			<div  class="searchSelect">
			<form action="<c:url value='DemoMountainHouseServletAction'></c:url>"method='post'>	
				<span>國家公園 :&nbsp </span>
				<input type="text" name="selectmountainname"> 
                <input type="submit" name="selectMountainName" value="查詢" >				
				</form>			
			</div>
			<div class="searchSelect">
			<form action="<c:url value='DemoMountainHouseServletAction'></c:url>"method='post'>	
				<span>山屋 :&nbsp </span>
				<input type="text" name="selectmountainhousename"> 
                <input type="submit" name="selectMountainHouseName" value="查詢" >	
                </form>	
			</div >
		</div>
		<div id="controller">
			<div>
				<form action="">	
				
					<input type="button" src="#" onclick="location.href='backinsermountainhouse.jsp'"  value="新增">		
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
						<th scope="col"><span class="tr_title">國家公園</span></th>
						<th scope="col"><span class="tr_title">山屋名稱</span></th>
						<th scope="col"><span class="tr_title">山屋床位</span></th>
						<th scope="col"><span class="tr_title">山屋營地位</span></th>
						<th scope="col"><span class="tr_title">高度 / 海拔</span></th>
						
					</tr>
				</thead>
				<tbody>
				<c:forEach var="i" items="${mountainhouse_all}">
				    <tr >	
				      <td>${i.mountainhouseid}</td>			      
				      <td>${i.mountainname}</td>
				      <td>${i.mountainhousename}</td>
				      <td>${i.mountainhouseseat}</td>
				      <td>${i.campseat}</td>
				      <td>${i.hight}</td>				       
				    </tr>
				 </c:forEach>
				 
				 <c:forEach var="j" items="${mountainname}">
				    <tr >	
				      <td>${j.mountainhouseid}</td>			      
				      <td>${j.mountainname}</td>
				      <td>${j.mountainhousename}</td>
				      <td>${j.mountainhouseseat}</td>
				      <td>${j.campseat}</td>
				      <td>${j.hight}</td>	
				    </tr>
				 </c:forEach>
				 
				 <c:forEach var="k" items="${mounrainhousename}">
				    <tr >
				      <td>${k.mountainhouseid}</td>			      
				      <td>${k.mountainname}</td>
				      <td>${k.mountainhousename}</td>
				      <td>${k.mountainhouseseat}</td>
				      <td>${k.campseat}</td>
				      <td>${k.hight}</td>	
				    
				 	  <td>
				      <form  action="<c:url value='DemoMountainHouseServletAction'></c:url>"method='post'>
				      <input type="hidden" name="deletemountainhouseid" value="${k.mountainhouseid}">
				      <input type="submit" name="deleteMountainHouse" value="刪除" >
				      </form>
				      </td> 
				   
				   <td>
				    		<form  action="<c:url value='DemoMountainHouseServletAction'></c:url>"method='post'>
				    		<input type="hidden" name="updatemountainhouseid" size="10" value="${k.mountainhouseid}">				    			
				    		<input type="text" name="updatemountainname" size="20" value="${k.mountainname}">				    		
				    		<input type="text" name="updatemountainhousename" size="20" value="${k.mountainhousename}">
				    		<input type="text" name="updatemountainhouseseat" size="20" value="${k.mountainhouseseat}">
				    		<input type="text" name="updatecampseat" size="20" value="${k.campseat}">
				    		<input type="text" name="updatehight" size="20" value="${k.hight}">
				    	<input type="submit" name="updateMountainHouse" value="修改">
				    	</form>
				   </td>
				   </tr>
				 </c:forEach>
				 
			</table>
		</div>
		
	</div>

</tbody>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" ></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" ></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" ></script>
	<script type="text/javascript" src="backMountain.js"></script>
</html>