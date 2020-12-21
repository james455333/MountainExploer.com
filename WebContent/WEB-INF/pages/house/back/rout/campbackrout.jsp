<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="javax.naming.Context"%>
<!DOCTYPE html>
<html lang="zh-tw">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>露營地 | 後台維護管理系統</title>

<!-- Custom fonts for this template-->
<link
	href="/MountainExploer.com/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<link href="/MountainExploer.com/css/sb-admin-2.min.css"
	rel="stylesheet">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<!-- Bootstrap core CSS -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css"
	rel="stylesheet">
<!-- JQuery UI -->
<link rel="stylesheet"
	href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
<!-- Custom styles for this template-->
<link href="/MountainExploer.com/css/sb-admin-2.min.css"
	rel="stylesheet">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/css/bootstrap-select.min.css">
<!-- dataTable -->
<link rel="stylesheet" type="text/css"
	href="//cdn.datatables.net/1.10.22/css/jquery.dataTables.min.css">
<!-- bootstrap-toggle -->
<link
	href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css"
	rel="stylesheet">
<!-- for this page -->
<link href="/MountainExploer.com/mountain/back/css/route.css"
	rel="stylesheet">
<!-- Fancy Box 3 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/gh/fancyapps/fancybox@3.5.7/dist/jquery.fancybox.min.css" />
<!-- sweetalert2 -->
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/@sweetalert2/theme-bootstrap-4/bootstrap-4.css">

<!-- JQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>

<!-- Bootstrap tooltips -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
<!-- Bootstrap core JavaScript-->
<script
	src="/MountainExploer.com/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.min.js"></script>
<!-- Latest compiled and minified JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/js/bootstrap-select.min.js"></script>
<!-- sweetalert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<!-- dataTable -->
<script type="text/javascript"
	src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
<!-- 	bootstrap-toggle -->
<script
	src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
<!-- Fancy Box 3  -->
<script
	src="https://cdn.jsdelivr.net/gh/fancyapps/fancybox@3.5.7/dist/jquery.fancybox.min.js"></script>
<!-- jquery validator -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.2/dist/jquery.validate.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.2/additional-methods.min.js"></script>
<!-- Page level plugins -->
<script src="/MountainExploer.com/vendor/chart.js/Chart.min.js"></script>
<!-- 跳框訊息 -->
<!-- <script src="/MountainExploer.com/mountain/back/js/route.js"></script> -->
<!-- <script src="/MountainExploer.com/mountain/back/js/routeFunction.js"></script> -->
<!-- FB Login -->
<link href="https://cdn.jsdelivr.net/....../dist/sweetalert2.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/....../dist/sweetalert2.all.min.js"></script>


<style type="text/css">
.myMouse{cursor: default;}

</style>
</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar"
			include-html="/MountainExploer.com/back/include/sidebar.html">
		</ul>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<nav
					class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow"
					include-html="/MountainExploer.com/back/include/topbar.html">
				</nav>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">路線資料維護</h1>
						<a href="#" id="exportAll"
							class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
							class="fas fa-download fa-sm text-white-50"></i>匯出資料表</a>
					</div>

					<div class='row'>

						<div class="col-xl-4 col-md-6 mb-4">
							<div class="card border-left-primary shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-s font-weight-bold text-primary text-uppercase mb-1">
												縣市總數量</div>
											<div id="rt-total-num"
												class="h5 mb-0 font-weight-bold text-gray-600">${areacount}區</div>
										</div>
										<div class="col-auto">
											<i class="fa fa-flag fa-2x" style="color: #339af0;"
												aria-hidden="true"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-4 col-md-6 mb-4">
							<div class="card border-left-success shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-s font-weight-bold text-success text-uppercase mb-1">
												鄉鎮總數量</div>
											<div id="rt-able-num"
												class="h5 mb-0 font-weight-bold text-gray-600">${countiescount}區</div>
										</div>
										<div class="col-auto">
											<i class="fa fa-flag fa-2x" style="color: #51cf66;"
												aria-hidden="true"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-4 col-md-6 mb-4">
							<div class="card border-left-danger shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-s font-weight-bold text-danger text-uppercase mb-1">
												露營地總數量</div>
											<div id="rt-forbid-num"
												class="h5 mb-0 font-weight-bold text-gray-600">${campcount}區</div>
										</div>
										<div class="col-auto">
											<i class="fa fa-flag fa-2x" style="color: #ff6b6b;"
												aria-hidden="true"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<!-- 下面開始 -->
						<div class="col-xl-12">
							<div class="card shadow mb-4" id="tb-container">
								<div class="card-header py-3"></div>
								<div class="card-body">
									<div class="d-flex">
										<div class="col-md-4 justify-content-end d-flex align-items-center ">
											
											<div class="input-group">
												<div class="input-group-prepend">
													<label class="input-group-text">縣市</label>
												</div>
												 
												<form class="form-inline" action="<c:url value='/Rout/mountainCampBack/selectAll#toseesee'></c:url>"method='get'>
													<select id="selectArea" class="form-control" name="selectarea">
														<option>請選擇指定縣市</option>
													</select>
														<div  class=" input-group-prepend ">
														<input type="hidden" value="" name="selectcounties">
														<input type="hidden" value=3 name="no"> 
														<input type="hidden" value=1 name="page"> 
														<input type="submit" class="btn btn-outline-success" value="查詢">
														</div>
												
												</form>
												
											</div>
										</div>
										
										
										
										<div class="col-md-4 justify-content-end d-flex align-items-center ">
											<div class="input-group ml-auto">
												<div class="input-group-prepend">
													<label class="input-group-text" >鄉鎮</label>
												</div>
												
												<form class="form-inline" action="<c:url value='/Rout/mountainCampBack/selectAll#toseesee'></c:url>"method='get'>
												
												<select id="selectCounties" class="form-control" name="selectcounties">
														<option>請選擇指定鄉鎮</option>
													</select>
												<div  class=" input-group-prepend ml-auto">
														<input type="hidden" value="" name="selectarea" >
														<input type="hidden" value=2 name="no" >
														<input type="hidden" value=1 name="page" >				
														<input type="submit" class="btn btn-outline-success" value="查詢">
														</div>
												</form>
											</div>
										</div>
										<div class="ml-auto">
											<form action="<c:url value='/Rout/mountainCampBack/selectAll#toseesee'></c:url>"method='get'>					
												<input type="hidden" value="" name="selectarea" >
												<input type="hidden" value="" name="selectcounties" >
												<input type="hidden" value=1 name="no" >
												<input type="hidden" value=1 name="page" >
												<input type="submit" id="toseesee" class="btn btn-outline-info" value="全部觀看">
											</form>
										</div>
										<div class="ml-auto">
											<form action="<c:url value='/Rout/mountainCampBack/selectCamp'></c:url>"
												method='get' id="form1" name="form1">
												營地名稱 :&nbsp <input type="text" class="light-table-filter"placeholder="請輸入關鍵字" name="selectcampname" >
												<input type="image" class="imgSearch" src="/MountainExploer.com/images/放大鏡.png" width="35px"
													onClick="document.form1.submit()">
											</form>
										</div>
									</div>
<!-- 									<hr> -->
<!-- 									<div class="d-flex"> -->
<!-- 										<h3>國家公園 -- 主類別控制</h3> -->
<!-- 										<button id="newNp" -->
<!-- 											class="btn btn-success btn-icon-split ml-auto"> -->
<!-- 											<span class="icon text-white-50"> <i -->
<!-- 												class="fas fa-mountain"></i> -->
<!-- 											</span> <span class="text">新增國家公園</span> -->
<!-- 										</button> -->
<!-- 										<button id="updateNp" -->
<!-- 											class="btn btn-warning btn-icon-split ml-auto"> -->
<!-- 											<span class="icon text-white-50"> <i -->
<!-- 												class="fas fa-mountain"></i> -->
<!-- 											</span> <span class="text">編輯國家公園</span> -->
<!-- 										</button> -->
<!-- 										<button id="deleteNp" -->
<!-- 											class="btn btn-danger btn-icon-split ml-auto"> -->
<!-- 											<span class="icon text-white-50"> <i -->
<!-- 												class="fas fa-trash-alt"></i> -->
<!-- 											</span> <span class="text">刪除國家公園</span> -->
<!-- 										</button> -->
<!-- 									</div> -->
									<hr>
									<div class=' d-flex justify-content-between'>
									
									
										<div class="col-xl-4 col-md-6 mb-4">
														<div class="col mr-2">
															<div
																class="text-s font-weight-bold text-primary text-uppercase mb-1">
																目前查詢筆數</div>
															<div id="rt-forbid-num"
																class="h5 mb-0 font-weight-bold text-gray-600">${totalData}區</div>
														</div>
										</div>									
									
									
									
										<div class="">									
															<a href="selectAll?selectarea=${selectarea }&selectcounties=${selectcounties}&no=${no }&page=1">«第一頁</a>	
									
													<c:choose>
													<c:when test="${page <= 1}"><a href="#">‹上一頁</a></c:when>
													<c:otherwise><a href="selectAll?selectarea=${selectarea}&selectcounties=${selectcounties}&no=${no }&page=${page-1}">‹上一頁</a></c:otherwise>
													</c:choose>					
													
														<select onChange="location = this.options[this.selectedIndex].value">
															<c:forEach var="toPage" begin="1" end="${totalPage}">
															<option value="selectAll?selectarea=${selectarea }&selectcounties=${selectcounties}&no=${no }&page=${toPage}" <c:if test="${toPage==page}">selected="selected"</c:if>>第${toPage}頁</option>
															</c:forEach>
														</select>
													
													<c:choose>
													<c:when test="${page == totalPage}"><a href="#">下一頁›</a></c:when>
													<c:otherwise><a href="selectAll?selectarea=${selectarea }&selectcounties=${selectcounties}&no=${no }&page=${page+1}">下一頁›</a></c:otherwise>
													</c:choose>				
														
														<a href="selectAll?selectarea=${selectarea }&selectcounties=${selectcounties}&no=${no }&page=${totalPage}">最末頁»</a>
										</div>				
								
					
							<div class="ml-auto">
								<form action="<c:url value='/Rout/mountainCampBack/inserjump'></c:url>"
									method='get'>
				
									<input type="submit" src="#" class="btn btn-outline-primary" name="" value="新增">
								</form>
							</div>
							
							</div>
									</div>
								<div class="card-body">
									<div class="table-responsive">
										<table id="routeTable">
											<thead>
												<tr>
													<th scope="col"><span class="tr_title">編號</span></th>
													<th scope="col"><span class="tr_title">縣市</span></th>
													<th scope="col"><span class="tr_title">鄉鎮</span></th>
													<th scope="col"><span class="tr_title">營地名稱</span></th>
													<th scope="col"><span class="tr_title">部落格網址</span></th>
													<th scope="col"><span class="tr_title">描述</span></th>
													<th scope="col"><span class="tr_title">星星分數總合</span></th>
													<th scope="col"><span class="tr_title">評分次數</span></th>
													<th scope="col"><span class="tr_title">平均分數</span></th>
													<th scope="col"><span class="tr_title">數量</span></th>
													<th scope="col"><span class="tr_title">價錢</span></th>
													<th scope="col"><span class="tr_title">照片</span></th>
													<th scope="col"><span class="tr_title"></span></th>
													<th scope="col"><span class="tr_title"></span></th>
												</tr>
											</thead>
											<tbody>
											<c:forEach var="i" items="${camp_all}">
						<tr>
							<td>${i.campbasicid}</td>
							<td>${i.counties.area.name}</td>
							<td>${i.counties.name}</td>
							<td>${i.name}</td>
							<td><a href="${i.url}">${i.url}</a></td>
							
							<td><a class="show" href="#show"  style="color: blue">點我看詳情.....more</a>
							<span class="showme" id="showme" style="display:none">${i.desc}<a href="#showme"  style="color: red">隱藏內容</a></span></td>
							
							<c:choose>
							<c:when test="${empty i.star}"><td>0</td></c:when>
							<c:otherwise><td>總共${i.star}分</td></c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${empty i.clickcount}"><td>0</td></c:when>
							<c:otherwise><td>評分過${i.clickcount}次</td></c:otherwise>
						</c:choose>
							<td>平均${i.star/i.clickcount}分</td>
							<td>${i.campamount}間</td>
							<td>TWD.${i.campprice}</td>
							<td>
								<c:choose>
								<c:when test="${empty i.campimgid.img }">
								<a class="tooltip-a" data-toggle='tooltip' href="${i.url}"target="_blank"><img alt='按'  height="100" width="100"
										src="/MountainExploer.com/housecamp/images/campimagnotfound.png"></a>
								</c:when>
								<c:when test="${not empty i.campimgid.img }">
								<a class="tooltip-a" data-toggle='tooltip' title="點擊" href="${i.url}"target="_blank"><img alt='按'  height="100" width="100"
										src="<c:url value='/mountainCampBack/showimg?imgid=${i.campimgid.id}'/>"></a>
								</c:when>
								</c:choose>
								</td>
							<td>
								<form
									action="<c:url value='/Rout/mountainCampBack/deleteCamp'></c:url>"
									name="form1" method='post'>
									<input type="hidden" name="deletecamp" value="${i.campbasicid}">
									<input type="button" value="刪除"
										onclick="if(confirm('確認要刪除嗎？')) this.form.submit();">
								</form>
							</td>
							<td>
								<form
									action="<c:url value="/Rout/mountainCampBack/updatejump"></c:url>"
									method="get">
									<input type="hidden" name="jumpupdate" value="${i.campbasicid}">
									<input type="submit" value="修改">
								</form>
							</td>
							
						</tr>
					</c:forEach>
					

					<c:forEach var="m" items="${lookupdate}">
						<tr>
							<td>${m.campbasicid}</td>
							<td>${m.counties.area.name}</td>
							<td>${m.counties.name}</td>
							<td>${m.name}</td>
							<td><a href="${m.url}">${m.url}</a></td>
							<td>${m.desc}</td>
							<c:choose>
							<c:when test="${empty m.star}"><td>0</td></c:when>
							<c:otherwise><td>總共${m.star}分</td></c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${empty m.clickcount}"><td>0</td></c:when>
							<c:otherwise><td>評分過${m.clickcount}次</td></c:otherwise>
						</c:choose>
							<td>平均${m.star/m.clickcount}分</td>
							<td>${m.campamount}間</td>
							<td>TWD.${m.campprice}</td>
							<td>
								<c:choose>
								<c:when test="${empty m.campimgid.img}">
								<a href="${m.url}"target="_blank"><img height="100" width="100"
										src="/MountainExploer.com/housecamp/images/campnull.PNG">按</a>
								</c:when>
								<c:when test="${not empty m.campimgid.img}">
								<a href="${m.url}" target="_blank"><img height="100" width="100"
										src="<c:url value='/mountainCampBack/showimg?imgid=${m.campimgid.id}'/>">按</a>
								</c:when>
								</c:choose>
							</td>
							
							</tr>
					</c:forEach>
											
											</tbody>
										</table>
									</div>
								</div>
							</div>
								
								
						</div>

						</div>
					</div>
					<!-- Page Heading -->

					<!-- DataTales Example -->
					<div class='hideDIV'>
						<a class="hideElm export" href=""></a>
					</div>




				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

			<!-- Footer -->
			<footer class="sticky-footer bg-white">
				<div class="container my-auto">
					<div class="copyright text-center my-auto"></div>
				</div>
			</footer>
			<!-- End of Footer -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">確認登出?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">確認即點選"登出"，或點選"取消"退出本介面</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">取消</button>
					<a class="btn btn-primary" href="../login.html">登出</a>
				</div>
			</div>
		</div>
	</div>

	<script>
		function delete_data() {
			if (confirm("確認刪除?")) {
				document.form1.submit();
				return true
				alert('已删除');
			} else {
				return false;
				alert('取消')
			}
		}
	</script>
	
	<script type="text/javascript">
		$(function() {
			
			
			var campUrl = "/MountainExploer.com/Rout/mountainCampBack";

			//所有縣市	
			$.ajax({
				url : campUrl + "/areaoption",
				method : "GET",
				dataType : "json",
				success : function(area) {
					for (var i = 0; i < area.length; i++) {
						$("#selectArea").append(
								"<option value='" + area[i].name + "'>"
										+ area[i].name + "</option>")
					}
					let firstArea = $("#selectArea").find("option").eq(0).val()

				}
			})
			//縣市選單變更	

			$("#selectArea").on("change",function() {
						var areaselect = $("#selectArea").val();
						$("#selectCounties").empty();
						$.ajax({
							url : campUrl + "/countiesoption?areaselect="
									+ areaselect,
							method : "GET",
							dataType : "json",
							success : function(counties) {
								for (var i = 0; i < counties.length; i++) {
									$("#selectCounties").append(
											"<option value='" + counties[i].name + "'>"
													+ counties[i].name
													+ "</option>")

								}
							}
						})
					})

				

	$(".show").click(function(){
		$(".show").slideToggle();
		  $(".showme").slideToggle();
		});

			$(".showme").click(function(){
				$(".showme").slideToggle();
				  $(".show").slideToggle();
				});
			
// 			$('.tooltip-a').tooltip()
			
	
			// 縣市圓餅圖	
			Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
			Chart.defaults.global.defaultFontColor = '#858796';

		

			// Pie Chart Example
			var ctx = document.getElementById("myPieChart");
			var myPieChart = new Chart(ctx, {
			  type: 'doughnut',
			  data: {

			    labels: [ "縣市" ],
			    datasets: [{
			      data: [55, 30, 15],
			      backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc'],
			      hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf'],
			      hoverBorderColor: "rgba(234, 236, 244, 1)",
			    }],
			  },
			  options: {
			    maintainAspectRatio: false,
			    tooltips: {
			      backgroundColor: "rgb(255,255,255)",
			      bodyFontColor: "#858796",
			      borderColor: '#dddfeb',
			      borderWidth: 5,
			      xPadding: 15,
			      yPadding: 15,
			      displayColors: false,
			      caretPadding: 10,
			    },
			    legend: {
			      display: true
			    },
			    cutoutPercentage: 80,
			  },
			});
		});
// 圓餅圖	end -->		
	</script>

	
	
	<script src="/MountainExploer.com/vendor/jquery/jquery.min.js"></script>
	<!-- Core plugin JavaScript-->
	<script
		src="/MountainExploer.com/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="/MountainExploer.com/js/sb-admin-2.min.js"></script>



	<script src="/MountainExploer.com/js/includejsp.js"></script>
</body>

</html>