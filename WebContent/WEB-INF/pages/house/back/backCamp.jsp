<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="javax.naming.Context"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>後台資料維護系統/露營地資料</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href='<c:url value="/backstage/css/backStage.css"/>'>
<link rel="stylesheet"
	href='<c:url value="/housecamp/css/back/backhousecamp.css"/>'>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src=" https://code.jquery.com/jquery-3.5.0.js"></script>	
<style>
.pageauto{
width:60% ;
margin-left:auto;}
.totalData{
padding-right:10%;
float : right;}
</style>
</head>
<body>
	<div id="container1">
		<!-- 引入共同頁首 -->
		<jsp:include page="../../fragment/backTopNav.jsp"></jsp:include>
		<div id="searchBar">
			<div class="searchAll">
				<form action="<c:url value='/mountainCampBack/selectAll'></c:url>"method='get'>					
					<input type="hidden" value="" name="selectarea" >
					<input type="hidden" value="" name="selectcounties" >
					<input type="hidden" value=1 name="no" >
					<input type="hidden" value=1 name="page" >
					<input type="submit" value="全部觀看">
				</form>
			</div>
			<div class="searchSelect">
				<form action="<c:url value='/mountainCampBack/selectAll'></c:url>"method='get'>
					<span>縣市 :&nbsp<select id="selectArea" name="selectarea">
					<option>請選擇縣市</option>
					</select>
					<input type="hidden" value="" name="selectcounties" >
					<input type="hidden" value=3 name="no" >
					<input type="hidden" value=1 name="page" >
					<input type="submit" value="查詢">
					</span>
				</form>
			</div>
			<div class="searchSelect">
				<form	action="<c:url value='/mountainCampBack/selectAll'></c:url>"
					method='get'>
					<span>鄉鎮 :&nbsp  <select id="selectCounties" name="selectcounties">
					<option>請選擇鄉鎮</option>
					</select>
					<input type="hidden" value="" name="selectarea" >
					<input type="hidden" value=2 name="no" >
					<input type="hidden" value=1 name="page" >				
					<input type="submit" value="查詢">
					</span>
				</form>
			</div>
			<div class="searchName">
				<form action="<c:url value='/mountainCampBack/selectCamp'></c:url>"
					method='get'>
					<span>營地名稱 :&nbsp </span>
					 <input type="text" name="selectcampname" >
					<input type="submit" value="查詢">
				</form>
			</div>
		</div>
		<div id="controller">
			<div>
				<form action="<c:url value='/mountainCampBack/inserjump'></c:url>"
					method='get'>

					<input type="submit" src="#" name="" value="新增">
				</form>
			</div>
			<div>
				<form action="">
					<input type="search" name="searchInsert"> <input
						type="button" src="#" value="修改">
				</form>
			</div>
			<div>
				<form action="">
					<input type="search" name="searchInsert"> <input
						type="button" src="#" value="刪除">
				</form>
			</div>
		</div>
		
							<!-- 分頁 -->
			
					<div class="pageauto">
				
				
				<a href="selectAll?selectarea=${selectarea }&selectcounties=${selectcounties}&no=${no }&page=1">«第一頁</a>	
				
				<c:choose>
				<c:when test="${page <= 1}"><a href="#">‹上一頁</a></c:when>
				<c:otherwise><a href="selectAll?selectarea=${selectarea}&selectcounties=${selectcounties}&no=${no }&page=${page-1}">‹上一頁</a></c:otherwise>
				</c:choose>					
				
					<select onChange="location = this.options[this.selectedIndex].value">
						<c:forEach var="toPage" begin="1" end="${totalPage}">
						<option value="selectAll?selectarea=${selectarea }&selectcounties=${selectcounties}&no=${no }&page=${toPage}" <c:if test="${toPage==page}">selected="selected"</c:if>>第${toPage}頁</option>
						</c:forEach>
					</select>
				
				<c:choose>
				<c:when test="${page == totalPage}"><a href="#">下一頁›</a></c:when>
				<c:otherwise><a href="selectAll?selectarea=${selectarea }&selectcounties=${selectcounties}&no=${no }&page=${page+1}">下一頁›</a></c:otherwise>
				</c:choose>				
					
					<a href="selectAll?selectarea=${selectarea }&selectcounties=${selectcounties}&no=${no }&page=${totalPage}">最末頁»</a>
					
					
					
			<div class="totalData">總共<c:out value="${totalData}">${totalData}</c:out>筆資料</div> </div>
				
		
				
			
		
		
		<div id="mainContainer">
			<table class="table">
				<thead class="thead-light">
					<tr class="a_titleName">
						<th scope="col"><span class="tr_title">編號</span></th>
						<th scope="col"><span class="tr_title">縣市</span></th>
						<th scope="col"><span class="tr_title">鄉鎮</span></th>
						<th scope="col"><span class="tr_title">營地名稱</span></th>
						<th scope="col"><span class="tr_title">部落格網址</span></th>
						<th scope="col"><span class="tr_title">描述</span></th>
						<th scope="col"><span class="tr_title">星星分數總合</span></th>
						<th scope="col"><span class="tr_title">評分次數</span></th>
						<th scope="col"><span class="tr_title">平均分數</span></th>
						<th scope="col"><span class="tr_title">照片</span></th>
						<th scope="col"><span class="tr_title"></span></th>
						<th scope="col"><span class="tr_title"></span></th>
					</tr>
				</thead>
				<tbody>
					<!-- 查詢全部 -->
					
					<c:forEach var="i" items="${camp_all}">
						<tr>
							<td>${i.campbasicid}</td>
							<td>${i.counties.area.name}</td>
							<td>${i.counties.name}</td>
							<td>${i.name}</td>
							<td><a href="${i.url}">${i.url}</a></td>
							<td>${i.desc}</td>
							<c:choose>
							<c:when test="${empty i.star}"><td>0</td></c:when>
							<c:otherwise><td>總共${i.star}分</td></c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${empty i.clickcount}"><td>0</td></c:when>
							<c:otherwise><td>評分過${i.clickcount}次</td></c:otherwise>
						</c:choose>
							<td>平均${i.star/i.clickcount}分</td>
							<td>
								<c:choose>
								<c:when test="${empty i.campimgid.img }">
								<a href="${i.url}"target="_blank"><img height="100" width="100"
										src="/MountainExploer.com/housecamp/images/campnull.PNG">按</a>
								</c:when>
								<c:when test="${not empty i.campimgid.img }">
								<a href="${i.url}"target="_blank"><img height="100" width="100"
										src="<c:url value='/mountainCampBack/showimg?imgid=${i.campimgid.id}'/>">按</a>
								</c:when>
								</c:choose>
								</td>
							<td>
								<form
									action="<c:url value='/mountainCampBack/deleteCamp'></c:url>"
									name="form1" method='post'>
									<input type="hidden" name="deletecamp" value="${i.campbasicid}">
									<input type="button" value="刪除"
										onclick="if(confirm('確認要刪除嗎？')) this.form.submit();">
								</form>
							</td>
							<td>
								<form
									action="<c:url value="/mountainCampBack/updatejump"></c:url>"
									method="get">
									<input type="hidden" name="jumpupdate" value="${i.campbasicid}">
									<input type="submit" value="修改">
								</form>
							</td>
							
						</tr>
					</c:forEach>
					

					<c:forEach var="m" items="${lookupdate}">
						<tr>
							<td>${m.campbasicid}</td>
							<td>${m.counties.area.name}</td>
							<td>${m.counties.name}</td>
							<td>${m.name}</td>
							<td><a href="${m.url}">${m.url}</a></td>
							<td>${m.desc}</td>
							<c:choose>
							<c:when test="${empty m.star}"><td>0</td></c:when>
							<c:otherwise><td>總共${m.star}分</td></c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${empty m.clickcount}"><td>0</td></c:when>
							<c:otherwise><td>評分過${m.clickcount}次</td></c:otherwise>
						</c:choose>
							<td>平均${m.star/m.clickcount}分</td>
							<td>
								<c:choose>
								<c:when test="${empty m.campimgid.img}">
								<a href="${m.url}"target="_blank"><img height="100" width="100"
										src="/MountainExploer.com/housecamp/images/campnull.PNG">按</a>
								</c:when>
								<c:when test="${not empty m.campimgid.img}">
								<a href="${m.url}" target="_blank"><img height="100" width="100"
										src="<c:url value='/mountainCampBack/showimg?imgid=${m.campimgid.id}'/>">按</a>
								</c:when>
								</c:choose>
							</td>
							<td>${m.campimgid.id}</td>
							</tr>
					</c:forEach>

					
	</tbody>
			</table>
		</div>

	</div>

	<script>
		function delete_data() {
			if (confirm("確認刪除?")) {
				document.form1.submit();
				return true
				alert('已删除');
			} else {
				return false;
				alert('取消')
			}
		}
	</script>
	<script type="text/javascript">
	$(function() {

		var campUrl = "/MountainExploer.com/mountainCampBack";

		//所有縣市	
		$.ajax({
			url : campUrl + "/areaoption",
			method : "GET",
			dataType : "json",
			success : function(area) {
				for (var i = 0; i < area.length; i++) {
					$("#selectArea").append(
							"<option value='" + area[i].name + "'>"
									+ area[i].name + "</option>")
				}
				let firstArea = $("#selectArea").find("option").eq(0).val()

			}
		})
		//縣市選單變更	

		$("#selectArea").on(
				"change",
				function() {
					var areaselect = $("#selectArea").val();
					$("#selectCounties").empty();
					$.ajax({
						url : campUrl + "/countiesoption?areaselect="
								+ areaselect,
						method : "GET",
						dataType : "json",
						success : function(counties) {
							for (var i = 0; i < counties.length; i++) {
								$("#selectCounties").append(
										"<option value='" + counties[i].name + "'>"
												+ counties[i].name
												+ "</option>")

							}
						}
					})
				})

	})
</script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>
	<script type="text/javascript" charset="UTF-8"
		src='<c:url value="/housecamp/css/back/backhousecamp.js"/>'></script>
</html>