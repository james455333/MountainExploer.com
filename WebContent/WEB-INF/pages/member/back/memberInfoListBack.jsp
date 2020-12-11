<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-tw">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>會員資料列表</title>

    <!-- Custom fonts for this template-->
    <link href="/MountainExploer.com/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/MountainExploer.com/css/sb-admin-2.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/sweetalert2@9.17.2/dist/sweetalert2.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9.17.2/dist/sweetalert2.all.min.js"></script>

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar"
            include-html="/MountainExploer.com/include/sidebar.html">
        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow"
                    include-html="/MountainExploer.com/include/topbar.html">
                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">岳進者後台</h1>
                        <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                                class="fas fa-download fa-sm text-white-50"></i>匯出資料表</a>
                    </div>

                <div class="container-fluid">
					<div class="row">
						<div class="col-md-12">
							<div class="row">
								<div class="col-md-2">
									<div>
										<button type="button" class="btn active btn-md btn-success reSelect">
											重置會員列表
										</button>									
									</div> 
								</div>
								<div class="col-md-6">
									<form class="form-inline" >
										<div>
											<span>會員查詢：</span>
											<input class="form-control mr-sm-2" type="text" placeholder="請輸入會員帳號"/> 
											<button class="btn btn-primary my-2 my-sm-0" type="submit">
												查詢
											</button>										
										</div>
									</form>									
								</div>
								<div class="col-md-4">
									<div>
										<button type="button" class="btn disabled btn-outline-primary seGM" value="100">
											一般登山者
										</button>
										<button type="button" class="btn disabled btn-outline-success seGU">
											登山嚮導
										</button>
										<button type="button" class="btn disabled btn-outline-danger banGroup">
											停權會員
										</button>
										<button type="button" class="btn disabled btn-outline-secondary admin">
											管理員
										</button>
									</div>
								</div>
							</div>
							<br>
<!-- 							<br> -->
							<table class="table table-hover">
								<thead>
									<tr>
										<th>
											停權／復權
										</th>
										<th>
											會員編號
										</th>
										<th>
											會員帳號
										</th>
										<th>
											會員Email
										</th>
										<th>
											會員身分組
										</th>
										<th>
											閱覽／修改資料
										</th>
									</tr>
								</thead>
								<tbody id="allMember">

								</tbody>
							</table>
						</div>
					</div>
				</div>   
                    

                   

                    
                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="/MountainExploer.com/login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="/MountainExploer.com/vendor/jquery/jquery.min.js"></script>
    <script src="/MountainExploer.com/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/MountainExploer.com/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/MountainExploer.com/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="/MountainExploer.com/vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="/MountainExploer.com/js/demo/折線圖demo.js"></script>
    <script src="/MountainExploer.com/js/demo/圓餅圖demo.js"></script>



    <script src="/MountainExploer.com/js/includejsp.js"></script>
    
    <script src="/MountainExploer.com/member/memberInfoListBack.js"></script>
</body>

</html>