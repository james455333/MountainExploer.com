<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>後台資料維護系統/山中小屋新增</title>
<script src=" https://code.jquery.com/jquery-3.5.0.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href='<c:url value="/backstage/css/backStage.css"/>'> 
<link rel="stylesheet" href='<c:url value="/housecamp/css/back/backhousecamp.css"/>' >
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
						<th scope="col"><span class="tr_title">國家公園</span></th>
						<th scope="col"><span class="tr_title">山屋名稱</span></th>
						<th scope="col"><span class="tr_title">山屋床位</span></th>
						<th scope="col"><span class="tr_title">山屋營地位</span></th>
						<th scope="col"><span class="tr_title">高度 / 海拔</span></th>
						<th scope="col"><span class="tr_title">描述</span></th>
						<th scope="col"><span class="tr_title">照片</span></th>
						<th scope="col"><span class="tr_title"></span></th>
					</tr>
				</thead>
				<tbody>
				  <tr>  
				   
				  	<form action="<c:url value='/mountainHouseBack/inserHouse'></c:url>"method='post' enctype="multipart/form-data">
				      <td><select name="inser_park" id="selectnPark">
				      
				      </select></td>
				      <td><input type="text" name="inser_house" size="20" value="大大小屋"></td>
				      <td><input type="text" name="inser_bed" size="20" value="10"></td>
				      <td><input type="text" name="inser_camp" size="20" value="20"></td>
				      <td><input type="text" name="inser_height" size="20" value="330M"></td>
				      <td><textarea name="inser_desc" cols="40" rows="8">冬季水源較不穩定，有簡易太陽能照明。有乾式生態廁所。住宿山屋者，請自備過夜及睡眠裝備。通訊品質:尚可~不穩定。為登頂雪山主峰主要之住宿山莊。請民眾依入園證之核准床位號碼入住使用。</textarea></td>
				      <td><img id="blah" src="/MountainExploer.com/housecamp/images/housenull.PNG" alt="your image" />		       
				      <input type="file" name="mFile" id="imgInp" size="25" accept="image/*">
				      </td>
				      <td><input type="submit"  value="新增"></td>
					</form>	    
				   
				    </tr>
			</table>
		</div>
		
	</div>

</body>
<script type="text/javascript">
$(function() {
	var houseUrl = "/MountainExploer.com/Rout/mountainHouseBack";

	$.ajax({
		url:houseUrl + "/nParkAlloption",
		method:"GET",
		dataType : "json",
		success:function(nPark){
			for(var i =0 ; i< nPark.length ; i++){
				$("#selectnPark").append(
						"<option value='" + nPark[i].id + "'>"
						+ nPark[i].name + "</option>") }
// 			let firstArea = $("#selectnPark").find("option").eq(0).val()
			
			}
		})
		})
	</script>
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
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" ></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" ></script>
	<script type="text/javascript" charset="UTF-8" src='<c:url value="/housecamp/css/back/backhousecamp.js"/>'></script>
</html>