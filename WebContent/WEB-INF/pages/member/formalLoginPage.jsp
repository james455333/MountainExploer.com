
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="zh-tw">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>岳進者</title>
    <link rel="stylesheet" href="/MountainExploer.com/css/other.css">
    <link rel="stylesheet" href="/MountainExploer.com/css/font.css">
    <link rel="stylesheet" href="/MountainExploer.com/css/style.css">
    <link rel="stylesheet" href="/MountainExploer.com/css/loginDiv.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<link href="https://cdn.jsdelivr.net/npm/sweetalert2@9.17.2/dist/sweetalert2.min.css" rel="stylesheet" />
    
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<!--     <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> -->
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <script src="userTop.js"></script>
    <style>

    </style>
</head>

<body>
	<div id="fb-root"></div>
	<script async defer crossorigin="anonymous" src="https://connect.facebook.net/zh_TW/sdk.js#xfbml=1&version=v9.0&appId=679603812750961&autoLogAppEvents=1" nonce="2cmTiiay"></script>

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
    
        <div class="div_li2" style="height: 600px;">
            <!-- 每頁不同的內容從這裡開始 -->
            
                <div class="container">
			    <div id="loginbox" style="margin-top:50px;margin-left:200px" class="mainbox col-lg-6 offset-md-3 col-md-8 offset-sm-2">
			        <div class="card card-inverse card-info" style="width:600px">
			            <div class="card-header">
			                <div class="card-title" style="font-family: Microsoft JhengHei;font-weight:bold;font-size:25px">註冊／登入</div>
			                <div style="float: right; font-size:16px; position: relative; top: -10px;"><a href="/MountainExploer.com/member/memberPwdFoundEntry">忘記密碼？</a>
			                </div>
			            </div>
			            <div style="padding-top:30px;height:400px" class="card-block">
			                <div style="display: none;" id="login-alert" class="alert alert-danger col-md-12"></div>
			                
			                    <div style="margin-bottom:25px;margin-left:40px;width:500px" class="input-group">
			                    	<span class="input-group-addon" style="font-weight:bold;font-size:20px">帳號：</span>
			          
			                        <input id="login-username" type="text" class="form-control account" name="account" style="font-size:20px"/>
			                    </div>
			                    <div style="margin-bottom: 25px;margin-left:40px;width:500px" class="input-group">
			                    	<span class="input-group-addon" style="font-weight:bold;font-size:20px">密碼：</span>
			                        <input id="login-password" type="password" class="form-control password" name="password" style="font-size:20px"/>
			                    </div>
			                    <div class="input-group" style="margin-left:250px">
			                        <div class="form-check" >
			                            <input type="checkbox" name="rememberMe" class="rememberMe" value="true">
                                       	<label for="rememberme" style="font-size:18px">記住我</label>
			                        </div>
			                    </div>
			                    <div style="margin-top: 10px;" class="form-group">
			                        <!-- Button -->
			                        <div class="col-md-12 controls">
			                        	<button type="button" id="btn-login" class="btn btn-primary btn-default submit">登入</button>
			                        </div>
			                    </div>
			                    <div class="form-group">
			                        <div class="col-lg-12 control">
			                            <div style="padding-top: 10px; font-size:18px;">立即 <a href="/MountainExploer.com/member/memberRegisterEntry">註冊</a>
			                            </div>
			                        </div>
			                    </div>
			                    <div>
				                    <div scope="public_profile,email" onlogin="checkLoginState();" class="fb-login-button" data-size="large" data-button-type="login_with" data-layout="default" data-auto-logout-link="false" data-use-continue-as="false" data-width=""></div>
			                    </div>

					            <div style="margin-top:10px">
						          	<input type="button" name="userLog1" class="btn btn-info userLog1" value="一般登入">
						          	<input type="button" name="userLog2" class="btn btn-warning userLog2" value="登山嚮導登入">
						          	<input type="button" name="adminLog" class="btn btn-secondary adminLog" value="管理員登入">
						          	<button type="button" name="testLog" class="btn btn-info disabled userLog3">即時登入</button>
					            </div>
					        </div>
			                
			            </div>
			        </div>
			    </div>
			    
				
                
               
	            
            </div>
            <!-- 每頁不同的內容到這裡結束 -->
        </div>
  

    <footer id="footer"
			include-html="/MountainExploer.com/forinclude/includeForFooter.html">
	</footer>
</body>
<script src="/MountainExploer.com/js/upLoadImg.js"></script><!-- 上傳頭像 -->
<script src="/MountainExploer.com/js/table.js"></script>
<script src="/MountainExploer.com/js/topBar.js"></script>
<!-- <script src="/MountainExploer.com/js/sweetalert.js"></script>sweet alert -->
<script src="/MountainExploer.com/js/includejsp.js"></script>
<script src="formalLoginAlone.js"></script>



</html>