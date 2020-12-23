<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="javax.naming.Context"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>山中小屋</title>
<link rel="stylesheet" href="/MountainExploer.com/css/other.css">
<link rel="stylesheet" href="/MountainExploer.com/css/font.css">
<link rel="stylesheet" href="/MountainExploer.com/css/style.css">
<link rel="stylesheet"href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<!-- 文杰 trap -->
<link href="/MountainExploer.com/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="/MountainExploer.com/assets/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<link href="/MountainExploer.com/assets/vendor/ionicons/css/ionicons.min.css" rel="stylesheet">
<link href="/MountainExploer.com/assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
<link href="/MountainExploer.com/assets/vendor/venobox/venobox.css" rel="stylesheet">
<link href="/MountainExploer.com/assets/vendor/aos/aos.css" rel="stylesheet">

<script src=" https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/sweetalert2@9.17.2/dist/sweetalert2.min.css"rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<!-- <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> -->
<script src="/MountainExploer.com/member/userTop.js"></script>
<style>
.images {
	width: 18px;
	height: 18px;
}

.clickcount {
	font-size: 20px
}

img{
	transition: all 0.6s;
}

img:hover {
	transform: scale(1.25);
}
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
					src="/MountainExploer.com/images/logo1.png" height="30%"
					width="30%"></a>
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
			<li class="breadcrumb-item"><a href="/MountainExploer.com/mountainHouseAct/actselectAll?page=1&no=1&parkid=">山中小屋</a></li>
			
			<c:if test="${ !empty Member}">
		    		<li style="list-style-type: none;" class="breadcrumb-item ml-auto" ><a  href="/MountainExploer.com/mountainHouseActOrder/selecthouseorder?Member=Member">訂單查詢</a></li>
			</c:if>
		</ol>
	</nav>
		<div class="div_ul p-5">
			<div class="" style="font-size:20px;" >
				<!-- 每頁不同的內容從這裡開始 -->
				<div class="mb-3 p-5  border shadow " style="color : white">
					<nav class="d-flex">

						<div class="ml-3">
							<!-- 控制列表內容從這邊開始 -->
							<form
								action="<c:url value='/mountainHouseAct/actselectAll'></c:url>"
								method='GET'>
								<div class="d-flex align-content-center">
									<select name="parkid" id="selectnPark">
										<option>請選擇國家公園</option>
									</select> <input type="hidden" value="1" name="page" > <input
										type="hidden" value="2" name="no"> <input
										type="submit" class="btn btn-outline-success" style="font-size:20px;" value="查詢">
								</div>
							</form>

						</div>

						<div class="ml-3">
							<form style="margin-left: 25px"
								action="<c:url value='/mountainHouseAct/actselectAll'></c:url>"
								method='get'>
								<input type="hidden" value="1" name="page"> <input
									type="hidden" value="1" name="no"> <input type="hidden"
									value="" name="parkid"> <input type="submit"
									class="btn btn-outline-info" style="font-size:20px;" value="全部觀看">
							</form>
						</div>
						<div class="ml-auto">
							<form class="d-flex"
								action="<c:url value='/mountainHouseAct/actselectHouse'></c:url>"
								method='GET' id="form1" name="form1">
								<input type="button" class="light-table-filter" id="clickbutton" value="一鍵輸入">
								<input type="text" class="light-table-filter" id="clickHousename"
									placeholder="請輸入山中小屋名稱" name="selecthouse">
								<!--                     <img class=imgSearch src="/MountainExploer.com/images/放大鏡.png" alt="" width="35px"> -->
								<input type="image" class=imgSearch
									src="/MountainExploer.com/images/放大鏡.png" width="35px"
									onClick="document.form1.submit()">
								<!-- <button><img class=imgSearch src="/MountainExploer.com/images/放大鏡.png" alt="" width="35px"></button> -->
							</form>
						</div>
					</nav>
					<!-- 控制列表內容到這邊結束 -->



				</div>

				<div class="mt-5 mx-3">
					<!-- datepicker -->


					<!--table-->
					<table class="table table-hover table-striped  " id="tablePreview"
						style="">
						<thead class="bg-success bg-gradient text-white " >
							<tr class="" style="font-size:20px;">
								<!-- thead更改從這邊開始 -->
								<th scope="col" >國家公園</th>
								<th scope="col" >山中小屋</th>
								<th scope="col" >床位數量</th>
								<th scope="col" >露營地數量</th>
								<th scope="col" >海拔</th>
								<th scope="col" >照片</th>
								<th scope="col" >星級</th>
								<!-- thead更改到這邊結束 -->
							</tr>
						</thead>


						<tbody class="">
							<!-- tbody更改從這邊開始 -->
							<c:forEach var="i" items="${House_All}">
								<tr>
									<td>${i.nationalPark.name}</td>
									<td><a href="jumpHouseDesc?selecthouseid=${i.housebasicid}">${i.name}</a></td>
									<td>${i.bed}</td>
									<td>${i.camp}</td>
									<td>${i.height}</td>
									<td class="img"><c:choose>
											<c:when test="${ empty i.imgid.img}">
											<a href="jumpHouseDesc?selecthouseid=${i.housebasicid}">
												<img height="100" width="100"
													src="/MountainExploer.com/housecamp/images/imgnotfound.png">
											</a>
											</c:when>

											<c:when test="${not emptyi.imgid.img}">
												<a href="jumpHouseDesc?selecthouseid=${i.housebasicid}">
												<img height="100" width="100"
													src="<c:url value='/mountainHouseBack/showimg?imgid=${i.imgid.id}'/>">
												</a>
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
								href="actselectAll?parkid=${parkid}&no=${no }&page=1">«第一頁</a></li>
							<c:choose>
								<c:when test="${page <=1 }">
									<li class="li1"><a href="#">‹上一頁</a></li>
								</c:when>
								<c:otherwise>
									<li class="li1"><a
										href="actselectAll?parkid=${parkid}&no=${no }&page=${page-1}">‹上一頁</a></li>
								</c:otherwise>
							</c:choose>
							<li class="li1"><select
								onChange="location = this.options[this.selectedIndex].value">
									<c:forEach var="toPage" begin="1" end="${totalPage}">
										<option
											value="actselectAll?parkid=${parkid}&no=${no }&page=${toPage}"
											<c:if test="${toPage==page}">selected="selected"</c:if>>第${toPage}頁</option>
									</c:forEach>

							</select></li>
							<c:choose>
								<c:when test="${page == totalPage}">
									<li class="li1"><a href="#">下一頁›</a></li>
								</c:when>
								<c:otherwise>
									<li class="li1"><a
										href="actselectAll?parkid=${parkid}&no=${no }&page=${page+1}">下一頁›</a></li>
								</c:otherwise>
							</c:choose>
							<li class="li1"><a
								href="actselectAll?parkid=${parkid}&no=${no }&page=${totalPage}">最末頁»</a></li>
						</ul>
					</nav>
				</div>




				<!-- 每頁不同的內容到這邊結束 -->
			</div>
		</div>

	</div>
	<!-- <footer id="footer" style="padding-top: 100px;background: #00428a;
    padding: 0 0 30px 0;
    color: #eee;
    font-size: 14px;
"
				include-html="/MountainExploer.com/forinclude/includeForFooter.html">
			</footer> -->
		
	<footer id="footer" style="padding-top: 100px"
			include-html="/MountainExploer.com/forinclude/includeForFooter.html">
	</footer>
</body>

<script type="text/javascript">
	$(function(){
		$("#clickbutton").on("click",function(){
			$("#clickHousename").val("攻頂小屋")
						})
		
	})

</script>


<script type="text/javascript">
	$(function() {
		var houseUrl = "/MountainExploer.com/mountainHouseAct";

		$.ajax({
			url : houseUrl + "/nParkAlloption",
			method : "GET",
			dataType : "json",
			success : function(nPark) {
				for (var i = 0; i < nPark.length; i++) {
					$("#selectnPark").append(
							"<option value='" + nPark[i].id + "'>"
									+ nPark[i].name + "</option>")
				}
				// 			let firstArea = $("#selectnPark").find("option").eq(0).val()

			}
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