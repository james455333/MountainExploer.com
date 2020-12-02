<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-tw">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>岳進者</title>
    <!-- Font Awesome -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
	<!-- Bootstrap core CSS -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet">
    <!-- project public -->
    <link rel="stylesheet" href="/MountainExploer.com/css/other.css">
    <link rel="stylesheet" href="/MountainExploer.com/css/font.css">
    <link rel="stylesheet" href="/MountainExploer.com/mountain/css/mountain.css">
    <!-- for this page -->
    <link rel="stylesheet" href="detail/detail.css">
	    <!-- JQuery UI -->
	<link rel="stylesheet" href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
    
    <!-- CKeditor4 -->
	<script src="/MountainExploer.com/mountain/ckeditor/ckeditor.js"></script>
	<!-- JQuery -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	<!-- Bootstrap tooltips -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
	<!-- Bootstrap core JavaScript -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.min.js"></script>
	<!-- MDB core JavaScript -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.0/js/mdb.min.js"></script>
	<!-- sweetalert -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <!-- for this page -->
    <script src="/MountainExploer.com/mountain/js/mountain.js"></script>
    <script src="detail/detail.js"></script>
    <script src="detail/detailFunction.js"></script>
    <!-- active method -->
	<script src="/MountainExploer.com/js/login.js "></script>
	<!-- Login Dialog -->
	<script src="//code.jquery.com/jquery-1.9.1.js"></script>
	<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
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
            <a class="navbar-brand" href="/MountainExploer.com/"><img src="/MountainExploer.com/images/logo1.png" height="30%" width="30%"></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent" include-html="/MountainExploer.com/forinclude/includeForIndex.html"></div>
        </nav>
    </header>
    <div class="div_ul">
    	<div>
    	<div id="dialog-form" title="登入/註冊">
			    <div id="login-div" class="ui-dialog">
			        <div class="login-body" id="login-panel">
			            <table class="logintable" style="margin: 0 auto;">
			                <tbody>
			                    <tr style="text-align: right;">
			                        <th>帳號:</th>
			                        <td><input id="account" name="account" type="text" style=" width: 200px;border: 1px #ABADB3 solid;
			                          padding: 5px 3px 5px; "></td>
			                    </tr>
			                    <tr style="text-align: right;">
			                        <th>密碼:</th>
			                        <td>
			                            <div>
			                                <input id="password" type="password" style="width: 200px;border: 1px #ABADB3 solid;padding: 5px 3px 5px; ">
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
												記住我<input id="rememberMe" type="checkbox" name="rememberme" style="float: left;">
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
    	</div>
        <!-- <div class="導覽列表">
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
        </div>
        <div class="div_li3">
        </div>
        <div class="div_li2">
            <!-- 每頁不同的內容從這裡開始 -->
            
            <div class="innerContainer">
				<!--	活動標題 	-->
				<table class="actTitle">
					<tbody>
						<tr>
							<td>
								<!-- 標籤 -->
								<div class="tagContainer"></div>
								<!-- 標題 -->
								<div class="a_title"><a></a></div>
							</td>
						</tr>
					</tbody>
				</table>
				<!-- 活動主內容 -->		
				<div class="actPost">
					<!-- 分隔用DIV	 -->
					<div class="d-stock"></div>
					<input type="hidden" name="seqno" >
					<table>
						<tbody>
							<tr>
								<!-- 會員資訊 -->
								<td class="memberTD">
									<!-- 會員暱稱 -->
									<div><a href=""></a></div>
									<!-- 會員頭像 -->
									<div class="memeberImgContainer">
										<a href="">
											<img class="memeberImg" src="">
										</a>
									</div>
								</td>
								<td class="d_Main">
									<!-- 發起時間 -->
									<div class="d_time"></div>
									<!-- 修改 -->
									<div class="d_ctrl">
										<button type="button" class="btn-detail-update btn btn-info btn-sm"><i class="fas fa-edit"></i> 編輯</button>
									</div>
									
									<!-- 發文內容 -->
									<div class="d_content">
										<!-- 內容文字 -->
										<div class="d_text">
											<!-- 最後編輯時間 -->
											<i></i>
											<!-- 會有預設內容，可更改 -->
										</div>
										<!-- 會員偵測 -->
										<div class="d_member_check">
											<div class="memberLocker">
												瀏覽完整內容，請先
												<a href="/MountainExploer.com/member/memberRegisterEntry">註冊</a>
												或
												<a href="/MountainExploer.com/member/memberLoginEntry">登入會員</a>
											</div>
											<!-- 圖片 (複數:最多5) -->
											<div class="d_act_img_con">
											</div>
<!-- 											<div class="d_act_img"> -->
<!-- 												<img alt="" src=""> -->
<!-- 											</div> -->
											<!-- 備註 -->
											<div class="d_noteInfo">
												<div>
													
												</div>
											</div>
											<!-- 報名鈕 -->
											<div class="goReg">
												<a href="#"></a>
											</div>
											
										</div>
										<!-- 留言 複數 -->
											<div class="d_sr">
												<div class="d-sr-body">
													<!-- 留言者 -->
													<div class="d_sr_img">
														<!-- 留言者頭像 -->
														<a href="">
															<img src="">
														</a>
													</div>
													<!-- 留言內容 -->
													<div class="d_sr_text">
														<!-- 留言者暱稱 -->
														<a style="padding: 0" href=""></a>
														<span></span>
														<!-- 測試留言者內容 -->
														<span>發表於 : </span>
													</div>
												</div>
											</div>
									</div>
								
								</td>
							</tr>
							<!-- 回覆-->
							<tr>
								<td>
								</td>
								<td>
									<div class="container-fluid comment-container btn-hide">
										<div class="row">
											<div class="col-md-10 comment-input-container">
												
												<input type="text" name="message" maxlength="30" placeholder="最大留言字數 : 30">
											</div>
											<div class="col-md-2 comment-btn-container">
												<button class="btn btn-success btn-block btn-sideResp">留言  <i class="fas far fa-comment-alt pl-1"></i></button>
											</div>
										</div>
									</div>
								</td>
							</tr>
<!-- 								預備用	 -->
							<tr>
							</tr>
						</tbody>
					</table>
				</div>
					
            	
            	
            	<nav class="pageControl" id="innerPC1">
                    <ul>
                        <li class="li1">
                            <a href="#">«第一頁</a>
                        </li>
                        <li class="li1">
                            <a href="#">‹上一頁</a>
                        </li>
                        <li class="li1">
                            <a href="#"></a>
                        </li>
                        <li class="li1">
                            <a href="#">下一頁›</a>
                        </li>
                        <li class="li1">
                            <a href="#">最末頁»</a>
                        </li>
                    </ul>
                </nav>
            	
            	
            </div>
            <!-- 頁面控制 -->
            <nav class="pageControl">
			    <ul>
			        <li class="li1">
			            <a href="#">«第一頁</a>
			        </li>
			        <li class="li1">
			            <a href="#">‹上一頁</a>
			        </li>
			        <li class="li1">
			            <a href="#"></a>
			        </li>
			        <li class="li1">
			            <a href="#">下一頁›</a>
			        </li>
			        <li class="li1">
			            <a href="#">最末頁»</a>
			        </li>
			    </ul>
			</nav>
            <div class="container-fluid">
				<div class="row resp-container">
					<div class="col-md-12">
						<div class="row">
							<div class="col-md-12">
								回覆
							</div>
						</div>
						<div class="row">
							<div class="col-md-12 resp-ckeditor">
								<textarea name="resp"></textarea>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								 <div class="control-group">
								    <label class="control control-checkbox">
								        設為私密回覆
								            <input type="checkbox" id="btn-resp-private" />
								    </label>
								</div>
								<button type="button" class="btn btn-primary btn-lg btn-resp">
									<i class="fas fa-plus"></i>
									發布回覆
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
            <!-- 每頁不同的內容到這裡結束 -->
            <!-- 頁面控制 -->
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
<!--sweet alert-->
<script src="/MountainExploer.com/js/topBar.js"></script>
<script src="/MountainExploer.com/js/sweetalert.js"></script>
<script src="/MountainExploer.com/js/includejsp.js"></script>
<!--sweet alert-->
</html>