<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
<c:set var='loginOK' value=''></c:set>


	<header>
		<!-- <h2>旅遊地點天氣查詢</h2> -->
	</header>
	<nav>
		<c:if test='${ empty sessionScope.MemberBean }'>
			<div class="top"id="register"  >
				<c:choose>
					<c:when test="${ functionCheck != 'REG' }"> 
						<a href='<c:url value="/member/register/register.jsp" />'>會員註冊</a>
					</c:when>
					<c:otherwise>
						會員註冊
					</c:otherwise>
				</c:choose>
			</div>
		</c:if>
		<c:if test='${ empty sessionScope.MemberBean }'>
			<div class="top"id="login"  >
				<c:choose>
					<c:when test="${ functionCheck != 'logging' }"> 
						<a href='<c:url value="/member/login/login.jsp" />'>會員登入</a>
					</c:when>
					<c:otherwise>
						會員登入
					</c:otherwise>
				</c:choose>
			</div>
		</c:if>
		<c:if test='${ !empty sessionScope.MemberBean }'>
			<div  class="top" id="member"  >
				<a href='<c:url value="/member/login/logout.jsp" />'>登出</a>
			</div>
		</c:if>
		<c:if test='${ !empty sessionScope.MemberBean }'>
			<div  class="top" id="member"  >
				<c:choose>
					<c:when test="${ functionCheck != 'memberInfo' }"> 
						<a href='<c:url value="/member/info/memberInfo.jsp" />'>會員資料</a>
					</c:when>
					<c:otherwise>
						會員資料
					</c:otherwise>
				</c:choose>
			
			
			</div>
		</c:if>

		<c:if test='${ !empty sessionScope.adminBean }'>
			<div class="" id="admin" class="text-info top" >
				<c:choose>
					<c:when test="${ functionCheck != 'maintainInfo' }"> 
						<a href='<c:url value="/maintain/maintain.jsp" />'>資料維護</a>
					</c:when>
					<c:otherwise>
						資料維護
					</c:otherwise>
				</c:choose>
			</div>
		</c:if>
		<div  id="mountain" class="text-info top">
			<c:choose>
				<c:when test="${ functionCheck != 'mountain' }"> 
					<a href='<c:url value="/mountain/RouteSummaryServlet"/>'>百戰百岳</a>
				</c:when>
				<c:otherwise>
					百戰百岳
				</c:otherwise>
			</c:choose>
		</div>
		<div  id="house" class="text-info top">
			<c:choose>
				<c:when test="${ functionCheck != 'house' }"> 
					<a href='<c:url value="/house/hList/mountainhouse.jsp" />'>露營地/山中小屋</a>
				</c:when>
				<c:otherwise>
					露營地/山中小屋
				</c:otherwise>
			</c:choose>
		
		</div>
		<div  id="shopping" class="text-info top">
			<c:choose>
				<c:when test="${ functionCheck != 'shopping' }"> 
					<a href='<c:url value="/shopping/ProductServlet" />'>購物商城</a>
				</c:when>
				<c:otherwise>
					購物商城
				</c:otherwise>
			</c:choose>
		
		</div>
		
		<div  id="platform" class="text-info top">
			<c:choose>
				<c:when test="${ functionCheck != 'platform' }"> 
					<a href='<c:url value="/platform/platform_index.jsp" />'>討論區</a>
				</c:when>
				<c:otherwise>
					討論區
				</c:otherwise>
			</c:choose>
		</div>
		
		

	</nav>



