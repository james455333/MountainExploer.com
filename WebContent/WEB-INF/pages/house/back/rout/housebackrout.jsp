<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="javax.naming.Context"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="zh-tw">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>岳進小屋 | 後台維護管理系統</title>

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
<link href="https://cdn.jsdelivr.net/....../dist/sweetalert2.min.css"
	rel="stylesheet" />
<script
	src="https://cdn.jsdelivr.net/....../dist/sweetalert2.all.min.js"></script>


<style type="text/css">
.myMouse {
	cursor: default;
}
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
						<h1 class="h3 mb-0 text-gray-800">小屋資料維護</h1>
						<a href="#" id="exportAll"
							class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
							class="fas fa-download fa-sm text-white-50"></i>匯出資料表</a>
					</div>

					<div class='row'>

						<div class="col-xl-4 col-md-6 mb-4">
							<div class="card border-left-danger shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-s font-weight-bold text-danger text-uppercase mb-1">
												岳進小屋總數量</div>
											<div id="rt-forbid-num"
												class="h5 mb-0 font-weight-bold text-gray-600">${AllHouse}區</div>
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
					<div class='row'>
						<div class="col-xl-6 col-lg-7">
							<div class="card shadow mb-4">
								<!-- Card Header - Dropdown -->
								<div class="card-header py-3 ">
									<div
										class="d-flex flex-row align-items-center justify-content-between">
										<h6 class="m-0 font-weight-bold text-primary">國家公園 - 小屋比例</h6>
										<div class="ml-auto px-2 no-arrow">
											<a href="" role="button" class="chart-reset"> <i
												class="fas fa-sm fa-fw fa-sync"></i>
											</a>
										</div>
										<div class="dropdown no-arrow">
											<a class="dropdown-toggle" href="#" role="button"
												id="dropdownMenuLink" data-toggle="dropdown"
												aria-haspopup="true" aria-expanded="false"> <i
												class="fas fa-ellipsis-v fa-sm fa-fw text-gray-800"></i>
											</a>
											<div
												class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
												aria-labelledby="dropdownMenuLink">
												<div class="dropdown-header">顯示圖像變化</div>
												<button class="dropdown-item usePer-chart" id="areacount"
													value='pie'>圓餅圖</button>
												<button class="dropdown-item usePer-chart" value='doughnut'>甜甜圈圖</button>
												<button class="dropdown-item usePer-chart" value='bar'>長條圖(直)</button>
												<button class="dropdown-item usePer-chart"
													value='horizontalBar'>長條圖(橫)</button>
												<div class="dropdown-divider"></div>
												<button class="dropdown-item" id="usePerNp-export">輸出為PNG檔</button>
												<button class="dropdown-item" id="usePerNp-export-json">輸出為JSON檔</button>
											</div>
										</div>
									</div>
									<!-- 									<div -->
									<!-- 										class="mt-3 d-flex flex-row align-items-center justify-content-between"> -->
									<!-- 										<div class="input-group"> -->
									<!-- 											<div class="input-group-prepend"> -->
									<!-- 												<label class="input-group-text" for="npChartSelect">選擇切換</label> -->
									<!-- 											</div> -->
									<!-- 											<select id="npChartSelect" class="custom-select"> -->
									<!-- 											</select> -->
									<!-- 										</div> -->
									<!-- 									</div> -->
								</div>
								<!-- Card Body -->
								<div class="card-body">
									<div class="chart-area">
										<canvas id="showthepie"></canvas>
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
										<div
											class="col-md-4 justify-content-end d-flex align-items-center ">

											<div class="input-group">
												<div class="input-group-prepend">
													<label class="input-group-text">國家公園</label>
												</div>

												<form class="form-inline"
													action="<c:url value='/Rout/mountainHouseBack/selectAll#toseesee'></c:url>"
													method='get'>
													<select id="selectnPark" class="form-control" name="parkid">
														<option value="">請選擇指定國家公園</option>
													</select>
													<div class=" input-group-prepend ">
														<input type="hidden" value="1" name="page"> <input
															type="hidden" value="2" name="no"> <input
															type="submit" class="btn btn-outline-success" value="查詢">
													</div>

												</form>

											</div>
										</div>


										<div class="ml-auto">
											<form
												action="<c:url value='/Rout/mountainHouseBack/selectHouse'></c:url>"
												method='get' id="form1" name="form1">
												<input type="button" id="clickbutton" class="light-table-filter" value="一鍵輸入"> 
												小屋名稱 :&nbsp 
												<input type="text" class="light-table-filter" id="clickHousename" placeholder="請輸入關鍵字" name="selecthouse"> 
												<input	type="image" class="imgSearch"
													src="/MountainExploer.com/images/放大鏡.png" width="35px"
													onClick="document.form1.submit()">
											</form>
										</div>


										<div class="ml-auto">
											<form
												action="<c:url value='/Rout/mountainHouseBack/selectAll#toseesee'></c:url>"
												method='get'>
												<input type="hidden" value="1" name="page"> <input
													type="hidden" value="1" name="no"> <input
													type="hidden" value="" name="parkid"> <input
													type="submit" id="toseesee" class="btn btn-outline-info"
													value="全部觀看">
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
										
										
											<a href="selectAll?parkid=${parkid }&no=${no }&page=1">«第一頁</a>
											<c:choose>
												<c:when test="${page <= 1}">
													<a href="#">‹上一頁</a>
												</c:when>
												<c:otherwise>
													<a
														href="selectAll?parkid=${parkid }&no=${no }&page=${page-1}">‹上一頁</a>
												</c:otherwise>
											</c:choose>

											<select
												onChange="location = this.options[this.selectedIndex].value">
												
												
												<c:forEach var="toPage" begin="1" end="${totalPage}">
													<option	value="selectAll?parkid=${parkid }&no=${no }&page=${toPage}"
														<c:if test="${toPage==page}">selected="selected"</c:if>>第${toPage}頁</option>
													
												</c:forEach>
											</select>

											<c:choose>
													<c:when test="${totalPage==page}"><a href="#">下一頁›</a></c:when>
													<c:otherwise>
													<a href="selectAll?parkid=${parkid }&no=${no }&page=${page+1}">下一頁›</a>
													</c:otherwise>
											</c:choose>
											<a
												href="selectAll?parkid=${parkid }&no=${no }&page=${totalPage}">最末頁»</a>
										
										</div>


										<div class="ml-auto">
											<form
												action="<c:url value='/Rout/mountainHouseBack/inserjump'></c:url>"
												method='get'>

												<input type="submit" src="#" class="btn btn-outline-primary"
													name="" value="新增">
											</form>
										</div>

									</div>
								</div>
								<div class="card-body">
									<div class="table-responsive">
										<table id="routeTable" style="border: 3px #cccccc solid;"
											cellpadding="10" border='1'>
											<thead>
												<tr>
													<th scope="col"><span class="tr_title">編號</span></th>
													<th scope="col"><span class="tr_title">國家公園</span></th>
													<th scope="col"><span class="tr_title">山中小屋</span></th>
													<th scope="col"><span class="tr_title">床位數量/價錢</span></th>
													<th scope="col"><span class="tr_title">露營地數量/價錢</span></th>
													<th scope="col"><span class="tr_title">海拔</span></th>
													<th scope="col"><span class="tr_title">描述</span></th>
													<th scope="col"><span class="tr_title">星星分數總合</span></th>
													<th scope="col"><span class="tr_title">評分次數</span></th>
													<th scope="col"><span class="tr_title">平均分數</span></th>
													<th scope="col"><span class="tr_title">照片</span></th>
													<th scope="col"><span class="tr_title"></span></th>
													<th scope="col"><span class="tr_title"></span></th>

												</tr>
											</thead>
											<tbody>
												<c:forEach var="i" items="${House_All}">
													<tr>
														<td>${i.housebasicid}</td>
														<td>${i.nationalPark.name}</td>
														<td>${i.name}</td>
														<td>${i.bed}床&nbspTWD&nbsp:&nbsp${i.bedprice}</td>
														<td>${i.camp}區&nbspTWD&nbsp:&nbsp${i.campprice}</td>
														<td>${i.height}</td>

														<td><a class="show" href="#show" style="color: blue">點我看詳情.....more</a>
															<span class="showme" style="display: none">${i.desc}<a
																href="#showme" style="color: red">隱藏內容</a></span></td>

														<c:choose>
															<c:when test="${empty i.star}">
																<td>0</td>
															</c:when>
															<c:otherwise>
																<td>總共${i.star}分</td>
															</c:otherwise>
														</c:choose>
														<c:choose>
															<c:when test="${empty i.clickcount}">
																<td>0</td>
															</c:when>
															<c:otherwise>
																<td>評分過${i.clickcount}次</td>
															</c:otherwise>
														</c:choose>
														<td><c:choose>
																<c:when test="${empty j.star}">0</c:when>
																<c:otherwise>
																	(平均<fmt:formatNumber type="number"
																		value="${j.star*1.0 / j.clickcount} "
																		maxFractionDigits="1" />分)		
																</c:otherwise>
															</c:choose></td>
														<td><c:choose>
																<c:when test="${empty i.imgid.img }">
																	<img height="100" width="100"
																		src="/MountainExploer.com/housecamp/images/imgnotfound.png">
																</c:when>
																<c:when test="${not empty i.imgid.img }">
																	<img height="100" width="100"
																		src="<c:url value='/mountainHouseBack/showimg?imgid=${i.imgid.id}'/>">
																</c:when>
															</c:choose></td>
														<td>
															<div style="margin: 10px">
																<form
																	action="<c:url value='/Rout/mountainHouseBack/deleteHouse'></c:url>"
																	name="form1" method='post'>
																	<input type="hidden" name="deletehouse"
																		value="${i.housebasicid}"> 
																		<input id="deletehouse" type="button" class="btn btn-outline-danger"
																		value="刪除"
																		onclick="if(confirm('確認要刪除嗎？')) this.form.submit();">
																</form>
															</div>
															<div style="margin: 10px">
																<form
																	action="<c:url value="/Rout/mountainHouseBack/updatejump"></c:url>"
																	method="get">
																	<input type="hidden" name="jumpupdate"
																		value="${i.housebasicid}"> <input
																		type="submit" class="btn btn-outline-info" value="修改">
																</form>
															</div>
														</td>
														<td>
															<form
																action="<c:url value="/Rout/mountainHouseBack/housebackorder"></c:url>"
																method="post">
																<input type="hidden" name="orderhouseid"
																	value="${i.housebasicid}"> <input type="hidden"
																	name="no" value="1"> <input type="hidden"
																	name="peoplename" value=""> <input
																	type="submit" class="btn btn-outline-success"
																	value="訂單查詢">
															</form>
														</td>

													</tr>
												</c:forEach>


												<c:forEach var="i" items="${lookupdate}">
													<tr>
														<td>${i.housebasicid}</td>
														<td>${i.nationalPark.name}</td>
														<td>${i.name}</td>
														<td>${i.bed}床&nbspTWD&nbsp:&nbsp${i.bedprice}</td>
														<td>${i.camp}區&nbspTWD&nbsp:&nbsp${i.campprice}</td>
														<td>${i.height}</td>
														<td>${i.desc}</td>
														<c:choose>
															<c:when test="${empty i.star}">
																<td>0</td>
															</c:when>
															<c:otherwise>
																<td>總共${i.star}分</td>
															</c:otherwise>
														</c:choose>
														<c:choose>
															<c:when test="${empty i.clickcount}">
																<td>0</td>
															</c:when>
															<c:otherwise>
																<td>評分過${i.clickcount}次</td>
															</c:otherwise>
														</c:choose>
														<c:choose>
															<c:when test="${empty i.clickcount}">
																<td>平均0分</td>
															</c:when>
															<c:otherwise>
																<td>平均${i.star*1.0 / i.clickcount}分</td>
															</c:otherwise>
														</c:choose>
														<td><c:choose>
																<c:when test="${empty i.imgid.img }">
																	<a class="tooltip-a" data-toggle='tooltip'
																		target="_blank"><img height="100" width="100"
																		src="/MountainExploer.com/housecamp/images/imgnotfound.png"></a>
																</c:when>
																<c:when test="${not empty i.imgid.img }">
																	<a class="tooltip-a" data-toggle='tooltip'
																		target="_blank"><img height="100" width="100"
																		src="<c:url value='/mountainHouseBack/showimg?imgid=${i.imgid.id}'/>"></a>
																</c:when>
															</c:choose></td>

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


// 		$("#deletehouse").on("click",function(){
// 		Swal.fire({
// 			  title: 'Are you sure?',
// 			  text: "You won't be able to revert this!",
// 			  icon: 'warning',
// 			  showCancelButton: true,
// 			  confirmButtonColor: '#3085d6',
// 			  cancelButtonColor: '#d33',
// 			  confirmButtonText: 'Yes, delete it!'
// 			}).then((result) => {
// 			  if (result.isConfirmed) {
// 			    Swal.fire(
// 			      'Deleted!',
// 			      'Your file has been deleted.',
// 			      'success'
// 			    )}
// 			})
// 		})


		
	</script>

<script type="text/javascript">
	$(function(){
		$("#clickbutton").on("click",function(){
			$("#clickHousename").val("攻頂小屋")
						})
		
	})

</script>

	<script type="text/javascript">
		$(function() {
			var houseUrl = "/MountainExploer.com/Rout/mountainHouseBack";

			$.ajax({
				url : houseUrl + "/nParkAlloption",
				method : "GET",
				dataType : "json",
				success : function(nPark) {
					for (var i = 0; i < nPark.length; i++) {

						$("#selectnPark").append(
								"<option value='" + nPark[i].id + "'>"
										+ nPark[i].name + "</option>")
					}
					//	 			let firstArea = $("#selectnPark").find("option").eq(0).val()

				}
			})
			$("body").on("click", ".show", function() {
				let thisShowme = $(this).siblings(".showme")
				// 				$(".showme").not(thisShowme).slideUp(250)
				thisShowme.slideToggle();
				$(this).toggle();
			});

			$("body").on("click", ".showme", function() {
				let thisShow = $(this).siblings(".show")
				thisShow.slideToggle();
				$(this).toggle();

			});
		});
		// 			$('.tooltip-a').tooltip() 

		$(function(housecount) {
					// 國家公園圓餅圖	
					Chart.defaults.global.defaultFontFamily = 'Nunito',
					'-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
			Chart.defaults.global.defaultFontColor = '#858796';

			var houseUrl = "/MountainExploer.com/Rout/mountainHouseBack";

			$.ajax({
				url : houseUrl + "/npTotalaHouse",
				method : "GET",
				dataType : "json",
				success : function(data) {
					console.log(data)

					showthepie(data)
				},

			})

			// Pie Chart Example

			function showthepie(data, housecount) {
				let name = []
				let Parkhousecount = []
				for ( let i in data) {
					name.push([ i ])
					Parkhousecount.push(data[i])
				}
				
				var ctx = $("#showthepie");
					
				let charSet = {
					type : 'pie',
					data : {

						labels : name,
						datasets : [ {
							data : Parkhousecount,
							backgroundColor : [ '#4e73df', '#1cc88a', '#36b9cc' ],
							hoverBackgroundColor : [ '#2e59d9', '#17a673',
									'#2c9faf' ],
							hoverBorderColor : "rgba(234, 236, 244, 1)",
						} ],
					},
					options : {
						maintainAspectRatio : false,
						tooltips : {
							backgroundColor : "rgb(255,255,255)",
							bodyFontColor : "#858796",
							borderColor : '#dddfeb',
							borderWidth : 5,
							xPadding : 15,
							yPadding : 15,
							displayColors : false,
							caretPadding : 10,
						},
						legend : {
							display : true
						},
					},
				}

					showthepie = new Chart(ctx,charSet);
				
			}
			;
		})
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