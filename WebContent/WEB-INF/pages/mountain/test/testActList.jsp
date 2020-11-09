<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>活動測試網頁</title>
<link rel="shortcut icon" type="image/png" href="<c:url value="/favicon.ico"/>"/>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" ></script>


</head>
<body>
	<h2>測試活動及報名系統</h2>
	<hr>
	<h3>新增活動</h3>
	<form>
		<table>
			<tr>
				<td>
					<label>會員編號</label>
					<input type="text" name="memberID" required>
				</td>
				<td>
					<label>國家公園名稱</label>
					<select id="nPSelect">
					</select>
				</td>
				<td>
					<label>路線名稱</label>
					<select id="nPSelect" class="route" name="routeID">
					</select>
				</td>
				<td>
					<label>活動名稱</label>
					<input type="text" name="actBasic" required>
				</td>
				<td>
					<label>活動價格</label>
					<input type="text" name="price" required>
				</td>
				<td>
					<label>活動開始日期 ~ 活動結束日期</label>
					<input type="text" name="StEndDate" required>
				</td>
				<td>
					<label>活動天數</label>
					<input type="text" name="totalDay" readonly="readonly">
				</td>
				<td>
					<label>活動報名人數上限</label>
					<input type="text" name="TopReg" readonly="readonly">
				</td>
				<td>
					<label>活動報名截止日</label>
					<input>
				</td>
				
			<tr>
		</table>
	</form>
	<hr>
	<h3>活動顯示</h3>
	<table>
		<thead>
			<tr>
				<td>活動編號</td>
				<td>活動名稱 / 活動天數</td>
				<td>活動預覽圖</td>
				<td>活動價格</td>
				<td>活動開始日期 / 活動結束日期</td>
				<td>目前報名人數 / 報名人數上限</td>
			</tr>
		</thead>
		<tbody>
		
		</tbody>
	
	</table>


</body>
</html>