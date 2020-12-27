<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>岳進者 - 報名頁面</title>
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
	    <!-- jquery loading -->
	<link rel="stylesheet" href="/MountainExploer.com/css/loading.css">
	    <!-- Font Awesome -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
	<!-- for this page -->
	<link rel="stylesheet" href="registry/registry.css">
	
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
	<!-- jquery validator -->
	<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.2/dist/jquery.validate.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.2/additional-methods.min.js"></script>
	<!-- jquery loading -->
	<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery-easy-loading/1.3.0/jquery.loading.min.js'></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery-loading-overlay/2.1.7/loadingoverlay.min.js'></script>
	<!-- 自用 -->
	<script src="/MountainExploer.com/mountain/js/mountain.js"></script>
	<script src="registry/registry.js"></script>
	<script src="registry/registryFunction.js"></script>
	<!-- jquery.blockUI -->
	<script src="http://malsup.github.io/jquery.blockUI.js"></script>
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
	<div class="container-fluid" style="padding: 0px;" include-html="/MountainExploer.com/forinclude/carousel.html">
	</div>
	<div class="div_ul">

		<div class="div_li1 dl1_adj"></div>
		<div class="div_li3 dl3_adj"></div>
		<div class="div_li2 dl2_adj">
			<!-- 每頁不同的內容從這裡開始 -->
			<div class="container-fluid reg-mainCon">
				<div class="row">
					<div class="col-md-12">
					
						<nav>
							<ol class="breadcrumb" id="bc">
								<li class="breadcrumb-item"><a href="/MountainExploer.com">首頁</a></li>
								<li class="breadcrumb-item"><a href="#">活動討論區</a></li>
								<li class="breadcrumb-item"><a href="#">活動詳情</a></li>
								<li class="breadcrumb-item active">報名頁面</li>
							</ol>
						</nav>
						<div class="page-header"></div>
						<div class="row rb">
							<div class="col-md-6">
								<div class="row reg-actInfo">
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
								<div class="row reg-actInfo">
									<div class="col-md-12 cb1 text-center">備註</div>
									<div class="col-md-12" id="act-note" style="overflow-wrap : anywhere "></div>
								</div>
							</div>
						</div>
						<div class="row rb">
							<div class="col-md-12 reg-ctrl">
								<div class="btn-group btn-group-lg bt-position-center" role="group" id="btn-controller">
									<button type="button" class="btn-regInfo-plus btn btn-success btn-lg">
										<i class="fa fa-plus" ></i> 增加報名人數
									</button>
									<button type="button" class="btn-regInfo-minus btn btn-danger btn-lg">
										<i class="fa fa-minus"></i> 減少報名人數
									</button>
									<div class="d-flex ml-3">
										<button type="button" id="regInfo-submit" class="btn btn-primary btn-block btn-lg" >
											<i class="fas fa-clipboard-check"></i> 確認報名
										</button>
										<button type="button" id='btn-click-auto' class="btn btn-outline-dark "> 一鍵輸入資料</button>
									</div>
									
								</div>
								<div class="row bg-warning m-3 d-flex justify-content-center" style="font-size : 17.5px"><i class="d-block mx-5 fas fa-exclamation fa-lg fa-pulse"></i><span class="font-weight-bolder"> 所有欄位皆為必填 </span><i class="d-block mx-5 fas fa-exclamation fa-lg fa-pulse"></i> </div>
								<div class="row regInfo">
									<form class="regInfo-form">
										<div class="regInfo-container">
											<div class="rei-con-main">
												<div class="rgi-con-left">
													<div class="reg-body">
														<div>姓名</div>
														<div>
															<input class="form-control" required type="text" name="name" pattern="^[\u4e00-\u9fa5_a-zA-Z]+$" placeholder="僅能輸入中文或英文">
														</div>
													</div>
													<div class="reg-body">
														<div>出生年月日</div>
														<div>
															<input required class="form-control" type="text" name="birthDay" readonly>
														</div>
													</div>
													<div class="reg-body">
														<div>身分證字號</div>
														<div>
															<input class="form-control" required type="text" name="personID" pattern="[A-Z]{1}[0-9]{9}" placeholder="範例 : A123456789">
														</div>
													</div>
												</div>
												<div class="rgi-con-right">
													<div class="reg-body">
														<div>電話(住)</div>
														<div>
															<input class="form-control" required type="text" name="contactPhone" pattern="[0-9]{2}-[0-9]+" placeholder="範例 : 01-2345678">
														</div>
													</div>
													<div class="reg-body">
														<div>手機</div>
														<div>
															<input class="form-control" required type="text" minlength="10" maxlength="10" pattern="^09[0-9]{8}" name="contactCellphone" placeholder="範例 : 0912345678">
														</div>
													</div>
													<div class="reg-body">
														<div>Email</div>
														<div>
															<input class="form-control" required type="email" name="contactEmail" placeholder="範例 : xxx@xmail.com">
														</div>
													</div>
												
												</div>
											</div>
											<div class="btn-rgi-reset">
												<div class="btn-group btn-group-lg bt-position" role="group">
													<button type="button" class="btn btn-warning btn-warning-reset">
														<i class="fa fa-file-text"></i> 重填
													</button>
												</div>
											</div>
										</div>
									</form>									
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