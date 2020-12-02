<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>後台資料維護系統/中山小屋修改</title>
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
						<th scope="col"><span class="tr_title">星星總和分數</span></th>
						<th scope="col"><span class="tr_title">評分次數</span></th>
						<th scope="col"><span class="tr_title">平均分數</span></th>
						<th scope="col"><span class="tr_title">描述</span></th>
						<th scope="col"><span class="tr_title">照片</span></th>
						<th scope="col"><span class="tr_title"></span></th>
						<th scope="col"><span class="tr_title"></span></th>
						<th scope="col"><span class="tr_title">原本圖片</span></th>
					</tr>
				</thead>
				<tbody>
				  <c:forEach var="k" items="${jumpupdatename}"> 
				<tr>  
				 <div>				 
				  	<form  action="<c:url value='/mountainHouseBack/updateHouse'></c:url>"method="post" enctype="multipart/form-data">	
 				    	<td><input type="hidden" name="update_park" value="${k.nationalPark.name}">${k.nationalPark.name}</td>	  
				    	<td><input type="text" name="update_name" size="20" value="${k.name}"> 	</td>
				    	<td><input type="text" name="update_bed" size="20" value="${k.bed}"> 	</td>
				    	<td><input type="text" name="update_camp" size="20" value="${k.camp}"> 	</td>
				    	<td><input type="text" name="update_height" size="20" value="${k.height}"> 	</td>	
				    	
					    <td>
						<c:choose>
					    <c:when test="${empty k.star}">總共0分</c:when>				    				    	
					    <c:otherwise><input type="hidden" name="update_star" value="${k.star}">總共${k.star}分</c:otherwise>
					    </c:choose></td>
					    <td>
					    <c:choose>
					    <c:when test="${empty k.clickcount}">0次</c:when>	
					    <c:otherwise><input type="hidden" name="update_click" value="${k.clickcount}">${k.clickcount}次</c:otherwise>
					    </c:choose></td>
					    <td>平均${k.star/k.clickcount}分</td>
					    
						<td><textarea name="update_desc" cols="40" rows="8">${k.desc}</textarea></td>				    	
						<td><input type="hidden" name="update_id" size="10" value="${k.housebasicid}">	</td> 			    		
				    	<td><img id="blah" src="/MountainExploer.com/housecamp/images/housenull.PNG" alt="更新圖片" />		       
				     		<input type="file" name="files" id="imgInp" size="25" accept="image/*"></td>
				     		 <input type="hidden" name="hotelnumber" value="${k.imgid.id}">
				    	<td><input type="submit"  value="修改"></td>
				    </form>
				    <td>
				    <c:choose>
							<c:when test="${ empty k.imgid.img}">
							<img height="100" width="100" src="/MountainExploer.com/housecamp/images/housenull.PNG">
							</c:when>
				    	<c:otherwise><img height="100" width="100"src="<c:url value='/mountainHouseBack/showimg?imgid=${k.imgid.id}'/>"></c:otherwise>
				    </c:choose>
				      </td>
				 </div>
				</tr> 
				    	</c:forEach> 
			</table>
		</div>
		
	</div>

</body>
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
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" ></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" ></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" ></script>
	<script type="text/javascript" charset="UTF-8" src='<c:url value="/housecamp/css/back/backhousecamp.js"/>'></script>
</html>