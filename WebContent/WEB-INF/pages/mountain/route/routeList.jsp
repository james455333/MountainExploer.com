<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>岳進者 - 路線介紹</title>
 
        <!-- Font Awesome -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <!-- Animate.css -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
	<!-- jquery loading -->
	<link rel="stylesheet" href="/MountainExploer.com/css/loading.css">
	<!-- bookblock -->
	<link rel="stylesheet" href="/MountainExploer.com/css/bookblock.css">
	<link rel="stylesheet" href="/MountainExploer.com/css/other.css">
    <link rel="stylesheet" href="/MountainExploer.com/css/font.css">
    <link rel="stylesheet" href="/MountainExploer.com/css/style.css">
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
    <script src="route/routeFunction.js"></script>
    <script src="route/route.js"></script>
    <script src="js/mountain.js"></script>
	<script src="/MountainExploer.com/js/loading.js"></script>    
	<script src="/MountainExploer.com/member/userTop.js"></script>
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
      <nav>
		<ol class="breadcrumb bg-light" style="font-size : 25px;" id="bc">
			<li class="breadcrumb-item"><a href="/MountainExploer.com">首頁</a></li>
			<li class="breadcrumb-item active"><a href="">路線介紹</a></li>
		</ol>
	</nav>
    <div class="div_ul">
        <div style="overflow: hidden;" class="div_li2 m-dl2-adj py-5">
	        <ul style="background-color: white" class="nav nav-pills nav-justified npList mx-3">
				
			</ul>
			<!-- Tab panes -->
			<div style="" id="rt-info-container" class="mx-3">
				 <div class="rt-container" id="rt-container">
					<div style="font-size:20px;" class="my-3" id="page-container" class="">
						<nav aria-label="Page navigation bookPage">
						  <ul class="pagination justify-content-center pagination-lg">
						    <li class="page-item">
						      <a id="first-page" class="page-link" href="#" aria-label="Previous">
						        <i class="fas fa-lg fa-fast-backward"></i>
						      </a>
						    </li>
						    <li class="page-item">
						    	<a id="prev-page" class="page-link" href="#">
							        <i class="fas fa-lg fa-angle-left"></i>
						    	</a>
						    </li>
						    <li class="page-item mx-1 p-0" style="width: 25%">
						    	<select class="custom-select custom-select-lg"  style="height: 100%;" id="rtSelect">
								</select>
						    </li>
						    <li class="page-item">
							    <a id="next-page" class="page-link" href="#">
							    	<i class="fas fa-lg fa-angle-right"></i>
							    </a>
						    </li>
						    <li class="page-item">
						      <a class="page-link" id="last-page" href="#" aria-label="Next">
						        <i class="fas fa-lg fa-fast-forward"></i>
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
			<li class="npModel nav-item invisible animate__animated  shadow-lg">
				   <a class="nav-link" href="#" style="font-size:30px;" data-toggle="tab" ></a>
			</li>
			<li class="li2">
			<button type="button" class="btn btn-outline-info"></button></li>
		</ul>
		
		<div class="rt-page bb-item">
			<div class="d-flex h-100 w-100 border border-primary">
				<div class="col-6 p-3">
					<div class="imgAdjust shadow">
		            </div>
				</div>
				<div class="col-6 p-3">
		            <div class="sec-div d-flex">
		                <div class="sec-div-title mr-auto"></div>
		            </div>
		            <hr>
		            <ul class="nav nav-pills nav-justified rt-Info">
						<li class="nav-item  animate__animated" >
							<a class="nav-link active show" href="#" style="font-size:30px;" data-toggle="tab" role="tab" aria-controls="nav-home" aria-selected="true">路線描述</a>
						</li>
						<li class="nav-item  animate__animated">
							<a class="nav-link" href="#" style="font-size:30px;" data-toggle="tab" role="tab" aria-controls="nav-home" aria-selected="false">建議行程</a>
						</li>
						<li class="nav-item  animate__animated ">
							<a class="nav-link" href="#" style="font-size:30px;" data-toggle="tab" role="tab" aria-controls="nav-home" aria-selected="false">前往交通</a>
						</li>
					</ul>
					<div class="tab-content shadow-lg mh-100 p-3">
			            <div class="tab-pane fade show active sec-div " role="tabpanel">
			                <div class="sec-div-text"></div>
			            </div>
			            <div class="tab-pane fade sec-div" role="tabpanel">
			                <div class="sec-div-text"></div>
			            </div>
			            <div class="tab-pane fade sec-div" role="tabpanel">
			            	<div class="sec-div-text"></div>
			            </div>
					</div>
				</div>
			</div>
		</div>
	</div>
    <footer id="footer"
			include-html="/MountainExploer.com/forinclude/includeForFooter.html">
	</footer>

</body>

<script src="/MountainExploer.com/js/upLoadImg.js"></script><!-- 上傳頭像 -->
<script src="/MountainExploer.com/js/table.js"></script>
<script src="/MountainExploer.com/js/topBar.js"></script>
<script src="/MountainExploer.com/js/sweetalert.js"></script><!--sweet alert-->
<script src="/MountainExploer.com/js/includejsp.js"></script>
</html>