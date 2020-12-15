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

    <title>岳進者 | 後台管理系統</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

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
                        <h1 class="h3 mb-0 text-gray-800">岳進者後台維護管理系統</h1>
<!--                         <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i -->
<!--                                 class="fas fa-download fa-sm text-white-50"></i>匯出資料表</a> -->
                    </div>

                    <!-- Content Row -->
<!--                     <div class="row"> -->

<!--                         Earnings (Monthly) Card Example -->
<!--                         <div class="col-xl-3 col-md-6 mb-4"> -->
<!--                             <div class="card border-left-primary shadow h-100 py-2"> -->
<!--                                 <div class="card-body"> -->
<!--                                     <div class="row no-gutters align-items-center"> -->
<!--                                         <div class="col mr-2"> -->
<!--                                             <div class="text-xs font-weight-bold text-primary text-uppercase mb-1"> -->
<!--                                                 Earnings (Monthly)</div> -->
<!--                                             <div class="h5 mb-0 font-weight-bold text-gray-800">$40,000</div> -->
<!--                                         </div> -->
<!--                                         <div class="col-auto"> -->
<!--                                             <i class="fas fa-calendar fa-2x text-gray-300"></i> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->

<!--                         Earnings (Monthly) Card Example -->
<!--                         <div class="col-xl-3 col-md-6 mb-4"> -->
<!--                             <div class="card border-left-success shadow h-100 py-2"> -->
<!--                                 <div class="card-body"> -->
<!--                                     <div class="row no-gutters align-items-center"> -->
<!--                                         <div class="col mr-2"> -->
<!--                                             <div class="text-xs font-weight-bold text-success text-uppercase mb-1"> -->
<!--                                                 Earnings (Annual)</div> -->
<!--                                             <div class="h5 mb-0 font-weight-bold text-gray-800">$215,000</div> -->
<!--                                         </div> -->
<!--                                         <div class="col-auto"> -->
<!--                                             <i class="fas fa-dollar-sign fa-2x text-gray-300"></i> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->

<!--                         Earnings (Monthly) Card Example -->
<!--                         <div class="col-xl-3 col-md-6 mb-4"> -->
<!--                             <div class="card border-left-info shadow h-100 py-2"> -->
<!--                                 <div class="card-body"> -->
<!--                                     <div class="row no-gutters align-items-center"> -->
<!--                                         <div class="col mr-2"> -->
<!--                                             <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Tasks -->
<!--                                             </div> -->
<!--                                             <div class="row no-gutters align-items-center"> -->
<!--                                                 <div class="col-auto"> -->
<!--                                                     <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div> -->
<!--                                                 </div> -->
<!--                                                 <div class="col"> -->
<!--                                                     <div class="progress progress-sm mr-2"> -->
<!--                                                         <div class="progress-bar bg-info" role="progressbar" -->
<!--                                                             style="width: 50%" aria-valuenow="50" aria-valuemin="0" -->
<!--                                                             aria-valuemax="100"></div> -->
<!--                                                     </div> -->
<!--                                                 </div> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                         <div class="col-auto"> -->
<!--                                             <i class="fas fa-clipboard-list fa-2x text-gray-300"></i> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->

<!--                         Pending Requests Card Example -->
<!--                         <div class="col-xl-3 col-md-6 mb-4"> -->
<!--                             <div class="card border-left-warning shadow h-100 py-2"> -->
<!--                                 <div class="card-body"> -->
<!--                                     <div class="row no-gutters align-items-center"> -->
<!--                                         <div class="col mr-2"> -->
<!--                                             <div class="text-xs font-weight-bold text-warning text-uppercase mb-1"> -->
<!--                                                 Pending Requests</div> -->
<!--                                             <div class="h5 mb-0 font-weight-bold text-gray-800">18</div> -->
<!--                                         </div> -->
<!--                                         <div class="col-auto"> -->
<!--                                             <i class="fas fa-comments fa-2x text-gray-300"></i> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->

<!--                     Content Row -->

<!--                     <div class="row"> -->

<!--                         Area Chart -->
<!--                         <div class="col-xl-8 col-lg-7"> -->
<!--                             <div class="card shadow mb-4"> -->
<!--                                 Card Header - Dropdown -->
<!--                                 <div -->
<!--                                     class="card-header py-3 d-flex flex-row align-items-center justify-content-between"> -->
<!--                                     <h6 class="m-0 font-weight-bold text-primary">折線圖範例1</h6> -->
<!--                                     <div class="dropdown no-arrow"> -->
<!--                                         <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" -->
<!--                                             data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> -->
<!--                                             <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i> -->
<!--                                         </a> -->
<!--                                         <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" -->
<!--                                             aria-labelledby="dropdownMenuLink"> -->
<!--                                             <div class="dropdown-header">下拉選單標題:</div> -->
<!--                                             <a class="dropdown-item" href="#">內容1</a> -->
<!--                                             <a class="dropdown-item" href="#">內容2</a> -->
<!--                                             <div class="dropdown-divider">分隔線</div> -->
<!--                                             <a class="dropdown-item" href="#">還是內容</a> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                                 Card Body -->
<!--                                 <div class="card-body"> -->
<!--                                     <div class="chart-area"> -->
<!--                                         <canvas id="myAreaChart"></canvas> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->

<!--                             <div class="card shadow mb-4"> -->
<!--                                 Card Header - Dropdown -->
<!--                                 <div -->
<!--                                     class="card-header py-3 d-flex flex-row align-items-center justify-content-between"> -->
<!--                                     <h6 class="m-0 font-weight-bold text-primary">折線圖範例2</h6> -->
<!--                                     <div class="dropdown no-arrow"> -->
<!--                                         <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" -->
<!--                                             data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> -->
<!--                                             <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i> -->
<!--                                         </a> -->
<!--                                         <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" -->
<!--                                             aria-labelledby="dropdownMenuLink"> -->
<!--                                             <div class="dropdown-header">下拉選單標題:</div> -->
<!--                                             <a class="dropdown-item" href="#">內容1</a> -->
<!--                                             <a class="dropdown-item" href="#">內容2</a> -->
<!--                                             <div class="dropdown-divider">分隔線</div> -->
<!--                                             <a class="dropdown-item" href="#">還是內容</a> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                                 Card Body -->
<!--                                 <div class="card-body"> -->
<!--                                     <div class="chart-area"> -->
<!--                                         <canvas id="myAreaChart2"></canvas> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->


<!--                         Pie Chart -->
<!--                         <div class="col-xl-4 col-lg-5"> -->
<!--                             <div class="card shadow mb-4"> -->
<!--                                 Card Header - Dropdown -->
<!--                                 <div -->
<!--                                     class="card-header py-3 d-flex flex-row align-items-center justify-content-between"> -->
<!--                                     <h6 class="m-0 font-weight-bold text-primary">會員身份分布圓餅圖</h6> -->
<!--                                     <div class="dropdown no-arrow"> -->
<!--                                         <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" -->
<!--                                             data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> -->
<!--                                             <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i> -->
<!--                                         </a> -->
<!--                                         <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" -->
<!--                                             aria-labelledby="dropdownMenuLink"> -->
<!--                                             <div class="dropdown-header">Dropdown Header:</div> -->
<!--                                             <a class="dropdown-item" href="#">Action</a> -->
<!--                                             <a class="dropdown-item" href="#">Another action</a> -->
<!--                                             <div class="dropdown-divider"></div> -->
<!--                                             <a class="dropdown-item" href="#">Something else here</a> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                                 Card Body -->
<!--                                 <div class="card-body"> -->
<!--                                     <div class="chart-pie pt-4 pb-2"> -->
<!--                                         <canvas id="myPieChart"></canvas> -->
<!--                                     </div> -->

<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->

<!--                     </div> -->
<!--                     <div class="container-fluid"> -->

<!--                         Page Heading -->
<!--                         <h1 class="h3 mb-2 text-gray-800">會員資料</h1> -->
<!--                         <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below. -->
<!--                             For more information about DataTables, please visit the <a target="_blank" -->
<!--                                 href="https://datatables.net">official DataTables documentation</a>.</p> -->
    
<!--                         DataTales Example -->
<!--                         <div class="card shadow mb-4"> -->
<!--                             <div class="card-header py-3"> -->
<!--                                 <h6 class="m-0 font-weight-bold text-primary">資料表內容</h6> -->
<!--                             </div> -->
    
<!--                             <nav> -->
<!--                                 <ul style="display: inline-flex; list-style: none"> -->
    
<!--                                     <li>國家公園: <select> -->
<!--                                             <option name="nothing" selected disabled>請選擇縣市</option> -->
<!--                                             <option value="值2">aa</option> -->
<!--                                             <option value="值3">bb</option> -->
                                            
<!--                                         </select> -->
    
<!--                                     </li> -->
<!--                                     <li>路線: <select> -->
<!--                                             <option name="nothing" selected disabled>選擇提示1</option> -->
<!--                                             <option value="值2">aa</option> -->
<!--                                             <option value="值3">bb</option> -->
<!--                                         </select></li> -->
<!--                                     <li>路線: <select> -->
<!--                                             <option name="nothing" selected disabled>選擇提示1</option> -->
<!--                                             <option value="值2">aa</option> -->
<!--                                             <option value="值3">bb</option> -->
<!--                                         </select></li> -->
<!--                                     <hr> -->
<!--                                     <div style="display: inline-flex;"> -->
                           
<!--                                         搜尋：<input type="search" class="light-table-filter" data-table="order-table" -->
<!--                                             placeholder="請輸入關鍵字"> -->
<!--                                             <input  type="image"  name="submit_Btn"  id="submit_Btn"  img  src="img/images/放大鏡.png" width="35px"> -->
                                       
<!--                                     </div> -->
<!--                                 </ul> -->
<!--                                 <br> -->
<!--                                 <a href="#" class="btn btn-primary btn-icon-split"> -->
<!--                                     <span class="icon text-white-50"> -->
<!--                                         <i class="fas fa-flag"></i> -->
<!--                                     </span> -->
<!--                                     <span class="text">按鈕1</span> -->
<!--                                 </a> -->
<!--                                 <a href="#" class="btn btn-primary btn-icon-split"> -->
<!--                                     <span class="icon text-white-50"> -->
<!--                                         <i class="fas fa-flag"></i> -->
<!--                                     </span> -->
<!--                                     <span class="text">按鈕2</span> -->
<!--                                 </a> -->
<!--                                 <a href="#" class="btn btn-primary btn-icon-split"> -->
<!--                                     <span class="icon text-white-50"> -->
<!--                                         <i class="fas fa-flag"></i> -->
<!--                                     </span> -->
<!--                                     <span class="text">按鈕3</span> -->
<!--                                 </a> -->
<!--                             </nav> -->
<!--                             <div class="card-body"> -->
<!--                                 <div class="table-responsive"> -->
<!--                                     <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0"> -->
<!--                                         <thead> -->
<!--                                             <tr> -->
<!--                                                 <th>欄位1</th> -->
<!--                                                 <th>欄位2</th> -->
<!--                                                 <th>欄位3</th> -->
    
<!--                                             </tr> -->
<!--                                         </thead> -->
<!--                                         <tfoot> -->
<!--                                             <tr> -->
<!--                                                 <th>欄位1</th> -->
<!--                                                 <th>欄位2</th> -->
<!--                                                 <th>欄位3</th> -->
    
<!--                                             </tr> -->
<!--                                         </tfoot> -->
<!--                                         <tbody> -->
<!--                                             <tr> -->
<!--                                                 <td>Tiger Nixon</td> -->
<!--                                                 <td>System Architect</td> -->
<!--                                                 <td>Edinburgh</td> -->
    
<!--                                             </tr> -->
<!--                                             <tr> -->
<!--                                                 <td>Garrett Winters</td> -->
<!--                                                 <td>Accountant</td> -->
<!--                                                 <td>Tokyo</td> -->
    
<!--                                             </tr> -->
<!--                                             <tr> -->
<!--                                                 <td>Ashton Cox</td> -->
<!--                                                 <td>Junior Technical Author</td> -->
<!--                                                 <td>San Francisco</td> -->
    
<!--                                             </tr> -->
<!--                                             <tr> -->
<!--                                                 <td>Cedric Kelly</td> -->
<!--                                                 <td>Senior Javascript Developer</td> -->
<!--                                                 <td>Edinburgh</td> -->
    
<!--                                             </tr> -->
<!--                                             <tr> -->
<!--                                                 <td>Airi Satou</td> -->
<!--                                                 <td>Accountant</td> -->
<!--                                                 <td> -->
<!--                                                     確認<a href="#" class="btn btn-success btn-circle btn-sm"> -->
<!--                                                         <i class="fas fa-check"></i> -->
<!--                                                     </a> -->
<!--                                                     詳情<a href="#" class="btn btn-info btn-circle btn-sm"> -->
<!--                                                         <i class="fas fa-info-circle"></i> -->
<!--                                                     </a> -->
<!--                                                     修改<a href="#" class="btn btn-warning btn-circle btn-sm"> -->
<!--                                                         <i class="fas fa-exclamation-triangle"></i> -->
<!--                                                     </a> -->
<!--                                                     刪除<a href="#" class="btn btn-danger btn-circle btn-sm"> -->
<!--                                                         <i class="fas fa-trash"></i> -->
<!--                                                     </a> -->
<!--                                                 </td> -->
    
<!--                                             </tr> -->
<!--                                             <tr> -->
<!--                                                 <td>Brielle Williamson</td> -->
<!--                                                 <td>Integration Specialist</td> -->
<!--                                                 <td>New York</td> -->
    
<!--                                             </tr> -->
<!--                                             <tr> -->
<!--                                                 <td>Herrod Chandler</td> -->
<!--                                                 <td>Sales Assistant</td> -->
<!--                                                 <td>San Francisco</td> -->
    
<!--                                             </tr> -->
<!--                                             <tr> -->
<!--                                                 <td>Rhona Davidson</td> -->
<!--                                                 <td>Integration Specialist</td> -->
<!--                                                 <td>Tokyo</td> -->
    
<!--                                             </tr> -->
<!--                                             <tr> -->
<!--                                                 <td>Colleen Hurst</td> -->
<!--                                                 <td>Javascript Developer</td> -->
<!--                                                 <td>San Francisco</td> -->
    
<!--                                             </tr> -->
<!--                                             <tr> -->
<!--                                                 <td>Sonya Frost</td> -->
<!--                                                 <td>Software Engineer</td> -->
<!--                                                 <td>Edinburgh</td> -->
    
<!--                                             </tr> -->
<!--                                             <tr> -->
<!--                                                 <td>Jena Gaines</td> -->
<!--                                                 <td>Office Manager</td> -->
<!--                                                 <td>London</td> -->
    
<!--                                             </tr> -->
<!--                                             <tr> -->
<!--                                                 <td>Quinn Flynn</td> -->
<!--                                                 <td>Support Lead</td> -->
<!--                                                 <td>Edinburgh</td> -->
    
<!--                                             </tr> -->
    
<!--                                         </tbody> -->
<!--                                     </table> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
    
<!--                     </div> -->
<!--                     /.container-fluid -->
<!--                     Content Row -->
<!--                     <div class="row"> -->

<!--                         Content Column -->
<!--                         <div class="col-lg-6 mb-4"> -->

<!--                             Project Card Example -->


<!--                             Color System -->
<!--                             <div class="row"> -->
<!--                                 <div class="col-lg-6 mb-4"> -->
<!--                                     <div class="card bg-primary text-white shadow"> -->
<!--                                         <div class="card-body"> -->
<!--                                             主要內容 -->
<!--                                             <div class="text-white-50 small">#4e73df</div> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                                 <div class="col-lg-6 mb-4"> -->
<!--                                     <div class="card bg-success text-white shadow"> -->
<!--                                         <div class="card-body"> -->
<!--                                             成功/確認 -->
<!--                                             <div class="text-white-50 small">#1cc88a</div> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                                 <div class="col-lg-6 mb-4"> -->
<!--                                     <div class="card bg-info text-white shadow"> -->
<!--                                         <div class="card-body"> -->
<!--                                             詳細內容 -->
<!--                                             <div class="text-white-50 small">#36b9cc</div> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                                 <div class="col-lg-6 mb-4"> -->
<!--                                     <div class="card bg-warning text-white shadow"> -->
<!--                                         <div class="card-body"> -->
<!--                                             修改 -->
<!--                                             <div class="text-white-50 small">#f6c23e</div> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                                 <div class="col-lg-6 mb-4"> -->
<!--                                     <div class="card bg-danger text-white shadow"> -->
<!--                                         <div class="card-body"> -->
<!--                                             刪除 -->
<!--                                             <div class="text-white-50 small">#e74a3b</div> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                                 <div class="col-lg-6 mb-4"> -->
<!--                                     <div class="card bg-secondary text-white shadow"> -->
<!--                                         <div class="card-body"> -->
<!--                                             次要內容 -->
<!--                                             <div class="text-white-50 small">#858796</div> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                                 <div class="col-lg-6 mb-4"> -->
<!--                                     <div class="card bg-light text-black shadow"> -->
<!--                                         <div class="card-body"> -->
<!--                                             色表1 -->
<!--                                             <div class="text-black-50 small">#f8f9fc</div> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                                 <div class="col-lg-6 mb-4"> -->
<!--                                     <div class="card bg-dark text-white shadow"> -->
<!--                                         <div class="card-body"> -->
<!--                                             色表2 -->
<!--                                             <div class="text-white-50 small">#5a5c69</div> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->

<!--                         </div> -->


<!--                     </div> -->

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
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="js/demo/折線圖demo.js"></script>
    <script src="js/demo/圓餅圖demo.js"></script>



    <script src="js/includejsp.js"></script>
</body>

</html>