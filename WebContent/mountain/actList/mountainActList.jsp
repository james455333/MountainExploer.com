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
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@800&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="../../pan/cssFolder/index.css">
<link rel="stylesheet" href="../mountainIndex.css">
<link rel="stylesheet" href="actList.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


<style>
</style>
</head>

<body>

	<!-- <c:set var='functionCheck'  value="none" scope="session"/> -->

	<div id="container">

		<!-- 引入共同頁首 -->


		<!-- 主要內容 -->
		<div id="content">
			<div id="c_container">
				<div id="m_present">
					<div class="stocker"></div>
					<!-- 查詢項 -->
					<div class="research">
						
					</div>
					<div class="act_show">
						<table class="table">
							<thead class="thead-light">
								<tr class="a_titleName">
									
									<th scope="col"><span class="tr_title">響導</span></th>
									<th scope="col"><span class="tr_title">活動名稱 ( 點擊可觀看詳情及報名 )</span></th>
									<th scope="col"><span class="tr_title">活動日期</span></th>
									<th scope="col"><span class="tr_title">報名費用</span></th>
									<th scope="col"><span class="tr_title">報名人上限/目前人數</span></th>
									<th scope="col"><span class="tr_title">報名截止日</span></th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="postBean" items="${actBean}" varStatus="va">
							
								<tr>
									<td class="guide_name"><a href="#">${postBean.memberName}</a></td>
									<td class="act_name"><a href="ActDetailServlet?post_id=${postBean.postID}">${postBean.actName}</a></td>
									<td>${postBean.startDate}  ~  ${postBean.endDate}</td>
									<td>${postBean.actPay}</td>
									<td>${postBean.regTopNum}  /  ${postBean.regNum }</td>
									<td>${postBean.regEndDate}</td>
								</tr>
							
							</c:forEach>
							<c:if test="${ empty LoginOK }">
								<script>
									$(".act_name").find("a").attr("href","#").on("click",function(){
										alert("此功能僅限會員使用");
									})
								</script>
							</c:if>
								
								
							</tbody>
						</table>
					</div>
					
					

				</div>

			</div>

		</div>

		<footer> </footer>

	</div>



	<script src="../../pan/jsFolder/index.js"></script>
	<script src="../mountain.js"></script>
	<script src="actList.js"></script>
	<c:if test="${ !empty errorMsg} ">
		<script type="text/javascript">
			alert("${errorMsg}")
		</script>
	</c:if>
	

</body>

</html>