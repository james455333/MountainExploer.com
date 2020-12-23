<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>會員註冊</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.2/dist/jquery.validate.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.2/additional-methods.min.js"></script>
<script src="testValidation.js"></script>

</head>
<body>
    <div>
        <form id="rgFrom">
            <fieldset>
                <legend>請輸入以下資訊：</legend>
                <div>
                    <label for="account">帳號：</label>
                    <input type="text" id="account" class="account" name="account" placeholder="請輸入帳號" autocomplete="off"/>
                    <span id="Antsp" class="Antsp"></span>
                    <span id="chksp"></span><br/>
                </div>
                <div>
                    <label for="pwd">密碼：</label>
                    <input type="password" id="pwd" class="pwd" name="pwd" placeholder="請輸入密碼">
<!--                     <span class="pwdsp"></span><br/> -->
                </div>
                <div>
                	<label for="chkPwd">密碼驗證：</label>
                	<input type="password" class="chkPwd" name="chkPwd" placeholder="請再次輸入密碼">
                	<span class="chksp"></span><br/>
                </div>
                <div>
                    <label for="name">姓名：</label>
                    <input type="text" class="name" name="name" placeholder="請輸入姓名" autocomplete="off">
                    <span class="nmsp"></span><br/>
                </div>
                <div>
                    <label for="email">Email：</label>
                    <input type="email" class="email" name="email" placeholder="請輸入電子郵件">
                    <span class="emsp"></span><br/>
                </div>
                <div>
                    <label for="statusId">身分組選擇</label>
                    <input type="radio" name="statusId" class="statusId1" value="110">一般會員
                    <input type="radio" name="statusId" class="statusId2" value="130">登山嚮導
                </div>
                <div style="display:none">
                	<label>註冊時間：</label>
                	<input type="text" class="regDate" id="regDate" name="regDate" readonly>
<!--                 	<span id="dtsp"></span> -->
                </div>
                <div>
                	<input type="submit" id="submit" name="submit" value="送出">
                	<input type="reset" id="reset" name="reset" value="清除">
                </div>
            </fieldset>
        </form>
    </div>
    
    
    
    
</body>
</html>