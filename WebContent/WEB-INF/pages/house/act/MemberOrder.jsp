<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="javax.naming.Context"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>會員  露營地 訂單</title>
<link rel="stylesheet" href="/MountainExploer.com/css/other.css">
<link rel="stylesheet" href="/MountainExploer.com/css/font.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src=" https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<style>
.images {
	width: 18px;
	height: 18px;
}

.clickcount {
	font-size: 20px
}
/* img change large */
.img{width:100%;
transition: all 0.6s;}
.img:hover{transform: scale(1.5);}
</style>
</head>

<body>
	<div class="count1">
		<div class="count1_img">
			<img src="/MountainExploer.com/images/logo1.png">
			<hr>
			<h1 class="font">可能改成輪播</h1>
			<!-- <a class="font">岳進者</a> -->
		</div>
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
	<div class="div_ul">
		<!-- 		<div class="secNavbar"> -->
		<!-- 			<nav> -->
		<!-- 				<ul class="second_nav"> -->
		<!-- 更改內容從這邊開始 -->
		<!-- 					<li class="li1"><a href="#">第二導覽列1</a></li> -->

		<!-- 					<li class="li1"><a href="#">第二導覽列2</a></li> -->

		<!-- 					<li class="li1"><a href="#">第二導覽列3</a></li> -->

		<!-- 					<li class="li1"><a href="#">第二導覽列4</a></li> -->
		<!-- 更改內容到這邊結束 -->
		<!-- 				</ul> -->
		<!-- 			</nav> -->
		<!-- 		</div> -->
		<div class="div_li1">
			<!-- 			<a>保留區</a> -->
		</div>
		<div class="div_li3">
			<!-- 			<a>保留區</a> -->
		</div>
		<div class="div_li2">
			<!-- 每頁不同的內容從這裡開始 -->
			<div class="searchBar">
				<nav>

					<div class="third_nav">
						<!-- 控制列表內容從這邊開始 -->
						


						<!-- 控制列表內容到這邊結束 -->
					</div>
				</nav>


				<div class="search">
					
				</div>

			</div>

			<div class="secDivContent">
				<!--table-->
				<table class="order-table table table-hover" id="tablePreview"
					style="background-color: white;">
					<thead class="order-table-th">
						<tr>
							<!-- thead更改從這邊開始 -->
							<th scope="col">訂單編號</th>
							<th scope="col">訂單姓名</th>
							<th scope="col">訂位數量</th>
							<th scope="col">訂單日期</th>
							<th scope="col">入住日期</th>
							<th scope="col">縣市鄉鎮</th>
							<th scope="col">營地名稱</th>
							<th scope="col">部落格</th>
							<th scope="col">星級</th>
							<th scope="col"></th>
							<!-- thead更改到這邊結束 -->
						</tr>
					</thead>

					<tbody class="order-table-tb">
						<!-- tbody更改從這邊開始 -->
<!-- 	露營star					 -->
						<div><h1>露營地訂單</h1></div>
						<c:forEach var="i" items="${memberorder}">
						
							<tr>
								<td>${i.camporderid}</td>
								<td>${i.peoplename}</td>
								<td>露營地&nbsp:&nbsp${i.amount}區</td>
								<td>${i.shoppingdate}</td>
								<td>${i.daterange}</td>
								<td>${i.campbasicid.counties.area.name}${i.campbasicid.counties.name}</td>
								<td><a href="/MountainExploer.com/mountainCampAct/jumpCampDesc?selectcampid=${i.campbasicid.campbasicid}">${i.campbasicid.name}</a></td>
								<td class="img"><c:choose>
										<c:when test="${empty i.campbasicid.campimgid.img }">
											<a href="${i.campbasicid.url}" target="_blank"><img height="100"
												width="100"
												src="/MountainExploer.com/housecamp/images/campnull.PNG">按</a>
										</c:when>
										<c:when test="${not empty i.campbasicid.campimgid.img }">
											<a href="${i.campbasicid.url}" target="_blank"><img height="100"
												width="100"
												src="<c:url value='/mountainCampBack/showimg?imgid=${i.campbasicid.campimgid.id}'/>">按</a>
										</c:when>
									</c:choose></td>
								<!-- 星星評分 -->
								<td>
									<p>
										<c:choose>
											<c:when
												test="${(i.campbasicid.star*1.0 / i.campbasicid.clickcount) lt 1 || empty i.campbasicid.star}">
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
												test="${ i.campbasicid.star*1.0/i.campbasicid.clickcount ge 1 && i.campbasicid.star*1.0/i.campbasicid.clickcount lt 2}">
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
												test="${i.campbasicid.star*1.0/i.campbasicid.clickcount ge 2 && i.campbasicid.star*1.0/i.campbasicid.clickcount lt 3}">
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
												test="${i.campbasicid.star*1.0/i.campbasicid.clickcount ge 3 && i.campbasicid.star*1.0/i.campbasicid.clickcount lt 4}">
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
												test="${i.campbasicid.star*1.0/i.campbasicid.clickcount ge 4 && i.campbasicid.star*1.0/i.campbasicid.clickcount lt 4.8}">
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
											<c:when test="${i.campbasicid.star*1.0 / i.campbasicid.clickcount ge 4.8}">
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
										<c:when test="${empty i.campbasicid.clickcount}">
											<p class="clickcount">無人評分</p>
										</c:when>
										<c:otherwise>
											<p class="clickcount">${i.campbasicid.clickcount}人評分過</p>
										</c:otherwise>
									</c:choose>
								</td>
								<td>
								<form action="<c:url value='/mountaincCampActOrder/deletecamporder'></c:url>">
									<input type="hidden" name="deleteorderid" value="${i.camporderid}">
									<input type="button" value="刪除"
										onclick="if(confirm('確認要刪除嗎？')) this.form.submit();">
								</form>
								</td>
							</tr>
						</c:forEach>
<!-- 露營end -->

 <!-- 小屋star -->
<%-- 						<c:forEach var="i" items="${memberhouseorder}"> --%>
<!-- 						<div><h1>山屋訂單</h1></div> -->
<!-- 							<tr style="font-size:20px"> -->
<%-- 								<td>${i.orderid}</td> --%>
<%-- 								<td>${i.peoplename}</td> --%>
<!-- 								<td>露營地&nbsp:&nbsp${i.campamount}區<p>小屋&nbsp:&nbsp${i.bedamount}床</p></td> -->
								
<%-- 								<td>${i.shoppingdate}</td> --%>
<%-- 								<td>${i.daterange}</td> --%>
<%-- 								<td>${i.housebasicid.nationalPark.name}</td> --%>
<%-- 								<td><a href="jumpCampDesc?selectcampid=${i.housebasicid.housebasicid}">${i.housebasicid.name}</a></td> --%>
<%-- 								<td class="img"><c:choose> --%>
<%-- 										<c:when test="${empty i.housebasicid.imgid.img }"> --%>
<!-- 											<img height="100" width="100"src="/MountainExploer.com/housecamp/images/campnull.PNG"> -->
<%-- 										</c:when> --%>
<%-- 										<c:when test="${not empty i.housebasicid.imgid.img }"> --%>
<%-- 											<img height="100"width="100"src="<c:url value='/mountainCampBack/showimg?imgid=${i.housebasicid.imgid.id}'/>"> --%>
<%-- 										</c:when> --%>
<%-- 									</c:choose></td> --%>
<!-- <!-- 								星星評分 --> -->
<!-- 								<td> -->
<!-- 									<p> -->
<%-- 										<c:choose> --%>
<%-- 											<c:when --%>
<%--  												test="${(i.housebasicid.star*1.0 / i.housebasicid.clickcount) lt 1 || empty i.housebasicid.star}">  --%>
<!-- 												<span><img class="images" -->
<!--  													src="/MountainExploer.com/housecamp/images/blackstar.PNG"></span>  -->
<!--  												<span><img class="images"  -->
<!--  													src="/MountainExploer.com/housecamp/images/blackstar.PNG"></span>  -->
<!--  												<span><img class="images"  -->
<!--  													src="/MountainExploer.com/housecamp/images/blackstar.PNG"></span>  -->
<!--  												<span><img class="images"  -->
<!--  													src="/MountainExploer.com/housecamp/images/blackstar.PNG"></span>  -->
<!--  												<span><img class="images"  -->
<!--  													src="/MountainExploer.com/housecamp/images/blackstar.PNG"></span>  -->
<%--  											</c:when>  --%>
<%--  											<c:when  --%>
<%--  												test="${ i.housebasicid.star*1.0/i.housebasicid.clickcount ge 1 && i.housebasicid.star*1.0/i.housebasicid.clickcount lt 2}">  --%>
<!--  												<span><img class="images"  -->
<!--  													src="/MountainExploer.com/housecamp/images/bringstar.PNG"></span>  -->
<!--  												<span><img class="images"  -->
<!--  													src="/MountainExploer.com/housecamp/images/blackstar.PNG"></span>  -->
<!--  												<span><img class="images"  -->
<!--  													src="/MountainExploer.com/housecamp/images/blackstar.PNG"></span>  -->
<!--  												<span><img class="images"  -->
<!--  													src="/MountainExploer.com/housecamp/images/blackstar.PNG"></span>  -->
<!--  												<span><img class="images"  -->
<!--  													src="/MountainExploer.com/housecamp/images/blackstar.PNG"></span>  -->
<%--  											</c:when>  --%>
<%--  											<c:when  --%>
<%--  												test="${i.housebasicid.star*1.0/i.housebasicid.clickcount ge 2 && i.housebasicid.star*1.0/i.housebasicid.clickcount lt 3}">  --%>
<!--  												<span><img class="images"  -->
<!--  													src="/MountainExploer.com/housecamp/images/bringstar.PNG"></span>  -->
<!--  												<span><img class="images"  -->
<!--  													src="/MountainExploer.com/housecamp/images/bringstar.PNG"></span>  -->
<!--  												<span><img class="images"  -->
<!--  													src="/MountainExploer.com/housecamp/images/blackstar.PNG"></span>  -->
<!--  												<span><img class="images"  -->
<!--  													src="/MountainExploer.com/housecamp/images/blackstar.PNG"></span>  -->
<!--  												<span><img class="images"  -->
<!--  													src="/MountainExploer.com/housecamp/images/blackstar.PNG"></span>  -->
<%--  											</c:when>  --%>
<%--  											<c:when  --%>
<%--  												test="${i.housebasicid.star*1.0/i.housebasicid.clickcount ge 3 && i.housebasicid.star*1.0/i.housebasicid.clickcount lt 4}">  --%>
<!--  												<span><img class="images"  -->
<!--  													src="/MountainExploer.com/housecamp/images/bringstar.PNG"></span>  -->
<!--  												<span><img class="images"  -->
<!--  													src="/MountainExploer.com/housecamp/images/bringstar.PNG"></span>  -->
<!--  												<span><img class="images"  -->
<!--  													src="/MountainExploer.com/housecamp/images/bringstar.PNG"></span>  -->
<!--  												<span><img class="images"  -->
<!--  													src="/MountainExploer.com/housecamp/images/blackstar.PNG"></span>  -->
<!--  												<span><img class="images"  -->
<!--  													src="/MountainExploer.com/housecamp/images/blackstar.PNG"></span>  -->
<%--  											</c:when>  --%>
<%--  											<c:when  --%>
<%--  												test="${i.housebasicid.star*1.0/i.housebasicid.clickcount ge 4 && i.housebasicid.star*1.0/i.housebasicid.clickcount lt 4.8}">  --%>
<!--  												<span><img class="images"  -->
<!--  													src="/MountainExploer.com/housecamp/images/bringstar.PNG"></span>  -->
<!--  												<span><img class="images"  -->
<!--  													src="/MountainExploer.com/housecamp/images/bringstar.PNG"></span>  -->
<!--  												<span><img class="images"  -->
<!--  													src="/MountainExploer.com/housecamp/images/bringstar.PNG"></span>  -->
<!--  												<span><img class="images"  -->
<!--  													src="/MountainExploer.com/housecamp/images/bringstar.PNG"></span>  -->
<!--  												<span><img class="images"  -->
<!--  													src="/MountainExploer.com/housecamp/images/blackstar.PNG"></span>  -->
<%--  											</c:when>  --%>
<%--  											<c:when test="${i.housebasicid.star*1.0/i.housebasicid.clickcount ge 4.8}">  --%>
<!--  												<span><img class="images"  -->
<!--  													src="/MountainExploer.com/housecamp/images/bringstar.PNG"></span>  -->
<!--  												<span><img class="images"  -->
<!--  													src="/MountainExploer.com/housecamp/images/bringstar.PNG"></span>  -->
<!--  												<span><img class="images"  -->
<!--  													src="/MountainExploer.com/housecamp/images/bringstar.PNG"></span>  -->
<!--  												<span><img class="images"  -->
<!--  													src="/MountainExploer.com/housecamp/images/bringstar.PNG"></span>  -->
<!--  												<span><img class="images"  -->
<!--  													src="/MountainExploer.com/housecamp/images/bringstar.PNG"></span>  -->
<%--  											</c:when>  --%>
<%--  										</c:choose>  --%>
<%--  									</p>  星星結束  <c:choose>  --%>
<%--  										<c:when test="${empty i.housebasicid.clickcount}">  --%>
<!--  											<p class="clickcount">無人評分</p>  -->
<%--  										</c:when>  --%>
<%--  										<c:otherwise>  --%>
<%--  											<p class="clickcount">${i.housebasicid.clickcount}人評分過</p>  --%>
<%--  										</c:otherwise>  --%>
<%--  									</c:choose>  --%>
<!--  								</td>  -->
<!--  								<td>  -->
<%--  								<form action="<c:url value='/mountaincCampActOrder/deletecamporder'></c:url>">  --%>
<%--  									<input type="hidden" name="deleteorderid" value="${i.orderid}">  --%>
<!--  									<input type="button" value="刪除"  -->
<!--  										onclick="if(confirm('確認要刪除嗎？')) this.form.submit();">  -->
<!--  								</form>  -->
<!--  								</td>  -->
<!--  							</tr>  -->
<%--  						</c:forEach>  --%>
 <!-- 小屋end --> 

					
						<!-- tbody更改到這邊結束 -->
					</tbody>

				</table>
				<nav class="pageControl">


					<ul style="display: inline-flex;">
						
					</ul>
				</nav>
			</div>




			<!-- 每頁不同的內容到這邊結束 -->
		</div>
	</div>

	<footer id="footer">
		<a>全站導覽</a>
		<button id="demo1">確認demo1</button>
		<button id="demo2">錯誤demo2</button>
		<button id="demo3">確認提醒demo3</button>
		<button id="demo4">多重選項&提醒視窗demo4</button>
		<button id="demo5">Demo5</button>
		<button id="demo6">Demo6</button>



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
<script src="/MountainExploer.com/js/upLoadImg.js"></script>
<!-- 上傳頭像 -->
<script src="/MountainExploer.com/js/table.js"></script>
<script src="/MountainExploer.com/js/topBar.js"></script>
<script src="/MountainExploer.com/js/sweetalert.js"></script>
<!--sweet alert-->
<script src="/MountainExploer.com/js/includejsp.js"></script>
</html>