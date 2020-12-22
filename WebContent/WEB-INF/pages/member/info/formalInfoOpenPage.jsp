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
    <link rel="stylesheet" href="/MountainExploer.com/css/style.css">
    <link rel="stylesheet" href="/MountainExploer.com/css/personalPage.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="/MountainExploer.com/member/css/bootstrapInfo.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
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
            <div class="secDivContent">
				<div class="container bootstrap snippets bootdey">
				<div class="panel-body inf-content">
				    <div class="row">
				        <div class="col-md-4">
				        	<form id="imgForm" action="<c:url value='/member/imgUpdateAction'/>" method="POST" enctype="multipart/form-data">
					            <img alt="會員頭貼" style="width:600px;" class="img-circle img-thumbnail isTooltip userFile" src="https://x1.xingassets.com/assets/frontend_minified/img/users/nobody_m.original.jpg" data-original-title="Usuario">
					            
					            <div style="display:none">
					            	<input type="text" class="seqno" name="seqno" value="${mbean.seqno}">
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
				                            	${mbean.account}
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
				                           	${mbean.memberInfo.neck_name}
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
				                           	<c:if test="${mbean.memberInfo.gender eq 'male'}">
												男
											</c:if>
											<c:if test="${mbean.memberInfo.gender eq 'female'}">
												女
											</c:if>
											<c:if test="${mbean.memberInfo.gender eq 'x'}">
												X
											</c:if>
											<c:if test="${mbean.memberInfo.gender eq  'mask'}">
												不透露
											</c:if>
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
				                            	${mbean.email}
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
				                            	<c:if test="${mbean.memberStatus.seqno eq 100}">
													一般登山者
												</c:if>
												<c:if test="${mbean.memberStatus.seqno eq 110}">
													未認證登山者
												</c:if>
												<c:if test="${mbean.memberStatus.seqno eq 120}">
													登山嚮導						
												</c:if>
												<c:if test="${mbean.memberStatus.seqno eq 130}">
													未認證嚮導
												</c:if>
												<c:if test="${mbean.memberStatus.seqno eq 140}">
													停權登山者
												</c:if>
												<c:if test="${mbean.memberStatus.seqno eq 150}">
													停權嚮導
												</c:if>
												<c:if test="${mbean.memberStatus.seqno eq 160}">
													管理員
												</c:if>
												
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
				                            	${mbean.memberInfo.climb_ex}
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
				                    </tr>
				                    <tr class="rgTr">        
				                        <td>
				                            <strong>
				                                <span class="glyphicon glyphicon-calendar text-primary"></span>
				                                	註冊日期
				                            </strong>
				                        </td>
				                        <td class="text-primary regDate">
				                             	${mbean.reg_Date}
				                        </td>
				                    </tr>
				                    <tr class="btnAction">        
				                        
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
            <div class="fix"><a href="#"><img src="/MountainExploer.com/images/arror.png" alt="" style=" width:60px; height:60px;"></a>
            </div>
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
<script src="formalInfoOpenPage.js"></script>
<script src="/MountainExploer.com/member/userTop.js"></script>
<script src="/MountainExploer.com/member/checkLogin.js"></script>

</html>