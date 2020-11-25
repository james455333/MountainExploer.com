<%@page import="member.MemberGlobal"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%
	Cookie[] cookies = null;
	String value1 = "";
	String value2 = "";
	String value3 = null;
	cookies = request.getCookies();
	if(cookies != null && cookies.length > 0){
		for(Cookie cookie : cookies){
			if(cookie.getName().equals("rmAnt")){
				value1 = cookie.getValue();
			}
			if(cookie.getName().equals("rmPwd")){
				value2 = MemberGlobal.decryptString(MemberGlobal.KEY, cookie.getValue());
			}
		}
	}

%>
<html>
<head>
<meta charset="UTF-8">
<title>Member Login</title>
</head>
<body>
	<h2>會員登入</h2>
	<div>
		<form action="<c:url value='/member/memberLogin'/>" method="POST">
			<div>
				<label>帳號：</label>
				<input type="text" id="account" name="account" value=<%=value1%>>
				<span>${errors.account}${errors.msg}</span><br/>
				<label>密碼：</label>
				<input type="password" id="password" name="password" value=<%=value2%>>
				<span>${errors.password}${errors.msg}</span><br/>
			</div>
			<div>
				<input type="submit" id="submit" name="submit" value="登入">
				<input type="checkbox" id="rememberMe" name="rememberMe">記住我<br/>
<%-- 				 ${requestScope.rememberMe eq 'check' } --%>
				<a href="/MountainExploer.com/member/memberRegisterEntry">註冊會員</a>
			</div>
			<div>
				<a href="/MountainExploer.com/member/memberPwdFoundEntry">忘記密碼</a>
			</div>
		</form>
	</div>

</body>
</html>