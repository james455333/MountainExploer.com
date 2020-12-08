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

    <title>岳進者 | 後台維護管理系統 | 山岳及路線資料維護</title>

    <!-- Custom fonts for this template-->
    <link href="/MountainExploer.com/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
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
	<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.22/css/jquery.dataTables.min.css">
	<!-- for this page -->    
    <link href="/MountainExploer.com/mountain/back/css/route.css" rel="stylesheet">
	<!-- JQuery -->
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<!-- Bootstrap tooltips -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
	<!-- Bootstrap core JavaScript -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.min.js"></script>
	<!-- Latest compiled and minified JavaScript -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/js/bootstrap-select.min.js"></script>
	<!-- sweetalert -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  	<!-- dataTable -->
	<script type="text/javascript" src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
	<!-- for this page -->
	<script src="/MountainExploer.com/mountain/back/js/route.js"></script>
	<script src="/MountainExploer.com/mountain/back/js/routeFunction.js"></script>
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
                        <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                                class="fas fa-download fa-sm text-white-50"></i>匯出資料表</a>
                    </div>
                    
                    <div class='row'>
                    	
                    	<div class="col-xl-6 col-md-6 mb-4">
                            <div class="card border-left-success shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-s font-weight-bold text-success text-uppercase mb-1">
                                              	  路線總數量</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-600" id='route-total-num'></div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fa fa-bookmark fa-2x text-gray-300" aria-hidden="true"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
					<div class='row'>
						  <div class="col-xl-8 col-lg-7">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">折線圖範例2</h6>
                                    <div class="dropdown no-arrow">
                                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                            aria-labelledby="dropdownMenuLink">
                                            <div class="dropdown-header">下拉選單標題:</div>
                                            <a class="dropdown-item" href="#">內容1</a>
                                            <a class="dropdown-item" href="#">內容2</a>
                                            <div class="dropdown-divider">分隔線</div>
                                            <a class="dropdown-item" href="#">還是內容</a>
                                        </div>
                                    </div>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-area">
                                        <canvas id="myAreaChart2"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
						<div class="col-xl-4 col-lg-7">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">會員身份分布圓餅圖</h6>
                                    <div class="dropdown no-arrow">
                                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                            aria-labelledby="dropdownMenuLink">
                                            <div class="dropdown-header">Dropdown Header:</div>
                                            <a class="dropdown-item" href="#">Action</a>
                                            <a class="dropdown-item" href="#">Another action</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="#">Something else here</a>
                                        </div>
                                    </div>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-pie pt-4 pb-2">
                                        <canvas id="myPieChart"></canvas>
                                    </div>

                                </div>
                            </div>
                        </div>
					</div>
                    <div class="container-fluid">

                        <!-- Page Heading -->
                        <h1 class="h3 mb-2 text-gray-800">路線資料維護</h1>
    
                        <!-- DataTales Example -->
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                            </div>
    						<div class="card-body">
    							<div class="row">
	                            	<div class="col-md-3 justify-content-end d-flex align-items-center ">
	                            		<div class="input-group">
										  <div class="input-group-prepend">
										    <label class="input-group-text" for="inputGroupSelect01">國家公園</label>
										  </div>
										  <select id="npSelect" class="custom-select" id="inputGroupSelect01">
										  </select>
										</div>
	                            	</div>
	                            	<div class="col-md-3 justify-content-end d-flex align-items-center ">	                                 
	                            		<div class="input-group">
										  <div class="input-group-prepend">
										    <label class="input-group-text" for="inputGroupSelect01">路線選項</label>
										  </div>
										  <select id="rtSelect" class="custom-select" id="inputGroupSelect01">
										  </select>
										</div>
	    							</div>
	                            	<div class="col-md-6 justify-content-end d-flex align-items-center ">
	                            		<div class="form-inline">
	                            			<input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      										<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
	                            		</div>
	    							</div>
    							</div>
	                            <hr>
	                             
	                                <a href="#" class="btn btn-primary btn-icon-split">
	                                    <span class="icon text-white-50">
	                                        <i class="fas fa-flag"></i>
	                                    </span>
	                                    <span class="text">按鈕1</span>
	                                </a>
	                                <a href="#" class="btn btn-primary btn-icon-split">
	                                    <span class="icon text-white-50">
	                                        <i class="fas fa-flag"></i>
	                                    </span>
	                                    <span class="text">按鈕2</span>
	                                </a>
	                                <a href="#" class="btn btn-primary btn-icon-split">
	                                    <span class="icon text-white-50">
	                                        <i class="fas fa-flag"></i>
	                                    </span>
	                                    <span class="text">按鈕3</span>
	                                </a>
    						</div>
                            <div class="card-body">
                                <div class="table-responsive">
<!--                                 	<div class="justify-content-between d-flex align-items-center"> -->
<!-- 	                                	<div class="dataTables_length" id="example_length"> -->
<!-- 	                                		<label>Show  -->
<!-- 	                                			<select name="example_length" aria-controls="example" class=""> -->
<!-- 	                                				<option value="10">10</option> -->
<!-- 	                                				<option value="25">25</option> -->
<!-- 	                                				<option value="50">50</option> -->
<!-- 	                                				<option value="100">100</option> -->
<!-- 	                                			</select> entries -->
<!-- 	                                		</label> -->
<!-- 	                                	</div> -->
<!--                                 	</div> -->
                                    <table id="routeTable">
                                    	<thead>
                                    		<tr>
                                    			<td style='width: 10%'>路線編號     </td>
												<td style='width: 10%'>路線名稱     </td>
												<td style='width: 15%'>國家公園名稱 </td>
												<td style='width: 20%'>路線介紹     </td>
												<td style='width: 20%'>建議路線     </td>
												<td style='width: 20%'>交通資訊	 </td>
                                    		</tr>
                                    	</thead>
										
									</table>
<!-- 									<div class="justify-content-between d-flex align-items-center"> -->
<!-- 										<div class="dataTables_info" id="example_info" role="status" aria-live="polite">Showing 1 to 10 of 57 entries</div> -->
<!-- 										<div class="dataTables_paginate paging_simple_numbers" id="example_paginate"> -->
<!-- 											<a class="paginate_button previous disabled" aria-controls="example" data-dt-idx="0" tabindex="-1" id="example_previous">Previous</a><span> -->
<!-- 											<a class="paginate_button current" aria-controls="example" data-dt-idx="1" tabindex="0">1</a> -->
<!-- 											<a class="paginate_button " aria-controls="example" data-dt-idx="2" tabindex="0">2</a> -->
<!-- 											<a class="paginate_button " aria-controls="example" data-dt-idx="3" tabindex="0">3</a> -->
<!-- 											<a class="paginate_button " aria-controls="example" data-dt-idx="4" tabindex="0">4</a> -->
<!-- 											<a class="paginate_button " aria-controls="example" data-dt-idx="5" tabindex="0">5</a> -->
<!-- 											<a class="paginate_button " aria-controls="example" data-dt-idx="6" tabindex="0">6</a></span> -->
<!-- 											<a class="paginate_button next" aria-controls="example" data-dt-idx="7" tabindex="0" id="example_next">Next</a> -->
<!-- 										</div> -->
<!-- 									</div> -->
                                </div>
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
</body>

</html>