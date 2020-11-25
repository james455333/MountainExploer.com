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
    <link rel="stylesheet" href="manage/manage.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" ></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" ></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="manage/manageFunction.js"></script>
    <script src="manage/checkFunction.js"></script>
    <script src="manage/manage.js"></script>
    <style>

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
        <div class="secNavbar" include-html="fragment/secondNav.html">
            
        </div>
        
        <div class="m-con">

	        <div class="div_li1 m-dl1-adj">
	            <div class="sideNav">
	            	<div class='m-si-op m-hide'><div>舉辦活動管理</div></div>
	            	<div class='m-si-op'><div>報名活動管理</div></div>
	            	<div class='m-si-op'><div>活動紀錄</div></div>
	            	<div class='m-si-op'><div>問題回報</div></div>
	            </div>
	        </div>
	        <div class="div_li3 m-hide">
	        </div>
	        <div class="div_li2 m-dl2-adj">
	        	<div class="m-ma-container">
	        		<div>
	        			<h2>歡迎來到活動管理頁面</h2>
	        			<h3>點選左列選項進入指定控制頁面</h3>
	        		</div>
					
	        	</div>
        	</div>
        </div>
    </div>
    
    <div class="m-hide">
   		<table class="order-table m-ma-ta">
        	<thead class="order-table-th"><tr>
				<th scope="col" style="width:75px">活動編號</th>
				<th scope="col" class="d-li-na">活動名稱</th>
				<th scope="col" class="m-tb-date">開始時間</th>
				<th scope="col" class="m-tb-date">結束時間</th>
				<th scope="col" style="width:75px">活動價格</th>
				<th scope="col" style="width:75px">路線名稱</th>
				<th scope="col" class="m-tb-date">發布時間</th>
				<th scope="col" style="width:75px">報名人數 / 人數上限</th>
				<th scope="col" class="m-tb-date">報名截止日</th>
				<th scope="col" style="width:50px">備註</th>
				<th scope="col" style="width:50px">回覆</th>
				<th scope="col">控制選項</th>
			</tr></thead>
			<tbody  class='order-table-tb hideTbody'>
				<tr>
					<td></td>
					<td><a class="m-tb-ti" href=""></a></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="m-tb-rt"></td>
					<td></td>
					<td></td>
					<td></td>
					<td><button>備註顯示</button></td>
					<td><button>CM</button></td>
					<td>
						<div class="flex-box">
							<button>報名選單</button>
							<button class="update-show">修改內容</button>
						</div>
						<div class="flex-box">
							<button></button>
							<button>取消活動</button>
						</div>
					</td>
				</tr>
				<tr class="m-note hideTr">
					<td colspan="12"> 
					</td>
				</tr>
				<tr class="tr-up hideTr">
					<td colspan="12">
						<div>
							<form action="" class="tr-form" enctype="multipart/form-data">
								<div class="tr-up-form">
									<input type="hidden" name="actBasic.seqno">
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
										<textarea rows="5" cols="100" name="note" class="m-note-form"></textarea>
									</label>
								</div>
								<div class="tr-up-form">
									<input type="submit" value="確認修改">
									<input type="reset" class="cancel-up" value="取消修改">
								</div>
							</form>
						</div>
					</td>
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

<script src="/MountainExploer.com/js/upLoadImg.js"></script><!-- 上傳頭像 -->
<script src="/MountainExploer.com/js/table.js"></script>
<script src="/MountainExploer.com/js/topBar.js"></script>
<script src="/MountainExploer.com/js/sweetalert.js"></script><!--sweet alert-->
<script src="/MountainExploer.com/js/includejsp.js"></script>
</html>