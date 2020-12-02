<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>後台資料維護系統</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" >
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> 
<script src="<c:url value='/backstage/backStage.js'/>"></script>
<link rel="stylesheet" href='<c:url value="/backstage/css/backStage.css"/>'> 
<!--<link rel="stylesheet" href='<c:url value="/WEB-INF/backstage/css/backStage.css"/>'>-->
</head>
<body>
	<!-- 測尋錯誤訊息 -->
		<c:choose>
			<c:when test="${ !empty errors}">
				<script type="text/javascript" charset="UTF-8">
					var errors = "${errors.msg}";
				</script>
			</c:when>
			<c:otherwise>
				<script type="text/javascript">
					var errors = null;
				</script>
			</c:otherwise>
		</c:choose>
		
		
		<!-- 測尋結果訊息 -->
		<c:choose>
			<c:when test="${ !empty result}">
				<script type="text/javascript" charset="UTF-8">
					var result = "${result}";
				</script>
			</c:when>
			<c:otherwise>
				<script type="text/javascript" charset="UTF-8">
					var result = null;
				</script>
			</c:otherwise>
		</c:choose>


	<div id="container1">
		<!-- 引入共同頁首 -->
		<jsp:include page="fragment/backTopNav.jsp"></jsp:include>
		<div id="container2">
			<div class="importData">
				<form action='<c:url value="/memberDataImport" />' method="post" enctype="multipart/form-data">
					<i>指定""會員資料""輸入檔案</i>
					<input type="file" name="datafile" accept=".csv" required>
					<input type="submit" value="確認輸入">
				</form>
			</div>
			<div class="importData">
				<form action='#' method="post" enctype="multipart/form-data">
					<i>指定"活動"資料輸入檔案</i>
					<input type="file" name="datafile" accept=".csv" required>
					<input type="submit" value="確認輸入">
				</form>
			</div>
			<div class="importData">
				<form action='<c:url value="/mountainDataImport"/>' method="post" enctype="multipart/form-data">
					<i>指定"山岳及路線"資料輸入檔案</i>
					<input type="file" name="datafile" accept=".csv" required>
					<input type="submit" value="確認輸入">
				</form>
			</div>
			<div class="importData">
				<form action='<c:url value="/houseDataImport"/>' method="post" enctype="multipart/form-data">
					<i>指定"小屋"資料輸入檔案</i>
					<input type="file" name="datafile" accept=".csv" required>
					<input type="submit" value="確認輸入">
				</form>
			</div>
			<div class="importData">
				<form action='<c:url value="/campDataImport"/>' method="post" enctype="multipart/form-data">
					<i>指定"露營地"資料輸入檔案</i>
					<input type="file" name="datafile" accept=".csv" required>
					<input type="submit" value="確認輸入">
				</form>
			</div>
			<div class="importData">
				<form action='<c:url value="/productDataImport.controller"/>' method="post" enctype="multipart/form-data">
					<i>指定"商品"資料輸入檔案</i>
					<input type="file" name="datafile" accept=".csv" required>
					<input type="submit" value="確認輸入">
				</form>
			</div>
			
		
		</div>
		
		
		
	</div>
	
	
</body>
</html>