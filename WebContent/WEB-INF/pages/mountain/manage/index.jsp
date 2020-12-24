<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>岳進者 - 會員管理系統</title>
    <link rel="stylesheet" href="/MountainExploer.com/css/other.css">
    <link rel="stylesheet" href="/MountainExploer.com/css/font.css">
    <link rel="stylesheet" href="/MountainExploer.com/css/style.css">
    <link rel="stylesheet" href="manage/manage.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
	 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
	 <!-- Font Awesome -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" ></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" ></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <!-- CKeditor 4 -->
	<script src="/MountainExploer.com/mountain/ckeditor/ckeditor.js"></script>
    <script src="/MountainExploer.com/mountain/js/mountain.js"></script>
    <script src="manage/managePostFunction.js"></script>
    <script src="manage/manageRegistryFunction.js"></script>
    <script src="manage/manageRecordFunction.js"></script>
    <script src="manage/manageReportFunction.js"></script>
    <script src="manage/checkFunction.js"></script>
    <script src="manage/manage.js"></script>
    <!-- jquery.blockUI -->
	<script src="http://malsup.github.io/jquery.blockUI.js"></script>
	<script src="/MountainExploer.com/member/userTop.js"></script>
	
    <style>

    </style>
</head>

<body>
    <div class="container-fluid" style="padding: 0px;" include-html="/MountainExploer.com/forinclude/carousel.html">
	</div>
    <header>
        <nav class="navbar navbar-expand-lg navbar-light bg-light zline">
            <a class="navbar-brand" href="#"><img src="/MountainExploer.com/images/logo1.png" height="30%"
                    width="30%"></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent"
                include-html="/MountainExploer.com/forinclude/includeForIndex.html"></div>
        </nav>
    </header>
    <div class="div_ul">
        
        <div class="m-con d-block m-5">

	        <div class="m-dl1-adj w-100">
	            <div class="sideNav d-flex justify-content-around p-5 shadow bg-white">
	            	<div class='m-hide m-si-op border  rounded animate__animated animate__jackInTheBox '><div class="my-3 mx-5">舉辦活動管理</div></div>
	            	<div class='m-si-op border  rounded animate__animated animate__jackInTheBox '><div class="my-3 mx-5">報名活動管理</div></div>
<!-- 	            	<div class='m-si-op'><div>活動紀錄</div></div> -->
<!-- 	            	<div class='m-si-op  rounded animate__animated animate__jackInTheBox '><div class="my-3 mx-5">求助及問題回報</div></div> -->
	            </div>
	        </div>
	        <div class="div_li3 m-hide">
	        </div>
	        <div class="m-dl2-adj">
	        	<div class="m-ma-container my-5 animate__animated animate__bounceIn">
	        		<div>
	        			<h2>歡迎來到活動管理頁面</h2>
	        		</div>
					
	        	</div>
        	</div>
        </div>
    </div>
    
    <div class="m-hide">
   		<table class="table table-hover m-ma-ta border shadow-lg" id="regTable">
        	<thead class="bg-success m_thead order-table-th"><tr>
				<th scope="col" style="width:6%">活動編號</th>
				<th scope="col" class="d-li-na" style="width:17.5%">活動名稱</th>
				<th scope="col" class="m-tb-date" style="width:6%">開始時間</th>
				<th scope="col" class="m-tb-date" style="width:6%">結束時間</th>
				<th scope="col" style="width:5%">活動價格</th>
				<th scope="col" style="width:7.5%">路線名稱</th>
				<th scope="col" class="m-tb-date" style="width:6%">發布時間</th>
				<th scope="col" style="width:10%">報名人數</th>
				<th scope="col" class="m-tb-date" style="width:6%">報名截止日</th>
				<th scope="col" style="width:10%">備註</th>
				<th scope="col" style="width:20%">控制選項</th>
			</tr></thead>
			<tbody  class='order-table-tb hideTbody  animate__animated animate__fadeInRight animate__slow'>
				<tr class="tr-main-post">
					<td></td>
					<td><a class="m-tb-ti" href=""></a></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="m-tb-rt"></td>
					<td></td>
					<td></td>
					<td></td>
					<td><button class="btn btn-outline-primary">備註顯示</button></td>
					<td>
						<div class="flex-box my-2 mx-2">
							<button class="bnt btn-outline-success bt-reg-show">報名選單</button>
							<button class="bnt btn-outline-warning bt-update-show">修改內容</button>
						</div>
						<div class="flex-box my-2 mx-2">
							<button class="bnt btn-outline-danger bt-act-hide"></button>
							<button class="bnt btn-danger bt-act-delete">取消活動</button>
						</div>
					</td>
				</tr>
				<tr class="m-note hideTr animate__animated animate__zoomIn " style="min-height: 50px;">
					<td colspan="12"> 
					</td>
				</tr>
				<tr class="tr-up hideTr animate__animated animate__zoomIn">
					<td colspan="12">
						<div>
							<form class="tr-form" enctype="multipart/form-data">
								<div class="tr-up-form">
									<input type="hidden" name="id">
									<div class="tr-up-fld">
										<div class="tr-up-fld-div">
											<div class="tr-up-label">
												<label>活動標題</label>
											</div>
											<div>
												<input type="text"  name="title" maxlength="15"><span></span>
												<div class="tr-up-error"></div>
											</div>
										</div>
										<div class="tr-up-fld-div">
											<div class="tr-up-label">
												<label>活動開始時間</label>
											</div>
											<div>
												<input name="startDate" readonly="readonly"><span></span>
												<div class="tr-up-error"></div>
											</div>
										</div>
										<div class="tr-up-fld-div">
											<div class="tr-up-label">
												<label>活動結束時間</label>
											</div>
											<div>
												<input name="endDate" readonly="readonly"><span></span>
												<div class="tr-up-error"></div>
											</div>
										</div>
										<div class="tr-up-fld-div">
											<div class="tr-up-label">
												<label>總天數</label>
											</div>
											<div>
												<input name="totalDay" readonly="readonly">
												<div></div>
											</div>
										</div>
									</div>
									<div class="tr-up-fld">
										<div class="tr-up-fld-div">
											<div class="tr-up-label">
												<label>活動價格</label>
											</div>
											<div>
												<input type="text" name="price" maxlength="9"><span></span>
												<div class="tr-up-error"></div>
											</div>
										</div>
										<div class="tr-up-fld-div">
											<div class="tr-up-label">
												<label>報名人數上限</label>
											</div>
											<div>
												<input type="text" name="regTop" maxlength="9"><span></span>
												<div class="tr-up-error"></div>
											</div>
										</div>
										<div class="tr-up-fld-div">
											<div class="tr-up-label">
												<label>報名截止日期</label>
											</div>
											<div>
												<input name="regEndDate" readonly="readonly"><span></span>
												<div class="tr-up-error"></div>
											</div>
										</div>
									</div>
								</div>
								<div class="tr-up-form">
									<label>備註 : 
										<textarea rows="5" cols="100" class="m-note-form"></textarea>
									</label>
								</div>
								<div class="tr-up-form">
									<button type="submit" class="btn btn-outline-success mx-3" value="確認修改">確認修改</button>
									<button type="button" class="cancel-up btn btn-outline-danger mx-3" value="取消修改">取消修改</button>
								</div>
							</form>
						</div>
					</td>
				</tr>
				<tr class="tr-reg hideTr  animate__animated animate__zoomIn">
					<td colspan="12">
						<div class="tr-reg-con">
							<div class="tr-reg-head">
								<div class="tr-reg-seqno">報名編號</div>
								<div class="tr-reg-mbName">報名會員名稱</div>
								<div class="tr-reg-regNum">報名人數</div>
								<div class="tr-reg-regDate">報名日期</div>
								<div class="tr-reg-attr">狀態列</div>
								<div class="tr-reg-control">控制列</div>
							</div>
							<div class="tr-reg-body">
								<div class="tr-reg-order">
									<div class="tr-reg-seqno"><a></a></div>
									<div class="tr-reg-mbName"></div>
									<div class="tr-reg-regNum"></div>
									<div class="tr-reg-regDate"></div>
									<div class="tr-reg-attr"></div>
									<div class="tr-reg-control"></div>
								</div>
								<div class="tr-reg-bar">
									<i class="fas fa-caret-down"></i>
								</div>
								<div class="tr-reg-info hideTr">
									<div class="tr-reg-info-head">
										<div class="tr-reg-info-name">姓名</div>
										<div class="tr-reg-info-bDay">出生年月日</div>
										<div class="tr-reg-info-pID">身分證字號</div>
										<div class="tr-reg-info-phone">電話</div>
										<div class="tr-reg-info-cellphone">手機</div>
										<div class="tr-reg-info-email">電子信箱</div>
									</div>
									<div class="tr-reg-info-body">
										<div class="tr-reg-info-name"></div>
										<div class="tr-reg-info-bDay"></div>
										<div class="tr-reg-info-pID"></div>
										<div class="tr-reg-info-phone"></div>
										<div class="tr-reg-info-cellphone"></div>
										<div class="tr-reg-info-email"></div>
									</div>
								</div>
							</div>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
        <table class="order-table table table-hover m-ma-reg-ta">
        	<thead class="order-table-th bg-info m-ma-reg-ta-th"><tr>
					<th scope="col" style="width:10%">報名編號</th>
					<th scope="col" style="width:15%">報名狀態列</th>
	        		<th scope="col" style="width:20%; font-size : 20px;">活動名稱</th>
					<th scope="col" style="width:10%">報名人數</th>
					<th scope="col" style="width:15%">報名詳情</th>
					<th scope="col" style="width:10%">報名日期</th>
					<th scope="col" style="width:20%">控制列</th>
        	</tr></thead>
        	<tbody class="order-table-tb animate__animated animate__zoomIn">
        		<tr class="rg-main">
        			<td></td>
        			<td></td>
        			<td><a></a></td>
        			<td></td>
        			<td><button class="btn btn-lg btn-outline-info bt-reg-info" style="font-size:20px;">詳情</button></td>
        			<td></td>
        			<td><button class="btn btn-lg btn-warning bt-reg-cancel">取消報名</button></td>
        		</tr>
        		<tr class="rg-info hideTr animate__animated animate__zoomIn">
        			<td colspan="7">
        				<div class="rg-info-con">
	        				<div class="rg-info-head">
	        					<div class="rg-info-seqno">報名詳情編號</div>
	        					<div class="rg-info-name">姓名</div>
								<div class="rg-info-bDay">出生年月日</div>
								<div class="rg-info-pID">身分證字號</div>
								<div class="rg-info-phone">電話</div>
								<div class="rg-info-cellphone">手機</div>
								<div class="rg-info-email">電子信箱</div>
								<div class="rg-info-controll">控制項</div>
	        				</div>
	        				<div class="rg-info-body">
	        					<div class="rg-info-body-info">
	        						<div class="rg-info-seqno"></div>
		        					<div class="rg-info-name"></div>
									<div class="rg-info-bDay"></div>
									<div class="rg-info-pID"></div>
									<div class="rg-info-phone"></div>
									<div class="rg-info-cellphone"></div>
									<div class="rg-info-email"></div>
									<div class="rg-info-controll"></div>
	        					</div>
	        					<div class="rg-info-body-info2 hideTr">
	        						<form action="#" class="rg-info-body-update">
		        						<div class="rg-info-seqno">
		        							<input type="hidden" name="seqno" readonly>
		        						</div>
			        					<div class="rg-info-name">
		        							<input type="text" name="name" maxlength="10" required>
			        					</div>
										<div class="rg-info-bDay">
											<input type="text" name="birthDay" required>
										</div>
										<div class="rg-info-pID">
											<input type="text" name="personID" required>
										</div>
										<div class="rg-info-phone">
											<input type="text" name="contactPhone" required>
										</div>
										<div class="rg-info-cellphone">
											<input type="text" name="contactCellphone" required>
										</div>
										<div class="rg-info-email">
											<input type="text" name="contactEmail" required>
										</div>
										<div class="rg-info-updateCtrl" >
											<div>
												<button class="btn btn-primary bt-reg-info-update-confirm">確定</button>
											</div>
											<div>
												<button class="btn btn-danger bt-reg-info-update-cancel">取消</button>
											</div>
										</div>
	        						</form>
	        					</div>
	        				</div>
        				</div>
        			</td>
        		</tr>
        	</tbody>
        </table>
		<table class="order-table m-ma-repo-ta">
			<thead class="order-table-th"><tr>
				<th scope="col">回報編號</th>
				<th scope="col">回報時間</th>
				<th scope="col">回覆狀態</th>
				<th scope="col">回報主題</th>
				<th scope="col">回報主旨</th>
				<th scope="col">回報內容</th>
				<th scope="col">回報選項</th>
			</tr></thead>
			<tbody class="order-table-tb">
				<tr class="main-repo-tr">
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</tbody>
		</table>
        <nav class="pageControl ver-mid">
        	<ul>
            	<li class="li1">
            		<div class="m-page">
	            		«第一頁
            		</div>
				</li>
                <li class="li1">
                	<div class="m-page">
	                	‹上一頁
                	</div>
                </li>
                <li class="li1">
                	<div  class="m-page">
                	</div>
				</li>
                <li class="li1">
                	<div class="m-page">
                		下一頁›
                	</div>
                </li>
                <li class="li1">
                	<div  class="m-page">
                		最末頁»
                	</div>
				</li>
			</ul>
		</nav>
    </div>
    <footer id="footer" style="padding-top: 100px"
			include-html="/MountainExploer.com/forinclude/includeForFooter.html">
	</footer>
</body>

<script src="/MountainExploer.com/js/upLoadImg.js"></script><!-- 上傳頭像 -->
<script src="/MountainExploer.com/js/table.js"></script>
<script src="/MountainExploer.com/js/topBar.js"></script>
<script src="/MountainExploer.com/js/sweetalert.js"></script><!--sweet alert-->
<script src="/MountainExploer.com/js/includejsp.js"></script>
</html>