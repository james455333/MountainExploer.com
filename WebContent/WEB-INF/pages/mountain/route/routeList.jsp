<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>岳進者 - 路線介紹</title>
    <link rel="stylesheet" href="/MountainExploer.com/css/other.css">
    <link rel="stylesheet" href="/MountainExploer.com/css/font.css">
    <link rel="stylesheet" href="route/route.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="route/routeFunction.js"></script>
    <script src="route/route.js"></script>
    <script src="js/mountain.js"></script>
    <!-- jquery.blockUI -->
	<script src="http://malsup.github.io/jquery.blockUI.js"></script>
    
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
        
        <div class="div_li1">
            
        </div>
        <div class="div_li3">
        </div>
        <div class="div_li2 m-dl2-adj">
        	<div class="npNav">
                <div class="my-3"><div class="npList d-flex align-items-center justify-content-around"> </div></div>
        	</div>
        	<div class="routeNav">
                <nav><ul class="routeList"></ul></nav>
            </div>
            <div class="secDivContent sdcAdjust">
                <div class="forImage imgAdjust">
                    <!-- 調整參考網址 https://segmentfault.com/q/1010000018971940 -->
                </div>
                <div class="sec-div">
                	<div class="sec-div-title">路線描述</div>
                	<div class="sec-div-text"></div>
                </div>
                <div class="sec-div">
                	<div class="sec-div-title">建議行程</div>
                	<div class="sec-div-text"></div>
                </div>
                <div class="sec-div">
                	<div class="sec-div-title">前往交通</div>
                	<div class="sec-div-text"></div>
                </div>
            </div>




            <!-- 每頁不同的內容到這裡結束 -->
        </div>
    </div>
	<div id='hideElm'>
		<li class="li2">
		<button type="button" class="btn btn-outline-info">
		</button></li>
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