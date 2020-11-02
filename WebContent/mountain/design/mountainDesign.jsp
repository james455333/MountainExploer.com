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
	</c:if>
	
	<c:if test="${ !empty deleteConfirm }">
		<script>
			alert("${deleteConfirm}");
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
					<div class="stocker">
					
					</div>
					<!-- 管理選項 -->
					<div class="controll-bar">
						<div>
							<span class="controll-option">新增模式</span>
						</div>
						<div>
							<span class="controll-option">修改模式</span>
						</div>
						<div>
							<span class="controll-option">刪除模式</span>
						</div>
					</div>
					<!-- 活動列表 -->
					<div class="act_manage act_active">
						<table class="table">
							<thead class="thead-light">
								<tr class="a_titleName">
									<th scope="col"><span class="tr_title">活動名稱</span></th>
									<th scope="col"><span class="tr_title">活動日期/天數</span></th>
									<th scope="col"><span class="tr_title">報名費用</span></th>
									<th scope="col"><span class="tr_title">報名人上限/目前人數</span></th>
									<th scope="col"><span class="tr_title">報名截止日</span></th>
									<th scope="col"><span class="tr_title">詳細資料</span></th>
								</tr>
							</thead>
								<c:forEach var="postList" items="${actBean}" varStatus="vs">
							<tbody>
									<tr>
										<td class="act_name"><a href="#">${postList.actName}</a></td>
										<td>${postList.startDate}  ~  ${postList.endDate}</td>
										<td>${postList.actPay}</td>
										<td>${postList.regTopNum}  /  ${postList.regNum }</td>
										<td>${postList.regEndDate}</td>
										<td><div class="act_show_detail">詳細資料</div></td>
									</tr>
									<tr class="invisible_detail">
										<td colspan="2"> 路線名稱 : ${postList.npName} -> ${postList.peakName}<br>
										總共天數 : ${postList.totalDay}<br>
										活動編號 : ${postList.postID}<br>
										活動發文日期 : ${postList.postDate}<br>
										</td>
										<td colspan="5">備註 : ${postList.actOther}</td>
									</tr>
							</tbody>
								</c:forEach>
						</table>
					</div>
					<!-- 新增活動之表單 -->
					<div class="act_manage">
						<form action="confirmPostServlet" id="new_act" method="post">
							
							<fieldset class="act-guideInfo">
								<div>
									<div>
										<label>響導姓名&nbsp&nbsp</label> <input name="gInfo_name"
											class="gInfo_name" type="text" value="${LoginOK.name}" readonly>
									</div>
									<div>
										<label>響導電子信箱&nbsp&nbsp</label> <input name="gInfo_email"
											class="gInfo_email" type="text" value="${LoginOK.email}" readonly>
									</div>
								</div>
								<div>
									<div>
										<label>響導稱呼 ( 綽號 )&nbsp&nbsp</label> <input name="gInfo_neakName"
											class="gInfo_neakName" type="text" required>
									</div>
									<div>
										<label>響導登山經驗&nbsp&nbsp</label> <input name="gInfo_exp"
											class="gInfo_exp" type="text" value="${LoginOK.exp}" readonly>
									</div>
								</div>
							</fieldset>
							<fieldset class="act-routeInfo">
								<legend>登山活動資訊</legend>
								<div>
									<div>
										<label for="act_np_name">國家公園名稱&nbsp &nbsp</label> 
										<select name="np_name" id="act_np_name">
											<option value="玉山國家公園">玉山國家公園</option>
											<option value="太魯閣國家公園">太魯閣國家公園</option>
											<option value="雪霸國家公園">雪霸國家公園</option>
										</select>
									</div>
									<div>
										<label>路線名稱&nbsp &nbsp</label> 
										<select name="peak_yu_name" id="rt_yu_peak" class="rt_active">
											<c:forEach var="peakName" items="${mountainBean}"
												varStatus="vs">
												<c:if test="${peakName.npName == '玉山國家公園'}">
													<option value="${peakName.name}">${peakName.name}</option>
												</c:if>
											</c:forEach>
										</select> <select name="peak_ta_name" id="rt_ta_peak" class="rt_wait">
											<c:forEach var="peakName" items="${mountainBean}"
												varStatus="vs">
												<c:if test="${peakName.npName == '太魯閣國家公園'}">
													<option value="${peakName.name}">${peakName.name}</option>
												</c:if>
											</c:forEach>
										</select> <select name="peak_sh_name" id="rt_sh_peak" class="rt_wait">
											<c:forEach var="peakName" items="${mountainBean}"
												varStatus="vs">
												<c:if test="${peakName.npName == '雪霸國家公園'}">
													<option value="${peakName.name}">${peakName.name}</option>
												</c:if>
											</c:forEach>
										</select>
									</div>
								</div>
								<div>
									<div>
										<label for="act_name">活動名稱&nbsp&nbsp</label>
										<input type="text" name="act_name" id="act_name" required>
									</div>
									<div>
										<label for="act_pay">報名費用&nbsp&nbsp</label>
										<input type="text" name="act_pay" id="act_pay" required>
									</div>
								</div>
								<div>
									<div>
										<label for="from_end_date">活動開始~結束日期&nbsp&nbsp</label> 
										<input type="text" id="from_end_date" name="from_end_date" required>
									</div>
									<div>
										<label for="total_day">活動天數&nbsp&nbsp</label>
										<input type="text" id="total_day" name="total_day" readonly >
									</div>

								</div>
								<div>
									<div>
										<label for="confirm_date">報名截止日&nbsp&nbsp</label> 
										<input type="text" id="confirm_date" name="confirm_date" required>
									</div>
									<div>
										<label for="total_parti">報名人數上限&nbsp&nbsp</label>
										<input type="text" id="total_parti" name="total_parti" required >
									</div>

								</div>


							</fieldset >
							
							<fieldset class="act-otherInfo">
								<legend>備註</legend>
								<div class="act_packageDiv">
									<textarea id="act_package" name="act_package" rows="5" cols="50"></textarea>
								</div>
							
							</fieldset>
							<div class="stocker"></div>
							<div class="finish_bar">
								<div>
									<input type="submit" value="送出">
								</div>
								<div>
									<input type="reset" value="重置">
								</div>
								<div>
									<input type="button" value="返回" id="act_back_button" href="<c:url value='mountainDesign.jsp'/>">
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
	<c:choose>
		<c:when test="${ empty errorMsg}">
			<c:if test="${ !empty confirmInsert}">
				<script>
					alert( "${confirmInsert}")
				</script>
			</c:if>
		</c:when>
		<c:when test="${!empty errorMsg}">
			<script type="text/javascript">
				alert( "${confirmInsert} <br> ${errorMsg}" )
			</script>
		</c:when>
		<c:otherwise>
			
		</c:otherwise>
	</c:choose>
	

</body>

</html>