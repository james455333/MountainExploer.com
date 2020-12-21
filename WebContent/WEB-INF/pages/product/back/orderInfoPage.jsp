<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-tw">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>岳進者 | 後台維護管理系統 | 訂單明細</title>

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
<!-- for this page -->
<!-- <script src="/MountainExploer.com/product/back/product.js"></script> -->
<!-- <script src="/MountainExploer.com/product/back/productFunction.js"></script> -->

<script src="/MountainExploer.com/js/swalLogin.js"></script>
<script>
	$(function() {
		$("#backPreviousPage").on("click", function() {
			window.history.go(-1)
		})
	})
</script>

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


					<hr>

					<div class='d-flex'>
						<h3>訂單明細</h3>
					</div>
					<hr>
				</div>
				<div class="card-body">
					<div class="table-responsive">

						<table style="font-size: 20px" class="table table-striped">
							<thead class="col">

								<tr>
									<th colspan="6" style="font-size: 22px" align="center">訂單編號:
										${orderId}</th>
								</tr>
								<tr>
									<!-- thead更改從這邊開始 -->
									<th scope="col" style="width: 20%;">商品編號</th>
									<th scope="col" style="width: 20%;">圖片</th>
									<th scope="col" style="width: 20%;">單價</th>
									<th scope="col" style="width: 10%;">數量</th>
									<th scope="col" style="width: 10%;">折扣</th>
									<th scope="col" style="width: 20%;">小計</th>
									<!-- thead更改到這邊結束 -->
								</tr>
							</thead>
							<tbody class="">

								<c:forEach var="aBean" varStatus="stat" items="${OrderInfo}">
									<tr>
										<td><a
											href='<c:url value='/back/shop/productInfoEntry?no=${aBean.itemBasicSeqno}' />'>
												${aBean.itemBasicSeqno} </a></td>
										<td><img style="width: 125px; height: 125px;"
											src="<c:url value='/backstage/product/search/images?seqno=${aBean.itemBasicSeqno}' />">
										</td>
										<td>$${aBean.unitPrice}</td>
										<td>${aBean.amount}</td>
										<td>${aBean.discount}</td>
										<td>${aBean.unitPrice*aBean.discount*aBean.amount}元</td>
									</tr>
									<c:set var="subtotal"
										value="${ subtotal + aBean.unitPrice * aBean.discount * aBean.amount }" />
								</c:forEach>
								<tr>
									<TD colspan="6" style="font-size: 22px">訂單總額: ${subtotal}
										元</TD>
								</tr>
								<tr>
									<TD colspan="6">
<!-- 										<button id="backPreviousPage" -->
<!-- 											class="btn btn-success btn-lg btn-block far fa-list-alt m-3 p-3"> -->
<!-- 											返回會員訂單</button> -->
										<button id="backPreviousPage"
											class="btn btn-success btn-lg btn-block far fa-list-alt m-3 p-3">
											返回訂單</button>
									</TD>
								</tr>





							</tbody>
						</table>
					</div>
				</div>
			</div>

		</div>
	</div>
	<!-- Page Heading -->

	<!-- DataTales Example -->




	<!-- /.container-fluid -->

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


	<script src="/MountainExploer.com/vendor/jquery/jquery.min.js"></script>
	<!-- Core plugin JavaScript-->
	<script
		src="/MountainExploer.com/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="/MountainExploer.com/js/sb-admin-2.min.js"></script>



	<script src="/MountainExploer.com/js/includejsp.js"></script>

</body>

</html>