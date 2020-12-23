<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="javax.naming.Context"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>露營小天地</title>
<link rel="stylesheet" href="/MountainExploer.com/css/other.css">
<link rel="stylesheet" href="/MountainExploer.com/css/font.css">
<link rel="stylesheet" href="/MountainExploer.com/css/style.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src=" https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/sweetalert2@9.17.2/dist/sweetalert2.min.css"rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="/MountainExploer.com/member/userTop.js"></script>
<style>
.images {
	width: 18px;
	height: 18px;
}

.clickcount {
	font-size: 20px
}
/* img change large */
img{
transition: all 0.6s;}
img:hover{transform: scale(1.5);}
#tablePreview td{
	vertical-align: middle;
}
.table-hover tbody tr:hover td, .table-hover tbody tr:hover th {
  background-color: #BBFFBB;
}
.table-striped>tbody>tr:nth-of-type(odd){
	background-color : #F0FFF0;

}

</style>
</head>

<body>
	<div class="container-fluid" style="padding: 0px;" include-html="/MountainExploer.com/forinclude/carousel.html">
	</div>
	<header>
		<nav class="navbar navbar-expand-lg navbar-light bg-light zline">
			<a class="navbar-brand" href="/MountainExploer.com/"><img
				src="/MountainExploer.com/images/logo1.png" height="30%" width="30%"></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent"
				include-html="/MountainExploer.com/forinclude/includeForIndex.html"></div>
		</nav>
	</header>
	<nav>
		<ol class="breadcrumb bg-light" style="font-size : 25px;" id="bc">
			<li class="breadcrumb-item"><a href="/MountainExploer.com">首頁</a></li>
			<li class="breadcrumb-item"><a href="/MountainExploer.com/mountainCampAct/actselectAll?selectarea=&selectcounties=&no=1&page=1">露營小天地</a></li>
			
		</ol>
	</nav>
	
	<div class="div_ul p-5">
			<div class="" style="font-size:20px;" >
				<!-- 每頁不同的內容從這裡開始 -->
				<div class="mb-3 p-5  border shadow " style="color : white">
					<nav class="d-flex">

						<div class="ml-auto">
						<!-- 控制列表內容從這邊開始 -->
						<form action="<c:url value='/mountainCampAct/actselectAll'></c:url>"
							method='GET'>
							<div>
								<select name="selectarea" id="selectArea">
									<option>請先選擇縣市</option>
								</select> 
								<input type="hidden" value="" name="selectcounties"> 
								<input type="hidden" value=3 name="no"> 
								<input type="hidden" value=1 name="page">
								<input type="submit"class="btn btn-outline-success" value="查詢">
							</div>
						</form>
						</div>
						<div class="ml-auto">
						<form
							action="<c:url value='/mountainCampAct/actselectAll'></c:url>"
							method='GET'>
							<div class="d-flex align-content-center">
								 <select name="selectcounties" id="selectCounties">
									<option>請選擇鄉鎮</option>
								</select> 
								<input type="hidden" value="" name="selectarea">
								 <input	type="hidden" value=2 name="no">
								 <input type="hidden"	value=1 name="page">
								 <input type="submit"	class="btn btn-outline-success" value="查詢">
							</div>
						</form>
						</div>
						<div class="ml-auto">
						<form style="margin-left: 25px"
							action="<c:url value='/mountainCampAct/actselectAll'></c:url>"
							method='get'>
							<input type="hidden" value="" name="selectarea"> <input
								type="hidden" value="" name="selectcounties"> <input
								type="hidden" value=1 name="no"> <input type="hidden"
								value=1 name="page"> <input type="submit"
								class="btn btn-outline-info" value="全部觀看">
						</form>


						<!-- 控制列表內容到這邊結束 -->
					</div>
				<div class="ml-auto">
					<form
						action="<c:url value='/mountainCampAct/actselectCamp'></c:url>"
						method='GET' id="form1" name="form1">
						露營地查詢：<input type="text" class="light-table-filter"
							placeholder="請輸入關鍵字" name="selectcampname">
						<!--                     <img class=imgSearch src="/MountainExploer.com/images/放大鏡.png" alt="" width="35px"> -->
						<input type="image" class=imgSearch
							src="/MountainExploer.com/images/放大鏡.png" width="35px"
							onClick="document.form1.submit()">
						<!-- <button><img class=imgSearch src="/MountainExploer.com/images/放大鏡.png" alt="" width="35px"></button> -->
					</form>
				</div>
				</nav>



			</div>
			
			

			<div class="mt-5 mx-3">
				<!--table-->
				<table class="order-table table table-hover" id="tablePreview">
					<thead class="bg-success bg-gradient text-white ">
						<tr style="font-size:20px;">
							<!-- thead更改從這邊開始 -->
							<th scope="col">縣市</th>
							<th scope="col">鄉鎮</th>
							<th scope="col">營地名稱</th>
							<th scope="col">部落格</th>
							<th scope="col">星級</th>
							<!-- thead更改到這邊結束 -->
						</tr>
					</thead>

					<tbody class="">
						<!-- tbody更改從這邊開始 -->
						<c:forEach var="i" items="${camp_all}">
							<tr>
								<td>${i.counties.area.name}</td>
								<td>${i.counties.name}</td>
								<td><a href="jumpCampDesc?selectcampid=${i.campbasicid}">${i.name}</a></td>
								<td class="img"><c:choose>
										<c:when test="${empty i.campimgid.img }">
											<a href="${i.url}" target="_blank"><img height="100"
												width="100"
												src="/MountainExploer.com/housecamp/images/campimagnotfound.png"></a>
										</c:when>
										<c:when test="${not empty i.campimgid.img }">
											<a href="${i.url}" target="_blank"><img height="100"
												width="100"
												src="<c:url value='/mountainCampBack/showimg?imgid=${i.campimgid.id}'/>"></a>
										</c:when>
									</c:choose></td>
								<!-- 星星評分 -->
								<td>
									<p>
										<c:choose>
											<c:when
												test="${(i.star*1.0 / i.clickcount) lt 1 || empty i.star}">
												<span><img class="images"
													src="/MountainExploer.com/housecamp/images/blackstar.PNG"></span>
												<span><img class="images"
													src="/MountainExploer.com/housecamp/images/blackstar.PNG"></span>
												<span><img class="images"
													src="/MountainExploer.com/housecamp/images/blackstar.PNG"></span>
												<span><img class="images"
													src="/MountainExploer.com/housecamp/images/blackstar.PNG"></span>
												<span><img class="images"
													src="/MountainExploer.com/housecamp/images/blackstar.PNG"></span>
											</c:when>
											<c:when
												test="${ i.star*1.0/i.clickcount ge 1 && i.star*1.0/i.clickcount lt 2}">
												<span><img class="images"
													src="/MountainExploer.com/housecamp/images/bringstar.PNG"></span>
												<span><img class="images"
													src="/MountainExploer.com/housecamp/images/blackstar.PNG"></span>
												<span><img class="images"
													src="/MountainExploer.com/housecamp/images/blackstar.PNG"></span>
												<span><img class="images"
													src="/MountainExploer.com/housecamp/images/blackstar.PNG"></span>
												<span><img class="images"
													src="/MountainExploer.com/housecamp/images/blackstar.PNG"></span>
											</c:when>
											<c:when
												test="${i.star*1.0/i.clickcount ge 2 && i.star*1.0/i.clickcount lt 3}">
												<span><img class="images"
													src="/MountainExploer.com/housecamp/images/bringstar.PNG"></span>
												<span><img class="images"
													src="/MountainExploer.com/housecamp/images/bringstar.PNG"></span>
												<span><img class="images"
													src="/MountainExploer.com/housecamp/images/blackstar.PNG"></span>
												<span><img class="images"
													src="/MountainExploer.com/housecamp/images/blackstar.PNG"></span>
												<span><img class="images"
													src="/MountainExploer.com/housecamp/images/blackstar.PNG"></span>
											</c:when>
											<c:when
												test="${i.star*1.0/i.clickcount ge 3 && i.star*1.0/i.clickcount lt 4}">
												<span><img class="images"
													src="/MountainExploer.com/housecamp/images/bringstar.PNG"></span>
												<span><img class="images"
													src="/MountainExploer.com/housecamp/images/bringstar.PNG"></span>
												<span><img class="images"
													src="/MountainExploer.com/housecamp/images/bringstar.PNG"></span>
												<span><img class="images"
													src="/MountainExploer.com/housecamp/images/blackstar.PNG"></span>
												<span><img class="images"
													src="/MountainExploer.com/housecamp/images/blackstar.PNG"></span>
											</c:when>
											<c:when
												test="${i.star*1.0/i.clickcount ge 4 && i.star*1.0/i.clickcount lt 4.8}">
												<span><img class="images"
													src="/MountainExploer.com/housecamp/images/bringstar.PNG"></span>
												<span><img class="images"
													src="/MountainExploer.com/housecamp/images/bringstar.PNG"></span>
												<span><img class="images"
													src="/MountainExploer.com/housecamp/images/bringstar.PNG"></span>
												<span><img class="images"
													src="/MountainExploer.com/housecamp/images/bringstar.PNG"></span>
												<span><img class="images"
													src="/MountainExploer.com/housecamp/images/blackstar.PNG"></span>
											</c:when>
											<c:when test="${i.star*1.0 / i.clickcount ge 4.8}">
												<span><img class="images"
													src="/MountainExploer.com/housecamp/images/bringstar.PNG"></span>
												<span><img class="images"
													src="/MountainExploer.com/housecamp/images/bringstar.PNG"></span>
												<span><img class="images"
													src="/MountainExploer.com/housecamp/images/bringstar.PNG"></span>
												<span><img class="images"
													src="/MountainExploer.com/housecamp/images/bringstar.PNG"></span>
												<span><img class="images"
													src="/MountainExploer.com/housecamp/images/bringstar.PNG"></span>
											</c:when>
										</c:choose>
									</p> <!-- 星星結束 --> <c:choose>
										<c:when test="${empty i.clickcount}">
											<p class="clickcount">無人評分</p>
										</c:when>
										<c:otherwise>
											<p class="clickcount">${i.clickcount}人評分過</p>
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
						</c:forEach>



						<!-- tbody更改到這邊結束 -->
					</tbody>

				</table>
				<nav class="pageControl">


					<ul style="display: inline-flex;">
						<li class="li1"><a
							href="actselectAll?selectarea=${selectarea }&selectcounties=${selectcounties}&no=${no }&page=1">«第一頁</a></li>
						<c:choose>
							<c:when test="${page<=1}">
								<li class="li1"><a href="#">‹上一頁</a></li>
							</c:when>
							<c:otherwise>
								<li class="li1"><a
									href="actselectAll?selectarea=${selectarea }&selectcounties=${selectcounties}&no=${no }&page=${page-1}">‹上一頁</a></li>
							</c:otherwise>
						</c:choose>
						<li class="li1"><select
							onChange="location = this.options[this.selectedIndex].value">
								<c:forEach var="toPage" begin="1" end="${totalPage}">
									<option
										value="actselectAll?selectarea=${selectarea }&selectcounties=${selectcounties}&no=${no }&page=${toPage}"
										<c:if test="${toPage==page}">selected="selected"</c:if>>第${toPage}頁</option>
								</c:forEach>

						</select></li>

						<c:choose>
							<c:when test="${page==totalPage}">
								<li class="li1"><a href="#">下一頁›</a></li>
							</c:when>
							<c:otherwise>
								<li class="li1"><a
									href="actselectAll?selectarea=${selectarea }&selectcounties=${selectcounties}&no=${no }&page=${page+1}">下一頁›</a></li>
							</c:otherwise>
						</c:choose>
						<li class="li1"><a
							href="actselectAll?selectarea=${selectarea }&selectcounties=${selectcounties}&no=${no }&page=${totalPage}">最末頁»</a></li>
					</ul>
				</nav>
			</div>




			<!-- 每頁不同的內容到這邊結束 -->
		</div>
	</div>


	<footer id="footer" style="padding: 100px"
			include-html="/MountainExploer.com/forinclude/includeForFooter.html">
	</footer>

</body>

<script type="text/javascript">
	$(function() {

		var campUrl = "/MountainExploer.com/mountainCampAct";

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

		$("#selectArea").on("change",function() {
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
<script src="/MountainExploer.com/js/upLoadImg.js"></script>
<!-- 上傳頭像 -->
<script src="/MountainExploer.com/js/table.js"></script>
<script src="/MountainExploer.com/js/topBar.js"></script>
<script src="/MountainExploer.com/js/sweetalert.js"></script>
<!--sweet alert-->
<script src="/MountainExploer.com/js/includejsp.js"></script>
</html>