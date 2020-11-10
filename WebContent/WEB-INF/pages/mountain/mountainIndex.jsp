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
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@800&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="../pan/cssFolder/index.css">
<link rel="stylesheet" href="mountainIndex.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
</style>
</head>

<body>

	
	<c:set var='functionCheck' value="mountain" scope="session" />
	
	
	<div id="container">

		<!-- 引入共同頁首 -->
		
	
		<!-- 主要內容 -->
		<div id="content">

			<!-- 測試是否有從資料庫抓到資料並輸入進session -->
			<%-- <c:out value="${sessionScope.mountainBean }" /> --%>
			<div id="c_container">
				
				<!-- 引入百戰百岳頁首 -->
				<c:set var="npSet" value="np1" scope="session"/>
				<jsp:include page="m_frag/secondTop.jsp"></jsp:include>
				
				<!-- 百戰百岳內容 -->
				<div id="m_present">
					<div class="third">
						<div id="m_np1" class="third_bar bar_active">
							<a id="a_np1" class="npA">玉山國家公園</a>
						</div>
						<div id="m_np2" class="third_bar">
							<a id="a_np2" class="npA">太魯閣國家公園</a>
						</div>
						<div id="m_np3" class="third_bar">
							<a id="a_np3" class="npA">雪霸國家公園</a>
						</div>
					</div>
					<div class="peakList co_active">
						<c:set var="tname" value="玉山國家公園" />
						<c:forEach var="peakName" items="${mountainBean}" varStatus="vs">
							<c:if test="${ peakName.npName == tname }">
								<div class="peak co_active">
									<a>${peakName.name}</a>
								</div>
							</c:if>
						</c:forEach>
					</div>
					<c:if test="${ ! empty mountainBean}">

						<c:forEach var="peakName" items="${mountainBean}" varStatus="vs">
							<c:if test="${ peakName.npName == tname }">
								<div class="dataCon">
									<c:if test="${vs.first}">
										<script>
											$(".dataCon").addClass(
													"co_active")
										</script>
									</c:if>

									<div class="m_img">
										<img src="${peakName.imgUrl }">
									</div>

									<div class="m_descriptiion">
										<p>${peakName.description }</p>
									</div>

									<div class="m_advice">
										<p>${peakName.advice }</p>
									</div>

									<div class="m_traffic">
										<p>${peakName.traffic }</p>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</c:if>
					<c:set var="tname" value="太魯閣國家公園" />
					<div class="peakList">
						<c:forEach var="peakName" items="${mountainBean}" varStatus="vs">
							<c:if test="${peakName.npName == tname }">
								<div class="peak">
									<a>${peakName.name}</a>
								</div>
							</c:if>
						</c:forEach>
					</div>


					<c:if test="${ ! empty mountainBean}">
						<c:forEach var="peakName" items="${mountainBean}" varStatus="vs">
							<c:if test="${peakName.npName == tname }">
								<div class="dataCon">
									<div class="m_img">
										<img src="${peakName.imgUrl }">
									</div>

									<div class="m_descriptiion">
										<p>${peakName.description }</p>
									</div>

									<div class="m_advice">
										<p>${peakName.advice }</p>
									</div>

									<div class="m_traffic">
										<p>${peakName.traffic }</p>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</c:if>
					<c:set var="tname" value="雪霸國家公園" />
					<div class="peakList">
						<c:forEach var="peakName" items="${mountainBean}" varStatus="vs">
							<c:if test="${peakName.npName == tname }">
								<div class="peak">
									<a>${peakName.name}</a>
								</div>
							</c:if>
						</c:forEach>
					</div>
					<c:if test="${ ! empty mountainBean}">

						<c:forEach var="peakName" items="${mountainBean}" varStatus="vs">
							<c:if test="${peakName.npName == tname }">
								<div class="dataCon">
									<div class="peakList">
										<div class="peak">
											<a>${peakName.name}</a>
										</div>
									</div>
									<div class="m_img">
										<img src="${peakName.imgUrl }">
									</div>

									<div class="m_descriptiion">
										<p>${peakName.description }</p>
									</div>

									<div class="m_advice">
										<p>${peakName.advice }</p>
									</div>

									<div class="m_traffic">
										<p>${peakName.traffic }</p>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</c:if>







				</div>




			</div>

		</div>

		<footer> </footer>

	</div>
	
	
	<script src="https://code.jquery.com/jquery-3.5.1.js"
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
		crossorigin="anonymous"></script>
	<script src="../pan/jsFolder/index.js"></script>
	<script id="contentCov"></script>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

	<script src="mountain.js"></script>
	<c:if test="${ !empty errorMsg }">
		<script type="text/javascript">
			alert("出現錯誤\n${errorMsg}\n請複製錯誤訊息並連絡管理員");
			
		</script>
	</c:if>
		<script>
		
		var npSet = sessionStorage.getItem("npSet")
		if( npSet == "np1"){
			
		/*console.log($(this).attr("id"))*/
		
		$('#m_np1').siblings(".third_bar").css({"border" : "none"}).end().css({
        "border" : "5px solid 	#8CEA00 "
    	})
		$('#m_np1').addClass("bar_active").siblings("div").removeClass("bar_active");
		let num = 1;
		$(".peakList").eq(num-1).addClass("co_active").siblings(".peakList").removeClass("co_active")	
		$(".peakList").eq(num-1).next().addClass("co_active").siblings(".dataCon").removeClass("co_active");
			
		}else if(npSet=="np2"){
			
		/*console.log($(this).attr("id"))*/
		
		$('#m_np2').siblings(".third_bar").css({"border" : "none"}).end().css({
        "border" : "5px solid 	#8CEA00 "
    	})
		$('#m_np2').addClass("bar_active").siblings("div").removeClass("bar_active");
		let num = 2;
		$(".peakList").eq(num-1).addClass("co_active").siblings(".peakList").removeClass("co_active")	
		$(".peakList").eq(num-1).next().addClass("co_active").siblings(".dataCon").removeClass("co_active");
			
		}else if(npSet == "np3"){
			
		/*console.log($(this).attr("id"))*/
		let m_np = '#m_np3'
		
		$('#m_np3').siblings(".third_bar").css({"border" : "none"}).end().css({
        "border" : "5px solid 	#8CEA00 "
    	})
		$('#m_np3').addClass("bar_active").siblings("div").removeClass("bar_active");
		let num = 3;
		$(".peakList").eq(num-1).addClass("co_active").siblings(".peakList").removeClass("co_active")	
		$(".peakList").eq(num-1).next().addClass("co_active").siblings(".dataCon").removeClass("co_active");
			
		}
		
		
	</script>
	
	


</body>

</html>