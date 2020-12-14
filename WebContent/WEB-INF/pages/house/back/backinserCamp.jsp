<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>後台資料維護系統/營地新增</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href='<c:url value="/backstage/css/backStage.css"/>'> 
<link rel="stylesheet" href='<c:url value="/housecamp/css/back/backhousecamp.css"/>' >
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src=" https://code.jquery.com/jquery-3.5.0.js"></script>
</head>
<body>
	<div id="container1">
		<!-- 引入共同頁首 -->
		<jsp:include page="../../fragment/backTopNav.jsp"></jsp:include>
		<div id="searchBar">
			<div  class="searchSelect">
				<span>國家公園 :&nbsp </span>
				<select name="">
					<option value="">test1</option>
				</select>			
			</div>
			<div class="searchSelect">
				<span>路線名稱 :&nbsp </span>
				<select name="" >
					<option value="">test1</option>
				</select>
			</div >
			<div class="searchAll">
				<form>
				<input type="search" name="search1">
				<input type="submit" value="搜尋">
				</form>
			</div>
		</div>
		<div id="controller">
			<div>
				<form action="">
					<input type="search" name="searchInsert">
					<input type="button" src="#" value="新增">		
				</form>
			</div>
			<div>
				<form action="">
					<input type="search" name="searchInsert">
					<input type="button" src="#" value="修改">		
				</form>
			</div>
			<div>
				<form action="">
					<input type="search" name="searchInsert">
					<input type="button" src="#" value="刪除">		
				</form>
			</div>
		</div>
		<div id="mainContainer">
			<table class="table">
				<thead class="thead-light">
					<tr class="a_titleName">
						<th scope="col"><span class="tr_title"></span></th>
						<th scope="col"><span class="tr_title">縣市</span></th>
						<th scope="col"><span class="tr_title">鄉鎮</span></th>
						<th scope="col"><span class="tr_title">營地名稱</span></th>
						<th scope="col"><span class="tr_title">部落格網址</span></th>
						<th scope="col"><span class="tr_title">描述</span></th>
						<th scope="col"><span class="tr_title">照片</span></th>
						<th scope="col"><span class="tr_title"></span></th>
					</tr>
				</thead>
				<tbody>
				  <tr>  
				   <div>
				  	<form action="<c:url value='/mountainCampBack/insertCamp'></c:url>"method='post' enctype="multipart/form-data">			 
					  <td><input type="hidden" name="insercamp_id" size="10"></td>		
					  		      
				      <td><select name="insercamp_area" id="selectArea" required="required"><option>請選擇縣市</option></select></td>
				      <td><select name="insercamp_counties" id="selectCounties" required="required"></select></td>
				      
				      <td><input type="text" name="insercamp_name" size="20" value="小小露營區"></td>
				      <td><input type="text" name="insercamp_url" size="50" value="https://evshhips.pixnet.net/blog"></td>
				      <td><textarea name="insercamp_desc" cols="40" rows="8">有收集雨水之儲水設備，枯水期不穩定，有簡易太陽能照明。有坑洞式廁所。住宿山屋者，請自備過夜及睡眠裝備。</textarea></td>
				      
				      <td><img id="blah" src="/MountainExploer.com/housecamp/images/campnull.PNG" alt="your image" />		       
				      <input type="file" name="mFile" id="imgInp" size="25" accept="image/*">
				      </td>
				      <td><input type="submit"  value="新增"></td>
					</form>	    
				   </div>
				    </tr>
			</table>
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
	$(function() {

		var campUrl = "/MountainExploer.com/mountainCampAct";

		//所有縣市	
		$.ajax({
			url : campUrl + "/areaoption",
			method : "GET",
			dataType : "json",
			success : function(area) {
				for (var i = 0; i < area.length; i++) {
					$("#selectArea").append(
							"<option value='" + area[i].name + "'>"
									+ area[i].name + "</option>")
				}
				let firstArea = $("#selectArea").find("option").eq(0).val()

			}
		})
		
		
	
		//縣市選單變更	

		$("#selectArea").on("change",function() {
					var areaselect = $("#selectArea").val();
					$("#selectCounties").empty();
					$.ajax({
						url : campUrl + "/countiesoption?areaselect="
								+ areaselect,
						method : "GET",
						dataType : "json",
						success : function(counties) {
							for (var i = 0; i < counties.length; i++) {
								$("#selectCounties").append(
										"<option value='" + counties[i].name + "'>"
												+ counties[i].name
												+ "</option>")

							}
						}
					})
				})

	})
</script>
</body>
	
	
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" ></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" ></script>
	<script type="text/javascript" charset="UTF-8" src='<c:url value="/housecamp/css/back/backhousecamp.js"/>'></script>
</html>