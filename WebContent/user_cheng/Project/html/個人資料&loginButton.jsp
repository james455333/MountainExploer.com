<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>岳進者</title>
    <link rel="stylesheet" href="../css/other.css">
    <link rel="stylesheet" href="../css/font.css">
    <link rel="stylesheet" href="../css/personalPage.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="//code.jquery.com/jquery-1.9.1.js"></script>
    <script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

    <style>

    </style>
</head>

<body>
    
    <div class="count1">
        <div class="count1_img">
            <img src="../images/logo1.png">
            <hr>
            <h1 class="font">岳進者</h1>
            <!-- <a class="font">岳進者</a> -->
        </div>
    </div>
    <header>
        <nav class="navbar navbar-expand-lg navbar-light bg-light zline">
            <a class="navbar-brand" href="#"><img src="../images/logo1.png" height="30%" width="30%"></a>
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
                                                <input type="password"
                                                    style="width: 200px;border: 1px #ABADB3 solid;padding: 5px 3px 5px; ">
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
                <div class="pageControl">

                    
                    <!-- <div class="pageControl_Tr">
                        <img src="../images/personal/user.png" alt="" class="pageControl_Td" type="button"
                            id="userShow">
                    </div>
                    <div class="pageControl_Tr">
                        <img src="../images/personal/id-card.png" alt="" class="pageControl_Td" type="button"
                            id="idCardShow">
                    </div>
                    <div class="pageControl_Tr">
                        <img src="../images/personal/padlock.png" alt="" class="pageControl_Td" type="button"
                            id="padlockShow">
                    </div>
                    <div class="pageControl_Tr">
                        <img src="../images/personal/trophy.png" alt="" class="pageControl_Td" type="button"
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
                        
                        <form>
                            <div class="form-group row" style="margin-right: 15px;
                            margin-left: 15px; margin-top: 15px;">
                              <label for="" class="col-2 col-form-label"><a><img src="../images/personal/padlock.png" alt="" style="width:30%;"></a></label> 
                              <div class="col-8">
                                <div class="input-group">
                                  <div class="input-group-prepend">
                                    <div class="input-group-text">
                                      <i class="fa fa-id-badge"></i>
                                    </div>
                                  </div> 
                                  <input id="" name="" placeholder="123" type="text" class="form-control">
                                </div>
                              </div>
                            </div>
                            <div class="form-group row" style="margin-right: 15px;
                            margin-left: 15px;">
                              <label for="" class="col-2 col-form-label">密碼:</label> 
                              <div class="col-8">
                                <div class="input-group">
                                  <div class="input-group-prepend">
                                    <div class="input-group-text">
                                      <i class="fa fa-lock"></i>
                                    </div>
                                  </div> 
                                  <input id="" name="" placeholder="123" type="text" class="form-control">
                                </div>
                              </div>
                            </div>
                            <div class="form-group row" style="margin-right: 15px;
                            margin-left: 15px;">
                              <label for="text" class="col-2 col-form-label">生日:</label> 
                              <div class="col-8">
                                <div class="input-group">
                                  <div class="input-group-prepend">
                                    <div class="input-group-text">
                                      <i class="fa fa-birthday-cake"></i>
                                    </div>
                                  </div> 
                                  <input id="text" name="text" placeholder="ex1996.01.01" type="text" class="form-control">
                                </div>
                              </div>
                            </div>
                            <div class="form-group row" style="margin-right: 15px;
                            margin-left: 15px;">
                              <label class="col-2">性別:</label> 
                              <div class="col-8">
                                <div class="custom-control custom-radio custom-control-inline">
                                  <input name="radio" id="radio_0" type="radio" class="custom-control-input" value="boy" required="required"> 
                                  <label for="radio_0" class="custom-control-label">男</label>
                                </div>
                                <div class="custom-control custom-radio custom-control-inline">
                                  <input name="radio" id="radio_1" type="radio" class="custom-control-input" value="girl" required="required"> 
                                  <label for="radio_1" class="custom-control-label">女</label>
                                </div>
                                <div class="custom-control custom-radio custom-control-inline">
                                  <input name="radio" id="radio_2" type="radio" class="custom-control-input" value="no" required="required"> 
                                  <label for="radio_2" class="custom-control-label">不選擇</label>
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
                                  <input id="text2" name="text2" placeholder="aaa0111@example.com" type="text" class="form-control">
                                </div>
                              </div>
                            </div>
                            <div class="form-group row" style="margin-right: 15px;
                            margin-left: 15px;">
                              <label class="col-2 col-form-label" for="textarea">個人簡介:</label> 
                              <div class="col-8">
                                <textarea id="textarea" name="textarea" cols="40" rows="5" class="form-control"></textarea>
                              </div>
                            </div> 
                            <div class="form-group row" style="margin-right: 15px;
                            margin-left: 15px;">
                              <div class="offset-4 col-8" style="margin: 0 auto;">
                                <button name="submit" type="submit" class="btn btn-primary">確認更改</button>
                                <button name="submit" type="submit" class="btn btn-primary">取消</button>
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
            <!-- <div class="fix"><a href="#"><img src="../images/arror.png" alt="" style=" width:60px; height:60px;"></a>
            </div> -->
            <!-- 此為快捷鍵；宣告為fix後會將DIV的層級拉到最外層(不管原本是寫在哪)也就是跳脫出原本的HTML框架 -->
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
        <button id="button7"><a href=""><img src="../images/personal/user.png" alt="" style="width: 30px;"
                    id="logInButton"></a></button>



    </footer>
</body>
<script src="../js/upLoadImg.js"></script><!-- 上傳頭像 -->
<script src="../js/table.js"></script>
<script src="../js/login.js "></script>
<script src="../js/topBar.js"></script>
<script src="../js/sweetalert.js"></script>
<!--sweet alert-->
<script src="../js/includejsp.js"></script>
<script src="../js/personalContrul.js"></script><!-- 個人資料控制列表 -->


</html>