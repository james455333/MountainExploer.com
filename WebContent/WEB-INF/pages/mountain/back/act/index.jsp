<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-tw">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>岳進者 | 後台維護管理系統 | 活動維護管理</title>

    <!-- Custom fonts for this template-->
    <link href="/MountainExploer.com/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
	<link href="/MountainExploer.com/css/sb-admin-2.min.css" rel="stylesheet">
	<!-- Font Awesome -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
	<!-- Bootstrap core CSS -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet">
	<!-- JQuery UI -->
	<link rel="stylesheet" href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
    <!-- Custom styles for this template-->
    <link href="/MountainExploer.com/css/sb-admin-2.min.css" rel="stylesheet">
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/css/bootstrap-select.min.css">
	<!-- dataTable -->
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/dt-1.10.22/af-2.3.5/b-1.6.5/b-colvis-1.6.5/b-html5-1.6.5/b-print-1.6.5/fh-3.1.7/datatables.min.css"/>
<!-- 	<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.22/css/jquery.dataTables.min.css"> -->
	<!-- bootstrap-toggle -->
	<link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
	<!-- Fancy Box 3 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/fancyapps/fancybox@3.5.7/dist/jquery.fancybox.min.css" />
	<!-- sweetalert2 -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/@sweetalert2/theme-bootstrap-4/bootstrap-4.css">
	<!-- bootstrap-slider -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-slider/11.0.2/css/bootstrap-slider.css">
	<!-- dateRangePicker -->
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
	<!-- for this page -->    
    <link href="/MountainExploer.com/mountain/back/css/act.css" rel="stylesheet">
    <link href="/MountainExploer.com/css/loading.css" rel="stylesheet">
	
	<!-- JQuery -->
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<!-- Bootstrap tooltips -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
	    <!-- Bootstrap core JavaScript-->
    <script src="/MountainExploer.com/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- Bootstrap core JavaScript -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.min.js"></script>
	<!-- bootstrap-slider -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-slider/11.0.2/bootstrap-slider.js"></script>
	<!-- bootstrap-select -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/js/bootstrap-select.min.js"></script>
	<!-- sweetalert2 -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
  	<!-- dataTable -->
  	<script type="text/javascript" src="https://cdn.datatables.net/v/bs4/dt-1.10.22/af-2.3.5/b-1.6.5/b-colvis-1.6.5/b-html5-1.6.5/b-print-1.6.5/fh-3.1.7/datatables.min.js"></script>
<!-- 	<script type="text/javascript" src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script> -->
	<!-- bootstrap-toggle -->
	<script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
	<!-- Fancy Box 3  -->
	<script src="https://cdn.jsdelivr.net/gh/fancyapps/fancybox@3.5.7/dist/jquery.fancybox.min.js"></script>
	<!-- Page level plugins -->
    <script src="/MountainExploer.com/vendor/chart.js/Chart.min.js"></script>
	<!-- dateRangePicker -->
	<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
	<!-- CKeditor 4 -->
	<script src="/MountainExploer.com/mountain/ckeditor/ckeditor.js"></script>
	<!-- jquery validator -->
	<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.2/dist/jquery.validate.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.2/additional-methods.min.js"></script>
	<!-- jquery loading -->
	<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery-easy-loading/1.3.0/jquery.loading.min.js'></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery-loading-overlay/2.1.7/loadingoverlay.min.js'></script>
	<!-- for this page -->
	<script src="/MountainExploer.com/js/loading.js"></script>
	<script src="/MountainExploer.com/mountain/back/js/act.js"></script>
	<script src="/MountainExploer.com/mountain/back/js/actFunction.js"></script>
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
                <div class="container-fluid" id="actBack">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">活動資料維護</h1>
                        <a href="#" id="exportAll" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                                class="fas fa-download fa-sm text-white-50"></i>匯出資料表</a>
                    </div>
                    
                    <div class='row'>
                    	<div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-s font-weight-bold text-primary text-uppercase mb-1">
                                              	  活動發佈總數</div>
                                            <div id="act-total-num" class="h5 mb-0 font-weight-bold text-gray-600"></div>
                                        </div>
                                        <div class="col-auto">
                                            <i  class="fas fa-hiking fa-flip-horizontal fa-2x" style="color: #339af0;" aria-hidden="true"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    	<div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-success shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-s font-weight-bold text-success text-uppercase mb-1">
                                              	  活躍狀態總數</div>
                                            <div id="act-active-num" class="h5 mb-0 font-weight-bold text-gray-600"></div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fa fa-check-circle fa-2x" style="color: #51cf66;" aria-hidden="true"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    	<div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-danger shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-s font-weight-bold text-danger text-uppercase mb-1">
                                              	  非活躍狀態總數</div>
                                            <div id="act-inactive-num" class="h5 mb-0 font-weight-bold text-gray-600"></div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fa fa-times-circle fa-2x" style="color:  #ff6b6b;" aria-hidden="true"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    	<div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-dark shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-s font-weight-bold text-dark text-uppercase mb-1">
                                              	  歷史狀態總數</div>
                                            <div id="act-expired-num" class="h5 mb-0 font-weight-bold text-gray-600"></div>
                                        </div>
                                        <div class="col-auto">
                                            <i  class="fa fa-history fa-2x"  aria-hidden="true"></i>
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
	                                    <h6 class="m-0 font-weight-bold text-primary">活動狀態</h6>
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
	                                            <button class="dropdown-item act-mode-chart" value='pie' >圓餅圖</button>
	                                            <button class="dropdown-item act-mode-chart" value='doughnut' >甜甜圈圖</button>
	                                            <button class="dropdown-item act-mode-chart" value='bar' >長條圖(直)</button>
	                                            <button class="dropdown-item act-mode-chart" value='horizontalBar' >長條圖(橫)</button>
	                                        	<div class="dropdown-divider"></div>
												<button class="dropdown-item" id="act-mode-export">輸出為PNG檔</button>
												<button class="dropdown-item" id="act-mode-export-json">輸出為JSON檔</button>
	                                        </div>
	                                    </div>
                                    </div>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-area">
                                        <canvas id="actModeChart"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
						
						<div class="col-xl-6 col-lg-7">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">標籤狀態</h6>
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
                                            <button class="dropdown-item tagMode-chart" value='pie' >圓餅圖</button>
											<button class="dropdown-item tagMode-chart" value='doughnut' >甜甜圈圖</button>
											<button class="dropdown-item tagMode-chart" value='bar' >長條圖(直)</button>
											<button class="dropdown-item tagMode-chart" value='horizontalBar' >長條圖(橫)</button>
                                       		<div class="dropdown-divider">分隔線</div>
											<button class="dropdown-item" id="tagMode-export">輸出為PNG檔</button>
                                        	<button class="dropdown-item" id="tagMode-export-json">輸出為JSON檔</button>
                                        </div>
                                    </div>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-area">
                                        <canvas id="tagModeChart"></canvas>
                                    </div>

                                </div>
                            </div>
                        </div>
					</div>
					<div class="row">
						<div class="col-xl-12 col-lg-7">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div class="card-header py-3">
                                    <div class=" d-flex flex-row align-items-center justify-content-between">
	                                    <h6 class="m-0 font-weight-bold text-primary">活動發佈及報名人數趨勢</h6>
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
												<button class="dropdown-item actTrend-chart" value='line' >曲線圖</button>
												<button class="dropdown-item actTrend-chart" value='bar' >長條圖(直)</button>
	                                       		<div class="dropdown-divider">分隔線</div>
												<button class="dropdown-item" id="actTrend-export">輸出為PNG檔</button>
	                                        	<button class="dropdown-item" id="actTrend-export-json">輸出為JSON檔</button>
	                                        </div>
	                                    </div>
                                    </div>
                                    <div class="d-flex justify-content-center my-3">
                                    	<div class="col-md-9 px-3">
	                                    	<input class="hideElm" type='range' id="monthSlider" >
                                    	</div>
                                    	<div class="col-md-3 px-3">
											<div class="input-group">
												<div class="input-group-prepend">
												    <label class="input-group-text" for="actTrend-select">選取年份</label>
												</div>
												<select id="actTrend-select" class="custom-select">
												</select>
											</div>
                                    	</div>
									</div>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div  class="chart-area">
                                        <canvas id="actTrendChart"></canvas>
                                    </div>

                                </div>
                            </div>
                        </div>
					</div>
                    <div class="row">
						<div class="col-xl-12">
	                        <div class="card shadow mb-4" id="tb-container">
	                            <div class="card-header d-flex py-3 align-items-center">
	                            	<h3 class=" text-primary">活動管理維護</h3>
	                            	<div class="ml-auto px-2 no-arrow">
		                                <a href="#selectAll"id="selectAll" role="button">
		                                    <i class="fas fa-lg fa-fw fa-sync"></i>
		                                </a>
	                                </div>
	                            </div>
	                            <div class="card-body" id="tableBody">
	                                <div class="table-responsive">
	                                    <table id="routeTable" class="table-hover table-striped">
	                                    	<thead>
	                                    		<tr>
	                                    			<td style='width: 10%'>狀態項</td>
	                                    			<td style='width: 10%'>發布日期</td>
	                                    			<td style='width: 7.5%'>編號</td>
													<td style='width: 15%'>名稱</td>
	                                    			<td style='width: 20%'>開始-結束日期</td>
	                                    			<td style='width: 12.5%'>報名期限</td>
													<td style='width: 25%'>控制項</td>
	                                    		</tr>
	                                    	</thead>
											
										</table>
	                                </div>
	                            </div>
	                        </div>
	    
	                    </div>
						</div>
                        <!-- Page Heading -->
    
                        <!-- DataTales Example -->
                    <div class='hideDIV'>
                    	<a class="hideElm export" href="" ></a>
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
                    <h5 class="modal-title" id="exampleModalLabel">確認登出?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">確認即點選"登出"，或點選"取消"退出本介面</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">取消</button>
                    <a class="btn btn-primary" href="../login.html">登出</a>
                </div>
            </div>
        </div>
    </div>


    <script src="/MountainExploer.com/vendor/jquery/jquery.min.js"></script>
    <!-- Core plugin JavaScript-->
    <script src="/MountainExploer.com/vendor/jquery-easing/jquery.easing.min.js"></script>
	<!-- jquery.blockUI -->
	<script src="http://malsup.github.io/jquery.blockUI.js"></script>
    <!-- Custom scripts for all pages-->
    <script src="/MountainExploer.com/js/sb-admin-2.min.js"></script>

    <script src="/MountainExploer.com/js/includejsp.js"></script>
</body>

</html>