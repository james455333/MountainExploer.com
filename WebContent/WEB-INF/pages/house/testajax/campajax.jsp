<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="javax.naming.Context"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Camp Ajax Test</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src=" https://code.jquery.com/jquery-3.5.0.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href='<c:url value="/backstage/css/backStage.css"/>'> 
<link rel="stylesheet" href='<c:url value="/housecamp/css/back/backhousecamp.css"/>' >
<script type="text/javascript" charset="UTF-8" src='<c:url value="/housecamp/back/backcampajax.js"/>'></script>
	<style>
/* 	.hideClass{ */
/* 		display : none ;  */
/* 	} */
	
	</style>

</head>
<body>
	<div id="container1">
		<!-- 引入共同頁首 -->
		<jsp:include page="../../fragment/backTopNav.jsp"></jsp:include>
		<div id="searchBar">
			
			<div  class="searchSelect">
				<span>縣市 :&nbsp </span>
				<select name="selectarea" id="selectArea" >	
				</select>	
				<div><input type="button" class="AreaSubmit" value="縣市查詢" ></div>	
								
			</div>
			<div class="searchSelect">
				<span>鄉鎮 :&nbsp </span>
				<select name="selectcounties" id="selectCounties" >
				</select>
				<div><input type="button" class="CountiesSubmit" value="鄉鎮查詢"></div>
			</div >
					
			<div class="searchAll">
				<div><input type="button" id="selectall" value="全部查詢"></div>
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
						<th scope="col"><span class="tr_title">編號</span></th>
						<th scope="col"><span class="tr_title">縣市</span></th>
						<th scope="col"><span class="tr_title">鄉鎮</span></th>
						<th scope="col"><span class="tr_title">營地名稱</span></th>
						<th scope="col"><span class="tr_title">網址</span></th>
						<th scope="col"><span class="tr_title">照片</span></th>
						<th scope="col"><span class="tr_title"></span></th>
					</tr>
				</thead>
				<tbody id="totalData"></tbody>
				<tbody id="totalArea"></tbody>
				<tbody id="totalCounties"></tbody>
				
				
			</table>
		</div>
		
	</div>
	
</body>

<script type="text/javascript">
$(function(){
	
	var campUrl = "/MountainExploer.com/mountainCampajax";
	
//所有縣市	
	$.ajax({
		url:campUrl + "/ajaxcampArea",
		method:"GET",
		dataType:"json",
		success:function(area){
		for (var i = 0  ; i < area.length ; i++){
			$("#selectArea").append("<option value='" + area[i].name + "'>" + area[i].name + "</option>")
			}
		let firstArea = $("#selectArea").find("option").eq(0).val()
		
		
		
		}
	})		
	//全部查詢
	$("#selectall").on("click", campSelectAll);
			function campSelectAll() {
					 
				$.ajax({
					url : campUrl + "/ajaxcampAll",
					method : "GET",
					dataType : "json",
					success : function(data) {
						console.log(data.length);
						for(let i = 0 ; i< data.length ; i++){
						$("#totalData").append("<tr>"+"<td>"+ data[i].campbasicid +"</td>"+"<td>" + data[i].counties.area.name +"</td>" +"<td>"+ data[i].counties.name  +"</td>" +"<td>"+ data[i].name +"</td>"+"<td>"+ data[i].url +"</td>"+"</tr>");
					
						}
						},					
					error : function() {
						console.log("123")
					}
				})		
			}
//縣市選單變更	
		
		$("#selectArea").on("change",function(){
			var selectarea = $("#selectArea").val();
			console.log("area" + selectarea)
			$("#selectCounties").empty();
		$.ajax({
				url:campUrl + "/ajaxcampCounties?selectarea=" + selectarea,
				method:"GET",
				dataType:"json",
				success:function(counties){
					console.log("counties" + counties.name)
					for (var i = 0  ; i < counties.length ; i++){
						$("#selectCounties").append("<option value='" + counties[i].name + "'>" + counties[i].name + "</option>")

						}}
		})
				
		})

//縣市查詢			
		$(".AreaSubmit").on("click",function(){
			let selectarea = $("#selectArea").val();
			
			$.ajax({
				url:campUrl + "/ajaxcampAreaSelect?selectarea=" + selectarea,
				method:"GET",
				dataType:"json",
				success:function(data){
					console.log(data);
					$("#totalArea").empty();
					for(let i = 0 ; i< data.length ; i++){
						$("#totalArea").append("<tr>"+"<td>"+ data[i].campbasicid +"</td>"+"<td>" + data[i].counties.area.name +"</td>" +"<td>"+ data[i].counties.name  +"</td>" +"<td>"+ data[i].name +"</td>"+"<td>"+ data[i].url +"</td>"+"</tr>");					
						}							
				},
				error:function(){
					console.log("nono")
					}				
			})
		})	
	
//鄉鎮查詢		
		$(".CountiesSubmit").on("click",function(){
			let countiesName = $("#selectCounties").val()
		$.ajax({
			url:campUrl + "/ajaxcampCounties?selectcounties=" + countiesName,
			method:"GET",
			
			dataType:"json",
			success:function(counties){
				console.log(counties)
				for (var i = 0  ; i < counties.length ; i++){
					$("#totalCounties").append("<tr>"+"<td>"+ counties[i].area.name +"</td>" +"<td>" + counties[i].name +"</td>"+"</tr>");					
					}}
			})
			})
		

	})

</script>
	
	<script type="text/javascript" charset="UTF-8" src='<c:url value="/housecamp/css/back/backhousecamp.js"/>'></script>
</html>