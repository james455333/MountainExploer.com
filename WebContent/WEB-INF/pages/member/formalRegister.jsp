<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-tw">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>岳進者會員註冊</title>
	<link rel="stylesheet" href="../css/other.css">
	<link rel="stylesheet" href="../css/font.css">
	<link rel="stylesheet" href="/MountainExploer.com/css/style.css">
	<link rel="stylesheet"
		href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<!-- 	<link rel="stylesheet" -->
<!-- 		href="https://maxcdn.bootstrapcdn.com/....../font-awesome.min.css"> -->
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/sweetalert2@9.17.2/dist/sweetalert2.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
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
            <form id="rsForm" 
                style="width: 800px; margin: 0 auto; border: 10px solid#ecf5ff; border-radius: 1%; background-color: d#ecf5ff;">
                <div style="border-radius: 3%; border: 10px solid white; background-color: white;">
<%--                 action="<c:url value='/member/memberRegister'/>" method="POST" --%>
				
                    <fieldset>
                        <legend>請輸入個人資料</legend>
                    </fieldset>
                    <div class="form-group">
                        <label for="inputAddress">帳號:</label>
                        <input type="text" class="form-control account" name="account" id="account" placeholder="帳號長度至少6個字元，必須包含大小寫英文字母與數字，不可包含特殊字元" required="required">
                    	<span id="Antsp" class="Antsp"></span>
                    	<span id="chkAntsp"></span><br/>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="inputEmail4">密碼:</label>
                            <input type="password" class="form-control pwd" name="pwd" id="pwd" placeholder="密碼長度至少8個字元，必須包含大小寫英文字母，可包含特殊字元" required="required">
                            <span class="pwdsp"></span><br/>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="inputPassword4">確認密碼:</label>
                            <input type="password" class="form-control chkPwd" id="chkPwd" placeholder="請再次輸入帳密碼" required="required">
                            <span class="chksp"></span><br/>
                        </div>
                    </div>
                    
                    <div class="form-row">
                    	<div class="form-group col-md-6">
	                        <label>姓名:</label>
	                        <input type="text" class="form-control name" name="name" id="name" placeholder="姓名長度至少2個字元" required="required">
	                        <span class="nmsp"></span><br/>
                        </div>
                        <div class="form-group col-md-6">
                        	<label>暱稱:</label>
	                        <input type="text" class="form-control ncName" name="ncName" id="ncName" placeholder="暱稱至少2個字元" required="required">
	                        <span class="ncsp"></span>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="inputCity">Email</label>
                            <input type="text" class="form-control email" id="email" name="email" placeholder="example@gmail.com，此格不可為空" required="required">
                            <span class="emsp"></span><br/>
                        </div>
                        <div class="form-group col-md-4">
                            <label for="inputState">身分組選擇</label>
                            <select id="statusId" name="statusId" class="form-control statusId" required="required">
                                <option value="110" selected>一般登山者</option>
                                <option value="130">登山嚮導</option>
                            </select>
                        </div>
                        <div style="display:none">
                        	<label>註冊時間：</label>
                			<input type="text" class="regDate" id="regDate" name="regDate" readonly="readonly">  
                    	</div>

                    </div>
                    <button type="button" id="send" name="submit" class="btn btn-outline-success send" value="send"><i class="fa fa-check-circle-o"></i>
                        確認送出</button>
                    <button type="button" name="fastRg" class="btn btn-outline-success fastRg"><i class="fa fa-check-circle-o"></i>快速註冊</button>
                    <button type="reset" class="btn btn-outline-danger reset" id="reset"><i class="fa fa-close"></i> 清除</button>
                </div>
                    
            </form>
            <!-- 每頁不同的內容到這裡結束 -->
        </div>
    </div>

	<footer id="footer"
			include-html="/MountainExploer.com/forinclude/includeForFooter.html">
	</footer>
</body>
<script src="../js/upLoadImg.js"></script>
<!-- 上傳頭像 -->
<script src="../js/table.js"></script>
<script src="../js/topBar.js"></script>
<script src="../js/sweetalert.js"></script>
<!--sweet alert-->
<script src="../js/includejsp.js"></script>
<script src="register.js"></script>
<script src="formalRegister.js"></script>

</html>