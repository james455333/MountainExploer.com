<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>岳進者</title>
	<!-- public -->
	<link rel="stylesheet" href="/MountainExploer.com/css/other.css">
	<link rel="stylesheet" href="/MountainExploer.com/css/font.css">
	<!-- bootstrap4 style sheet -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<!-- daterangepicker style sheet -->
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
	<!-- daterangepicker-font-awesome  style sheet -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<!-- bootstrap-select-->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/css/bootstrap-select.min.css">
	<!-- for this page  style sheet -->
	<link rel="stylesheet" href="newAct/newAct.css">
	
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
	<!-- 自用 -->
	<script src="/MountainExploer.com/mountain/js/mountain.js"></script>
	<script src="newAct/newAct.js"></script>
	<script src="newAct/newActFunction.js"></script>
	<!-- jquery.blockUI -->
	<script src="http://malsup.github.io/jquery.blockUI.js"></script>


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
	<div class="count1">
		<div class="count1_img">
			<img src="/MountainExploer.com/images/logo1.png">
			<hr>
			<h1 class="font">可能改成輪播</h1>
			<!-- <a class="font">岳進者</a> -->
		</div>
	</div>
	<div class="div_ul">

		<div class="div_li1 dl1_adj"></div>
		<div class="div_li3 dl3_adj"></div>
		<div class="div_li2 dl2_adj">
			<!-- 每頁不同的內容從這裡開始 -->
			<nav>
				<ol class="breadcrumb" id="bc">
					<li class="breadcrumb-item"><a href="/MountainExploer.com">首頁</a></li>
					<li class="breadcrumb-item"><a href="/MountainExploer.com/mountain/list?page=1&od=1">活動討論區</a></li>
					<li class="breadcrumb-item active">發表活動</li>
				</ol>
			</nav>
			
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12">
						<div class="page-header">
							<h1>
								歡迎來到 發表活動頁面 <small>發表一個活動讓大家一起參與吧</small>
							</h1>
						</div>
						<ul class="newa-ul">
							<li class="list-item">
								填入必要資訊並發送
							</li>
							<li class="list-item">
								除了備註，其餘都是固定必填項
							</li>
							
						</ul>
						<div class="row form-container">
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
													<input class="form-control" required type="text" maxlength="9" name="actInfo.price" pattern="^[0-9]+$" placeholder="僅能輸數字">
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
													<input class="form-control" required type="number" pattern="[0-9]+" name="actInfo.regTop">
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
									<div class="row new-form-head-con">
										<div class="col-md-12">
											<div class="row new-form-head">
												<div class="col-md-12">
													上傳圖片(最多五張)
												</div>
											</div>
											<div class="row new-form-body">
												<div class="col-md-12">
													<input type="file" accept="image/*" name='files' multiple>
												</div>
											</div>
										</div>
										<div class="col-md-12">
											<div class="row new-form-head">
												<div class="col-md-12">
													上傳圖片預覽
												</div>
											</div>
											<div class="row new-form-body">
												<div class="col-md-12">
													<div id="previewMultiple"></div>
												</div>
											</div>
										</div>
									</div>
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
						<div class="row">
							<div class="col-md-12">
								<button id="btn-submit"type="button" class="btn btn-lg btn-primary btn-block">
									Button
								</button>
								
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<button type="button" id='btn-click-auto' class="btn btn-dark btn-lg"> 一鍵輸入資料</button>
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
<script src="/MountainExploer.com/js/upLoadImg.js"></script>
<!-- 上傳頭像 -->
<script src="/MountainExploer.com/js/table.js"></script>
<script src="/MountainExploer.com/js/topBar.js"></script>
<script src="/MountainExploer.com/js/sweetalert.js"></script>
<!--sweet alert-->
<script src="/MountainExploer.com/js/includejsp.js"></script>
</html>