<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>岳進者</title>
    <link rel="stylesheet" href="/MountainExploer.com/css/other.css">
    <link rel="stylesheet" href="/MountainExploer.com/css/font.css">
    <link rel="stylesheet" href="/MountainExploer.com/css/personalPage.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="/MountainExploer.com/member/css/bootstrapInfo.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9.17.2/dist/sweetalert2.all.min.js"></script>

    <style>
	
    </style>
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
            <a class="navbar-brand" href="#"><img src="/MountainExploer.com/images/logo1.png" height="30%" width="30%"></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent"
                include-html="/MountainExploer.com/forinclude/includeForIndex.html"></div>
        </nav>
    </header>
    <div class="div_ul">
        <div class="div_li1">
            <a></a>
        </div>
        <div class="div_li3">
            <a></a>
        </div>
        <div class="div_li2">
            <!-- 每頁不同的內容從這裡開始 -->
            
            <!-- 每頁不同內容到這邊結束 -->
            <div class="fix"><a href="#"><img src="/MountainExploer.com/images/arror.png" alt="" style=" width:60px; height:60px;"></a>
            </div>
            <!-- 宣告為fix後會將DIV的層級拉到最外層(不管原本是寫在哪)也就是跳脫出原本的HTML框架 -->
        </div>

    </div>

    <footer id="footer">
        <a>全站導覽</a>



    </footer>
</body>
<script src="/MountainExploer.com/js/upLoadImg.js"></script><!-- 上傳頭像 -->
<script src="/MountainExploer.com/js/table.js"></script>
<script src="/MountainExploer.com/js/topBar.js"></script>
<!--sweet alert-->
<script src="/MountainExploer.com/js/includejsp.js"></script>
<script src="/MountainExploer.com/js/personalContrul.js"></script><!-- 個人資料控制列表 -->
<script src="bootstrapInfo.js"></script>


</html>