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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="//code.jquery.com/jquery-1.9.1.js"></script>
    <script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/sweetalert2@9.17.2/dist/sweetalert2.min.css" rel="stylesheet" />
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
            
                <div class="pageControl">

                    
                    <!-- <div class="pageControl_Tr">
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
                    </div> -->
                </div>
                <div class="personalInfo">
                    <div id="user" style="display: none;">
                    上傳頭像
                    </div>
                    <div id="idCard display: block;">
                        <!-- 個資內容<br>
                        相片:<br>
                        帳號:<br>
                        密碼:<br>
                        名稱:<br>
                        生日:<br>
                        性別:<br> -->
                        <h2>修改會員資料</h2>
                        <form id="upInForm" action="<c:url value='/member/memberInfoUpdateAction' />" method="POST">
                        
                        	<div style="display:none">
								<label>會員編號</label>
								<input type="text" name="seqno" class="seqno" id="seqno" value="${Member.seqno}">
							</div>
                            <div class="form-group row" style="margin-right: 15px;
                            margin-left: 15px; margin-top: 15px;">
                              <label for="" class="col-2 col-form-label">暱稱：</label> 
                              <div class="col-8">
                                <div class="input-group">
                                  <div class="input-group-prepend">
                                    <div class="input-group-text">
                                      <i class="fa fa-id-badge"></i>
                                    </div>
                                  </div> 
                                  <input id="ncName" name="memberInfo.neck_name" type="text" class="form-control ncName" value="${Member.memberInfo.neck_name}" required="required">
                                </div>
                              </div>
                            </div>
                            <div class="form-group row" style="margin-right: 15px;
                            margin-left: 15px;">
                              <label for="" class="col-2 col-form-label">姓名：</label> 
                              <div class="col-8">
                                <div class="input-group">
                                  <div class="input-group-prepend">
                                    <div class="input-group-text">
                                      <i class="fa fa-lock"></i>
                                    </div>
                                  </div> 
                                  <input id="name" name="name" type="text" class="form-control name" value="${Member.name}">
                                  <span class="nmsp"></span><br/>
                                </div>
                              </div>
                            </div>
                            <div class="form-group row" style="margin-right: 15px;
                            margin-left: 15px;">
                              <label for="text" class="col-2 col-form-label">生日：</label> 
                              <div class="col-8">
                                <div class="input-group">
                                  <div class="input-group-prepend">
                                    <div class="input-group-text">
                                      <i class="fa fa-birthday-cake"></i>
                                    </div>
                                  </div> 
                                  <input id="birDate" name="memberInfo.birthday" type="text" class="form-control birDate" value="${Member.memberInfo.birthday}">
                                  <span class="brsp"></span><br/>
                                </div>
                              </div>
                            </div>
                            <div class="form-group row" style="margin-right: 15px;
                            margin-left: 15px;">
                              <label class="col-2">性別：</label> 
                              <div class="col-8">
                                <div class="custom-control custom-radio custom-control-inline">
                                  <input name="memberInfo.gender" id="gender1" type="radio" class="custom-control-input" value="male" required="required" ${Member.memberInfo.gender == "male" ? 'checked' : ''}> 
                                  <label for="radio_0" class="custom-control-label">男</label>
                                </div>
                                <div class="custom-control custom-radio custom-control-inline">
                                  <input name="memberInfo.gender" id="gender2" type="radio" class="custom-control-input" value="female" required="required" ${Member.memberInfo.gender == "female" ? 'checked' : ''}> 
                                  <label for="radio_1" class="custom-control-label">女</label>
                                </div>
                                <div class="custom-control custom-radio custom-control-inline">
                                  <input name="memberInfo.gender" id="gender3" type="radio" class="custom-control-input" value="x" required="required" ${Member.memberInfo.gender == "x" ? 'checked' : ''}> 
                                  <label for="radio_2" class="custom-control-label">X</label>
                                </div>
                                <div class="custom-control custom-radio custom-control-inline">
                                  <input name="memberInfo.gender" id="gender4" type="radio" class="custom-control-input" value="mask" required="required" ${Member.memberInfo.gender == "mask" ? 'checked' : ''}> 
                                  <label for="radio_3" class="custom-control-label">不透露</label>
                                </div>
                              </div>
                            </div>
                            <div class="form-group row" style="margin-right: 15px;
                            margin-left: 15px;">
                              <label for="text2" class="col-2 col-form-label">E-mail:</label> 
                              <div class="col-8">
                                <div class="input-group">
                                  <div class="input-group-prepend">
                                    <div class="input-group-text">
                                      <i class="fa fa-envelope"></i>
                                    </div>
                                  </div> 
                                  <input id="email" name="email" type="text" class="form-control email" value="${Member.email}" required="required">
                                  <span class="emsp"></span><br/>
                                </div>
                              </div>
                            </div>
                            <div class="form-group row" style="margin-right: 15px;
                            margin-left: 15px;">
                              <label for="text2" class="col-2 col-form-label">手機號碼：</label> 
                              <div class="col-8">
                                <div class="input-group">
                                  <div class="input-group-prepend">
                                    <div class="input-group-text">
                                      <i class="fa fa-envelope"></i>
                                    </div>
                                  </div> 
                                  <input id="phone" name="memberInfo.phone" type="text" class="form-control phone" value="${Member.memberInfo.phone}" required="required">
                                  <span class="phsp"></span><br/>
                                </div>
                              </div>
                            </div>
                            <div class="form-group row" style="margin-right: 15px;
                            margin-left: 15px;">
                              <label for="text2" class="col-2 col-form-label">登山經驗：</label> 
                              <div class="col-8">
                                <div class="input-group">
                                  <div class="input-group-prepend">
                                    <div class="input-group-text">
                                      <i class="fa fa-envelope"></i>
                                    </div>
                                  </div> 
                                  <input id="exp" name="memberInfo.climb_ex" type="text" class="form-control exp" value="${Member.memberInfo.climb_ex}" required="required">
                                </div>
                              </div>
                            </div>
                            <div class="form-group row" style="margin-right: 15px;
                            margin-left: 15px;">
                              <label class="col-2 col-form-label" for="textarea">個人簡介:</label> 
                              <div class="col-8">
                                <textarea id="other" name="memberInfo.other" cols="40" rows="5" class="form-control other"></textarea>
                              </div>
                            </div> 
                            <div class="form-group row" style="margin-right: 15px;
                            margin-left: 15px;">
                              <div class="offset-4 col-8" style="margin: 0 auto;">
                                <button name="submit" type="submit" class="btn btn-primary submit">確認更改</button>
                                <button name="submit" id="reset" type="reset" class="btn btn-primary">取消</button>
                              </div>
                            </div>
                          </form>

                    </div>
                    <div id="padLock" style="display: none;">
                        安全性<br>
                        帳號:(唯讀)<br>
                        密碼:(可更改)
                    </div>
                    <div id="challenge" style="display: none;">
                        挑戰<br>
                        (目前尚未有任何積分或挑戰成就)
                    </div>
                </div>

            </div>
            <div>Icons made by <a href="https://www.flaticon.com/authors/freepik" title="Freepik">Freepik</a> from <a
                    href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a></div>
            <!-- 每頁不同內容到這邊結束 -->
            <!-- <div class="fix"><a href="#"><img src="/MountainExploer.com/images/arror.png" alt="" style=" width:60px; height:60px;"></a>
            </div> -->
            <!-- 此為快捷鍵；宣告為fix後會將DIV的層級拉到最外層(不管原本是寫在哪)也就是跳脫出原本的HTML框架 -->
        </div>

    </div>
    <footer id="footer">
        <a>全站導覽</a>
<!--         <button id="demo1">確認demo1</button> -->
<!--         <button id="demo2">錯誤demo2</button> -->
<!--         <button id="demo3">確認提醒demo3</button> -->
<!--         <button id="demo4">多重選項&提醒視窗demo4</button> -->
<!--         <button id="demo5">Demo5</button> -->
<!--         <button id="demo6">Demo6</button> -->
        <button id="button7"><a href=""><img src="/MountainExploer.com/images/personal/user.png" alt="" style="width: 30px;"
                    id="logInButton"></a></button>



    </footer>
</body>
<script src="/MountainExploer.com/js/upLoadImg.js"></script><!-- 上傳頭像 -->
<script src="/MountainExploer.com/js/table.js"></script>
<script src="/MountainExploer.com/js/login.js "></script>
<script src="/MountainExploer.com/js/topBar.js"></script>
<!-- <script src="/MountainExploer.com/js/sweetalert.js"></script> -->
<!--sweet alert-->
<script src="/MountainExploer.com/js/includejsp.js"></script>
<script src="/MountainExploer.com/js/personalContrul.js"></script><!-- 個人資料控制列表 -->
<script src="/MountainExploer.com/member/formalUpdateInfo.js"></script>

</html>