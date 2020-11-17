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
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="/MountainExploer.com/mountain/act/list/css/list.css">
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="<c:url value='/mountain/act/list/js/ajax.js' />"></script>
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
        <div class="導覽列表">
            <nav>
                <ul class="second_nav">
                    <li class="li1"><a href="#">活動列表</a></li>

                    <li class="li1"><a href="#">活動管理</a></li>

                    <li class="li1"><a href="#">路線介紹</a></li>

                </ul>
            </nav>
        </div>
        <div class="div_li1">
            <a>保留區</a>
        </div>
        <div class="div_li3">
            <a>保留區</a>
        </div>
        <div class="div_li2">
            <!-- 每頁不同的內容從這裡開始 -->
        	<div class="searchBar">
                <nav>
                    <ul class="third_nav">
                        <!-- 控制列表內容從這邊開始 -->
                        <li>活動標籤:
                            <select name="actTag">
                                <option value="0" selected disabled>請選擇活動標籤</option>
                                <option value="0">不指定</option>
                                <option value="1">新活動</option>
                                <option value="2">熱門活動</option>
                                <option value="3">歷史活動</option>
                            </select></li>

                        <li>報名標籤:
                            <select name="regTag">
                                <option value="0" selected disabled>請選擇報名標籤</option>
                                <option value="0">不指定</option>
                                <option value="1">尚可報名</option>
                                <option value="2">報名將滿</option>
                                <option value="3">報名將截止</option>
                                <option value="4">報名已滿</option>
                                <option value="5">報名截止</option>
                               	
                            </select></li>
                        <!-- 控制列表內容到這邊結束 -->
                    </ul>
                </nav>
                <div class="search">
                    搜尋：<input type="search" class="light-table-filter" data-table="order-table" placeholder="請輸入關鍵字">
                    <button><img class=imgSearch src="/MountainExploer.com/images/放大鏡.png" alt="" width="35px"></button>
                </div>

            </div>

            <div class="secDivContent">
                <!--table-->
                <table class="order-table">
                    <thead class="order-table-th">
                        <tr>
                            <!-- thead更改從這邊開始 -->
                            <th scope="col">活動預覽圖</th>
                            <th scope="col">活動名稱</th>
                            <th scope="col">發布時間 / 默認排序</th>
                            <th scope="col">目前人數 / 人數上限</th>
                            <th scope="col">報名截止日</th>
                            <th scope="col">最新回應</th>
                              <!-- thead更改到這邊結束 -->
                        </tr>
                    </thead>


                </table>

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
            <!-- 每頁不同的內容到這裡結束 -->
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
<!-- 設置頁面參數 -->
<script type="text/javascript">
	checklogin = "${sessionScope.LoginOK}"
	page = ${page}
</script>
<script src="/MountainExploer.com/js/upLoadImg.js"></script><!-- 上傳頭像 -->
<script src="/MountainExploer.com/js/table.js"></script>
<!--sweet alert-->
<script src="/MountainExploer.com/js/topBar.js"></script>
<script src="/MountainExploer.com/js/sweetalert.js"></script>
<script src="/MountainExploer.com/js/includejsp.js"></script>
<!--sweet alert-->
</html>