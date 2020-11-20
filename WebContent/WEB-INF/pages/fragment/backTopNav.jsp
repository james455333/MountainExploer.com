<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
	<header><a href='<c:url value="/backStageEntry"/>' >後台資料維護系統</a>
		<div><a href='<c:url value="/member/memberBackLogout"/>'>登出</a></div>
	</header>
		<nav id="navbar1">
			<div><a href='<c:url value="/member/memberBackEntry"/>'>會員資料</a></div>
			<div><a href="#">活動紀錄(尚未實作)</a></div>
			<div><a href='<c:url value="/backstage/mountain/retrieveEntry"/>'>山岳及路線資料</a></div>
			<div><a href='<c:url value="/mountainCampBack/selectAll"/>'>露營地資料</a></div>
			<div><a href='<c:url value="/house/back/backMountainHouse.jsp"/>'>山中小屋資料</a></div>
			<div><a href='<c:url value="/backstage/product/retrievePage"/>'>商品資料</a></div>
		</nav>
    
    