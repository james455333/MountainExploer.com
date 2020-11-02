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
	<c:if test="${ empty LoginOK }">
		<script>
			alert("閒置過長或尚未登入，關閉本視窗將導向會員登入頁")
			document.location.href="../../member/login/login.jsp";
		</script>
	</c:if>
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
							<form action="RegActServlet" id="show_act" method="post">
							<fieldset>
								<legend>響導個人資料</legend>
								<div>
									<div>
										<label>響導姓名&nbsp&nbsp</label> <input name="gInfo_name"
											class="gInfo_name" type="text" readonly value="${regAct.memberName}">
									</div>
									<div>
										<label>響導電子信箱&nbsp&nbsp</label> <input name="gInfo_email"
											class="gInfo_email" type="text" readonly value="${regAct.email }">
									</div>
								</div>
								<div>
									<div>
										<label>響導稱呼 ( 綽號 )&nbsp&nbsp</label> <input name="gInfo_neakName"
											class="gInfo_neakName" type="text" readonly value="${regAct.neakName}">
									</div>
									<div>
										<label>響導登山經驗&nbsp&nbsp</label> <input name="gInfo_exp"
											class="gInfo_exp" type="text" readonly value="${regAct.memberEXP}">>
									</div>
								</div>
								
							</fieldset>	
							<fieldset class="act-routeInfo">
								
								<legend>登山活動資訊</legend>
								<div>
									<div>
										<label for="act_np_name">國家公園名稱&nbsp &nbsp</label> 
										<input type="text" name="np_name" id="act_np_name" value="${regAct.npName }" readonly>
									</div>
									<div>
										<label>路線名稱&nbsp &nbsp</label> 
										<input type="text" name="peak_name" id="peak_name" class="rt_active" value="${regAct.peakName}" readonly>
										 
									</div>
								</div>
								<div>
									<div>
										<label for="act_name">活動名稱&nbsp&nbsp</label>
										<input type="text" name="act_name" id="act_name" value="${regAct.actName}" readonly>
									</div>
									<div>
										<label for="act_pay">報名費用&nbsp&nbsp</label>
										<input type="text" name="act_pay" id="act_pay" value="${regAct.actPay}" readonly>
									</div>
								</div>
								<div>
									<div>
										<label for="from_end_date">活動開始~結束日期&nbsp&nbsp</label> 
										<input type="text" id="from_end_date" name="from_end_date" value="${regAct.startDate} ~ ${regAct.endDate}" readonly >
									</div>
									<div>
										<label for="total_day">活動天數&nbsp&nbsp</label>
										<input type="text" id="total_day" name="total_day" value="${regAct.totalDay}" disabled>
									</div>

								</div>
								<div>
									<div>
										<label for="confirm_date">報名截止日&nbsp&nbsp</label> 
										<input type="text" id="confirm_date" name="confirm_date"  value="${regAct.regEndDate}" disabled>
									</div>
									<div>
										<label for="total_parti">報名人數上限&nbsp&nbsp/目前報名人數</label>
										<input type="text" id="total_parti" name="total_parti" value="${regAct.regTopNum} / ${regAct.regNum}" disabled>
									</div>

								</div>


							</fieldset >
							
							<fieldset class="act-otherInfo">
								<legend>備註</legend>
								<div class="act_packageDiv">
									<textarea id="act_package" name="act_package" rows="5" cols="50" disabled>${regAct.actOther}</textarea>
								</div>
							
							</fieldset>
							<div class="stocker"></div>
							<div class="finish_bar">
								<div>
								<input type="submit" value="報名" id="confrim_button">
								</div>
								<div>
								<input type="button" value="返回上一頁" id="act_back_button" >
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
	<script src="actList.js"></script>


</body>

</html>