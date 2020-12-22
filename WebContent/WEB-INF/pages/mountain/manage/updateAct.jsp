<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>岳進者 [ 活動修改 ]</title>
	<!-- public -->
	<link rel="stylesheet" href="/MountainExploer.com/css/other.css">
	<link rel="stylesheet" href="/MountainExploer.com/css/font.css">
	<link rel="stylesheet" href="/MountainExploer.com/css/style.css">
	<!-- bootstrap4 style sheet -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<!-- daterangepicker style sheet -->
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
	<!-- daterangepicker-font-awesome  style sheet -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<!-- bootstrap-select-->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/css/bootstrap-select.min.css">
	<!-- Fancy Box 3 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/fancyapps/fancybox@3.5.7/dist/jquery.fancybox.min.css" />
	<!-- nanogallery2 -->
	<link href="https://cdn.jsdelivr.net/npm/nanogallery2@3/dist/css/nanogallery2.min.css" rel="stylesheet" type="text/css">
	<!-- Font Awesome -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
		<!-- animate.css -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
	<!-- for this page  style sheet -->
	<link rel="stylesheet" href="updateAct/updateAct.css">
	
	<!-- jquery-->
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<!-- bootstrap4 -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>
		<!-- daterangepicker -->
	<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<!-- sweetalert -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<!-- bootstrap-select-->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.18/js/bootstrap-select.min.js"></script>
	<!-- jquery validator -->
	<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.2/dist/jquery.validate.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.2/additional-methods.min.js"></script>
	<!-- CKeditor 4 -->
	<script src="/MountainExploer.com/mountain/ckeditor/ckeditor.js"></script>
	<!-- jquery.blockUI -->
	<script src="http://malsup.github.io/jquery.blockUI.js"></script>
	<!-- Fancy Box 3  -->
	<script src="https://cdn.jsdelivr.net/gh/fancyapps/fancybox@3.5.7/dist/jquery.fancybox.min.js"></script>
	<!-- nanogallery2 -->
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/nanogallery2@3/dist/jquery.nanogallery2.min.js"></script>
	<!-- MDB core JavaScript -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.0/js/mdb.min.js"></script>
	<!-- Bootstrap tooltips -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
	<!-- Bootstrap core JavaScript -->
	<script type="text/javascript"src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.min.js"></script>
	<!-- jquery loading -->
	<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery-easy-loading/1.3.0/jquery.loading.min.js'></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery-loading-overlay/2.1.7/loadingoverlay.min.js'></script>
	<!-- 自用 -->
	<script src="/MountainExploer.com/mountain/js/mountain.js"></script>
	<script src="updateAct/updateAct.js"></script>
	<script src="updateAct/updateActFunction.js"></script>
	<!--  active progressBar + jquery-loading -->
	<script src="/MountainExploer.com/js/loading.js"></script>
</head>
<body>
<header>
		<nav class="navbar navbar-expand-lg navbar-light bg-light zline">
			<a class="navbar-brand" href="#"><img
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
	<div class="container-fluid" id="carousel-set" style="padding: 0px" include-html="/MountainExploer.com/forinclude/carousel.html">
	</div>
	<div class="div_ul">
		<nav>
			<ol class="breadcrumb" id="bc">
				<li class="breadcrumb-item"><a href="/MountainExploer.com">首頁</a></li>
				<li class="breadcrumb-item"><a href="/MountainExploer.com/mountain/list?page=1&od=1">活動討論區</a></li>
				<li class="breadcrumb-item active">發表活動</li>
			</ol>
		</nav>
		<div class="div_li1 dl1_adj"></div>
		<div class="div_li3 dl3_adj"></div>
		<div class="div_li2 dl2_adj">
			<!-- 每頁不同的內容從這裡開始 -->
			
			
			<div class="container-fluid m-5 "id="mother" style="overflow: hidden;">
				<div class="row">
					<div class="col-md-12 d-flex flex-column" style="min-height: 800px;">
						<div class="d-none animate__animated " id="titleContainer">
							<div class="page-header shadow-lg mt-3 p-3 rounded-lg" style="background-color:#FCFCFC">
								<h1>
									活動資訊修改 
								</h1>
							</div>
						</div>
						<div class="row form-container  d-none animate__animated " id="form-container">
							<form id="newAct-form" class="newAct-form">
								<div class="col-md-12 newA-back">
									<div class="row new-form-head-con">
										<div class="col-md-12">
											<div class="row new-form-head">
												<div class="col-md-12">
													活動基本資訊
												</div>
											</div>
											<div class="row new-form-body">
												<div class="col-md-2">
												活動名稱
												</div>
												<div class="col-md-4">
													<input class="form-control" required type="text" maxlength="30" name="actInfo.title" pattern="^[\u4e00-\u9fa5_a-zA-Z0-9]+$" placeholder="僅能輸入中、英文及數字，最多30字">
												</div>
												<div class="col-md-2">
												活動價格
												</div>
												<div class="col-md-4">
													<input class="form-control" required type="text" maxlength="5" name="actInfo.price" pattern="^[0-9]+$" placeholder="僅能輸數字">
												</div>
											</div>
										</div>
										
									</div>
									<div class="row new-form-head-con">
										<div class="col-md-12">
											<div class="row new-form-head">
												<div class="col-md-12">
												活動路線選擇
												</div>
											</div>
											<div class="row new-form-body">
												<div class="col-md-2">
												國家公園
												</div>
												<div class="col-md-4">
													<select class="selectpicker" id="npSelect" data-live-search="true">
														 <option class="hideOP"></option>
													</select>
												</div>
												<div class="col-md-2">
												選定路線
												</div>
												<div class="col-md-4">
													<select name="actInfo.rtBasic.id" class="selectpicker" id="rtSelect" data-live-search="true">
														<option class="hideOP"></option>
													</select>
												</div>
											</div>
											<div class="row new-form-body route-desp-head">
												<div class="col-md-12">
													路線介紹
												</div>
											</div>
											<div class="row new-form-body route-desp-body">
												<div class="col-md-12">
												</div>
											</div>
										</div>
									</div>
									<div class="row new-form-head-con">
										<div class="col-md-12">
											<div class="row new-form-head">
												<div class="col-md-12">
												活動時間資訊
												</div>
											</div>
											<div class="row new-form-body">
												<div class="col-md-2">
													開始日期
												</div>
												<div class="col-md-4">
													<input class="form-control" readonly required type="text" name="actInfo.startDate">
												</div>
												<div class="col-md-2">
													總天數
												</div>
												<div class="col-md-4">
													<input class="form-control" readonly required type="text" name="actInfo.totalDay">
												</div>
											</div>
											<div class="row new-form-body">
												<div class="col-md-2">
													結束日期
												</div>
												<div class="col-md-4">
													<input class="form-control" readonly required type="text" name="actInfo.endDate">
												</div>
												<div class="col-md-2">
												</div>
												<div class="col-md-4">
												</div>
											</div>
										</div>
									</div>
									<div class="row new-form-head-con">
										<div class="col-md-12">
											<div class="row new-form-head">
												<div class="col-md-12">
													活動報名資訊
												</div>
											</div>
											<div class="row new-form-body">
												<div class="col-md-2">
													報名人數上限
												</div>
												<div class="col-md-4">
													<input class="form-control" required type="number" maxlength="5" pattern="^[1-9]*[0-9]+" name="actInfo.regTop">
												</div>
												<div class="col-md-2">
													報名截止日期
												</div>
												<div class="col-md-4">
													<input class="form-control" readonly required type="text" name="actInfo.regEndDate">
												</div>
											</div>
										</div>
									</div>
<!-- 									<div class="row new-form-head-con"> -->
<!-- 										<div class="col-md-12"> -->
<!-- 											<div class="row new-form-head"> -->
<!-- 												<div class="col-md-12"> -->
<!-- 													上傳圖片修改(上限五張) -->
<!-- 												</div> -->
<!-- 											</div> -->
											
<!-- 											<div class="row new-form-body"> -->
<!-- 												<div class="col-md-12" id="previewMultiple"> -->
<!-- 													<div class='newAct-img-container hideElm'> -->
<!-- 														<a ><img data-toggle='tooltip' title='點擊放大' src="" alt="" class='showImage'/></a> -->
<!-- 														<div class="img-controller"> -->
<!-- 															<button  data-toggle="tooltip" type="button" title='設為預設' class="btn btn-outline-success btn-img-default"> -->
<!-- 																<i class="fas fa-anchor"></i> -->
<!-- 															</button> -->
<!-- 															<button  data-toggle="tooltip" type="button" title='更新圖片' class="btn btn-outline-info btn-img-upload"> -->
<!-- 																<i class="fas fa-file-upload"></i> -->
<!-- 															</button> -->
<!-- 															<button  data-toggle="tooltip" type="button" title='刪除本圖片' class="btn btn-outline-danger btn-img-cancel"> -->
<!-- 																<i class="fas fa-times"></i> -->
<!-- 															</button> -->
															
<!-- 														</div> -->
<!-- 													</div> -->
<!-- 												</div> -->
<!-- 											</div> -->
<!-- 											<div class="row new-form-body"> -->
<!-- 												<div class="col-md-12" > -->
<!-- 													<div class="custom-file"> -->
<!-- 													    <input type="file" class="custom-file-input" id="files"> -->
<!-- 													    <label class="custom-file-label" for="files">選擇新增圖片</label> -->
<!-- 													</div> -->
<!-- 												</div> -->
<!-- 											</div> -->
<!-- 										</div> -->
<!-- 									</div> -->
									
									<div class="row new-form-head-con">
										<div class="col-md-12">
											<div class="row new-form-head">
												<div class="col-md-12">
													備註欄
												</div>
											</div>
											<div class="row new-form-body">
												<div class="col-md-12">
													<textarea rows="" cols="" name="note"></textarea>
												</div>
											</div>
										</div>
									</div>
								</div>
							</form>
						</div>
						<div class="mt-auto">
							<div class="row" style="margin-bottom: 10px;">
								<div class="col-md-12">
									<button id="btn-reset"type="button" class="btn btn-lg btn-warning btn-block">
										重置修改
									</button>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<button id="btn-submit"type="button" class="btn btn-lg btn-primary btn-block">
										完成修改
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<!-- 每頁不同的內容到這裡結束 -->
		</div>
	</div>
	<div class="hideDIV" style="display:none;">
	</div>

	<footer id="footer"
			include-html="/MountainExploer.com/forinclude/includeForFooter.html">
	</footer>
</body>
<script src="/MountainExploer.com/js/upLoadImg.js"></script>
<!-- 上傳頭像 -->
<script src="/MountainExploer.com/js/table.js"></script>
<script src="/MountainExploer.com/js/topBar.js"></script>
<script src="/MountainExploer.com/js/sweetalert.js"></script>
<!--sweet alert-->
<script src="/MountainExploer.com/js/includejsp.js"></script>
</html>