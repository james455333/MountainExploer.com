<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="zh-tw">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>岳進者 - 活動</title>
<!-- public -->
<link rel="stylesheet" href="/MountainExploer.com/css/other.css">
<link rel="stylesheet" href="/MountainExploer.com/css/font.css">
<!-- for this page -->
<link rel="stylesheet"
	href="/MountainExploer.com/mountain/css/mountain.css">
<link rel="stylesheet"
	href="/MountainExploer.com/mountain/act/list/list.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<!-- Bootstrap core CSS -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css"
	rel="stylesheet">
<!-- JQuery UI -->
<link rel="stylesheet"
	href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">

<!-- JQuery -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Bootstrap tooltips -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.min.js"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.0/js/mdb.min.js"></script>
<!-- sweetalert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- daterangepicker -->
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<!-- for this page -->
<script src="/MountainExploer.com/mountain/js/mountain.js"></script>
<script src="act/list/listFunction.js"></script>
<script src="act/list/list.js"></script>
<!-- active method -->
<script src="/MountainExploer.com/js/login.js "></script>
<!-- Login Dialog -->
<script src="//code.jquery.com/jquery-1.9.1.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
</head>


<body>


	<div class="count1">
		<div class="count1_img">
			<img src="/MountainExploer.com/images/logo1.png">
			<hr>
			<h1 class="font">岳進者</h1>
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
		<div class="secNavbar" include-html="fragment/secondNav.html"></div>
		<div class="div_li1"></div>
		<div class="div_li3"></div>
		<div class="div_li2">
			<!-- 每頁不同的內容從這裡開始 -->


			<div class="searchBar m-list-searchBar">
				<nav>
					<ul class="third_nav">
						<!-- 控制列表內容從這邊開始 -->
						<li>活動標籤: <select name="aTag">
								<option value="0" selected disabled>請選擇活動標籤</option>
								<option value="0">預設顯示</option>
								<option value="1">新活動</option>
								<option value="2">熱門活動</option>
								<option value="3">歷史活動</option>
						</select></li>

						<li>報名標籤: <select name="rTag">
								<option value="0" selected disabled>請選擇報名標籤</option>
								<option value="0">預設顯示</option>
								<option value="6">尚可報名</option>
								<option value="8">報名將滿</option>
								<option value="7">報名將截止</option>
								<option value="5">報名已滿</option>
								<option value="4">報名截止</option>

						</select></li>
						<li>本次查詢總筆數 :</li>
						<!-- 控制列表內容到這邊結束 -->
					</ul>
				</nav>
				<form action="list" id="m-sr-form">
					<div class="search">
						<input type="hidden" name="page" value="1" readonly> <input
							type="hidden" name="od" value="3" readonly> 搜尋：<input
							name="search" type="search" class="light-table-filter"
							placeholder="請輸入活動名稱">
						<button>
							<img class=imgSearch src="/MountainExploer.com/images/放大鏡.png"
								alt="" width="35px">
						</button>
					</div>
				</form>
			</div>
			<nav class="pageControl">
				<ul>
					<li class="li1"><a href="#">«第一頁</a></li>
					<li class="li1"><a href="#">‹上一頁</a></li>
					<li class="li1"><a href="#"></a></li>
					<li class="li1"><a href="#">下一頁›</a></li>
					<li class="li1"><a href="#">最末頁»</a></li>
				</ul>
			</nav>

			<div class="m-sdc-adj">
				<!-- btn -->

				<div id="btn-newpost" class="btn-group btn-group-lg" role="group">
					<button class="list-newPost btn btn-secondary" type="button">
						發起活動 <i class="fa fa-pencil-square-o"></i>
					</button>
				</div>
				<!--table-->
				<table class="order-table m-ta-aj">
					<thead class="order-table-th">
						<tr>
							<!-- thead更改從這邊開始 -->
							<th scope="col">活動預覽圖</th>
							<th scope="col" class="d-li-na">活動名稱</th>
							<th scope="col">發布時間 / 默認排序</th>
							<th scope="col">目前人數 / 人數上限</th>
							<th scope="col">報名截止日</th>
							<th scope="col">最新回應</th>
							<!-- thead更改到這邊結束 -->
						</tr>
					</thead>
					<tbody class='order-table-tb hideTbody'>
						<tr>
							<td><a href=""> <img class='showImage'> <img
									class='extendImage' src="">
							</a></td>
							<td><a class="m-tb-ti" href=""></a></td>
							<td><a href=""></a></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</tbody>
				</table>

			</div>
			<nav class="pageControl">
				<ul>
					<li class="li1"><a href="#">«第一頁</a></li>
					<li class="li1"><a href="#">‹上一頁</a></li>
					<li class="li1"><a href="#"></a></li>
					<li class="li1"><a href="#">下一頁›</a></li>
					<li class="li1"><a href="#">最末頁»</a></li>
				</ul>
			</nav>
			<!-- 每頁不同的內容到這裡結束 -->
		</div>
	</div>
	<div>
		<div id="dialog-form" title="登入/註冊">
			<div id="login-div" class="ui-dialog">
				<div class="login-body" id="login-panel">
					<table class="logintable" style="margin: 0 auto; width: 250px">
						<tbody>
							<tr style="text-align: right;">
								<th>帳號:</th>
								<td><div>
										<input id="account" name="account" type="text"
											style="width: 200px; border: 1px #ABADB3 solid; padding: 5px 3px 5px;">
									</div></td>
							</tr>
							<tr style="text-align: right;">
								<th>密碼:</th>
								<td>
									<div>
										<input id="password" type="password"
											style="width: 200px; border: 1px #ABADB3 solid; padding: 5px 3px 5px;">
									</div>
								</td>
							</tr>
							<tr>
								<th></th>
								<td>
									<div>
										<a href="#">忘記密碼</a>
									</div>
								</td>
							</tr>
							<tr>
								<th></th>
								<td>
									<div>
										<label> 記住我<input id="rememberMe" type="checkbox"
											name="rememberme" style="float: left;">
										</label>
									</div>

								</td>
							</tr>
						</tbody>
					</table>
					<br>
					<div style="text-align: center;">
						立即<a href="#" style="color: blue;">註冊</a>新帳號
					</div>
				</div>
			</div>
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
<!-- 設置頁面參數 -->
<script src="../js/upLoadImg.js"></script>
<!-- 上傳頭像 -->
<script src="../js/table.js"></script>
<!--sweet alert-->
<script src="../js/topBar.js"></script>
<script src="../js/sweetalert.js"></script>
<script src="../js/includejsp.js"></script>
<!--sweet alert-->
</html>