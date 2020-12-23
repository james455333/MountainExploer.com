<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-tw">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>岳進者第三方登入會員註冊</title>
<link rel="stylesheet" href="../css/other.css">
<link rel="stylesheet" href="../css/font.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://cdn.jsdelivr.net/npm/sweetalert2@9.17.2/dist/sweetalert2.min.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9.17.2/dist/sweetalert2.all.min.js"></script>
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
			<a class="navbar-brand" href="#"><img src="../images/logo1.png"
				height="30%" width="30%"></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent"
				include-html="../forinclude/includeForIndex.html"></div>
		</nav>
	</header>
	<div class="div_ul">

		<!-- <div class="div_li1">
            <a>保留區</a>
        </div>
        <div class="div_li3">
            <a>保留區</a>
        </div> -->
        <div class="div_li2" style="background: #ecf5ff; height: auto;">
            <!-- 每頁不同的內容從這裡開始 -->
            <form
                style="width: 800px; margin: 0 auto; border: 10px solid#ecf5ff; border-radius: 1%; background-color: d#ecf5ff;">
                <div style="border-radius: 3%; border: 10px solid white; background-color: white;">
				
                    <fieldset>
                        <legend>請填寫基本資料</legend>
                    </fieldset>
                    <div class="form-row">
                    	<div class="form-group col-md-6">
		                    <label for="inputAddress">帳號:</label>
		                    <span>${Member.account}</span><br/>
		                    <input type="hidden" class="form-control account" name="account" id="account" value="${Member.account}" readonly="readonly">                    	
                    	</div>
                    	<div class="form-group col-md-6">
	                        <label for="inputAddress2">姓名:</label>
	                        <span>${Member.name}</span><br/>
	                        <input type="hidden" class="form-control name" name="name" id="name" value="${Member.name}" readonly="readonly">
                    	</div>
                    </div>
	                   
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="inputCity">Email：</label>
                            <span>${Member.email}</span>
                            <input type="hidden" class="form-control email" id="email" name="email" value="${Member.email}" readonly="readonly">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="inputState">身分組選擇</label>
                            <select id="statusId" name="statusId" class="form-control statusId" required="required">
                                <option value="100" selected>一般登山者</option>
                                <option value="130">登山嚮導</option>
                            </select>
                        </div>
                        

                    </div>
                    <div class="form-row">
                    	<div class="form-group col-md-6">
                    		<label for="inputNc">暱稱：</label>
                    		<input type="text" class="form-control ncName" placeholder="請填寫暱稱">
                    	</div>
                    	<div class="form-group col-md-6">
                    		<label for="inputExp">登山經驗：</label>
                    		<input type="text" class="form-control exp" placeholder="請填寫登山經驗，字數限制30字">
                    	</div>
                    </div>
                    
                    <div style="display:none">
                        	<label>註冊時間：</label>
                			<input type="text" class="regDate" id="regDate" name="regDate" readonly="readonly">  
                    	</div>
                    <button type="button" name="submit" class="btn btn-outline-success submit"><i class="fa fa-check-circle-o"></i>
                        確認送出</button>
<!--                         <button type="button" class="btn btn-outline-success testBt"><i class="fa fa-check-circle-o"></i>測試</button> -->
                    <button type="button" name="fastRg" class="btn btn-outline-success fastRg"><i class="fa fa-check-circle-o"></i>快速註冊</button>
                    <button type="reset" class="btn btn-outline-danger reset" id="reset"><i class="fa fa-close"></i> 清除</button>
                </div>
                    
            </form>
            <!-- 每頁不同的內容到這裡結束 -->
        </div>
    </div>

	<footer id="footer">
<!-- 		<a>全站導覽</a> -->
<!-- 		<button id="demo1">確認demo1</button> -->
<!-- 		<button id="demo2">錯誤demo2</button> -->
<!-- 		<button id="demo3">確認提醒demo3</button> -->
<!-- 		<button id="demo4">多重選項&提醒視窗demo4</button> -->
<!-- 		<button id="demo5">Demo5</button> -->
<!-- 		<button id="demo6">Demo6</button> -->



	</footer>
</body>
<script src="../js/upLoadImg.js"></script>
<!-- 上傳頭像 -->
<script src="../js/table.js"></script>
<script src="../js/topBar.js"></script>
<!-- <script src="../js/sweetalert.js"></script> -->
<!--sweet alert-->
<script src="../js/includejsp.js"></script>
<script src="socailLoginInfo.js"></script>
<script src="/MountainExploer.com/member/userTop.js"></script>
</html>