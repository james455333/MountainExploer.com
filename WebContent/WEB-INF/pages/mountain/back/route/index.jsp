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
	<!-- bootstrap-toggle -->
	<link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
	<!-- for this page -->    
    <link href="/MountainExploer.com/mountain/back/css/route.css" rel="stylesheet">
	<!-- Fancy Box 3 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/fancyapps/fancybox@3.5.7/dist/jquery.fancybox.min.css" />
	<!-- sweetalert2 -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/@sweetalert2/theme-bootstrap-4/bootstrap-4.css">
	
	<!-- JQuery -->
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<!-- Bootstrap tooltips -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
	<!-- Bootstrap core JavaScript -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.min.js"></script>
	<!-- Latest compiled and minified JavaScript -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/js/bootstrap-select.min.js"></script>
	<!-- sweetalert2 -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
  	<!-- dataTable -->
	<script type="text/javascript" src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
	<!-- bootstrap-toggle -->
	<script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
	<!-- Fancy Box 3  -->
	<script src="https://cdn.jsdelivr.net/gh/fancyapps/fancybox@3.5.7/dist/jquery.fancybox.min.js"></script>
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
                    	
                    	<div class="col-xl-4 col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-s font-weight-bold text-primary text-uppercase mb-1">
                                              	  路線總數量</div>
                                            <div id="rt-total-num" class="h5 mb-0 font-weight-bold text-gray-600"></div>
                                        </div>
                                        <div class="col-auto">
                                            <i  class="fa fa-flag fa-2x" style="color: #339af0;" aria-hidden="true"></i>
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
                                            <div class="text-s font-weight-bold text-success text-uppercase mb-1">
                                              	  路線啟用量</div>
                                            <div id="rt-able-num" class="h5 mb-0 font-weight-bold text-gray-600"></div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fa fa-check-circle fa-2x" style="color: #51cf66;" aria-hidden="true"></i>
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
                                            <div class="text-s font-weight-bold text-danger text-uppercase mb-1">
                                              	  路線禁用量</div>
                                            <div id="rt-forbid-num" class="h5 mb-0 font-weight-bold text-gray-600"></div>
                                        </div>
                                        <div class="col-auto">
                                            <i  class="fa fa-times-circle fa-2x" style="color: #ff6b6b;" aria-hidden="true"></i>
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
                        <div class="card shadow mb-4" id="tb-container">
                            <div class="card-header py-3">
                            </div>
    						<div class="card-body">
    							<div class="d-flex">
	                            	<div class="col-md-4 justify-content-end d-flex align-items-center ">
	                            		<div class="input-group">
										  <div class="input-group-prepend">
										    <label class="input-group-text" for="inputGroupSelect01">國家公園</label>
										  </div>
										  <select id="npSelect" class="custom-select" id="inputGroupSelect01">
										  </select>
										</div>
	                            	</div>
	                            	<div class="col-md-4 justify-content-end d-flex align-items-center ">	                                 
	                            		<div class="input-group">
										  <div class="input-group-prepend">
										    <label class="input-group-text" for="inputGroupSelect01">路線選項</label>
										  </div>
										  <select id="rtSelect" class="custom-select" id="inputGroupSelect01">
										  </select>
										</div>
	    							</div>
	                            	<a href="#selectAll" class="ml-auto">
		                                <button id="selectAll" class="btn btn-primary btn-icon-split">
		                                    <span class="icon text-white-50">
		                                        <i class="fas fa-redo"></i>
		                                    </span>
		                                    <span class="text">重置查詢</span>
		                                </button>
	                            	</a>
    							</div>
	                             <hr>
	                             	<div class="d-flex">
		                            	<h3>國家公園 -- 主類別控制</h3>
		                                <button id="newNp" class="btn btn-success btn-icon-split ml-auto">
		                                    <span class="icon text-white-50">
		                                        <i class="fas fa-mountain"></i>
		                                    </span>
		                                    <span class="text">新增國家公園</span>
		                                </button>
		                                <button id="updateNp" class="btn btn-warning btn-icon-split ml-auto">
		                                    <span class="icon text-white-50">
		                                        <i class="fas fa-mountain"></i>
		                                    </span>
		                                    <span class="text">編輯國家公園</span>
		                                </button>
		                                <button id="deleteNp" class="btn btn-danger btn-icon-split ml-auto">
		                                    <span class="icon text-white-50">
		                                        <i class="fas fa-trash-alt"></i>
		                                    </span>
		                                    <span class="text">刪除國家公園</span>
		                                </button>
	                             	</div>
	                             <hr>
	                             <div class='d-flex'>
	                                <h3>路線選項</h3>
	                                <button id="newRoute" class="btn btn-success btn-icon-split ml-auto">
	                                    <span class="icon text-white-50">
	                                        <i class="fas fa-flag"></i>
	                                    </span>
	                                    <span class="text">新增路線</span>
	                                </button>
	                             </div>
	                             <hr>
    						</div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table id="routeTable">
                                    	<thead>
                                    		<tr>
                                    			<td style='width: 7.5%'>狀態項</td>
                                    			<td style='width: 15%'>路線圖</td>
                                    			<td style='width: 12.5%'>路線編號</td>
												<td style='width: 15%'>路線名稱</td>
												<td style='width: 15%'>國家公園</td>
												<td style='width: 35%'>控制項</td>
                                    		</tr>
                                    	</thead>
										
									</table>
                                </div>
                            </div>
                        </div>
    
                    </div>
                    <div class='hideDIV'>
                    	<button class="btn btn-info btn-rt-image">
                    		<i class="fas fa-image"></i>路線圖
						</button>
                    	<button class="btn btn-orange btn-rt-info">
                    		<i class="fas fa-info"></i>詳情
						</button>
                    	<button class="btn btn-warning btn-rt-update">
                    		<i class="fas fa-exclamation-triangle"></i>修改
						</button>
                    	<button class="btn btn-danger btn-rt-delete">
                    		<i class="fas fa-trash"></i>刪除
						</button>
						<input type="checkbox" class='btn-ctrl ' data-toggle="toggle" data-on="<i class='fas fa-power-off'></i> 啟用" data-off="<i class='fas fa-ban'></i> 禁用" data-onstyle="success" data-offstyle="danger">
                    	<form>
						  <div class="custom-file">
						    <input type="file" class="custom-file-input" id="customFile">
						    <label class="custom-file-label" for="customFile">Choose file</label>
						  </div>
						</form>
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