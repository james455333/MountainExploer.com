<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<nav id="mountainNav" class="no-change">

	<%-- <c:if test="${LoginOK.groupId == '200'}"> --%>
		<div class="use-flexbox first">
			<a href="<c:url value='/mountain/design/mountainDesign.jsp'/>">登山活動設計</a>
			<div>
				<a href="<c:url value='/mountain/design/mountainDesign.jsp'/>">活動管理</a>
			</div>
		</div>
	<%-- </c:if> --%>
	<div class="use-flexbox first">
		<a href="<c:url value='/mountain/actList/mountainActList.jsp'/>">登山活動</a>
		<div>
			<a>一般健行(難度A)</a>
		</div>
		<div>
			<a>中級縱走(難度B)</a>
		</div>
		<div>
			<a>高級縱走(難度C)</a>
		</div>
	</div>
	<div class="use-flexbox first">
		<a href="<c:url value='/mountain/mountainIndex.jsp'/>">山岳介紹</a>
		<div id="np1">
			<a href="<c:url value='/mountain/mountainIndex.jsp'/>">玉山國家公園</a>
		</div>
		<div id="np2">
			<a href="<c:url value='/mountain/mountainIndex.jsp'/>">太魯閣國家公園</a>
		</div>
		<div id="np3">
			<a href="<c:url value='/mountain/mountainIndex.jsp'/>">雪霸國家公園</a>
		</div>
		
		
		<script>
			
		
		</script>
	</div>
	
</nav>