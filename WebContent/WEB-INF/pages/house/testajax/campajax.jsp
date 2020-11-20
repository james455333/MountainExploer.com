<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Camp Ajax Test</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
</head>
<body>


	<div>

		<input type="button" id="selectall" value="全部查詢">
	</div>
	<div id="totalData"></div>



	<script type="text/javascript">
		$("#selectall").on("click", campSelectAll);
		function campSelectAll() {

			$.ajax({
				url:"<c:url value='/mountainCampajax/ajaxcampAll' />",
				method:"GET",
				dataType:"json",
				success:function(data) {
					console.log(data);
					console.log("1111")
					for (let i = 0; i < data.length; i++) {
						$("#totalData").append(
								'<option value ="' + data[i].id +'">'
										+ data[i].name + "</option>")
					}

				}

			})
		}
	</script>
</body>
</html>