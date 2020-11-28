<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>岳進者</title>
    <link rel="stylesheet" href="/MountainExploer.com/css/other.css">
    <link rel="stylesheet" href="/MountainExploer.com/css/font.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    
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
        <div class="secNavbar">
            <nav>
                <ul class="second_nav">
                    <li class="li1"><a href="#">第二導覽列1</a></li>

                    <li class="li1"><a href="#">第二導覽列2</a></li>

                    <li class="li1"><a href="#">第二導覽列3</a></li>

                    <li class="li1"><a href="#">第二導覽列4</a></li>
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
            <!-- <div class="searchBar">
                <nav>
                    <ul class="third_nav">
                        <li>居住地:
                            <select>
                                <option name="nothing" selected disabled>請選擇縣市</option>
                                <option value="值2">aa</option>
                                <option value="值3">bb</option>
                            </select></li>

                        <li>預設1:
                            <select>
                                <option name="nothing" selected disabled>選擇提示1</option>
                                <option value="值2">aa</option>
                                <option value="值3">bb</option>
                            </select></li>

                        <li>預設2:
                            <select>
                                <option name="nothing" selected disabled>選擇提示2</option>
                                <option value="值2">aa</option>
                                <option value="值3">bb</option>
                            </select></li>

                    </ul>
                </nav>
                <div class="search">
                    搜尋：<input type="search" class="light-table-filter" data-table="order-table" placeholder="請輸入關鍵字">
                    <img class=imgSearch src="/MountainExploer.com/images/放大鏡.png" alt="" width="35px">
                </div>

            </div> -->

            <div class="secDivContent">

                <div class="forImage">
                    <img src="/MountainExploer.com/images/BGI.jpg" alt="" class="forImagesImg">
                    <!-- 調整參考網址 https://segmentfault.com/q/1010000018971940 -->
                </div>
                <div class="forFrom"></div>
                <div class="forText"></div>
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

<script src="/MountainExploer.com/js/upLoadImg.js"></script><!-- 上傳頭像 -->
<script src="/MountainExploer.com/js/table.js"></script>
<script src="/MountainExploer.com/js/topBar.js"></script>
<script src="/MountainExploer.com/js/sweetalert.js"></script><!--sweet alert-->
<script src="/MountainExploer.com/js/includejsp.js"></script>
</html>