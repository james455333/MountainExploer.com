<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>會員註冊</title>
<script src="//code.jquery.com/jquery-3.5.1.js"></script>
</head>
<body>
    <div>
        <form action="/member/memberRegister" method="POST">
            <fieldset>
                <legend>請輸入以下資訊：</legend>
                <div>
                    <label>帳號：</label>
                    <input type="text" id="account" class="account" placeholder="請輸入帳號" autocomplete="off"/>
                    <span id="Antsp" class="Antsp"></span><br/>
                </div>
            </fieldset>
        </form>
    </div>
    
<script src="register.js"></script>
</body>
</html>