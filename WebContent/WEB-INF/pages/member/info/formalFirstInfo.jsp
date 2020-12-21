<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-tw">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>岳進者會員認證資料填寫</title>
    <link rel="stylesheet" href="../css/other.css">
    <link rel="stylesheet" href="../css/font.css">
    <link rel="stylesheet" href="/MountainExploer.com/css/style.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
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
            <form action="<c:url value='/member/memberFirstInfoInsert' />" method="POST"
                style="width: 800px; margin: 0 auto; border: 10px solid#ecf5ff; border-radius: 1%; background-color: d#ecf5ff;">
                <div style="border-radius: 3%; border: 10px solid white; background-color: white;">

                    <fieldset>
                        <legend>${Member.name}的認證資料</legend>
                    </fieldset>
                    <div style="display:none">
						<label>會員編號：</label>
						<input type="text" name="seqno" id="seqno" value="${Member.seqno}">
						<label>身分組ID：</label>
						<input type="text" name="memberStatus.seqno" id="statusId" value="${Member.memberStatus.seqno}">
					</div>
<!--                     <div class="form-group"> -->
<!--                         <label for="inputNcName">暱稱：</label> -->
<!--                         <input type="text" class="form-control ncName" id="ncName" name="memberInfo.neck_name" placeholder="請輸入暱稱" required="required"> -->
<!--                     </div> -->
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="inputGender">性別：</label>
                            <select id="" class="form-control" name="memberInfo.gender">
                            	<option value="mask" selected>不透露</option>
                            	<option value="male">男</option>
                            	<option value="female">女</option>
                            	<option value="x">X</option>
                            </select>
                            
                        </div>
                        <div class="form-group col-md-6">
                            <label for="inputBirthday">生日：</label>
                            <input type="text" id="birDate" class="form-control birDate" name="memberInfo.birthday" placeholder="YYYY-MM-DD">
							<span class="brsp"></span><br/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPhone">手機號碼：</label>
                        <input type="text" id="phone" class="form-control phone" name="memberInfo.phone" placeholder="09xxxxxxxx" required="required">
						<span class="phsp"></span><br/>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="inputExp">登山經驗：</label>
                            <input type="text" id="exp" class="form-control exp" name="memberInfo.climb_ex" placeholder="請輸入登山經驗" required="required" align="">
							<span class="expsp"></span>
                        </div>

                    </div>
                    <button type="submit" id="submit" name="submit" class="btn btn-outline-success"><i class="fa fa-check-circle-o"></i>
                        確認送出</button>
                     <button type="button" class="btn btn-outline-success fastIn"><i class="fa fa-check-circle-o"></i>快速填寫</button>
                    <button type="reset" class="btn btn-outline-danger" id="reset"><i class="fa fa-close"></i> 清除</button>
                </div>
            </form>
            <!-- 每頁不同的內容到這裡結束 -->
        </div>
    </div>

    <footer id="footer"
			include-html="/MountainExploer.com/forinclude/includeForFooter.html">
	</footer>
</body>
<script src="../js/upLoadImg.js"></script><!-- 上傳頭像 -->
<script src="../js/table.js"></script>
<script src="../js/topBar.js"></script>
<script src="../js/sweetalert.js"></script>
<!--sweet alert-->
<script src="../js/includejsp.js"></script>
<script src="/MountainExploer.com/member/formalFirstInfo.js"></script>
<script src="/MountainExploer.com/member/userTop.js"></script>
<script src="/MountainExploer.com/member/checkLogin.js"></script>

</html>