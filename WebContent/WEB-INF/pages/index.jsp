<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
 	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>岳進者</title>
	<link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/font.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    
    <style>
        body {
            margin: 1px;
            padding: 1px;
        }
    </style>
    <script src="/MountainExploer.com/js/includejsp.js"></script>
</head>
<body>
    <div class="container1" id="">
        <div class="count1">
            <div class="count1_img">
                <img src="/MountainExploer.com/images/logo1.png">
                <hr>
                <h1 class="font">岳進者</h1>
            </div>


        </div>

        <header>
            <nav class="navbar navbar-expand-lg navbar-light bg-light zline">
                 <a class="navbar-brand" href="#" include-html="/MountainExploer.com/forinclude/includeForIndexLogo.html">
            </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse"
                    data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                    aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent" include-html="/MountainExploer.com/forinclude/includeForIndex.html"></div>
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






        <footer id="footer">

        </footer>

    </div>
    <script type="text/javascript">
		checklogin = "${sessionScope.Member}"
	</script>
    <script src="/MountainExploer.com/js/topBar.js"></script>

</body>
</html>