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
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

<script src="/MountainExploer.com/mountain/test/ajaxmultiImage.js" ></script>

<style type="text/css">
	#showActList td{
		border: 1px solid red;
	}
	#newAct td{
		border : 1px solid gray;
	}
</style>

</head>
<body>
	<h2>測試活動及報名系統</h2>
	<hr>
	<h3>新增活動</h3>
	<form enctype="multipart/form-data" id="imgForm">
		<table id="newAct" >
			<tr>
				<td>
					<input id="file" type="file" name="files" multiple>
				</td>
			</tr>
		</table>
		<input type="submit" value="新增活動" id="newActButton">
	</form>
		<hr>
	<hr>
	

</body>
</html>