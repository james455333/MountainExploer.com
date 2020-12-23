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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet"
	href="https://cdn.jsdelivr.net/gh/fancyapps/fancybox@3.5.7/dist/jquery.fancybox.min.css" />
	
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<!--     <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script> -->
<!-- 	<script -->
<!-- 	src="https://cdn.jsdelivr.net/gh/fancyapps/fancybox@3.5.7/dist/jquery.fancybox.min.js"></script> -->
	
</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar"
            include-html="/MountainExploer.com/back/include/sidebar.html">
        </ul>
        <!-- End of Sidebar -->
        

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow"
                    include-html="/MountainExploer.com/back/include/topbar.html">
                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">岳進者後台</h1>
                    	<button type="button" class="btn btn-secondary fakeDate">批量註冊</button>
                        <a href="#" id="exporJsonAll" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
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
												岳進者會員總數</div>
											<div id="rt-forbid-num"
												class="h5 mb-0 font-weight-bold text-gray-600 countMb"></div>
										</div>
										<div class="col-auto">
											<i class="fas fa-users fa-2x" style="color: #ff6b6b;"
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
                                    <div class="d-flex flex-row align-items-center justify-content-between">
	                                    <h6 class="m-0 font-weight-bold text-primary">會員身分組分布</h6>
	                                    <div class="ml-auto px-2 no-arrow">
		                                    <a href="" role="button" class="chart-reset">
		                                       	<i class="fas fa-sm fa-fw fa-sync"></i>
		                                    </a>
	                                    </div>
	                                    <div class="dropdown no-arrow">
	                                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
	                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                                            <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-800"></i>
	                                        </a>
	                                        <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
	                                            aria-labelledby="dropdownMenuLink">
	                                            <div class="dropdown-header">顯示圖像變化</div>
	                                            <button class="dropdown-item mb-mode-chart pieMode" id="pieMode" value='pie' >圓餅圖</button>
	                                            <button class="dropdown-item mb-mode-chart doughnut" value='doughnut' >甜甜圈圖</button>
	                                            <button class="dropdown-item mb-mode-chart bar" value='bar' >長條圖(直)</button>
	                                            <button class="dropdown-item mb-mode-chart horizontalBar" id="horizontalBar" value='horizontalBar' >長條圖(橫)</button>
	                                        	<div class="dropdown-divider"></div>
												<button class="dropdown-item" id="mb-mode-export">輸出為PNG檔</button>
												<button class="dropdown-item" id="mb-mode-export-json">輸出為JSON檔</button>
	                                        </div>
	                                    </div>
                                    </div>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-area">
                                        <canvas id="mbModeChart"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
						
						<div class="col-xl-6 col-lg-7">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">會員性別比例</h6>
                                    <div class="ml-auto px-2 no-arrow">
	                                    <a href="#" role="button" class="chart-reset">
	                                       	<i class="fas fa-sm fa-fw fa-sync"></i>
	                                    </a>
                                    </div>
                                    <div class="dropdown no-arrow">
                                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-800"></i>
                                        </a>
                                        
                                        <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                            aria-labelledby="dropdownMenuLink">
                                            <div class="dropdown-header">顯示圖像變化</div>
                                            <button class="dropdown-item tagMode-chart pieGd" value='pie' >圓餅圖</button>
											<button class="dropdown-item tagMode-chart doughnutGd" value='doughnut' >甜甜圈圖</button>
											<button class="dropdown-item tagMode-chart barGd" value='bar' >長條圖(直)</button>
											<button class="dropdown-item tagMode-chart horizontalBarGd" value='horizontalBar' >長條圖(橫)</button>
                                       		<div class="dropdown-divider">分隔線</div>
											<button class="dropdown-item" id="gd-Mode-export">輸出為PNG檔</button>
                                        	<button class="dropdown-item" id="gd-Mode-export-json">輸出為JSON檔</button>
                                        </div>
                                    </div>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-area gdArea">
                                        <canvas id="gdModeChart"></canvas>
                                    </div>

                                </div>
                            </div>
                        </div>
					</div>
<!-- 					<div class="row"> -->
<!-- 						<div class="col-xl-12 col-lg-7"> -->
<!--                             <div class="card shadow mb-4"> -->
<!--                                 Card Header - Dropdown -->
<!--                                 <div class="card-header py-3"> -->
<!--                                     <div class=" d-flex flex-row align-items-center justify-content-between"> -->
<!-- 	                                    <h6 class="m-0 font-weight-bold text-primary">註冊分布及趨勢</h6> -->
<!-- 	                                    <div class="ml-auto px-2 no-arrow"> -->
<!-- 		                                    <a href="#" role="button" class="chart-reset"> -->
<!-- 		                                       	<i class="fas fa-sm fa-fw fa-sync"></i> -->
<!-- 		                                    </a> -->
<!-- 	                                    </div> -->
<!-- 	                                    <div class="dropdown no-arrow"> -->
<!-- 	                                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" -->
<!-- 	                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> -->
<!-- 	                                            <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-800"></i> -->
<!-- 	                                        </a> -->
	                                        
<!-- 	                                        <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" -->
<!-- 	                                            aria-labelledby="dropdownMenuLink"> -->
<!-- 	                                            <div class="dropdown-header">顯示圖像變化</div> -->
<!-- 												<button class="dropdown-item actTrend-chart" value='line' >曲線圖</button> -->
<!-- 												<button class="dropdown-item actTrend-chart" value='bar' >長條圖(直)</button> -->
<!-- 	                                       		<div class="dropdown-divider">分隔線</div> -->
<!-- 												<button class="dropdown-item" id="actTrend-export">輸出為PNG檔</button> -->
<!-- 	                                        	<button class="dropdown-item" id="actTrend-export-json">輸出為JSON檔</button> -->
<!-- 	                                        </div> -->
<!-- 	                                    </div> -->
<!--                                     </div> -->
<!--                                     <div class="d-flex justify-content-center my-3"> -->
<!--                                     	<div class="col-md-9 px-3"> -->
<!-- 	                                    	<input class="hideElm" type='range' id="monthSlider" > -->
<!--                                     	</div> -->
<!--                                     	<div class="col-md-3 px-3"> -->
<!-- 											<div class="input-group"> -->
<!-- 												<div class="input-group-prepend"> -->
<!-- 												    <label class="input-group-text" for="actTrend-select">選取年份</label> -->
<!-- 												</div> -->
<!-- 												<select id="actTrend-select" class="custom-select"> -->
<!-- 												</select> -->
<!-- 											</div> -->
<!--                                     	</div> -->
<!-- 									</div> -->
<!--                                 </div> -->
<!--                                 Card Body -->
<!--                                 <div class="card-body"> -->
<!--                                     <div  class="chart-area"> -->
<%--                                         <canvas id="actTrendChart"></canvas> --%>
<!--                                     </div> -->

<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!-- 					</div> -->
                                <!-- DataTales Example -->
			                    <div class='hideDIV'>
			                    	<a class="hideElm export" href="" ></a>
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
								<div class="col-md-5">
									<form class="form-inline" >
										<div>
											<span>會員查詢：</span>
											<input class="form-control mr-sm-2 account" name="account" type="text" placeholder="請輸入會員帳號"/> 
											<button class="btn btn-primary my-2 my-sm-0 sgSelect" type="button">
												查詢
											</button>
											<button class="btn btn-info my-2 my-sm-0 inpAnt" type="button">
												快速輸入
											</button>										
										</div>
									</form>									
								</div>
								<div class="col-md-5">
									<div>
										<button type="button" class="btn disabled btn-outline-primary seGM" value="100">
											一般登山者
										</button>
										<button type="button" class="btn disabled btn-outline-success seGU" value="120">
											登山嚮導
										</button>
										<button type="button" class="btn disabled btn-outline-danger unGroup">
											未認證會員
										</button>
										<button type="button" class="btn disabled btn-outline-danger banGroup">
											停權會員
										</button>
										<button type="button" class="btn disabled btn-outline-secondary admin" value="160">
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
								<tbody id="allMember" class="allMember">

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
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- Page level custom scripts -->
<!--     <script src="/MountainExploer.com/js/demo/圓餅圖demo.js"></script> -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9.17.2/dist/sweetalert2.all.min.js"></script>
    <script src="/MountainExploer.com/js/includejsp.js"></script>
    
    <script src="/MountainExploer.com/member/memberInfoListBack.js"></script>
<!--     <script src="/MountainExploer.com/member/Linedemo.js"></script> -->
    <script src="/MountainExploer.com/member/backCard.js"></script>
<!--     <script src="/MountainExploer.com/member/backLineCard.js"></script> -->
</body>

</html>