<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajax Test</title>
</head>
<script src="https://code.jquery.com/jquery-3.5.1.js" ></script>

<body>
	<form>
		<div>
			<label>帳號：</label>
			<input type="text" id="account" name="account">
<!-- 			<input type="button" id="checkAnt" name="checkAnt"> -->
			<span id="showResult"></span>
		</div>
	</form>
	
	<script type="text/javascript">
	$("#account").on("blur", checkIsExist);
		function checkIsExist(){
			
			var userAnt = $.trim($("#account").val());
			
			$.ajax({
				method:"GET",
				url:"<c:url value='/member/isExistTest' />",
				data:{account:userAnt},
				dataType:"json",
				complete:function(msg){
					console.log(msg);
					if(eval("(" + msg.responseText + ")")){
						$("#showResult").html("<font color='red'>帳號已存在</font>");
					} else{
						$("#showResult").html("帳號可以使用");
					}
				}
			})
		}
		
		
// 		complete:function(msg){
// 			if(eval("('+"msg.responseText+"')")){
// 				$("#showResult").html("<font color='red'>帳號已存在</font>");
// 			} else{
// 				$("#showResult").html("帳號可以使用");
// 			}
// 		}
		
		function clearCss(){
			$("#showResult").html("");
		}
	
	
	
	
	</script>

</body>
</html>