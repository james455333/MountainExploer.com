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
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript" charset="UTF-8"
	src='<c:url value="/product/shop/shop.js"/>'></script>
	<script src="/MountainExploer.com/js/swalLogin.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9.17.2/dist/sweetalert2.all.min.js"></script>
		<style>
        

        .order-table-tb {
            display: flex;
            margin: auto;
            flex-wrap: wrap;
            justify-content: center;
        }
        .div {
            margin: 15px;
            font-size: 18px;
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
	<div class="div_ul">
		<div class="secNavbar">
			<nav>
				<ul class="second_nav">
					<!-- 更改內容從這邊開始 -->
									<li class="li1">
										<span>主類別 :&nbsp</span>
										<select name="firstclass" id="fcSelect">
										</select>
										<input type="button" value="主類別查詢" class="fcSubmit">
										</li>
									<li class="li1">次類別: <select name="secondclass" class="scSelect"></select>
							<input type="button" value="次類別查詢" class="scSubmit">
						</li>
<%-- 										<li class="li1"><a href="<c:url value='/MountainExploer.com/shop/search/totalData?firstclass=624' />">戶外服飾</a></li> --%>
<!-- 										<li class="li1"><a href="?firstclass=624">爬山涉水</a></li> -->
<!-- 										<li class="li1"><a href="#">戶外廚房</a></li> -->
<!-- 										<li class="li1"><a href="#">野外的家</a></li> -->
<!-- 										<li class="li1"><a href="#">功能背包</a></li> -->
<!-- 										<li class="li1"><a href="#">照明設備</a></li> -->
<!-- 										<li class="li1"><a href="#">人身部品</a></li> -->
<!-- 										<li class="li1"><a href="#">專業儀器</a></li> -->
<!-- 										<li class="li1"><a href="#">技術攀登</a></li> -->
<!-- 										<li class="li1"><a href="#">水上用具</a></li> -->
<!-- 										<li class="li1"><a href="#">配件、其他</a></li> -->

					<!-- 					<li class="li1"><a href="#">第二導覽列2</a></li> -->

					<!-- 					<li class="li1"><a href="#">第二導覽列3</a></li> -->

					<!-- 					<li class="li1"><a href="#">第二導覽列4</a></li> -->

					<!-- 更改內容到這邊結束 -->
				</ul>
			</nav>
		</div>
		<div class="div_li1">
			<a></a>
		</div>
		<div class="div_li3">
			<a></a>
		</div>
		<div class="div_li2">
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
					<button type="submit" class="priceSubmitButton ">價格區間查詢</button>
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

			<div class="secDivContent">
				<div>
					<span>資料筆數 : </span> <span id="totalData"> </span>
				</div>
				<div>
					<a href='<c:url value="/shop/shoppingCartEntry"/>'>查看購物車</a>
					<br>
					<span>品項： ${ShoppingCart.itemNumber} 項</span>
					<br>
					<span>金額： $  ${ShoppingCart.subtotal} </span>

				</div>
				<div>
					<a href='<c:url value="/shoppingcart/memberOrders"/>'>查看訂單</a>
				</div>
				<!--table-->
				<table class="order-table">
<!-- 					<thead class="order-table-th"> -->
<!-- 							<th scope="col">商品名稱</th> -->
<!-- 							<th scope="col">圖片</th> -->
<!-- 							<th scope="col">價格</th> -->
<!-- 							<th scope="col">選擇數量</th> -->
<!-- 							thead更改到這邊結束 -->
<!-- 						</tr> -->
<!-- 					</thead> -->
					
					<div class="order-table-tb">
					
					</div>
					
<!-- 					<tbody class="order-table-tb"> -->
<!-- 						tbody更改從這邊開始 -->
<!-- 						<tr> -->
<!-- 							<td>商品名稱</td> -->
<!-- 							<td >圖片</td> -->
<!-- 							<td>價格</td> -->
<!-- 							<td >選擇數量</td> -->
<!-- 						</tr> -->
<!-- 						<tr> -->
<!-- 							<td>商品名稱</td> -->
<!-- 							<td >圖片</td> -->
<!-- 							<td>價格</td> -->
<!-- 							<td >選擇數量</td> -->
<!-- 						</tr> -->
<!-- 						<tr> -->
<!-- 							<td>商品名稱</td> -->
<!-- 							<td >圖片</td> -->
<!-- 							<td>價格</td> -->
<!-- 							<td >選擇數量</td> -->
<!-- 						</tr> -->
<!-- 						<tr> -->
<!-- 							<td>商品名稱</td> -->
<!-- 							<td >圖片</td> -->
<!-- 							<td>價格</td> -->
<!-- 							<td >選擇數量</td> -->
<!-- 						</tr> -->


<!-- 						tbody更改到這邊結束 -->
<!-- 					</tbody> -->

<!-- 				</table> -->

				<nav class="pageControl">
					<!-- 					<div> -->
					<!-- 						<li id="firstPage" class="li1" ><a href="/MountainExploer.com/shop/shoppingPage?name=1">«第一頁</a></li> -->
					<!-- 					</div> -->
					<!-- 					<div> -->
					<!-- 						<li id="previousPage" class="li1" ><a href="/MountainExploer.com/shop/shoppingPage?name=">‹上一頁</a></li> -->
					<!-- 					</div> -->
					<!-- 					<div> -->
					<!-- 						<i id="pageNo"></i> -->
					<!-- 					</div> -->
					<!-- 					<div> -->
					<!-- 						<li id="nextPage" class="li1" ><a href="/MountainExploer.com/shop/shoppingPage?name=">下一頁›</a></li> -->
					<!-- 					</div> -->
					<!-- 					<div> -->
					<!-- 						<li id="lastPage" class="li1" ><a href="/MountainExploer.com/shop/shoppingPage?name=">最末頁»</a></li> -->
					<!-- 					</div> -->

					<input id="firstPage" type="button" value="最前頁" name="1" disabled>
					<input id="previousPage" type="button" value="前一頁" name="" disabled>
					<i id="pageNo"></i> <input id="nextPage" type="button" value="下一頁"
						name="" disabled> <input id="lastPage" type="button"
						value="最尾頁" name="" disabled>

				</nav>
			</div>




			<!-- 每頁不同的內容到這邊結束 -->
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
<script src="/MountainExploer.com/js/upLoadImg.js"></script>
<!-- 上傳頭像 -->
<script src="/MountainExploer.com/js/table.js"></script>
<script src="/MountainExploer.com/js/topBar.js"></script>
<script src="/MountainExploer.com/js/sweetalert.js"></script>
<!--sweet alert-->
<script src="/MountainExploer.com/js/includejsp.js"></script>
</html>