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

<title>岳進者 | 後台維護管理系統 | 訂單狀態維護</title>

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
						<h3>新增商品</h3>
						<!-- 										<button id="newRoute" -->
						<!-- 											class="btn btn-success btn-icon-split ml-auto"> -->
						<!-- 											<span class="icon text-white-50"> <i -->
						<!-- 												class="fas fa-flag"></i> -->
						<!-- 											</span> <span class="text">訂單維護</span> -->
						<!-- 										</button> -->
						<%-- 									<a href='<c:url value="/MountainExploer.com/backstage/product/allOrders"/>'>訂單維護</a> --%>
					</div>
					<hr>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<form action='<c:url value="/back/shop/createProductData"/>'
							enctype="multipart/form-data" method="post">
							<div>* 為必填項目</div>
							<div>
								<span>*次分類 :&nbsp</span> <select name="scName">
									<c:forEach var="scBean" items="${scBean}" varStatus="vsRT">
										<option value="${scBean.id}">${scBean.name}</option>
									</c:forEach>
								</select>
							</div>
							<div>
								<label for="name">* 產品名稱 : &nbsp&nbsp</label> <input type="text"
									name="name" value="新增商品" required>
							</div>
							<div>
								<label for="type">* 型號 : &nbsp&nbsp</label> <input type="text"
									name="type" value="新增型號" required>
							</div>
							<div>
								<label for="price">* 價格 : &nbsp&nbsp</label> <input type="text"
									name="price" value="999" required>
							</div>
							<div>
								<label for="stock">* 庫存 : &nbsp&nbsp</label> <input type="text"
									name="stock" value="99" required>
							</div>
							<div>
								<label for="productImg">* 產品圖檔案 : &nbsp&nbsp</label> <input
									type="file" name="productImg" accept="image/*" required>
							</div>
							<div>
								<label for="description">介紹 : &nbsp&nbsp</label>
								<textarea rows="2.5%" cols="50%"  name="description" value="新增產品介紹"  ></textarea>
							</div>

							<div>
								<div>
									<input type="submit" value="確認新增">
								</div>
								<div>
									<input type="reset" value="清除">
								</div>
								<div>
									<input type="button" value="返回上一頁" id="backPreviousPage">
								</div>
							</div>
						</form>

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


	<script src="/MountainExploer.com/vendor/jquery/jquery.min.js"></script>
	<!-- Core plugin JavaScript-->
	<script
		src="/MountainExploer.com/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="/MountainExploer.com/js/sb-admin-2.min.js"></script>



	<script src="/MountainExploer.com/js/includejsp.js"></script>

	<script>
		$(function() {
			$("#newRoute")
					.on(
							"click",
							function() {
								window.location = "MountainExploer.com/backstage/product/createDataPage"
							})
		})
	</script>
</body>