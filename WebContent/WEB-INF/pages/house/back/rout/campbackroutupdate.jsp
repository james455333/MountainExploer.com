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

<title>露營地 | 後台修改系統</title>

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
		
				
					<div class="row">
						<!-- 下面開始 -->
						<div class="col-xl-12">
							<div class="card shadow mb-4" id="tb-container">
								<div class="card-header py-3"></div>
								
								</div>
								<div class="card-body">
									<div class="table-responsive">
					<c:forEach var="l" items="${jumpupdatename}">
					<form action="<c:url value='/Rout/mountainCampBack/updateCamp' ></c:url>"method="Post" enctype="multipart/form-data">
							<input type="hidden" name="updatacamp_id" size="10" value="${l.campbasicid}">
							<fieldset>
								<legend>新增露營地</legend>
								<div class="">
									<div class="form-group col-md-6">
										<label>縣市 : </label> <a class="col-sm-10"><input type="hidden" name="updatecamp_city" size="10" value="${l.counties.area.name}" id="selectArea">${l.counties.area.name}</a>
										
										<label>鄉鎮 : </label> <a class="col-sm-10"><select name="updatecamp_town" id="selectCounties"></select></a>
									</div>
								</div>
								<div class="form-group col-md-6">
									<label>營地名稱 : </label><a class="col-sm-10"><input type="text" name="updatecamp_name" size="20" value="${l.name}" required="required"></a>
								</div>
								<div class="form-group col-md-6">
									<label>部落格網址 : </label><a class="col-sm-10"><input type="text" name="updatecamp_url" size="50" value="${l.url}"></a>
								</div>
								<div class="form-group col-md-6">
									<label>營區數量 : </label><a class="col-sm-10"><input type="text" name="updatecamp_campamount" size="15" value="${l.campamount}" required="required"></a>
								
									<label>價格 : </label><a class="col-sm-10"><input type="text" name="updatecamp_campprice" size="15" value="${l.campprice}" required="required"></a>
								</div>
								<div class="form-group col-md-6">
									<label class="col-sm-10">營區描述 : </label><textarea name="updatecamp_desc" rows="10" cols="50">${l.desc}</textarea>
								</div>
								<div class="form-group col-md-6">	<img id="blah" src="" alt="your image" />		       
				      					<input type="file" name="files" id="imgInp" size="25" accept="image/*">
				      					<input type="hidden" name="hotelnumber" value="${l.campimgid.id}">
				      			</div>
				      			<div class="form-group col-md-6">
				      					<input class="btn btn-outline-secondary" type="submit"  value="修改">
				      			</div>		
							</fieldset>
				
															
					</form>
							<div  class="form-group col-md-6">
							<c:choose>
								<c:when test="${empty l.campimgid.img }">
								<img height="100" width="100"src="/MountainExploer.com/housecamp/images/campnull.PNG">
								</c:when>
				      		<c:otherwise><img height="100"width="100"src="<c:url value='/mountainCampBack/showimg?imgid=${l.campimgid.id}'/>"></c:otherwise>
				      	</c:choose>
							</div>
					</c:forEach>
										
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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

	<script>
function readURL(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();
    
    reader.onload = function(e) {
      $('#blah').attr('src', e.target.result);
    }
    
    reader.readAsDataURL(input.files[0]); // convert to base64 string
  }
}

$("#imgInp").change(function() {
  readURL(this);
});
</script>
<script type="text/javascript">
$(function(){
	var campUrl = "/MountainExploer.com/Rout/mountainCampBack";
$(window).on("load",function(){
	
		var areaselect = $("#selectArea").val()
		$.ajax({
			url:campUrl+"/countiesoption?areaselect=" + areaselect,
			dataType:"json",
			method:"GET",
			success:function(counties){
				for(var i = 0 ; i< counties.length ; i++){
				$("#selectCounties").append("<option value='" + counties[i].name + "'>" + counties[i].name + "</option>")	
				}	}
			
			})
})
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