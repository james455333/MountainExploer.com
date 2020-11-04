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
				<form action="<c:url value='/mountainHouseCampBack/selectAll'></c:url>"method='get'>		
				<input  type="submit" value="全部觀看">
				</form>
			</div>
			<div  class="searchSelect">
			<form action="<c:url value='/mountainHouseCampBack/selectCity'></c:url>"method='post'>	
				<span>縣市 :&nbsp </span>
				<input type="text" name="selectcity"> 
                <input type="submit" value="查詢" >				
				</form>			
			</div>
			<div class="searchSelect">
			<form action="<c:url value='/mountainHouseCampBack/selectTown'></c:url>"method='post'>	
				<span>鄉鎮 :&nbsp </span>
				<input type="text" name="selecttown"> 
                <input type="submit" value="查詢" >	
                </form>	
			</div >
			<div class="searchName">
				<form action="<c:url value='/mountainHouseCampBack/selectCamp'></c:url>"method='post'>	
				<span>營地名稱 :&nbsp </span>
				<input type="text" name="selectcampname"> 
                <input type="submit" value="查詢" >	
				</form>
			</div>
		</div>
		<div id="controller">
			<div>
				<form action="<c:url value='/mountainHouseCampBack/inserjump'></c:url>"method='get'>	
				
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
				      <td>${i.campid}</td>			      
				      <td>${i.city}</td>
				      <td>${i.camptown}</td>
				      <td> ${i.campname}</td>
				      <td><a href="${i.campdesc}">${i.campdesc}</a></td> 
				    <td>
				      <form  action="<c:url value='/mountainHouseCampBack/deleteCamp'></c:url>"method='post'>
				      <input type="hidden" name="deletecamp" value="${i.campid}">
				      <input type="submit"  value="刪除" >
				      </form>
				      </td> 
				    
				   <td>
				  	<form  action="<c:url value='/mountainHouseCampBack/updatejump'></c:url>"method='get'>
				    	 <input type="hidden" name="jumpupdate" value="${i.campid}">
				    	<input type="submit"  value="修改">
					</form>				  
				   
				   </td>
				    </tr>	    
				 </c:forEach>
				<!-- 查詢縣市 -->
				 
				 <c:forEach var="j" items="${camp_city}">
				    <tr >	
				      <td>${j.campid}</td>		      
				      <td>${j.city}</td>
				      <td>${j.camptown}</td>
				      <td> ${j.campname}</td>
				      <td><a href="${j.campdesc}">${j.campdesc}</a></td>   
				     <td>
				      <form  action="<c:url value='/mountainHouseCampBack/deleteCamp'></c:url>"method='post'>
				      <input type="hidden" name="deletecamp" value="${j.campid}">
				      <input type="submit"  value="刪除" >
				      </form>
				      </td> 
				    
				   <td>
				  	<form  action="<c:url value='/mountainHouseCampBack/updatejump'></c:url>"method='get'>
				    	 <input type="hidden" name="jumpupdate" value="${j.campid}">
				    	<input type="submit"  value="修改">
					</form>				  
				   
				   </td>
				    </tr>
				 </c:forEach>
				 <!-- 查詢鄉鎮 -->				
				 
				 <c:forEach var="k" items="${camp_town}">
				    <tr >
				      <td>${k.campid}</td>			      
				      <td>${k.city}</td>
				      <td>${k.camptown}</td>
				      <td> ${k.campname}</td>
				      <td><a href="${k.campdesc}">${k.campdesc}</a></td>   
				     <td>
				      <form  action="<c:url value='/mountainHouseCampBack/deleteCamp'></c:url>"method='post'>
				      <input type="hidden" name="deletecamp" value="${k.campid}">
				      <input type="submit"  value="刪除" >
				      </form>
				      </td> 
				    
				   <td>
				  	<form  action="<c:url value='/mountainHouseCampBack/updatejump'></c:url>"method='get'>
				    	 <input type="hidden" name="jumpupdate" value="${k.campid}">
				    	<input type="submit"  value="修改">
					</form>				  
				   
				   </td>
				    </tr>
				 </c:forEach>
				 <!-- 查詢營地 -->
				 <c:forEach var="l" items="${camp_campname}">
				    <tr >	
				      <td>${l.campid}</td>		      
				      <td>${l.city}</td>
				      <td>${l.camptown}</td>
				      <td> ${l.campname}</td>
				      <td><a href="${l.campdesc}">${l.campdesc}</a></td>  
				     
				      <td>
				      <form  action="<c:url value='/mountainHouseCampBack/deleteCamp'></c:url>"method='post'>
				      <input type="hidden" name="deletecamp" value="${l.campid}">
				      <input type="submit"  value="刪除" >
				      </form>
				      </td> 
				    
				   <td>
				  	<form  action="<c:url value='/mountainHouseCampBack/updatejump'></c:url>"method='get'>
				    	 <input type="hidden" name="jumpupdate" value="${l.campid}">
				    	<input type="submit"  value="修改">
					</form>				  
				   
				   </td>
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