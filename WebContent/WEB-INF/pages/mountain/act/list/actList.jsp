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
	<link rel="stylesheet" href="/MountainExploer.com/mountain/css/mountain.css">
	<link rel="stylesheet" href="/MountainExploer.com/mountain/act/list/list.css">
	<!-- bootstrap 4 core -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<!-- Font Awesome -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
	<!-- Bootstrap core CSS -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet">
	<!-- JQuery UI -->
	<link rel="stylesheet" href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
	
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
	<!-- jquery loading -->
	<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery-easy-loading/1.3.0/jquery.loading.min.js'></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery-loading-overlay/2.1.7/loadingoverlay.min.js'></script>
	<!-- daterangepicker -->
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
	<!-- active method -->
	<!-- Login Dialog -->
<!-- 	<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script> -->
	<!-- jquery.blockUI -->
	<script src="http://malsup.github.io/jquery.blockUI.js"></script>
	<!--  active progressBar + jquery-loading -->
	<script src="/MountainExploer.com/js/loading.js"></script>
	<!-- for this page -->
	<script src="/MountainExploer.com/mountain/js/mountain.js"></script>
	<script src="act/list/listFunction.js"></script>
	<script src="act/list/list.js"></script>
<!-- 	<script src="/MountainExploer.com/js/blockUI.js"></script> -->

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
	<div class="div_ul" id="text-loading">
		<div class="secNavbar" include-html="fragment/secondNav.html"></div>
		<div class="div_li1"></div>
		<div class="div_li3"></div>
		<div class="div_li2">
			<!-- 每頁不同的內容從這裡開始 -->
			<nav>
				<ol class="breadcrumb" id="bc">
					<li class="breadcrumb-item"><a href="/MountainExploer.com">首頁</a></li>
					<li class="breadcrumb-item active">活動討論區</li>
				</ol>
			</nav>

			<div style="border: 5px" class="m-list-searchBar bg-light rounded m-0 py-2 px-1">
				<div class="d-flex">
						<!-- 控制列表內容從這邊開始 -->
						<div class="d-flex align-items-center mx-1">
							<div class="input-group ">
								<div class="input-group-prepend">
								   <label class="input-group-text  text-primary" for="aTag-select">活動狀態</label>
								</div>
									<select id="aTag-select" name="aTag" class="custom-select">
										<option value="0" selected disabled>請選擇活動標籤</option>
										<option value="0">預設顯示</option>
										<option value="1">新活動</option>
										<option value="2">熱門活動</option>
										<option value="3">歷史活動</option>
									</select>
							</div>
						</div>
						<div class="align-items-center mx-1">
							<div class="input-group">
								<div class="input-group-prepend">
								   <label class="input-group-text text-primary" for="rTag-select">報名狀態</label>
								</div>
									<select id="rTag-select" name="rTag" class="custom-select">
										<option value="0" selected disabled>請選擇報名標籤</option>
										<option value="0">預設顯示</option>
										<option value="6">尚可報名</option>
										<option value="8">報名將滿</option>
										<option value="7">報名將截止</option>
										<option value="5">報名已滿</option>
										<option value="4">報名截止</option>
									</select>
							</div>
						</div>
						<div class="d-inline-flex align-items-center mx-1">查詢筆數 :</div>
						<div class="align-items-center ml-auto">
							<div >
								<form action="list" id="m-sr-form">
									<div style="position: static" class="search d-inline-flex">
										<button class="btn btn-outline-success">
											<i class="fas fa-search pr-1 mr-1"></i> 搜尋
										</button>
										<input type="hidden" name="page" value="1" readonly>
										<input type="hidden" name="od" value="3" readonly> 
										<input
											name="search" type="search" class="form-control"
											placeholder="請輸入活動名稱">
									</div>
								</form>
							</div>
						</div>
						<!-- 控制列表內容到這邊結束 -->
				</div>
				
			</div>
			<nav class="my-3" style="background-color:#F0F0F0">
				<ul class="pagination  pageController justify-content-center ">
					<li class="page-item "><a class="page-link"  href="#"><i class="fas fa-angle-double-left"></i></a></li>
					<li class="page-item"><a class="page-link"  href="#"><i class="fas fa-angle-left"></i></a></li>
					<li class="page-item"><a class="page-link"  href="#"><i class="fas fa-angle-right"></i></a></li>
					<li class="page-item"><a class="page-link"  href="#"><i class="fas fa-angle-double-right"></i></a></li>
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
                <table class="order-table table table-hover" id="tablePreview" style="background-color:white;">
<!--                 <table class="order-table m-ta-aj"> -->
                    <thead class="order-table-th">
                        <tr>
                            <!-- thead更改從這邊開始 -->
                            <th scope="col">活動預覽圖</th>
                            <th scope="col" class="d-li-na">活動名稱</th>
                            <th scope="col">發布者 / 發布時間</th>
                            <th scope="col">目前人數 / 人數上限</th>
                            <th scope="col">報名截止日</th>
                            <th scope="col">最新回應</th>
                              <!-- thead更改到這邊結束 -->
                        </tr>
                    </thead>
                    <tbody  class='order-table-tb hideTbody'>
	                    <tr>
							<td>
								<a href="">
									<img class='showImage'  >
									<img class='extendImage' src="" >
								</a>
							</td>
							<td>
								<a class="m-tb-ti" href=""></a>
							</td>
							<td>
							<a href=""></a>
							</td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</tbody>
				</table>

			</div>
			<nav class="my-3" style="background-color:#F0F0F0">
				<ul class="pagination  pageController justify-content-center">
					<li class="page-item"><a class="page-link"  href="#"><i class="fas fa-angle-double-left"></i></a></li>
					<li class="page-item"><a class="page-link"  href="#"><i class="fas fa-angle-left"></i></a></li>
					<li class="page-item"><a class="page-link"  href="#"><i class="fas fa-angle-right"></i></a></li>
					<li class="page-item"><a class="page-link"  href="#"><i class="fas fa-angle-double-right"></i></a></li>
				</ul>
			</nav>
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
</body>
<!-- 設置頁面參數 -->
<script src="../js/upLoadImg.js"></script>
<!-- 上傳頭像 -->
<script src="../js/table.js"></script>
<!--sweet alert-->
<script src="../js/topBar.js"></script>
<script src="../js/includejsp.js"></script>
<!--sweet alert-->
</html>