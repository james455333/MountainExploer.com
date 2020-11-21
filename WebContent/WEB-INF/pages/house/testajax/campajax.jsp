<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="javax.naming.Context"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Camp Ajax Test</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src=" https://code.jquery.com/jquery-3.5.0.js"></script>
</head>
<body>

	<div><input type="button" id="selectall" value="全部查詢"></div>
	<div id="totalData"></div>



	<script type="text/javascript">
		$("#selectall").on("click",campSelectAll);

		function campSelectAll() {
			$.ajax({
				url:"<c:url value='/mountainCampajax/ajaxcampAll' />",
				method:"GET",
				success :function(data) {
					console.log("success", data);
// 					$("#totalData").html(CampInfoBean.id + CampInfoBean.name + data)
				},
				error : function(){
					console.log("123")
				}

			})
		}
	</script>
	
	
	<script type="text/javascript" charset="UTF-8"
		src='<c:url value="/housecamp/css/back/backhousecamp.js"/>'></script>
</body>
</html>