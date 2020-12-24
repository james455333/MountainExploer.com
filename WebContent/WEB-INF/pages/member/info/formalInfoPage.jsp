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
    <link rel="stylesheet" href="/MountainExploer.com/css/style.css">
    
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

    <style>
	
    </style>
</head>

<body>
    
    <div class="container-fluid" style="padding: 0px;" include-html="/MountainExploer.com/forinclude/carousel.html">
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
            <div class="secDivContent">
				<div class="container bootstrap snippets bootdey">
				<div class="panel-body inf-content">
				    <div class="row">
				        <div class="col-md-4">
				        	<form id="imgForm" action="<c:url value='/member/imgUpdateAction'/>" method="POST" enctype="multipart/form-data">
					            <img alt="會員頭貼" style="width:600px;" class="img-circle img-thumbnail isTooltip userFile" src="https://x1.xingassets.com/assets/frontend_minified/img/users/nobody_m.original.jpg" data-original-title="Usuario">
					            <p class="text-primary" style="font-family: Microsoft JhengHei;">點擊圖片修改頭貼</p>
								<div  style="display:none" class="hiddenImg">
									<img src="">
									<input type="file" name="userImg" class="userImg" accept="image/*" style="font-family: Microsoft JhengHei;margin-left:50px">
									<input type="button" class="updateImg" value="修改頭貼">								
								</div>	
					            <div style="display:none">
					            	<input type="text" class="seqno" name="seqno" value="${Member.seqno}">
					            </div>
				            </form>
				        </div>
				        <div class="col-md-6">
				            <strong style="font-family: Microsoft JhengHei;font-weight:bold;font-size:30px">個人資訊</strong><br>
				            <div class="table-responsive">
				            <table class="table table-user-information">
				                <tbody>
				                    <tr class="acTr">        
				                        <td>
				                            <strong>
				                                <span class="glyphicon glyphicon-asterisk text-primary"></span>
				                                	會員帳號
				                            </strong>
				                        </td>
				                        <td class="text-primary account">
				                            	尚未填寫
				                        </td>
				                    </tr>
				                    <tr class="nmTr">    
				                        <td>
				                            <strong>
				                                <span class="glyphicon glyphicon-user text-primary"></span>    
				                                	姓名
				                            </strong>
				                        </td>
				                        <td class="text-primary name">
				                                 	尚未填寫
				                            <div>
				                            </div>
				                        </td>
				                        <td style="display:none" class="hiddeninp">
					                        <input type="text" class="form-control nmInp" placeholder="請填入至少兩個中文字元" required="required">				                            	
				                        </td>
				                    </tr>
				                    <tr class="ncTr">        
				                        <td>
				                            <strong>
				                                <span class="glyphicon glyphicon-cloud text-primary"></span>  
				                                	暱稱
				                            </strong>
				                        </td>
				                        <td class="text-primary ncName">
				                           	尚未填寫
				                        </td>
				                        <td style="display:none" class="hiddeninp">
					                        <input type="text" class="form-control ncInp" required="required">				                            	
				                        </td>
				                    </tr>
				                    <tr class="gnTr">        
				                        <td>
				                            <strong>
				                                <span class="glyphicon glyphicon-cloud text-primary"></span>  
				                                	性別
				                            </strong>
				                        </td>
				                        <td class="text-primary gender">
				                           	尚未填寫
				                        </td>
				                        <td style="display:none" class="hiddeninp">
					                        <input type="radio" style="margin-left:3px" name="gnInp" id="gnInp1" class="gnInp" value="male" required="required">男
					                        <input type="radio" style="margin-left:3px" name="gnInp" id="gnInp2" class="gnInp" value="female" required="required">女
					                        <input type="radio" style="margin-left:3px" name="gnInp" id="gnInp3" class="gnInp" value="x" required="required">X
					                        <input type="radio" style="margin-left:3px" name="gnInp" id="gnInp4" class="gnInp" value="mask" required="required">不透露				                            	
				                        </td>
				                    </tr>
				
				                    <tr class="emTr">        
				                        <td>
				                            <strong>
				                                <span class="glyphicon glyphicon-bookmark text-primary"></span> 
				                                	Email
				                            </strong>
				                        </td>
				                        <td class="text-primary email">
				                            	尚未填寫
				                        </td>
				                        <td style="display:none" class="hiddeninp">
					                        <input type="text" class="form-control emInp" placeholder="example@gmail.com，此格不可為空" required="required">				                            	
				                        </td>
				                    </tr>
				                    <tr class="phTr">        
				                        <td>
				                            <strong>
				                                <span class="glyphicon glyphicon-bookmark text-primary"></span> 
				                                	手機
				                            </strong>
				                        </td>
				                        <td class="text-primary phone">
				                            	尚未填寫
				                        </td>
				                        <td style="display:none" class="hiddeninp">
					                        <input type="text" class="form-control phInp" placeholder="09xxxxxxxx" required="required">				                            	
				                        </td>
				                    </tr>
				
				
				                    <tr class="gpTr">        
				                        <td>
				                            <strong>
				                                <span class="glyphicon glyphicon-eye-open text-primary"></span> 
				                                	身分組
				                            </strong>
				                        </td>
				                        <td class="text-primary group">
				                            	尚未填寫
				                        </td>
				                    </tr>
				                    <tr class="exTr">        
				                        <td>
				                            <strong>
				                                <span class="glyphicon glyphicon-envelope text-primary"></span> 
				                                	登山經驗
				                            </strong>
				                        </td>
				                        <td class="text-primary exp">
				                            	尚未填寫
				                        </td>
				                        <td style="display:none" class="hiddeninp">
					                        <input type="text" class="form-control exInp" placeholder="請填寫您的登山經驗" required="required">				                            	
				                        </td>
				                    </tr>
				                    <tr class="otTr">        
				                        <td>
				                            <strong>
				                                <span class="glyphicon glyphicon-calendar text-primary"></span>
				                                	個人簡介
				                            </strong>
				                        </td>
				                        <td class="text-primary other">
				                            	尚未填寫
				                        </td>
				                        <td style="display:none" class="hiddeninp">
					                        <textarea name="otInp" rows="5" cols="20" class="form-control otInp" placeholder="請填寫您的個人簡介"></textarea>				                            	
				                        </td>
				                    </tr>
				                    <tr class="brTr">        
				                        <td>
				                            <strong>
				                                <span class="glyphicon glyphicon-calendar text-primary"></span>
				                                	生日
				                            </strong>
				                        </td>
				                        <td class="text-primary birDate">
				                             	尚未填寫
				                        </td>
				                        <td style="display:none" class="hiddeninp">
					                        <input type="text" class="form-control brInp" placeholder="YYYY-MM-DD">				                            	
				                        </td>
				                    </tr>
				                    <tr class="rgTr">        
				                        <td>
				                            <strong>
				                                <span class="glyphicon glyphicon-calendar text-primary"></span>
				                                	註冊日期
				                            </strong>
				                        </td>
				                        <td class="text-primary regDate">
				                             	尚未填寫
				                        </td>
				                    </tr>
				                    <tr class="btnAction">        
				                        <td>
				                            
				                            	<button type="button" id="updateInfobtn" class="btn btn-info updateInfobtn">修改會員資訊</button>
				                            	<div style="display:none;inline" class="hiddeninp">
				                            		<button type="button" id="updateAction" class="btn btn-primary updateAction">確認修改</button>
				                            		<button type="button" style="margin-left:5px" id="reset" class="btn btn-danger reset">取消</button>
				                            	</div>
				                            
				                        </td>
				                        <td>				                             	
				                            <div style="inline">
				                                <button type="button" class="btn btn-secondary updatePwdbtn">修改密碼</button>
				                                <div style="display:none;" class="hiddeninp">
				                                	<button type="button" class="btn btn-info disabled textUpdate">修改資料</button>
				                                </div>
				                            </div>
				                        </td>
				                    </tr>                                  
				                </tbody>
				            </table>
				            </div>
				        </div>
				    </div>
				</div>
				</div>                                        

            </div>
            <!-- 每頁不同內容到這邊結束 -->
            
            <!-- 宣告為fix後會將DIV的層級拉到最外層(不管原本是寫在哪)也就是跳脫出原本的HTML框架 -->
        </div>

    </div>

    <footer id="footer"
			include-html="/MountainExploer.com/forinclude/includeForFooter.html">
	</footer>
</body>
<script src="/MountainExploer.com/js/upLoadImg.js"></script><!-- 上傳頭像 -->
<script src="/MountainExploer.com/js/table.js"></script>
<script src="/MountainExploer.com/js/topBar.js"></script>
<!--sweet alert-->
<script src="/MountainExploer.com/js/includejsp.js"></script>
<script src="/MountainExploer.com/js/personalContrul.js"></script><!-- 個人資料控制列表 -->
<script src="bootstrapInfo.js"></script>
<script src="/MountainExploer.com/member/userTop.js"></script>
<script src="/MountainExploer.com/member/checkLogin.js"></script>


</html>