<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>活動測試網頁</title>
<link rel="shortcut icon" type="image/png" href="/MountainExploer.com/favicon.ico" />
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" ></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

<script src="/MountainExploer.com/mountain/test/testAct.js" ></script>
<script src="/MountainExploer.com/mountain/test/ajax.js" ></script>

<style type="text/css">
	#showActList td{
		border: 1px solid red;
	}
	#newAct td{
		border : 1px solid gray;
	}
	.showImage{
		width : 50px;
		height : 50px;
	}
	.extendImage{
		position: absolute;
		hegith : 300px;
		width : 300px;
		display: none;
		z-index: 10;
	}
	.tagContainer{
		display : inline-flex;
   		align-items:center;
    	justify-content:center;
	}
	.actTag{
		font-size: 50%;
		color : blue;
	}
	.regTag{
		font-size: 50%;
		color : red;
	}
	
</style>

</head>
<body>
	<h2>測試活動及報名系統</h2>
	<hr>
	<h3>新增活動</h3>
		<table id="newAct">
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
					<select class="route" name="routeID">
					</select>
				</td>
				<td>
					<label>活動名稱</label>
					<hr>
					<label> 1. 不得為空 2. 包含空格、中、英文不得超過15字 3.不得含有特殊字元及空格，如:!@#$%^&... </label>
					<input type="text" name="title" required>
					<span class="correctSpan"></span>
					<span class="errorSpan"></span>
				</td>
				<td>
					<label>活動價格</label>
					<input type="text" name="price" required>
					<span class="correctSpan"></span>
					<span class="errorSpan"></span>
				</td>
			</tr>
			<tr>
				<td>
					<label>活動開始日期 ~ 活動結束日期</label>
					<hr>
					<label> (開始日期最晚必須於兩個禮拜(21日)後)</label>
					<input type="text" name="StEndDate" required readonly>
					<span class="correctSpan"></span>
					<span class="errorSpan"></span>
				</td>
				<td>
					<label>活動天數</label>
					<input type="text" name="totalDay" readonly="readonly" id="totalDay">
				</td>
				<td>
					<label>活動報名人數上限</label>
					<input type="text" name="TopReg" required>
					<span class="correctSpan"></span>
					<span class="errorSpan"></span>
				</td>
				<td>
					<label>活動報名截止日(最晚必須為活動開始前7日)</label>
					<input type="text" name="RegEndDate" readonly="readonly" required>
				</td>
				<td>
					<label>備註</label>
					<textarea name="note"></textarea>
				</td>
			<tr>
			<tr>
				<td>
					<form enctype="multipart/form-data" id="imgForm">
						<label>圖片上傳 : (每個活動最多五張圖)</label>
						<input type="file" name="files" multiple accept="image/*">
					</form>
				</td>
			</tr>
			
		</table>
		<hr>
		<input type="submit" value="新增活動" id="newActButton" >
	<hr>
	<h3>活動顯示</h3>
	<table  id="showActList">
		<thead>
			<tr>
				<td>活動預覽圖</td>
				<td>活動名稱 / 活動天數 / 活動價格 / 活動開始~ 結束日期</td>
				<td>發布時間 / 默認排序 </td>
				<td>目前人數 / 人數上限</td>
				<td>報名截止日</td>
			</tr>
		</thead>
		
	
	</table>


</body>
</html>