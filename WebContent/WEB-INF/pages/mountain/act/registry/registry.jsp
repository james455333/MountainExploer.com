<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>岳進者 - 報名頁面</title>
<link rel="stylesheet" href="/MountainExploer.com/css/other.css">
<link rel="stylesheet" href="/MountainExploer.com/css/font.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="registry/registry.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.2/dist/jquery.validate.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.2/additional-methods.min.js"></script>
<script src="/MountainExploer.com/mountain/js/mountain.js"></script>
<script src="registry/registry.js"></script>
<script src="registry/registryFunction.js"></script>
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
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12">
						<nav>
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="#">Home</a></li>
								<li class="breadcrumb-item"><a href="#">Library</a></li>
								<li class="breadcrumb-item active">Data</li>
							</ol>
						</nav>
						<div class="page-header"></div>
						<div class="row rb">
							<div class="col-md-6">
								<div class="row ">
									<div class="col-md-12 cb1 text-center">報名訊息</div>
									<div class="col-md-12" id="info-Container">
										<div id="actInfo-Container-head">
											<div>價格 :</div>
											<div>目前報名人數 :</div>
											<div>報名人數上限 :</div>
											<div>報名截止日期 :</div>
											<div>活動開始日期 :</div>
										</div>
										<div id="act-simpleinfo">
											<div></div>
											<div></div>
											<div></div>
											<div></div>
											<div></div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="row">
									<div class="col-md-12 cb1 text-center">備註</div>
									<div class="col-md-12" id="act-note"></div>
								</div>
							</div>
						</div>
						<div class="row rb">
							<div class="col-md-12 reg-ctrl">
								<div class="btn-group btn-group-lg bt-position" role="group">
									<button type="button" class="btn btn-success btn-lg">
										<i class="fa fa-plus"></i>增加報名人數
									</button>
									<button type="button" class="btn btn-danger btn-lg">
										<i class="fa fa-minus"></i>減少報名人數
									</button>
								</div>
								<div class="row">**所有欄位皆為必填**</div>
								<div class="row regInfo-head">
									<div style="width: 12.5%;">姓名</div>
									<div style="width: 12.5%;">出生年月日</div>
									<div style="width: 12.5%;">身分證字號</div>
									<div style="width: 15%;">電話(住)</div>
									<div style="width: 15%;">手機</div>
									<div style="width: 22.5%;">Email</div>
									<div style="width: 10%;">控制欄</div>
								</div>
								<div class="row regInfo-body">
									<form class="regInfo-form">
										<div class="regInfo-body-order">
											<div style="width:12.5%;">
												<input class="form-control" required type="text" name="name_0" placeholder="姓名">
											</div>
											<div style="width:12.5%;">
												<input required class="form-control" type="text" name="birthDay">
											</div>
											<div style="width:12.5%;">
												<input class="form-control" required type="text" name="personID_0" pattern="[A-Z]{1}-[0-9]+" placeholder="A123456789">
												<div class="invalid-feedback"></div>
											</div>
											<div style="width:15%;">
												<input class="form-control" required type="text" name="contactPhone_0" pattern="[0-9]{2}-[0-9]+" placeholder="01-2345678">
											</div>
											<div style="width:15%;">
												<input class="form-control" required type="text" minlength="10" maxlength="10" pattern="^09[0-9]{8}" name="contactCellphone_0" placeholder="ex : 0912345678">
											</div>
											<div style="width:22.5%;">
												<input class="form-control" required type="email" name="contactEmail_0" placeholder="Email">
											</div>
											<div style="width:10%;">
												<button type="reset" class="btn btn-warning"><i class="fa fa-file-text"></i>重置</button>
											</div>
										</div>
									</form>									
								</div>
								<a id="regInfo-submit" class="btn btn-primary btn-block"
									type="button"><i class="fa fa-cloud-upload"></i>確認報名</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 每頁不同的內容到這裡結束 -->
		</div>
	</div>
	<div class="hideDIV" style="display: none">=
<!-- 			<div id="regInfo-body-order-origin"> -->
<!-- 				<div style="width:12.5%;"> -->
<!-- 					<input class="form-control" required type="text" name="name" placeholder="姓名"> -->
<!-- 				</div> -->
<!-- 				<div style="width:12.5%;"> -->
<!-- 					<input required type="text" name="birthDay"> -->
<!-- 				</div> -->
<!-- 				<div style="width:12.5%;"> -->
<!-- 					<input class="form-control" required type="text" name="personID" placeholder="身分證字號"> -->
<!-- 					<div class="invalid-feedback"></div> -->
<!-- 				</div> -->
<!-- 				<div style="width:15%;"> -->
<!-- 					<input class="form-control" required type="text" name="contactPhone" placeholder="電話(住)"> -->
<!-- 				</div> -->
<!-- 				<div style="width:15%;"> -->
<!-- 					<input class="form-control" required type="text" name="contactCellphone" minlength="10" pattern="^09[0-9]{8}" placeholder="手機"> -->
<!-- 				</div> -->
<!-- 				<div style="width:22.5%;"> -->
<!-- 					<input class="form-control" required type="text" name="contactEmail" placeholder="Email"> -->
<!-- 				</div> -->
<!-- 				<div style="width:10%;"> -->
<!-- 					<button type="reset" class="btn btn-warning"><i class="fa fa-file-text"></i>重置</button> -->
<!-- 				</div> -->
<!-- 			</div>			 -->
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