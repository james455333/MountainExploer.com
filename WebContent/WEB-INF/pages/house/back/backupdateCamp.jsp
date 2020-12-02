<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>後台資料維護系統/露營地修改</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
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
						
						<th scope="col"><span class="tr_title"></span></th>
						<th scope="col"><span class="tr_title">縣市</span></th>
						<th scope="col"><span class="tr_title">鄉鎮</span></th>
						<th scope="col"><span class="tr_title">營地名稱</span></th>
						<th scope="col"><span class="tr_title">部落格網址</span></th>
						<th scope="col"><span class="tr_title">星星總和分數</span></th>
						<th scope="col"><span class="tr_title">評分次數</span></th>
						<th scope="col"><span class="tr_title">平均分數</span></th>
						<th scope="col"><span class="tr_title">描述</span></th>
						<th scope="col"><span class="tr_title">更新圖片</span></th>
						<th scope="col"><span class="tr_title">原本圖片</span></th>
						<th scope="col"><span class="tr_title"></span></th>
					</tr>
				</thead>
				<tbody>
				  <c:forEach var="l" items="${jumpupdatename}"> 
				<tr>  
				 <div>				 
				  	<form  action="<c:url value='/mountainCampBack/updateCamp'></c:url>"method="post" enctype="multipart/form-data">	
				    	<td><input type="hidden" name="updatacamp_id" size="10" value="${l.campbasicid}">	</td> 			    		
 				    	<td><input type="hidden" name="updatecamp_city" size="10" value="${l.counties.area.name}" id="selectArea">${l.counties.area.name}</td>	  
				    	<td><select name="updatecamp_town" id="selectCounties" value="${l.counties.name}"></select></td>
				    	<td><input type="text" name="updatecamp_name" size="20" value="${l.name}"></td>
				    	<td><input type="text" name="updatecamp_url" size="50" value="${l.url}"></td>
				    	
				    	<td>
				    	<c:choose>
							<c:when test="${empty k.star}">總共0分</c:when>
				    	<c:otherwise><input type="hidden" name="updatecamp_star" value="${k.star}">總共${k.star}分</c:otherwise>
					    </c:choose></td>
					    
					    <td>
					    <c:choose>
					    <c:when test="${empty k.clickcount}">0次</c:when>
					    <c:otherwise><input type="hidden" name="updatecamp_click" value="${k.clickcount}">${k.clickcount}次</c:otherwise>
					    </c:choose></td>
					    
					    <td>平均${k.star/k.clickcount}分</td>
				    	
				    	<td><textarea name="updatecamp_desc" cols="40" rows="8"> ${l.desc}</textarea></td>
				    	<td><img id="blah" src="/MountainExploer.com/housecamp/images/campnull.PNG" alt="更新圖片" />		       
				     		<input type="file" name="files" id="imgInp" size="25" accept="image/*"></td>
				     		 <input type="hidden" name="hotelnumber" value="${l.campimgid.id}">
				    	<td><input type="submit"  value="修改"></td>
				    </form>
				      	<td>
				      	<c:choose>
								<c:when test="${empty l.campimgid.img }">
								<img height="100" width="100"src="/MountainExploer.com/housecamp/images/campnull.PNG">
								</c:when>
				      		<c:otherwise><img height="100" width="100"src="<c:url value='/mountainCampBack/showimg?imgid=${l.campimgid.id}'/>"></c:otherwise>
				      	</c:choose>
				      </td>
				 </div>
				</tr> 
				    	</c:forEach> 
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

</body>

<script type="text/javascript">
$(function(){
	var campUrl = "/MountainExploer.com/mountainCampBack";
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


</script>
<!--     <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" ></script> -->
	<script type="text/javascript" charset="UTF-8" src='<c:url value="/housecamp/css/back/backhousecamp.js"/>'></script>
</html>