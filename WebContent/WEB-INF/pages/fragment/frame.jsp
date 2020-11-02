<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<!-- functionCheck 的 value對應值 -->
<!-- 會員登入 = logging -->
<!-- 會員資料 = memberInfo -->
<!-- 資料維護 = maintainInfo -->
<!-- 百戰百岳 = mountain -->
<!-- 露營地/山中小屋 = house -->
<!-- 購物商城 = shopping -->
<!-- 討論區 = platform -->

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>岳進者</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" >
<link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@800&display=swap" rel="stylesheet">
 <link rel="stylesheet" href="../pan/cssFolder/index.css">
 
 <script src="https://code.jquery.com/jquery-3.5.1.js" ></script>
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<style>
</style>
</head>

<body>

<!-- <c:set var='functionCheck'  value="none" scope="session"/> -->
	<!-- 讀取進度條 -->
	<div id="loading">
		<div class="loading"></div> 
		<!-- <script type="text/javascript"> 
		$('.loading').animate({'width':'33%'},50); 
		//第一個進度節點 
	</script>  -->
	</div>
	<div id="container">
	<script type="text/javascript"> 
		$('.loading').animate({'width':'33%'},500); 
		//第一個進度節點 
	</script> 
		<!-- 引入共同頁首 -->

		
		<!-- 主要內容 -->
		<div id="content">
		<!-- <script type="text/javascript"> 
			$('.loading').animate({'width':'55%'},250); 
			//第二個進度節點 
		</script>  -->
			

		</div>

		<footer> 
		<!-- <script type="text/javascript"> 
			$('.loading').animate({'width':'100%'},250,function(){
					$('#loading').fadeOut(); 
				}); 
			//$('#loading').fadeOut();  
			//第三個進度節點 
		</script>  -->
		
		</footer>

	</div>


	
	 <script src="../pan/jsFolder/index.js"></script> 


		
		
</body>

</html>