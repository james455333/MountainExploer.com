<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>後台資料維護系統/商品資料/[新增]]</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href='<c:url value="/backstage/css/backStage.css"/>'> 
</head>
<body>
	<div id="container1">
		<!-- 引入共同頁首 -->
		<jsp:include page="../../fragment/backTopNav.jsp"></jsp:include>
		
	
		
		<form action='<c:url value="/backstage/product/createProductData"/>'  enctype="multipart/form-data" method="post">
				<div>
				* 為必填項目
				</div>
				
				
<!-- 			<div> -->
<!-- 				<span>主類別 :&nbsp</span> <select name="fcName"> -->
<%-- 					<c:forEach var="fcBean" items="${fcBean}" varStatus="vs"> --%>
<%-- 						<option value="${fcBean.id}">${fcBean.name}</option> --%>
<%-- 					</c:forEach> --%>
<!-- 				</select> -->
<!-- 			</div> -->
		
		
			<div >
				<span>*次分類 :&nbsp</span> <select name="scName">
					<c:forEach var="scBean" items="${scBean}" varStatus="vsRT">
						<option value="${scBean.id}">${scBean.name}</option>
					</c:forEach>
				</select>
			</div>
			
		
				
				<div>
					<label for="name">* 產品名稱: &nbsp&nbsp</label>			
					<input type="text" name="name" required>
				</div>
				<div>
<!-- 					<label for="fcName">* 主類別名稱 : &nbsp&nbsp</label>			 -->
<!-- 					<input type="text" name="fcName" required> -->
<!-- 				</div> -->
<!-- 				<div> -->
<!-- 					<label for="scName">* 次類別名稱 : &nbsp&nbsp</label>			 -->
<!-- 					<input type="text" name="scName" required> -->
<!-- 				</div> -->
				<div>
					<label for="type">* 型號 : &nbsp&nbsp</label>			
					<input type="text" name="type" required>
				</div>
				<div>
					<label for="price">* 價格 : &nbsp&nbsp</label>			
					<input type="text" name="price" required>
				</div>
				<div>
					<label for="stock">* 庫存 : &nbsp&nbsp</label>			
					<input type="text" name="stock" required>
				</div>
				<div>
					<label for="productImg">* 產品圖檔案 : &nbsp&nbsp</label>			
					<input type="file" name="productImg"  accept="image/*" required>
				</div>
				<div >
					<label for="description">* 介紹 : &nbsp&nbsp</label>			
					<textarea rows="2.5%" cols="50%" name="description"  required></textarea>
				</div>
			
			</div>
			<div >
				<div>
					<input type="submit" value="確認新增">
				</div>
				<div>
				<input type="reset" value="清除">
				</div>
				<div>
					<input type="button" value="返回上一頁" id="backPreviousPage">
				</div>
			</div>
		</form>
			
		
	</div>
	

</body>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" ></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" ></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" ></script>
	<script type="text/javascript" charset="UTF-8" src='<c:url value="/product/back/backProductMountain.js"/>'></script>
	<script>
		$(function(){
			$("#backPreviousPage").on("click",function(){
					window.history.go(-1)
				})
			})
	</script>
</html>