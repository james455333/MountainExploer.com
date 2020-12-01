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
            <a>保留區</a>
        </div>
        <div class="div_li3">
            <a>保留區</a>
        </div>
        <div class="div_li2">
            <!-- 每頁不同的內容從這裡開始 -->
            <div class="secDivContent">
                <div class="pageControl">
                    <div class="pageControl_Tr">
                        <img src="/MountainExploer.com/images/personal/user.png" alt="" class="pageControl_Td" type="button"
                            id="userShow">
                    </div>
                    <div class="pageControl_Tr">
                        <img src="/MountainExploer.com/images/personal/id-card.png" alt="" class="pageControl_Td" type="button"
                            id="idCardShow">
                    </div>
                    <div class="pageControl_Tr">
                        <img src="/MountainExploer.com/images/personal/padlock.png" alt="" class="pageControl_Td" type="button"
                            id="padlockShow">
                    </div>
                    <div class="pageControl_Tr">
                        <img src="/MountainExploer.com/images/personal/trophy.png" alt="" class="pageControl_Td" type="button"
                            id="challengeShow">
                    </div>
                </div>
                <div class="personalInfo">
                    <div id="user" style="display: block;">
                    	<h2>上傳頭貼</h2>
                       	<input type="button" name="userImg" class="userImg" value="上傳頭貼">
                    </div>
                    <div id="idCard" style="display: none;">
                       	<h2>${Member.memberInfo.neck_name}的個人資料</h2>
                       	<div style="display:none">
							<input type="text" name="seqno" class="seqno" value="${Member.seqno}">
						</div>
						<div>
                        	<label>帳號：</label>
                        	<span>${Member.account}</span><br>
							<input type="hidden" name="account" value="${Member.account}">
						</div>
						<div>
                      	  	<label>暱稱：</label>
                      	  	<span>${Member.memberInfo.neck_name}</span><br>
                      		<input type="hidden" name="memberInfo.neck_name" value="${Member.memberInfo.neck_name}">
						</div>
						<div>
							<label>姓名：</label>
							<span>${Member.name}</span><br>
							<input type="hidden" name="name" value="${Member.name}">
						</div>
						<div>
							<label>性別：</label>
							<span>
								<c:if test="${Member.memberInfo.gender eq 'male'}">
									男
								</c:if>
								<c:if test="${Member.memberInfo.gender eq 'female'}">
									女
								</c:if>
								<c:if test="${Member.memberInfo.gender eq 'x'}">
									X
								</c:if>
							</span><br>
							<input type="hidden" name="memberInfo.gender" value="${Member.memberInfo.gender}">
						</div>
						<div>
                        	<label>生日：</label>
                        	<span>${Member.memberInfo.birthday}</span><br/>
							<input type="hidden" name="memberInfo.birthday" value="${Member.memberInfo.birthday}">
						</div>
                        <div>
                        	<label>手機號碼：</label>
                        	<span>${Member.memberInfo.phone}</span><br/>
							<input type="hidden" name="memberInfo.phone" value="${Member.memberInfo.phone}">
                        </div>
                        <div>
                        	<label>Email：</label>
							<span>${Member.email}</span><br/>
							<input type="hidden" name="email" value="${Member.email}">
                        </div>
                        <div>
                        	<label>登山經驗：</label>
							<span>${Member.memberInfo.climb_ex}</span><br/>
							<input type="hidden" name="memberInfo.climb_ex" value="${Member.memberInfo.climb_ex}">
                        </div>
                        <div>
                        	<label>身分組：</label>
                        	<span>
                        		<c:if test="${Member.memberStatus.seqno eq 100}">
									一般會員
								</c:if>
								<c:if test="${Member.memberStatus.seqno eq 120}">
									登山嚮導						
								</c:if>
                        	</span><br>
                        </div>
                        <div class="otdiv">
                        	<label>個人簡介：</label>
                        	<span class="otsp"></span><br/>
                        	<input type="text" name="memberInfo.other" class="other" id="other" value="" readonly="readonly">
                        </div>
                        <div>
                        	<input type="button" class="turnToUpPage" value="修改會員資料"/>
                        </div>
                    </div>
                    <form action="<c:url value='/member/memberPwdChangeAction' />" method="POST">
                    <div id="padLock" style="display: none;">
                    	<h2>修改密碼</h2>
                    	<div style="display:none">
							<input type="text" name="seqnoPwd" class="seqnoPwd" value="${Member.seqno}">
						</div>
                        <div>
                        	<label>請輸入舊密碼：</label>
							<input type="password" class="pwd" id="pwd" name="password" required="required">
							<span class="pwdsp">${errors.password}</span>
                        </div>
                        <div>
                        	<label>請輸入新密碼：</label>
							<input type="password" class="updatePwd" name="updatePwd" required="required">
							<span class="upsp">${errors.updatePwd}</span>
                        </div>
                        <div>
                        	<label>請再次輸入新密碼：</label>
							<input type="password" class="chkPwd" name="chkPwd" required="required">
							<span class="chksp">${errors.chkPwd}</span>
                        </div>
                        <div>
							<input type="submit" class="submit" name="submit" value="送出">
						</div>
                    </div>
                    </form>
                    <div id="challenge" style="display: none;">
                        挑戰<br>
                        (目前尚未有任何積分或挑戰成就)
                    </div>
                </div>

            </div>
            <div>Icons made by <a href="https://www.flaticon.com/authors/freepik" title="Freepik">Freepik</a> from <a
                    href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a></div>
            <!-- 每頁不同內容到這邊結束 -->
            <div class="fix"><a href="#"><img src="/MountainExploer.com/images/arror.png" alt="" style=" width:60px; height:60px;"></a>
            </div>
            <!-- 宣告為fix後會將DIV的層級拉到最外層(不管原本是寫在哪)也就是跳脫出原本的HTML框架 -->
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
        <button id="demo7">Demo7</button>



    </footer>
</body>
<script src="/MountainExploer.com/member/memberPwdChange.js"></script>
<script src="/MountainExploer.com/js/upLoadImg.js"></script><!-- 上傳頭像 -->
<script src="/MountainExploer.com/js/table.js"></script>
<script src="/MountainExploer.com/js/topBar.js"></script>
<script src="/MountainExploer.com/js/sweetalert.js"></script>
<!--sweet alert-->
<script src="/MountainExploer.com/js/includejsp.js"></script>
<script src="/MountainExploer.com/js/personalContrul.js"></script><!-- 個人資料控制列表 -->


</html>