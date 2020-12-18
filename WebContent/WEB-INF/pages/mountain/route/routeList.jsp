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
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <!-- Animate.css -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
	<!-- jquery loading -->
	<link rel="stylesheet" href="/MountainExploer.com/css/loading.css">
	<!-- bookblock -->
	<link rel="stylesheet" href="/MountainExploer.com/css/bookblock.css">
    <link rel="stylesheet" href="route/route.css">
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <!-- bookblock -->
	<script src="/MountainExploer.com/js/modernizr.custom.js"></script>    
	<script src="/MountainExploer.com/js/jquery.bookblock.min.js"></script>    
	<script src="/MountainExploer.com/js/bookblock.min.js"></script>    
     <!-- jquery loading -->
	<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery-easy-loading/1.3.0/jquery.loading.min.js'></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery-loading-overlay/2.1.7/loadingoverlay.min.js'></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="route/routeFunction.js"></script>
    <script src="route/route.js"></script>
    <script src="js/mountain.js"></script>
	<script src="/MountainExploer.com/js/loading.js"></script>    

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
      <nav>
		<ol class="breadcrumb" id="bc">
			<li class="breadcrumb-item"><a href="/MountainExploer.com">首頁</a></li>
			<li class="breadcrumb-item active"><a href="">路線介紹</a></li>
		</ol>
	</nav>
    <div class="div_ul">
        <div class="div_li2 m-dl2-adj ">
	        <ul class="nav nav-tabs npList mx-3">
				
			</ul>
			<!-- Tab panes -->
			<div style="" id="rt-info-container" class="mx-3">
				 <div class="rt-container" id="">
<!-- 				 	<div class="routeNav  shadow-lg"> -->
<!-- 		                <nav><ul class="routeList"></ul></nav> -->
<!-- 		            </div> -->
		            <div id="rt-book" class="bb-bookblock">
					</div>
					<div id="page-container">
						<nav aria-label="Page navigation bookPage">
						  <ul class="pagination justify-content-center">
						    <li class="page-item">
						      <a id="first-page" class="page-link" href="#" aria-label="Previous">
						        <span aria-hidden="true">&laquo;</span>
						      </a>
						    </li>
						    <li class="page-item"><a id="prev-page" class="page-link" href="#"><</a></li>
						    <li class="page-item"><a id="stop-page" class="page-link" href="#">stop</a></li>
						    <li class="page-item"><a id="next-page" class="page-link" href="#">></a></li>
						    <li class="page-item">
						      <a class="page-link" id="last-page" href="#" aria-label="Next">
						        <span aria-hidden="true" >&raquo;</span>
						      </a>
						    </li>
						  </ul>
						</nav>
					</div>
				</div>
			</div>
        	
            <!-- 每頁不同的內容到這裡結束 -->
        </div>
    </div>
	<div id='hideElm'>
		<ul>
			<li class="npModel nav-item invisible animate__animated ">
				   <a class="nav-link" data-toggle="tab" ></a>
			</li>
			<li class="li2">
			<button type="button" class="btn btn-outline-info"></button></li>
		</ul>
		
		<div class="rt-page bb-item">
			<div class="row">
				<div class="col-md-6">
					<div class="mx-3 my-3 imgAdjust">
		            </div>
				</div>
				<div class="col-md-6">
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
			</div>
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
<script src="/MountainExploer.com/js/topBar.js"></script>
<script src="/MountainExploer.com/js/sweetalert.js"></script><!--sweet alert-->
<script src="/MountainExploer.com/js/includejsp.js"></script>
</html>