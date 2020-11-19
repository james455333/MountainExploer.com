<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-tw">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>岳進者</title>
    <link rel="stylesheet" href="/MountainExploer.com/css/other.css">
    <link rel="stylesheet" href="/MountainExploer.com/css/font.css">
    <link rel="stylesheet" href="/MountainExploer.com/mountain/act/detail/css/detail.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="<c:url value='/mountain/act/detail/js/detail.js' />"></script>
</head>

<body>
    <div class="count1">
        <div class="count1_img">
            <img src="/MountainExploer.com/images/logo1.png">
            <hr>
            <h1 class="font">岳進者</h1>
            <!-- <a class="font">岳進者</a> -->
        </div>
    </div>
    <header>
        <nav class="navbar navbar-expand-lg navbar-light bg-light zline">
            <a class="navbar-brand" href="/MountainExploer.com/"><img src="/MountainExploer.com/images/logo1.png" height="30%" width="30%"></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent" include-html="/MountainExploer.com/forinclude/includeForIndex.html"></div>
        </nav>
    </header>
    <div class="div_ul">
        <!-- <div class="導覽列表">
            <nav>
                <ul class="second_nav">
                    <li class="li1"><a href="#">第二導覽列1</a></li>

                    <li class="li1"><a href="#">第二導覽列2</a></li>

                    <li class="li1"><a href="#">第二導覽列3</a></li>

                    <li class="li1"><a href="#">第二導覽列4</a></li>
                </ul>
            </nav>
        </div> -->
        <div class="div_li1">
            <a>保留區</a>
        </div>
        <div class="div_li3">
            <a>保留區</a>
        </div>
        <div class="div_li2">
            <!-- 每頁不同的內容從這裡開始 -->
            
            <div class="innerContainer">
            	<!-- 頁面控制 -->
            	<nav class="pageControl">
                    <ul>
                        <li class="li1">
                            <a href="#">«第一頁</a>
                        </li>
                        <li class="li1">
                            <a href="#">‹上一頁</a>
                        </li>
                        <li class="li1">
                            <a href="#"></a>
                        </li>
                        <li class="li1">
                            <a href="#">下一頁›</a>
                        </li>
                        <li class="li1">
                            <a href="#">最末頁»</a>
                        </li>
                    </ul>
                </nav>
				<!--	活動標題 	-->
<!-- 				<table class="actTitle"> -->
<!-- 					<tbody> -->
<!-- 						<tr> -->
<!-- 							<td> -->
<!-- 								標籤 -->
<!-- 								<div></div> -->
<!-- 								標題字 -->
<!-- 								<div> -->
<!-- 									測試用標題 -->
<!-- 								</div> -->
<!-- 							</td> -->
<!-- 						</tr> -->
<!-- 					</tbody> -->
<!-- 				</table> -->
				<!--	活動主內容與留言	 -->
<!-- 				<div class="actPost"> -->
<!-- 						分隔用DIV	 -->
<!-- 					<div></div> -->
<!-- 					<table> -->
<!-- 						<tbody> -->
<!-- 							<tr> -->
<!-- 								會員資訊 -->
<!-- 								<td class="memberTD"> -->
<!-- 									會員Seqno -->
<!-- 									<div style="display:none;"></div> -->
<!-- 									會員暱稱 -->
<!-- 									<div>測試暱稱</div> -->
<!-- 									會員頭像 -->
<!-- 									<div class="memeberImgContainer"> -->
<!-- 										<img class="memeberImg" src="https://media1.s-nbcnews.com/j/newscms/2018_37/2566431/180914-stock-universe-al-1025_cdb902a22ae43a09c662a5f03f673a82.fit-1240w.jpg"> -->
<!-- 									</div> -->
<!-- 								</td> -->
								
<!-- 								發文內容 -->
<!-- 								<td class="d_Main"> -->
<!-- 									發文與最後編輯時間 -->
<!-- 									<div class="d_time"> 測試發文時間 / </div> -->
<!-- 									發文內容 -->
									
<!-- 									<div class="d_content"> -->
<!-- 										內容文字 -->
<!-- 										<div class="d_text"> -->
<!-- 											最後編輯時間 -->
<!-- 											<i></i> -->
<!-- 											名稱 -->
<!-- 											<div>測試名稱</div> -->
<!-- 											活動費用 -->
<!-- 											<div>測試活動費用</div> -->
<!-- 											路線資訊 -->
<!-- 											<div>測試路線資訊</div> -->
<!-- 											活動日期(開始~結束) -->
<!-- 											<div>測試活動日期</div> -->
<!-- 											目前報名人數 / 報名人數上限 -->
<!-- 											<div>測試報名人數</div> -->
<!-- 											報名截止日 -->
<!-- 											<div>測試報名截止日</div> -->
<!-- 											活動日期 -->
<!-- 											<div>測試活動日期</div> -->
<!-- 										</div> -->
<!-- 										會員偵測 -->
<!-- 										<div class="d_member_lock">會員專視 -->
<!-- 											圖片 (複數:最多5) -->
<!-- 											<div class="d_act_img"> -->
<!-- 												<img alt="" src="https://cdn.mos.cms.futurecdn.net/qWRNTdErRRidiwWoT5dvj-1200-80.jpg"> -->
<!-- 											</div> -->
<!-- 											<div class="d_act_img"> -->
<!-- 												<img alt="" src="https://cdn.mos.cms.futurecdn.net/qWRNTdErRRidiwWoT5dvj-1200-80.jpg"> -->
<!-- 											</div> -->
<!-- 											<div class="d_act_img"> -->
<!-- 												<img alt="" src="https://cdn.mos.cms.futurecdn.net/qWRNTdErRRidiwWoT5dvj-1200-80.jpg"> -->
<!-- 											</div> -->
<!-- 											備註 -->
<!-- 											<div> -->
<!-- 												測試備註內容 -->
<!-- 											</div> -->
<!-- 											報名鈕 -->
<!-- 											<div> -->
<!-- 												<form> -->
<!-- 													<input type="submit" value="報名"> -->
<!-- 												</form> -->
<!-- 											</div> -->
<!-- 											留言 複數 -->
<!-- 											<div class="d_sr"> -->
<!-- 												留言者 -->
<!-- 												<div class="d_sr_img"> -->
<!-- 													留言者頭像 -->
<!-- 													<a> -->
<!-- 														<img src=""> -->
<!-- 													</a> -->
<!-- 													留言者暱稱 -->
<!-- 												</div> -->
<!-- 												留言內容 -->
<!-- 												<div class="d_sr_text"> -->
<!-- 													<a>測試留言者暱稱</a> -->
<!-- 													測試留言者內容 -->
<!-- 													<span>留言時間</span> -->
<!-- 												</div> -->
<!-- 											</div> -->
<!-- 										</div> -->
<!-- 									</div> -->
								
<!-- 								</td> -->
<!-- 							</tr> -->
<!-- 								預備用	 -->
<!-- 							<tr> -->
<!-- 							</tr> -->
<!-- 								預備用	 -->
<!-- 							<tr> -->
<!-- 							</tr> -->
<!-- 						</tbody> -->
<!-- 					</table> -->
<!-- 				</div> -->
            	
            	
            	
            	
            </div>
            <!-- 每頁不同的內容到這裡結束 -->
            <!-- 頁面控制 -->
            	<nav class="pageControl">
                    <ul>
                        <li class="li1">
                            <a href="#">«第一頁</a>
                        </li>
                        <li class="li1">
                            <a href="#">‹上一頁</a>
                        </li>
                        <li class="li1">
                            <a href="#"></a>
                        </li>
                        <li class="li1">
                            <a href="#">下一頁›</a>
                        </li>
                        <li class="li1">
                            <a href="#">最末頁»</a>
                        </li>
                    </ul>
                </nav>
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
<script src="/MountainExploer.com/js/upLoadImg.js"></script><!-- 上傳頭像 -->
<script src="/MountainExploer.com/js/table.js"></script>
<!--sweet alert-->
<script src="/MountainExploer.com/js/topBar.js"></script>
<script src="/MountainExploer.com/js/sweetalert.js"></script>
<script src="/MountainExploer.com/js/includejsp.js"></script>
<!--sweet alert-->
</html>