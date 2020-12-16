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
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>

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
			<div class="container">
				<div class="row">
					<h2></h2>
			        
			        
			<div class="col-md-7" style="margin-left:200px">
			
			<div class="panel panel-default" style="margin-top:15px;height:800px">
			  <div class="panel-heading" >  <h4 style="font-family: Microsoft JhengHei;font-weight:bold;font-size:25px">個人資料</h4></div>
			   <div class="panel-body">
			       
			    <div class="box box-info">
			        
			            <div class="box-body">
			                     <div class="col-sm-6">
			                     <div  align="center"> <img alt="User Pic" src="https://x1.xingassets.com/assets/frontend_minified/img/users/nobody_m.original.jpg" id="profile-image1" class="img-circle img-responsive"> 
			                
			                <input id="profile-image-upload" class="hidden" type="file">
			<div style="color:#999;" >點擊此處上傳頭貼</div>
			                <!--Upload Image Js And Css-->
			           
			              
			   
			                
			                
			                     
			                     
			                     </div>
			              
			              <br>
			    
			              <!-- /input-group -->
			            </div>
			            <div class="col-sm-6">
			            <h4 class="username" style="color:#00b1b1;font-family: Microsoft JhengHei;font-weight:bold;font-size:18px"> </h4></span>
			              <span class="usergroup"><p></p></span>            
			            </div>
			            <div class="clearfix"></div>
			            <hr style="margin:5px 0 5px 0;">
			    
			              
			<div class="col-sm-5 col-xs-6 tital " style="font-family: Microsoft JhengHei;font-weight:bold;font-size:18px">會員帳號：</div>
				<div class="col-sm-7 col-xs-6 account"></div>
			    <div class="clearfix"></div>
				<div class="bot-border"></div>
			
			<div class="col-sm-5 col-xs-6 tital " style="font-family: Microsoft JhengHei;font-weight:bold;font-size:18px">會員暱稱：</div>
				<div class="col-sm-7 ncName"></div>
			  	<div class="clearfix"></div>
				<div class="bot-border"></div>
			
			<div class="col-sm-5 col-xs-6 tital " style="font-family: Microsoft JhengHei;font-weight:bold;font-size:18px">會員姓名：</div>
				<div class="col-sm-7 name"></div>
			  	<div class="clearfix"></div>
				<div class="bot-border"></div>
			
			<div class="col-sm-5 col-xs-6 tital " style="font-family: Microsoft JhengHei;font-weight:bold;font-size:18px">性別：</div>
				<div class="col-sm-7 gender"></div>
			 	<div class="clearfix"></div>
				<div class="bot-border"></div>
			
			
			<div class="col-sm-5 col-xs-6 tital " style="font-family: Microsoft JhengHei;font-weight:bold;font-size:18px">生日：</div>
				<div class="col-sm-7 birDate"></div>
			    <div class="clearfix"></div>
				<div class="bot-border"></div>
			
			<div class="col-sm-5 col-xs-6 tital " style="font-family: Microsoft JhengHei;font-weight:bold;font-size:18px">Email：</div>
				<div class="col-sm-7 email"></div>
			 	<div class="clearfix"></div>
				<div class="bot-border"></div>
			
			<div class="col-sm-5 col-xs-6 tital " style="font-family: Microsoft JhengHei;font-weight:bold;font-size:18px">手機：</div>
				<div class="col-sm-7 phone"></div>
			 	<div class="clearfix"></div>
				<div class="bot-border"></div>
			
			<div class="col-sm-5 col-xs-6 tital " style="font-family: Microsoft JhengHei;font-weight:bold;font-size:18px">登山經驗：</div>
				<div class="col-sm-7 exp"></div>
			 	<div class="clearfix"></div>
				<div class="bot-border"></div>
				
			
			<div class="col-sm-5 col-xs-6 tital " style="font-family: Microsoft JhengHei;font-weight:bold;font-size:18px">個人簡介：</div>
				<div class="col-sm-7 other"></div>
			    <div class="clearfix"></div>
				<div class="bot-border"></div>
			
			<div class="col-sm-5 col-xs-6 tital " style="font-family: Microsoft JhengHei;font-weight:bold;font-size:18px">加入日期</div>
				<div class="col-sm-7 regDate"></div>
				<div class="clearfix"></div>
				<div class="bot-border"></div>
			
			
			            <!-- /.box-body -->
			          </div>
			          <!-- /.box -->
			
			        </div>
			       
			            
			    </div> 
			    </div>
			</div>  
			    <script>
			              $(function() {
			    $('#profile-image1').on('click', function() {
			        $('#profile-image-upload').click();
			    });
			});       
			              </script> 
			       
			       
			       
			       
			       
			       
			       
			       
			       
			   </div>
			</div>
            
            
            
            
            <!-- 每頁不同內容到這邊結束 -->
            <div class="fix"><a href="#"><img src="/MountainExploer.com/images/arror.png" alt="" style=" width:60px; height:60px;"></a>
            </div>
            <!-- 宣告為fix後會將DIV的層級拉到最外層(不管原本是寫在哪)也就是跳脫出原本的HTML框架 -->
        </div>

    </div>

    <footer id="footer">
        <a>全站導覽</a>



    </footer>
</body>
<!-- <script src="/MountainExploer.com/member/memberPwdChange.js"></script> -->
<script src="/MountainExploer.com/js/upLoadImg.js"></script><!-- 上傳頭像 -->
<script src="/MountainExploer.com/js/table.js"></script>
<script src="/MountainExploer.com/js/topBar.js"></script>
<!-- <script src="/MountainExploer.com/js/sweetalert.js"></script> -->
<!--sweet alert-->
<script src="/MountainExploer.com/js/includejsp.js"></script>
<script src="/MountainExploer.com/js/personalContrul.js"></script><!-- 個人資料控制列表 -->


</html>