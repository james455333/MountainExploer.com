<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>露營地</title>
<link rel="stylesheet" href="/MountainExploer.com/css/other.css">
<link rel="stylesheet" href="/MountainExploer.com/css/font.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>




<style>
.images {
	width: 25px;
	height: 25px;
}

.topname {
	margin: 50px 45px 40px 5px;
	float: left;
	padding: 50px 0px 40px 5px;
}

.body {
	margin: 20px;
	clear: left;
	width: 500px;
	height: 50px;
}

.counties {
	float: left;
	padding: 0px 20px 40px 50px;
	clear: left;
}
div{margin: 20px;}
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
		<!--         <div class="secNavbar"> -->
		<!--             <nav> -->
		<!--                 <ul class="second_nav"> -->
		<!--                     <li class="li1"><a href="#">第二導覽列1</a></li> -->

		<!--                     <li class="li1"><a href="#">第二導覽列2</a></li> -->

		<!--                     <li class="li1"><a href="#">第二導覽列3</a></li> -->

		<!--                     <li class="li1"><a href="#">第二導覽列4</a></li> -->
		<!--                 </ul> -->
		<!--             </nav> -->
		<!--         </div> -->
		<div class="div_li1">
			<!--             <a>保留區</a> -->
		</div>
		<div class="div_li3">
			<!--             <a>保留區</a> -->
		</div>
		<div class="div_li2">
			<!-- 每頁不同的內容從這裡開始 -->


			<div class="secDivContent">

				<!--    新增訂單   	inserorder -->

				<form	action="<c:url value='/mountaincCampActOrder/insercamporder'></c:url>"
					method='get'>
					<div class="forImage">

						<c:forEach var="i" items="${list}">

							<c:choose>
								<c:when test="${ empty i.campimgid.img}">
									<img style="height: 80%"
										src="/MountainExploer.com/housecamp/images/campnull.PNG">
								</c:when>
								<c:when test="${not empty i.campimgid.img}">
									<img style="height: 80%"
										src="<c:url value='/mountainCampBack/showimg?imgid=${i.campimgid.id}'/>">
								</c:when>
							</c:choose>

							<h2 style="padding: 10px">
								<input type="hidden" name="camporder_campid"
									value="${i.campbasicid}">${i.name}</h2>
						</c:forEach>

					</div>
					<!-- 右邊 -->
<!-- 					<div class="forFrom "></div> -->
					<!-- 左邊 -->
					<div class="secDivContent ">
						<!-- 訂單填寫 -->
						<div align="left"><h4>
							<c:forEach var="j" items="${list}">
								<!-- 訂房日期 -->
								<div><h5>${j.counties.area.name}&nbsp${j.counties.name}&nbsp${j.name}</h5></div>
								<div>
									入住時間 : <input type="hidden" name="camporder_bookdate" value="${selectdate}"><a style="color: blue">${selectdate}</a>&nbsp&nbsp 共 ${bookneight} 晚
										<input type="hidden" id="shoppingdate" name="camporder_shoppingdate" size="45" readonly>
								</div>
								
								<div>
									預定營區數 :&nbsp <input type="hidden" name="camporder_amount" value="${amount}">${amount}區
								</div><div>
									價錢 :&nbsp <input type="hidden" name="camporder_price" value="${totalprice}">TWD&nbsp:&nbsp${totalprice}
								</div>
								
								<div>
									姓名 : <input type="text" name="camporder_peoplename" value="我是誰">
								<div></div>
									電話 : <input type="text" name="camporder_cellphone" value="0912345678">
								</div>
								<div>
									特別要求 :
								</div> 
								<div><textarea rows="4" cols="50" name="camporder_textsuggest"></textarea></div>

								<input type="submit" value="送出">
							</c:forEach>
						</h4></div>

					</div>
				</form>
			</div>




			<!-- 每頁不同的內容到這裡結束 -->
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

	<!-- 日曆     -->
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
	<link rel="stylesheet" type="text/css"
		href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

	<script type="text/javascript">
		$("#from").daterangepicker(
				{
					//     "singleDatePicker": true,
					"autoApply" : true,
					"locale" : {
						"format" : "YYYY年MM月DD日",
						"separator" : " - ",
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

		$("#shoppingdate").daterangepicker(
				{
				    "singleDatePicker": true,
					"startDate" : 0,
					"locale" : {
						"format" : "YYYY年MM月DD日",
						"separator" : " - ",
						"applyLabel" : "確認",
						"cancelLabel" : "取消",
						"customRangeLabel" : "自訂義範圍",
						"daysOfWeek" : [ "日", "一", "二", "三", "四", "五", "日" ],
						"monthNames" : [ "1 月", "2 月", "3 月", "4 月", "5 月",
								"6 月", "7 月", "8 月", "9 月", "10 月", "11 月",
								"12 月" ],
						"firstDay" : 1
					},
				});
	</script>
	<!--     日曆end -->
</body>

<script src="/MountainExploer.com/js/upLoadImg.js"></script>
<!-- 上傳頭像 -->
<script src="/MountainExploer.com/js/table.js"></script>
<script src="/MountainExploer.com/js/topBar.js"></script>
<script src="/MountainExploer.com/js/sweetalert.js"></script>
<!--sweet alert-->
<script src="/MountainExploer.com/js/includejsp.js"></script>
</html>