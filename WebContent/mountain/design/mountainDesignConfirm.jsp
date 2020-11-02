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
<link rel="stylesheet" href="m_design.css">
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
	<%-- <c:if test="${ empty LoginOK }">
		<script>
			alert("閒置過長或尚未登入，關閉本視窗將導向會員登入頁")
			document.location.href="../../member/login/login.jsp";
		</script>
	</c:if> --%>

	<!-- <c:set var='functionCheck'  value="none" scope="session"/> -->

	<div id="container">

		<!-- 引入共同頁首 -->

		<!-- 主要內容 -->
		<div id="content">
			<div id="c_container">
				<div id="m_present">
					<div class="stocker"></div>
					<div class="d_nav">
						<div>
							<a id="a_act1" class="d_nav_a">活動管理</a>
						</div>
					</div>
					<div class="stocker"></div>
					
				
					<!-- 新增活動之表單 -->
					<div class="act_active">
						<form action="newPostServlet" id="new_act" method="post">
							<fieldset style="display:none;">
								<legend>響導個人資料</legend>
								<div>
									<div>
										<label>響導姓名&nbsp&nbsp</label> <input name="gInfo_name"
											class="gInfo_name" type="text">
									</div>
									<div>
										<label>響導電子信箱&nbsp&nbsp</label> <input name="gInfo_email"
											class="gInfo_email" type="text" value="${postBean.memberID }">
									</div>
								</div>
								<div>
									<c:choose>
										<c:when test="${ !empty postBean.neakName}">
											<div>
												<label>響導稱呼 ( 綽號 )&nbsp&nbsp</label> <input name="gInfo_neakName"
													class="gInfo_neakName" type="text" value="${postBean.neakName}" readonly>
											</div>
										</c:when>
										<c:otherwise>
											<div>
												<label>響導稱呼 ( 綽號 )&nbsp&nbsp</label> <input name="gInfo_neakName"
													class="gInfo_neakName" type="text" readonly>
											</div>
										</c:otherwise>
									</c:choose>
									<div>
										<label>響導登山經驗&nbsp&nbsp</label> <input name="gInfo_exp"
											class="gInfo_exp" type="text" readonly value="${postBean.memberEXP}">
									</div>
								</div>
								
							</fieldset>	
							<fieldset class="act-routeInfo">
								
								<legend>登山活動資訊</legend>
								<div>
									<div>
										<label for="act_np_name">國家公園名稱&nbsp &nbsp</label> 
										<input type="text" name="np_name" id="act_np_name" value="${postBean.npName}" readonly>
									</div>
									<div>
										<label>路線名稱&nbsp &nbsp</label> 
										<input type="text" name="peak_name" id="peak_name" class="rt_active" value="${postBean.peakName}" readonly>
										 
									</div>
								</div>
								<div>
									<div>
										<label for="act_name">活動名稱&nbsp&nbsp</label>
										<input type="text" name="act_name" id="act_name" value="${postBean.actName}" readonly>
									</div>
									<div>
										<label for="act_pay">報名費用&nbsp&nbsp</label>
										<input type="text" name="act_pay" id="act_pay" value="${postBean.actPay}" readonly>
									</div>
								</div>
								<div>
									<div>
										<label for="from_end_date">活動開始~結束日期&nbsp&nbsp</label> 
										<input type="text"  name="StartEnd" autocomplete="off" value="${postBean.startDate} ~ ${postBean.endDate}" readonly >
									</div>
									<div>
										<label for="total_day">活動天數&nbsp&nbsp</label>
										<input type="text"  name="totalDay"  value="${postBean.totalDay}" readonly>
									</div>

								</div>
								<div>
									<div>
										<label for="confirm_date">報名截止日&nbsp&nbsp</label> 
										<input type="text"  name="confrimDate" autocomplete="off" value="${postBean.regEndDate}" readonly>
									</div>
									<div>
										<label for="total_parti">報名人數上限&nbsp&nbsp</label>
										<input type="text"  name="total_parti" autocomplete="off" value="${postBean.regTopNum}" readonly>
									</div>

								</div>


							</fieldset >
							
							<fieldset class="act-otherInfo">
								<legend>備註</legend>
								<div class="act_packageDiv">
									<textarea id="act_package" name="act_package" rows="5" cols="50" readonly>${postBean.actOther}</textarea>
								</div>
							
							</fieldset>
							<div class="stocker"></div>
							<div class="finish_bar">
								<div>
								<input type="submit" value="確認新增" id="confrim_button">
								</div>
								<div>
								<input type="button" value="修改" id="rewrite_design">
								</div>
								<div>
								<input type="button" value="返回" id="act_back_button">
								</div>
							</div>

						</form>
					</div>

				</div>

			</div>

		</div>

		<footer> </footer>

	</div>
	


	<script src="../../pan/jsFolder/index.js"></script>
	<script src="../mountain.js"></script>
	<script src="m_design.js"></script>
	<script>
		$("#confrim_button").on("click",function(){
			sessionStorage.setItem("newActivity","waiting");
		})
		$("#rewrite_design").on("click",function(){
			history.go(-1);
		})
	</script>

</body>

</html>