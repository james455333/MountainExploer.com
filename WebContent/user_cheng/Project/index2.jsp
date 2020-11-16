<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-tw">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>岳進者</title>
    <link rel="stylesheet" href="/MountainExploer.com/css/index.css">
    <link rel="stylesheet" href="/MountainExploer.com/css/font.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
        integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <style>
        body {
            margin: 1px;
            padding: 1px;
        }
    </style>
    <script src="/MountainExploer.com/js/includejsp.js"></script>
    <script src="/MountainExploer.com/js/topBar.js"></script>
</head>

<body>
    <div class="container1" id="">
        <div class="count1">
            <div class="count1_img">
                <img src="images/logo1.png">
                <hr>
                <h1 class="font">岳進者</h1>
            </div>
        </div>
        <header>
            <nav class="navbar navbar-expand-lg navbar-light bg-light zline">
                <a class="navbar-brand" href="#"><img src="images/logo1.png" height="30%" width="30%"></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse"
                    data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                    aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent"
                    include-html="forinclude/includeForIndex.html"></div>
            </nav>
        </header>
        <div class="div_ul">
            <div class="div_li1">
                <a>保留區</a>
            </div>
            <div class="div_li3">
                <a>保留區</a>
            </div>
            <div class="div_li2">
                <!-- 每頁不同的內容從這裡開始 -->
                <div class="c001">
                    <div class="c002">
                        <div class="c003">
                            <dl class="c004">
                                <img src="images/下載.jpg">
                                <dt class="p_i_name">姓名class="p_i_name"</dt>
                                <br>
                                <dd class=p_i_content>內容</dd>
                                <dd class=p_i_content>1111111111111111111</dd>
                                <dd class=p_i_content>2222222222222222222222222222 </dd>
                            </dl>
                            <hr>
                            <dl class="c004">
                                <img src="images/下載.jpg">
                                <hr>
                                <dt class="p_i_name">姓名class="p_i_name"</dt>
                                <br>
                                <dd class=p_i_content>內容</dd>
                                <dd class="p_i_content">1111111111111111111</dd>
                                <dd class="p_i_content">2222222222222222222222222222 </dd>
                            </dl>
                        </div>
                    </div>
                </div>
                <!-- 每頁不同的內容到這裡結束 -->
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
        
        <footer id="footer">
        </footer>
    </div>
</body>

</html>