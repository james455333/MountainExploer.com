<%@ page import="member.MemberGlobal" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	Cookie[] cookies = null;
	String value1 = "";
	cookies = request.getCookies();
	if(cookies != null && cookies.length > 0){
		for(Cookie cookie : cookies){
			if(cookie.getName().equals("rmPwd")){
				value1 = MemberGlobal.decryptString(MemberGlobal.KEY, cookie.getValue());
			}
		}
	}

%>
<!DOCTYPE html>
<html lang="zh-tw">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>岳進者</title>
    <link rel="stylesheet" href="/MountainExploer.com/css/other.css">
    <link rel="stylesheet" href="/MountainExploer.com/css/font.css">
    <link rel="stylesheet" href="/MountainExploer.com/css/loginDiv.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <style>

    </style>
</head>

<body>
	<div id="fb-root"></div>
	<script async defer crossorigin="anonymous" src="https://connect.facebook.net/zh_TW/sdk.js#xfbml=1&version=v9.0&appId=679603812750961&autoLogAppEvents=1" nonce="2cmTiiay"></script>
<%-- 	<c:choose> --%>
<%-- 		<c:when test="${!empty errors}"> --%>
<!-- 			<script type="text/javascript" charset="UTF-8"> -->
<%-- // 				var errors = "${errors.msg}"; --%>
<!-- 			</script> -->
<%-- 		</c:when> --%>
<%-- 		<c:otherwise> --%>
<!-- 			<script type="text/javascript"> -->
<!-- // 				var errors = null; -->
<!-- 			</script> -->
<%-- 		</c:otherwise> --%>
<%-- 	</c:choose> --%>
	
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
       
        <!-- <div class="div_li1">
            <a>保留區</a>
        </div>
        <div class="div_li3">
            <a>保留區</a>
        </div> -->
        <div class="div_li2" style="height: 600px;">
            <!-- 每頁不同的內容從這裡開始 -->
            <div id="login-div" class="ui-dialog">
                <div class="login-header">登入/註冊
                    <a href="#"><img src="/MountainExploer.com/images/close.png" style="width: 25px; float: right; margin-right: 10px;"
                            alt=""></a>
                    <hr>
                </div>
                <form id="loginForm" action="<c:url value='/member/memberLoginAlone' />" method="POST">
                
                <div class="login-body" id="login-panel">
                    <table class="logintable" style="margin: 0 auto;">
                        <tbody>
                            <tr style="text-align: right;">
                                <th>帳號:</th>
                                <td>
                                	<input name="account" id="account" class="account" type="text" value="${cookie.rmAnt.value}" style=" width: 200px;border: 1px #ABADB3 solid;
                                    	padding: 5px 3px 5px; ">
                                    <span>${errors.account}${errors.msg}</span>
                                </td>
                                
                            </tr>
                            <tr>
                                <th>密碼:</th>
                                <td>
                                    <div>
                                        <input type="password" id="password" name="password" class="password" value="<%=value1%>"
                                            style="width: 200px;border: 1px #ABADB3 solid;padding: 5px 3px 5px; ">
                                        <span>${errors.password}${errors.msg}</span>
                                    </div>
                                    <div>
                                        <a href="/MountainExploer.com/member/memberPwdFoundEntry">忘記密碼</a>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th></th>
                                <td>
                                    <input type="checkbox" name="rememberMe" class="rememberMe"
                                    	<c:if test="${cookie.rememberMe.value == 'check'}">
                                                    		checked="checked"
                                       	</c:if> value="true">
                                       	<label for="rememberme">記住我</label>
                                    <input type="submit" class="submit" id="submit" value="登入">
                                    
                                </td>
                            </tr>
                         
                        </tbody>
                    </table>
                    <br>
                    <div style="text-align: center;">立即<a href="/MountainExploer.com/member/memberRegisterEntry">註冊</a>帳號</div>
                </div>
                </form>
                <div>
	            	<div scope="public_profile,email" onlogin="checkLoginState();" class="fb-login-button" data-size="large" data-button-type="login_with" data-layout="default" data-auto-logout-link="false" data-use-continue-as="false" data-width=""></div>
	            </div>
	            <br>
	            <div>
		          	<input type="button" name="userLog1" class="btn btn-info userLog1" value="一般登入">
		          	<input type="button" name="userLog2" class="btn btn-warning userLog2" value="登山嚮導登入">
		          	<input type="button" name="adminLog" class="btn btn-secondary adminLog" value="管理員登入">
	            </div>
	            
            </div>
            <!-- 每頁不同的內容到這裡結束 -->
        </div>
    </div>

    <footer id="footer">
        <!-- <a>全站導覽</a>
        <button id="demo1">確認demo1</button>
        <button id="demo2">錯誤demo2</button>
        <button id="demo3">確認提醒demo3</button>
        <button id="demo4">多重選項&提醒視窗demo4</button>
        <button id="demo5">Demo5</button>
        <button id="demo6">Demo6</button> -->



    </footer>
</body>
<script src="/MountainExploer.com/js/upLoadImg.js"></script><!-- 上傳頭像 -->
<script src="/MountainExploer.com/js/table.js"></script>
<script src="/MountainExploer.com/js/topBar.js"></script>
<!-- <script src="/MountainExploer.com/js/sweetalert.js"></script>sweet alert -->
<script src="/MountainExploer.com/js/includejsp.js"></script>
<!-- <script src="formalLoginAlone.js"></script> -->

</html>