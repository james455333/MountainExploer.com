<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>岳進者小屋</title>
<link rel="stylesheet" href="/MountainExploer.com/css/other.css">
<link rel="stylesheet" href="/MountainExploer.com/css/font.css">
<link rel="stylesheet" href="/MountainExploer.com/css/style.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
 <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
  />	
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
.tips {
	width: 100%;
	font-size: 88%;
	background: #DEFFFF;
}

.images {
	width: 25px;
	height: 25px;
}

.topname {
	margin: 50px 45px 40px 5px;
	padding: 50px 0px 40px 5px;
}

.body {
	margin: 20px;
	clear: left;
	width: 90%;
	height: 100%;
	text-align: left;
}

.counties {
	float: left;
	padding: 0px 20px 40px 50px;
	clear: left;
}

img {
	transition: all 0.6s;
}


.forFrom {
	float: none;
}

.forText {
	width: 100%;
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
	<div class="div_ul">
<!-- 		<div class="secNavbar"> -->
<!-- 			<nav> -->
<!-- 				<ul class="second_nav"> -->
<!-- 					<li class="li1"><a -->
<!-- 						href="/MountainExploer.com/mountainHouseAct/actselectAll?page=1&no=1&parkid=">首頁</a></li> -->
<%-- 					<c:if test="${ !empty Member}"> --%>
<!-- 						<li class="li1"><a -->
<!-- 							href="/MountainExploer.com/mountainHouseActOrder/selecthouseorder?Member=Member">訂單查詢</a></li> -->
<%-- 					</c:if> --%>
<!-- 					                    <li class="li1"><a href="#">第二導覽列3</a></li> -->

<!-- 					                    <li class="li1"><a href="#">第二導覽列4</a></li> -->
<!-- 				</ul> -->
<!-- 			</nav> -->
<!-- 		</div> -->
		<nav style="font-size: 20px;" aria-label="breadcrumb">
		  <ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="/MountainExploer.com">首頁</a></li>
		    <li class="breadcrumb-item"><a href="/MountainExploer.com/mountainHouseAct/actselectAll?page=1&no=1&parkid=">山中小屋</a></li>
			    <c:forEach var="i" items="${selecthouseid}">
			   		<li class="breadcrumb-item active" aria-current="page">${i.name}</li>
			    </c:forEach>
			    	
				    	<c:choose>
					    	<c:when test="${empty Member}">
												
						    	<li style="list-style-type: none" class="breadcrumb-item  swalLogin" >
									<a href="#">現在預定房間</a>
								</li>
							</c:when>
					    	<c:otherwise>
						  		<li style="list-style-type: none" class="breadcrumb-item" >
									<a href="#from">現在預定房間</a>
								</li>
					    	</c:otherwise>
				    	</c:choose>
					
			    <c:if test="${ !empty Member}">
		    		<li style="list-style-type: none;" class="breadcrumb-item ml-auto" ><a  href="/MountainExploer.com/mountainHouseActOrder/selecthouseorder?Member=Member">訂單查詢</a></li>
				</c:if>
								
		  </ol>
		</nav>
		<div class="div_li1">
			<!--             <a>保留區</a> -->
		</div>
		<div class="div_li3">
			<!--             <a>保留區</a> -->
		</div>
		<div class="div_li2">
			<!-- 每頁不同的內容從這裡開始 -->
			

			<div class="mt-5">

				<!--                 <div class="forImage"> -->
				<!--                     <img src="/MountainExploer.com/images/BGI.jpg" alt="" class="forImagesImg"> -->
				<!--                     調整參考網址 https://segmentfault.com/q/1010000018971940 -->
				<!--                 </div> -->
				<!-- 左邊 -->
				<div class="border shadow bg-white p-5">
					
					<div class="d-flex shadow border" id="tostar">
								
					
						<c:forEach var="i" items="${selecthouseid}">
							<div style="margin: 30px 0px 30px 30px">
								<c:choose>
									<c:when test="${ empty i.imgid.img}">
										<div><img height="500" width="500"
											src="/MountainExploer.com/housecamp/images/imgnotfound.png"></div>
									</c:when>
									<c:when test="${not empty i.imgid.img}">
										<div><img height="500" width="500"
											src="<c:url value='/mountainHouseBack/showimg?imgid=${i.imgid.id}'/>"></div>
									</c:when>
								</c:choose>
							</div>
						</c:forEach>
								<div style="margin: 30px 80px 30px 0px">
									<img height="250" width="350"
											src="/MountainExploer.com/housecamp/images/housebed.jpg">
									<img height="250" width="350"
											src="/MountainExploer.com/housecamp/images/housecampbig.jpg">
								
								</div>
								
								
								
							

					</div>
					<div class="row mt-5">
						
						
						<div class="col-6">
						<div>
								<c:forEach var="i" items="${selecthouseid}">
									
									<div class="body">
								<div class="body">
									<h2>${i.nationalPark.name}</h2>
									<h3>${i.name}</h3>
								</div>
								<div class="body">@ 海拔高度 : ${i.height}</div>
								<div class="body">@ 山屋總床位 : ${i.bed} 床</div>
								<div class="body">@ 營地總數量 : ${i.camp} 區</div>
								<div class="body" id="">
									@ 備註 :
									<div class="body border p-3"
										style="height: 100%;width:100%'">
										<div id="date" style="margin: 5px">${i.desc}</div>
									</div>
								</div>
							</div>								

								</c:forEach>
						</div>
							</div>
							<!-- 評價 -->
						
						<div class="col-sm-6 d-flex ">
							<div>
							
							<!-- 				印星星		 -->
							<div>

								<c:forEach var="j" items="${selecthouseid}">
									<div class="" >
										<c:choose>
											<c:when
												test="${(j.star*1.0 / j.clickcount) lt 1 || empty j.star}">
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
												test="${ j.star*1.0/j.clickcount ge 1 && j.star*1.0/j.clickcount lt 2}">
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
												test="${j.star*1.0/j.clickcount ge 2 && j.star*1.0/j.clickcount lt 3}">
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
												test="${j.star*1.0/j.clickcount ge 3 && j.star*1.0/j.clickcount lt 4}">
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
												test="${j.star*1.0/j.clickcount ge 4 && j.star*1.0/j.clickcount lt 4.8}">
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
											<c:when test="${j.star*1.0 / j.clickcount ge 4.8}">
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

										<c:choose>
											<c:when test="${j.clickcount <= 0 || empty j.clickcount}">(0人評分過)</c:when>
											<c:otherwise>(${j.clickcount }人評分過)</c:otherwise>
										</c:choose>

										<div>
											<c:choose>
												<c:when test="${empty j.star}">(無人評分)</c:when>
												<c:otherwise>
												(平均<fmt:formatNumber type="number"
														value="${j.star*1.0 / j.clickcount} "
														maxFractionDigits="1" />分)		
												</c:otherwise>
											</c:choose>
											<div style="margin: 10px">
												<form
													action="<c:url value='/mountainHouseAct/jumpupdatestart'></c:url>"
													method="get">
													<input type="hidden" name="selecthouseid"
														value="${j.housebasicid}">
													<c:choose>
														<c:when test="${empty Member}">
															<input type="button"
																class="swalLogin btn btn-primary py-2 px-3" value="評分">
														</c:when>
														<c:otherwise>
															<!-- 											<input type="submit" value="評分"> -->
															<a href="#" data-toggle="modal" data-target="#showMap"
																data-whatever="${j.housebasicid}"
																class="btn btn-primary py-2 px-3">評分</a>

														</c:otherwise>
													</c:choose>


												</form>

											</div>
										</div>
	<!-- 	星星評分		 -->
										<div class="modal fade" id="showMap" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel"
											aria-hidden="true">
											<div class="modal-dialog modal-dialog-centered"
												role="document">
												<div class="modal-content" style="width: 640px">
													<div class="modal-header">
														<h5 class="modal-title" id="exampleModalLabel">您今天看起來</h5>
														<button type="button" class="close" data-dismiss="modal"
															aria-label="Close">
															<span aria-hidden="true">&times;</span>
														</button>
													</div>
													<div class="modal-body" id="mapHere" style="width: 640px">
														<form id="star"
															action="<c:url value='/mountainHouseAct/updatestar#tostar'></c:url>"
															method='GET'>
															<span><img id="img1" class="images"
																src="/MountainExploer.com/housecamp/images/blackstar.PNG" />
																<img id="img2" class="images"
																src="/MountainExploer.com/housecamp/images/blackstar.PNG" />
																<img id="img3" class="images"
																src="/MountainExploer.com/housecamp/images/blackstar.PNG" />
																<img id="img4" class="images"
																src="/MountainExploer.com/housecamp/images/blackstar.PNG" />
																<img id="img5" class="images"
																src="/MountainExploer.com/housecamp/images/blackstar.PNG" />
															</span> <input type="hidden" name="updatestar" value="${j.star}">
															
															<input type="hidden" name="updateclick"
																value="${j.clickcount}"> <input type="hidden"
																name="updateid" value="${j.housebasicid}"> 
															<input type="submit" value="送出">
															
														</form>
													</div>
													<div class="modal-footer">

														<button type="button" class="btn btn-secondary"
															data-dismiss="modal">關閉</button>
													</div>
												</div>
											</div>
										</div>


									</div>
								</c:forEach>
								<!-- 星星end -->
							</div>
							<div class="tips m-3 "">
							
								<div style="margin: 100px 0 0 0; text-align: left;">
									<div style="margin: 10px">◎登山的好選擇</div>
									<div style="margin: 10px">◎宿營地內請以簡易器具炊煮，禁止野炊、烤肉或燃火等行為。</div>
									<div style="color: #AA0000; margin: 10px">◎所有裝備 (
										睡袋與登山裝備等 ) 及餐飲皆需自行攜帶準備。</div>
									<div style="margin: 10px">◎所有客房禁菸</div>	
								</div>
								
							</div>
						</div>
					</div></div>
				</div>
				<!-- 		下框 -->
				<div class="my-5" >
					<div class="p-3 bg-white shadow"
						style="height: 125px">
						<h3 style="">查詢住宿日期</h3>
						<form action="<c:url value='/mountainHouseActOrder/selectamount#date'></c:url>">

							<c:forEach var="i" items="${selecthouseid}">
								<!--       小屋編號          			 -->
								<input type="hidden" name="selecthouseid"
									value="${i.housebasicid}">
							</c:forEach>
							<div>
								入住時間 : <input type="text" id="from" name="select_bookdate"
									size="45" readonly>

								<c:choose>
									<c:when test="${empty Member}">
										<input type="button" class="swalLogin btn btn-outline-info"
											value="查詢">
									</c:when>
									<c:otherwise>

										<input type="submit" class="btn btn-outline-info"
											style="color: white; background-color: #0066FF;" value="查詢">

									</c:otherwise>
								</c:choose>
							</div>
						</form>
					</div>
					<!-- 	顯示查詢日期			                			 -->
					<div class="mb-3">
						<form
							action="<c:url value='/mountainHouseActOrder/orderjump#orderdesc'></c:url>">
							<c:forEach var="i" items="${house}">
								<input type="hidden" name="orderjump_houseid"
									value="${i.housebasicid}">
								<input type="hidden" name="orderjump_bookdate"
									value="${selectdate}">
								<div style="background-color:#ECFFFF ;border:3px #cccccc solid;">
									<h2>${selectdate}</h2>
									<h4>
										共選了 <a style="color: #5599FF">${bookneight}</a> 天
									</h4>
								</div>

								<table class="order-table table table-hover" id="tablePreview"
									style="background-color: white;">
									<thead class="order-table-th">
										<tr>
											<th scope="col">岳進者休息區</th>
											<th scope="col">價格</th>
											<th scope="col">選擇數量</th>
											<th scope="col">總共金額</th>
										</tr>
									</thead>

									<tbody class="order-table-tb">
										<tr>
											<td class="img"><c:choose>
													<c:when
														test="${leftcampamount <= 10 && leftcampamount >= 1}">
														<p style="color: red">*&nbsp營地剩餘
															${leftcampamount}區&nbsp*</p>
													</c:when>
													<c:when test="${leftcampamount <= 0}">
														<p style="color: red">無剩餘區域&nbsp!!</p>
													</c:when>
													<c:when test="${leftcampamount > 10}">
														<p style="color: blue">營地還有${leftcampamount}區</p>
													</c:when>
												</c:choose> <img class="animate__animated animate__lightSpeedInRight animate__delay-1s" style="height: 60%"
												src="/MountainExploer.com/housecamp/images/housecampsmall.jpg">
											</td>

											<td>TWD.${i.campprice}</td>
											<td>
												<select id="campleftamount" name="orderjump_campamount"></select>
											
											</td>

											<td><input type=text readonly style="width:100%;"
												class=" border-0 text-dark" name="orderjump_totelprice"
												id="houseorderprice" required="required">
											
												<p>
													<input id="ordersubmit" class="btn btn-outline-success"  style="width: 100%"
														type="button" value="立即下訂" >
												</p>
											
												</td>
										</tr>

										<tr>
											<td class="img"><c:choose>
													<c:when test="${leftbedamount <= 10 && leftbedamount >= 1}">
														<p style="color: red">*&nbsp床位剩餘${leftbedamount}區&nbsp*</p>
													</c:when>
													<c:when test="${leftbedamount <= 0}">
														<p style="color: red">無剩餘床位&nbsp!!</p>
													</c:when>
													<c:when test="${leftbedamount > 10}">
														<p style="color: blue">床位還有${leftbedamount}床</p>
													</c:when>
												</c:choose> <img class="animate__animated animate__lightSpeedInRight animate__delay-2s" style="height: 60%"
												src="/MountainExploer.com/housecamp/images/bedsmall.jpg">
											</td>

											<td>TWD.${i.bedprice}</td>
											<td><select id="bedleftamount"
												name="orderjump_bedamount"></select></td>

										</tr>

									</tbody>

								</table>

							</c:forEach>

						</form>
					</div>
					<div >
						<c:forEach var="i" items="${selecthouse}">

							<table class="order-table table table-hover" id="tablePreview"
								style="background-color: white;">
								<thead class="order-table-th">
									<tr>
										<th scope="col">岳進者休息區</th>
										<th scope="col"></th>

									</tr>
								</thead>

								<tbody class="order-table-tb">
									<tr>
										<td><img alt=""
											src="/MountainExploer.com/housecamp/images/bedsmall.jpg">
											<p>TWD.&nbsp${i.bedprice}</p></td>

										<td><img alt=""
											src="/MountainExploer.com/housecamp/images/housecampsmall.jpg">

											<p>TWD.&nbsp${i.campprice}</p></td>
									</tr>
								</tbody>
							</table>
							<div>
								<h2 style="color:">
									<a href="#from" >請先查詢住宿日期</a>
								</h2>
							</div>
						</c:forEach>
					</div>
					<!--下框end-->
				</div>

			</div>




			<!-- 每頁不同的內容到這裡結束 -->
		</div>
	</div>

	<footer id="footer" style="padding: 100px"
			include-html="/MountainExploer.com/forinclude/includeForFooter.html">
	</footer>


	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
	<link rel="stylesheet" type="text/css"
		href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />


	<script type="text/javascript">
  
		var dateRangePicker = $("#from").daterangepicker(
				{ //  "singleDatePicker": true,
					"autoApply" : true,
					"maxSpan" : {
						"days" : 7
					},
					"minDays" : 2,

					"locale" : {
						"format" : "YYYY年MM月DD日",
						"separator" : " ~ ",
						"applyLabel" : "確認",
						"cancelLabel" : "取消",
						"customRangeLabel" : "自訂義範圍",
						"daysOfWeek" : [ "日", "一", "二", "三", "四", "五", "日" ],
						"monthNames" : [ "1 月", "2 月", "3 月", "4 月", "5 月",
								"6 月", "7 月", "8 月", "9 月", "10 月", "11 月",
								"12 月" ],
						"firstDay" : 1
					},
					"startDate" : 0,
					"endDate" : moment().subtract(-1, 'days'),
					"minDate" : moment(),
					"maxDate" : moment().subtract(-6, 'month')
				});

		$("#from").on("apply.daterangepicker",function(){
			console.log( $(this).val())
			})
	</script>

	<script type="text/javascript">

		$(document).ready(
						function() {
							var campleftamount = "${leftcampamount}";
							if (campleftamount >= 10) {
								campleftamount = "10"
							}
							;

							var bedleftamount = "${leftbedamount}";
							if (bedleftamount >= 10) {
								bedleftamount = "10"
							}
							;
							var houseid = "${houseid}";
							var bedprice = "${bedprice}";
							var campprice = "${campprice}";
							var bookneight = "${bookneight}";

							var orderhouse = "/MountainExploer.com/mountainHouseActOrder";

							

							

							$.ajax({
								url : orderhouse
										+ "/orderhousebedamount",
								method : "GET",
								data : {"selecthouseid":houseid},
								dateType : "json",
								success : function(order) {
									for (var i = 0; i <= campleftamount; i++) {
										$("#campleftamount").append(
												"<option value='"+ i +"'>" + i+ "&nbsp&nbsp&nbsp"+ "(" + "TWD:" + i
														* campprice + ")"
														+ "</option>"
														)

												
									}
									for (var i = 0; i <= bedleftamount; i++) {
										$("#bedleftamount").append(
												"<option value='"+ i +"'>" + i
														+ "&nbsp&nbsp&nbsp"
														+ "(" + "TWD:" + i
														* bedprice + ")"
														+ "</option>")

									}

									// 	let str = $("#campleftamount").find("option").eq(0).val();
								}
							})
							$("#campleftamount").change(
									function() {
										var str = $("#campleftamount").val();
										var stt = $("#bedleftamount").val();

										$("#houseorderprice").empty();
										var houseorderprice =	$("#houseorderprice").val(
												(campprice * str + bedprice
														* stt)
														* bookneight)

														if($("#houseorderprice").val().length <= 1 || $("#houseorderprice").val() <= 0){
															$("#houseorderprice").val(""); }

									})
							$("#bedleftamount").change(
									function() {
										var str = $("#campleftamount").val();
										var stt = $("#bedleftamount").val();
										$("#houseorderprice").empty();
				
								$("#houseorderprice").val(
												(campprice * str + bedprice
														* stt)
														* bookneight)
										
										if($("#houseorderprice").val().length <= 1 || $("#houseorderprice").val() <= 0){
												$("#houseorderprice").val(""); }

									})
// 							$("#ordersubmit").on("click",function(){
// 								if($("#houseorderprice").val().length <= 1){
// 									alert("請選擇一間房");
// 									return false;
// 										}else{
// 											$(this).submit();}
// 								})		
								
								
								$("#ordersubmit").on("click",function() {
									if($("#houseorderprice").val().length <= 1){
										Swal.fire({
											  icon: 'error',
											  title: '請選擇一間房',
											 
											})
	 										}else{
	 											
	 										 $(this).parents('form').submit();
	 											}
									});
								
										
													
							// 	$('#showMap').on('show.bs.modal', function (event) {
							// 	var aHref = $(event.relatedTarget);
							// 	var houseid = aHref.data('whatever');
							// 	$.ajax({
							// 		url : orderhouse+"/selecthouseidtostar?selecthouseid=" + houseid,
							// 		type : "GET",
							// 		data : {"houseid" : houseid},
							// 		datatype : "json",
							// 		success : function(data, status) {
							// 			$("#mapHere").html(data);

							// 		},
							// 		error : function(data, status) {
							// 			$("#mapHere").html(data);
							// 			console.log(data)
							// 		}
							// 	});			
							// 	})						

						})
	</script>
	<script>
	
		let index;

		$("#img1")
				.click(
						function() {
							$(this)
									.attr("src",
											"/MountainExploer.com/housecamp/images/bringstar.PNG");
						})
				.click(
						function() {
							$("#img5,#img4,#img3,#img2")
									.attr("src",
											"/MountainExploer.com/housecamp/images/blackstar.PNG");
						}).val()

		$("#img2")
				.click(
						function() {
							$("#img2,#img1")
									.attr("src",
											"/MountainExploer.com/housecamp/images/bringstar.PNG");
						})
				.click(
						function() {
							$("#img5,#img4,#img3")
									.attr("src",
											"/MountainExploer.com/housecamp/images/blackstar.PNG");
						})

		$("#img3")
				.click(
						function() {
							$("#img3,#img2,#img1")
									.attr("src",
											"/MountainExploer.com/housecamp/images/bringstar.PNG");
						})
				.click(
						function() {
							$("#img5,#img4")
									.attr("src",
											"/MountainExploer.com/housecamp/images/blackstar.PNG");
						})

		$("#img4")
				.click(
						function() {
							$("#img4,#img3,#img2,#img1")
									.attr("src",
											"/MountainExploer.com/housecamp/images/bringstar.PNG");
						})
				.click(
						function() {
							$("#img5")
									.attr("src",
											"/MountainExploer.com/housecamp/images/blackstar.PNG");
						})

		$("#img5")
				.click(
						function() {
							$("#img5,#img4,#img3,#img2,#img1")
									.attr("src",
											"/MountainExploer.com/housecamp/images/bringstar.PNG");
						})

		$(document).ready(
				function() {
					$("img").click(function() {
						index = $(this).index()
					});
					$("#star")
							.on(
									"submit",
									function(e) {

										let originStarV = $(
												"input[name='updatestar']")
												.val()
										let originCount = $(
												"input[name='updateclick']")
												.val()
										$("input[name='updatestar']").val(
												Number(originStarV)
														+ Number(index + 1))
										$("input[name='updateclick']")
												.val(
														Number(originCount)
																+ Number(1))
										// 		e.preventDefault(); // 不會送出submit
									})

				});
	</script>
	
	
	<script type="text/javascript">
	  var count = 1;
	    var countEl = document.getElementById("count");
	    function plus(){
	        count++;
	        countEl.value = count;
	    }
	    function minus(){
	      if (count > 1) {
	        count--;
	        countEl.value = count;
	      }  
	    }
	</script>

</body>

<script src="/MountainExploer.com/js/swalLogin.js"></script>
<script src="/MountainExploer.com/js/upLoadImg.js"></script>
<!-- 上傳頭像 -->
<script src="/MountainExploer.com/js/table.js"></script>
<script src="/MountainExploer.com/js/topBar.js"></script>
<script src="/MountainExploer.com/js/sweetalert.js"></script>
<!--sweet alert-->
<script src="/MountainExploer.com/js/includejsp.js"></script>
</html>