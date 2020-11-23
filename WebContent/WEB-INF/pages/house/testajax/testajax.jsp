<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.5.1.js" ></script>

</head>
<body>
	<form>
	<div class="123ttt">
		<input type="submit" id="select" name="select" value="1">
		<i></i>
		
	</div>
	<div class="123ttt">
		<input type="submit" id="select" name="select" value="1">
		<i></i>
		
	</div>
	<div class="123ttt">
		<input type="submit" id="select" name="select" value="1">
		<i></i>
		
	</div>
	<div class="123ttt">
		<input type="submit" id="select" name="select" value="1">
		<i></i>
		
	</div>
	<input type="submit" id="select" name="select" onclick="">
	</form>



<script type="text/javascript">
	$(document).ready(function(){
		
		$(".123ttt").html()
		$(".123ttt").text()
		$(".123ttt").value()
		$(".123ttt").length
		$(".123ttt").eq(i)
		console.log( $(".123ttt") )

		$("#select").attr("disable",true) 
		$("#select").css("name")

		$(".123ttt").find("input[name='select']").val() =1
		
		
		})
		
		
	<div>
		<input type="button" id="selectall" value="全部查詢">
	</div>
	<div id="totalData" >
	
	</div>



	<script type="text/javascript">
			
		$("#selectall").on("click", campSelectAll);

		function campSelectAll() {
				 
			$.ajax({
				url : "<c:url value='/mountainCampajax/ajaxcampAll' />",
				method : "GET",
				dataType : "json",
				success : function(data) {
					console.log("success", data);

					for(let i = 0 ; i< data.length ; i++){
					$("#totalData").append(data[i].counties.area.name + data[i].counties.name + data[i].campbasicid + data[i].name + data[i].url +"</br>");
				
					}
					},
					
				error : function() {
					console.log("123")
				}
			})
		
		}
		
	</script>
</script>

</body>
</html>