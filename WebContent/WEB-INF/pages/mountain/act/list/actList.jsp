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
	<link rel="stylesheet" href="/MountainExploer.com/css/style.css">
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
	<!-- Animate.css -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
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

</head>


<body>
	<div class="container-fluid" id="carousel-set" style="padding: 0px" include-html="/MountainExploer.com/forinclude/carousel.html">
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
	<nav class="">
		<ol class="breadcrumb" style="font-size : 25px;" id="bc">
			<li class="breadcrumb-item"><a href="/MountainExploer.com">首頁</a></li>
			<li class="breadcrumb-item active">活動討論區</li>
		</ol>
	</nav>
	<div class="div_ul d-flex" id="text-loading" style="min-height: 800px;">
		<div class="col-3">
			<div class="w-100 h-100">
				<div id="btn-newpost" class="btn-group p-3"  role="group">
						<button style="font-size:35px;" class="list-newPost btn btn-success" type="button">
							<i class="fas fa-hiking"></i> 舉辦活動 
						</button>
				</div>
				<div class="w-100 p-3">
					<form action="list" id="m-sr-form">
						<div style="position: static; float: none;" class="search d-flex">
							<button class="btn btn-outline-success">
								<i class="fas fa-search pr-1 mr-1"></i> 搜尋
							</button>
							<input type="hidden" name="page" value="1" readonly>
							<input type="hidden" name="od" value="3" readonly> 
							<input name="search" type="search" class="form-control" placeholder="請輸入活動名稱">
						</div>
					</form>
				</div>
				<div class="btn-group btn-group-toggle p-3 w-100" data-toggle="buttons">
				    <label class="showMode btn btn-outline-primary">
				        <input type="radio" name="mode" autocomplete="off" value="list"> 清單模式
				    </label>
				    <label class="showMode btn btn-outline-primary active">
				        <input type="radio" name="mode" autocomplete="off" value="image" checked> 圖片模式
				    </label>
				</div>
				<div class="px-3">
						<!-- 控制列表內容從這邊開始 -->
						<div class="">
							<div>
								<span style="font-size:25px;">活動狀態</span>
							</div>
							<hr class="bg-info">
							<div class="custom-control custom-radio my-3 d-inline-flex justify-content-start">
								<input type="radio" id="aTag-new" name="aTag" class="custom-control-input" value="1">
								<label class="custom-control-label" for="aTag-new">新活動</label>
							</div>
							<div class="custom-control custom-radio my-3  d-inline-flex">
								<input type="radio" id="aTag-hot" name="aTag" class="custom-control-input" value="2">
								<label class="custom-control-label" for="aTag-hot">熱門活動</label>
							</div>
							<div class="custom-control custom-radio my-3  d-inline-flex">
								<input type="radio" id="aTag-old" name="aTag" class="custom-control-input" value="3">
								<label class="custom-control-label" for="aTag-old">歷史活動</label>
							</div>
							<br>
							<br>
							<div>
								<span style="font-size:25px;">報名狀態</span>
							</div>
							<hr class="bg-info">
							<div class="custom-control custom-radio d-inline-flex my-3  justify-content-start">
								<input type="radio" id="rTag-alv" name="rTag" class="custom-control-input" value="0">
								<label class="custom-control-label" for="rTag-alv">預設顯示</label>
							</div>
							<div class="custom-control custom-radio d-inline-flex my-3  justify-content-start">
								<input type="radio" id="rTag-alv" name="rTag" class="custom-control-input" value="6">
								<label class="custom-control-label" for="rTag-alv">尚可報名</label>
							</div>
							<div class="custom-control custom-radio d-inline-flex my-3 ">
								<input type="radio" id="rTag-alm-clz" name="rTag" class="custom-control-input" value="7">
								<label class="custom-control-label" for="rTag-alm-clz">報名將截止</label>
							</div>
							<div class="custom-control custom-radio d-inline-flex my-3 ">
								<input type="radio" id="rTag-alm-full" name="rTag" class="custom-control-input" value="8">
								<label class="custom-control-label" for="rTag-alm-full">報名將滿</label>
							</div>
							<div class="custom-control custom-radio d-inline-flex my-3 ">
								<input type="radio" id="rTag-clz" name="rTag" class="custom-control-input" value="4">
								<label class="custom-control-label" for="rTag-clz">報名已截止</label>
							</div>
							<div class="custom-control custom-radio d-inline-flex my-3 ">
								<input type="radio" id="rTag-full" name="rTag" class="custom-control-input" value="5">
								<label class="custom-control-label" for="rTag-full">報名已滿</label>
							</div>
						</div>
						<div class="d-inline-flex align-items-center my-3" id="totalData">查詢筆數 :</div>
						<!-- 控制列表內容到這邊結束 -->
				</div>
			</div>
		</div>
		<div class="col-9" id='info-page'>
			<!-- 每頁不同的內容從這裡開始 -->
			
			<div class="d-flex px-1">
				
				<nav class="my-3 align-items-center">
					<ul class="pagination pageController justify-content-left ">
						<li class="page-item "><a class="page-link"  href="#"><i class="fas fa-angle-double-left"></i></a></li>
						<li class="page-item"><a class="page-link"  href="#"><i class="fas fa-angle-left"></i></a></li>
						<li class="page-item"><a class="page-link"  href="#"><i class="fas fa-angle-right"></i></a></li>
						<li class="page-item"><a class="page-link"  href="#"><i class="fas fa-angle-double-right"></i></a></li>
					</ul>
				</nav>
			</div>

			<div class="m-sdc-adj " id="mode-container">
                <div id="table-image" class="show-mode animate__animated d-flex flex-wrap animate__zoomIn justify-content-left">
					<div style="width:25%; max-width: 200px" class="p-1 borders act-container d-none shadow animate__animated animate__flipInY" >
						<div style="width: auto;" class="p-1">
							<div style="min-height: 200px;"class="image border">
								<a><img style="width:100%; height:auto; min-height: 200px;" src=""></a>
							</div>
							<div class="title d-flex justify-content-center">
								<div class="text-truncate"> 
				    				<a style="font-size: 20px; max-width:175px"class="m-tb-ti d-inline-block act-title text-truncate"></a>
								</div>
							</div>
							<div style="font-size:10px" class="post-info d-flex align-items-end">
									<div class="mr-auto text-left author"><a href=""></a></div>
									<div class="mr-auto text-left postDate"></div>
								</div>
						</div>
					</div>
				</div>
                <!--table-->
                <table class="show-mode order-table table table-hover animate__animated animate__zoomOut d-none" id="table-list" style="background-color:white;">
<!--                 <table class="order-table m-ta-aj"> -->
                    <thead class="order-table-th" id="tableHeader">
                        <tr>
                            <!-- thead更改從這邊開始 -->
                            <th scope="col" style="width:10%;">活動預覽圖</th>
                            <th scope="col" class="d-li-na"  style="width:35%;text-align: left">活動名稱</th>
                            <th scope="col"  style="width:25%;">發布者 / 發布時間</th>
                            <th scope="col"  style="width:15%;">目前人數 / 人數上限</th>
                            <th scope="col"  style="width:15%;">報名截止日</th>
                              <!-- thead更改到這邊結束 -->
                        </tr>
                    </thead>
                    <tbody  class='order-table-tb hideTbody'>
	                    <tr class="animate__animated animate__bounceIn ">
							<td >
								<a href="">
									<img class='showImage'  >
									<img class='extendImage' src="" >
								</a>
							</td>
							<td class="d-flex align-items-center" style="justify-content: flex-start;">
								<a class="m-tb-ti" href=""></a>
							</td>
							<td style="font-size:10px;">
							<a href=""></a>
							</td>
							<td></td>
							<td></td>
						</tr>
					</tbody>
				</table>

			</div>
			<nav class="my-3" >
				<ul class="pagination  pageController justify-content-left">
					<li class="page-item"><a class="page-link"  href="#"><i class="fas fa-angle-double-left"></i></a></li>
					<li class="page-item"><a class="page-link"  href="#"><i class="fas fa-angle-left"></i></a></li>
					<li class="page-item"><a class="page-link"  href="#"><i class="fas fa-angle-right"></i></a></li>
					<li class="page-item"><a class="page-link"  href="#"><i class="fas fa-angle-double-right"></i></a></li>
				</ul>
			</nav>
			<!-- 每頁不同的內容到這裡結束 -->
		</div>
	</div>
	<footer id="footer"
			include-html="/MountainExploer.com/forinclude/includeForFooter.html">
	</footer>
</body>
<!-- 設置頁面參數 -->
<script src="../js/upLoadImg.js"></script>
<script src="../js/includejsp.js"></script>
<!-- 上傳頭像 -->
<script src="../js/table.js"></script>
<!--sweet alert-->
<script src="../js/topBar.js"></script>
<!--sweet alert-->
</html>