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
            <h1 class="font">岳進者</h1>
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
        <!-- <div class="secNavbar">
            <nav>
                <ul class="second_nav">
                    <li class="li1"><a href="#">第二導覽列1</a></li>

                    <li class="li1"><a href="#">第二導覽列2</a></li>

                    <li class="li1"><a href="#">第二導覽列3</a></li>

                    <li class="li1"><a href="#">第二導覽列4</a></li>
                </ul>
            </nav>
        </div> -->
        <div class="div_li1">
            <a>保留區</a>
        </div>
        <div class="div_li3">
            <a>保留區</a>
        </div>
        <div class="div_li2">
<div>
    <div>登入</div>
    <div>註冊</div>
</div>
            <!-- 每頁不同的內容從這裡開始 -->
<div id="dialog-form" title="登入/註冊">
    <div id="login-div" class="ui-dialog">
      <div class="login-body" id="login-panel">
        <table class="logintable" style="margin: 0 auto;">
          <tbody>
            <tr style="text-align: right;">
              <th>帳號:</th>
              <td><input name="username" type="text" style=" width: 200px;border: 1px #ABADB3 solid;
                          padding: 5px 3px 5px; "></td>
            </tr>
            <tr style="text-align: right;">
              <th>密碼:</th>
              <td>
                <div>
                  <input type="password" style="width: 200px;border: 1px #ABADB3 solid;padding: 5px 3px 5px; ">
                </div>
              </td>
            </tr>
            <tr>
              <th></th>
              <td>
                <div>
                  <a href="#">忘記密碼</a>
                </div>
              </td>
            </tr>
            <tr>
              <th></th>
              <td>
                <div>
                  <label>
                    記住我<input type="checkbox" name="rememberme" style="float: left;">
                  </label>
                </div>

              </td>
            </tr>
          </tbody>
        </table>
        <br>
        <div style="text-align: center;">立即<a href="#" style="color:blue;">註冊</a>新帳號</div>
      </div>
    </div>
  </div>



  <button id="create-user">登入/註冊</button>

            
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
        <button id="button7"><a href=""><img src="/MountainExploer.com/images/personal/user.png" alt="" style="width: 30px;" id="logInButton"></a></button>



    </footer>
</body>
<script src="/MountainExploer.com/js/upLoadImg.js"></script><!-- 上傳頭像 -->
<script src="/MountainExploer.com/js/login.js"></script><!-- 上傳頭像 -->
<script src="/MountainExploer.com/js/table.js"></script>
<script src="/MountainExploer.com/js/topBar.js"></script>
<script src="/MountainExploer.com/js/sweetalert.js"></script><!--sweet alert-->
<script src="/MountainExploer.com/js/includejsp.js"></script>
</html>