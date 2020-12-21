<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>購物頁面</title>
<link rel="stylesheet" href="/MountainExploer.com/css/other.css">
<link rel="stylesheet" href="/MountainExploer.com/css/font.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<link href="https://cdn.jsdelivr.net/npm/sweetalert2@9.17.2/dist/sweetalert2.min.css" rel="stylesheet" />
	 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
	<script type="text/javascript" charset="UTF-8" src='<c:url value="/product/shop/shop.js"/>'></script>
	<script src="/MountainExploer.com/js/swalLogin.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9.17.2/dist/sweetalert2.all.min.js"></script>
    <script src="/MountainExploer.com/member/userTop.js"></script>
		<style>
        

        .order-table-tb {
        
            display: flex;
            margin: auto;
            flex-wrap: wrap;
            justify-content: center;
        }
        .table {
            width : 225px;
        }
        .secDivContent {
            display: flex;
            margin: auto;
        }
        .div {
        	width : 200px;
            margin: 15px;
            font-size: 18px;
            justify-content: center;
        }
        .div2 {
            margin: 15px;
            font-size: 18px;
            line-height: 40px;
        }

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
	<nav>
		<ol class="breadcrumb p-4" style="font-size : 22.5px;" id="bc">
			<li class="breadcrumb-item"><a href="/MountainExploer.com">首頁</a></li>
			<li class="breadcrumb-item"><a href="/MountainExploer.com/mountain/list?page=1&od=1">活動討論區</a></li>
			<li class="breadcrumb-item active">發表活動</li>
		</ol>
	</nav>
	<div class="div_ul d-flex">
			
		<div class="col-3" >
			<div class="m-3  p-3">
				<div class="" style="line-height : unset;">
					<!-- 更改內容從這邊開始 -->
					<div class="d-flex align-items-center justify-content-between p-1">
						<select class="w-100 h-100 mr-3" name="firstclass" id="fcSelect">
						</select>
						<button type="button" value="主類別查詢" class="mx-1 fcSubmit btn btn-outline-danger">主類別查詢</button>
					</div>
					<div class="d-flex align-items-center justify-content-between p-1">
						<select name="secondclass" class="scSelect h-100 w-100 mr-3"></select>
						<button type="button" value="次類別查詢" class="mx-1 scSubmit btn btn-outline-danger">次類別查詢</button>
					</div>
					<!-- 更改內容到這邊結束 -->
				</div>
			</div>
			<div class="div2 p-3">
				<div style="width:100%" class="btn-group dropdown">
					<button type="button" class="btn btn-lg btn-block btn-outline-success dropdown-toggle justify-content-between" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
						我的購物車
					</button>
					<div class="dropdown-menu w-100">
					    <div class="div2">
					    	<a href='<c:url value="/shop/shoppingCartEntry"/>'>查看購物車詳情</a>
					    </div>
					    <hr>
					    <div class="div2">
							<a href='<c:url value="/shoppingcart/memberOrders"/>'>查看訂單</a>
						</div>
					    <hr>
					  	<div class="div2">
					  		<div>
								品項： ${ShoppingCart.itemNumber} 項
							</div>
							<div>
								金額： $  ${ShoppingCart.subtotal} 
							</div>
					  	</div>
					</div>
				</div>
				
				<br>
				

			</div>
			
		</div>
		<div class="col-9">
				<!-- 每頁不同的內容從這裡開始 -->
				
				<div class="searchBar">
					<nav>
						<ul class="third_nav">
							<!-- 控制列表內容從這邊開始 -->
	<!-- 						<li>主類別: <select name="firstclass" id="fcSelect"></select> <input -->
	<!-- 							type="button" value="主類別查詢" class="fcSubmit"> -->
	<!-- 						</li> -->
	<!-- 						<li>次類別: <select name="secondclass" class="scSelect"></select> -->
	<!-- 							<input type="button" value="次類別查詢" class="scSubmit"> -->
	<!-- 						</li> -->
						</ul>
					</nav>
	
					<div>
						<span>價格區間 : </span> <input type="radio" name="radioGroup"
							id="radioA" value="1" checked="checked" /><label>0-1000元</label>
						<input type="radio" name="radioGroup" id="radioB" value="2" /><label>1001-2000元</label>
						<input type="radio" name="radioGroup" id="radioC" value="3" /><label>2001-3000元</label>
						<input type="radio" name="radioGroup" id="radioD" value="4" /><label>3000元以上</label>
						<button type="submit" class="priceSubmitButton btn btn-outline-danger">價格區間查詢</button>
						<!-- <button type="submit" class="priceSubmitButton btn btn-outline-dark">價格區間查詢</button> -->
					</div>
					<div>
						商品名稱搜尋：<input type="text" class="light-table-filter"
							placeholder="請輸入關鍵字"> <img
							class="imgSearch" src="/MountainExploer.com/images/放大鏡.png" alt=""
							width="35px">
						<!-- <button><img class=imgSearch src="/MountainExploer.com/images/放大鏡.png" alt="" width="35px"></button> -->
					</div>
	
				</div>
	
				<div class="secDivContent" >
					<div >
						資料筆數: <span id="totalData"> </span> 筆
					</div>
					</div>
					<!--table-->
					<table class="order-table">
						<table class="order-table-tb">
						</table>
					</table>
					<nav class="pageControl">
	
						<input id="firstPage" type="button" value="最前頁" name="1" disabled>
						<input id="previousPage" type="button" value="前一頁" name="" disabled>
						<i id="pageNo"></i> <input id="nextPage" type="button" value="下一頁"
							name="" disabled> <input id="lastPage" type="button"
							value="最尾頁" name="" disabled>
	
					</nav>
			<!-- 每頁不同的內容到這邊結束 -->
	</div>

	<footer id="footer">



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