<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="javax.naming.Context"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>會員 小屋 訂單</title>
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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="/MountainExploer.com/member/userTop.js"></script>

<style>
.order{
	text-align: left; 
	font-size: 20px;
}
.ordertop{
	margin : 10px;
	font-size: 20px;
	color : black;
	font-weight:bold;;
}
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
	<div class="div_ul">
				<div class="secNavbar">
					<nav>
						<ul class="second_nav" style="background-color: #C4E1FF">
		<!-- 更改內容從這邊開始 -->
							<li class="li1"><a href="/MountainExploer.com/mountainHouseAct/actselectAll?page=1&no=1&parkid=">回到查詢列表</a></li>

		<!-- 					<li class="li1"><a href="#">第二導覽列2</a></li> -->

		<!-- 					<li class="li1"><a href="#">第二導覽列3</a></li> -->

<!-- 							<li class="li1"><a href="#">第二導覽列4</a></li> -->
		<!-- 更改內容到這邊結束 -->
						</ul>
					</nav>
				</div>
		<div class="div_li1">
			<!-- 			<a>保留區</a> -->
		</div>
		<div class="div_li3">
			<!-- 			<a>保留區</a> -->
		</div>
		<div class="div_li2">
			<!-- 每頁不同的內容從這裡開始 -->
			
<!-- 訂單star			 -->
			<div class="secDivContent" >
				
				<div><h1>${membername} 的小屋訂單</h1></div>
				<c:forEach var="i" items="${memberhouseorder}">
					
					  <div class="form-group row" style="background-color: white;padding : 15px">
					   
					    	<div style="padding : 15px">
					    		<c:choose>
						    		<c:when test="${empty i.housebasicid.imgid.img }">
										<img height="300px" width="300px"src="/MountainExploer.com/housecamp/images/imgnotfound.png">
									</c:when>
									<c:when test="${not empty i.housebasicid.imgid.img }">
										<img height="300px"width="300px"src="<c:url value='/mountainHouseBack/showimg?imgid=${i.housebasicid.imgid.id}'/>">
									</c:when>
					    		</c:choose>
					    	</div>
					    	<div style="padding : 20px  ;">
							<div class="order"><label class="ordertop">訂單編號 : </label>${i.orderid} <label class="ordertop" style="margin-left:50px">聯絡人: </label>${i.peoplename}</div>
							<div class="order"><label class="ordertop">國家公園 : </label>${i.housebasicid.nationalPark.name}
											   <label class="ordertop" style="margin-left:50px">小屋名稱 : </label><a href="/MountainExploer.com/mountainHouseAct/jumpHouseDesc?selecthouseid=${i.housebasicid.housebasicid}">${i.housebasicid.name}</a>
										<c:choose>
											<c:when
 												test="${(i.housebasicid.star*1.0 / i.housebasicid.clickcount) lt 1 || empty i.housebasicid.star}"> 
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
 												test="${ i.housebasicid.star*1.0/i.housebasicid.clickcount ge 1 && i.housebasicid.star*1.0/i.housebasicid.clickcount lt 2}"> 
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
 												test="${i.housebasicid.star*1.0/i.housebasicid.clickcount ge 2 && i.housebasicid.star*1.0/i.housebasicid.clickcount lt 3}"> 
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
 												test="${i.housebasicid.star*1.0/i.housebasicid.clickcount ge 3 && i.housebasicid.star*1.0/i.housebasicid.clickcount lt 4}"> 
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
 												test="${i.housebasicid.star*1.0/i.housebasicid.clickcount ge 4 && i.housebasicid.star*1.0/i.housebasicid.clickcount lt 4.8}"> 
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
 											<c:when test="${i.housebasicid.star*1.0/i.housebasicid.clickcount ge 4.8}"> 
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
 									
							
							
							
							</div>
							<div class="order"><label class="ordertop">床位數量 : </label>${i.bedamount}床 <label class="ordertop" style="margin-left:50px">營區數量 : </label>${i.campamount}區</div>
							<div class="order"><label class="ordertop">訂單日期 : </label>${i.shoppingdate}</div>
							<div class="order"><label class="ordertop">入住日期 : </label>${i.daterange}</div>
<!-- 							<div> -->
<%-- 								<form action="<c:url value='/mountainHouseActOrder/deletehouseorder'></c:url>">  --%>
<%--  									<input type="hidden" name="deleteorderid" value="${i.orderid}">  --%>
<!--  									<input type="button" value="刪除"  onclick="if(confirm('確認要刪除嗎？')) this.form.submit();">  -->
<!--  								</form>  -->
							
<!-- 							</div> -->
							</div>
						</div>
				</c:forEach>
			</div>
<!-- 訂單end -->
			

					
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

	<footer id="footer"
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