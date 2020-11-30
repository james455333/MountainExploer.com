<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="javax.naming.Context"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>後台資料維護系統/山中小屋資料</title>
<script src=" https://code.jquery.com/jquery-3.5.0.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href='<c:url value="/backstage/css/backStage.css"/>'>
<link rel="stylesheet"
	href='<c:url value="/housecamp/css/back/backhousecamp.css"/>'>
</head>
<body>
	<div id="container1">
		<!-- 引入共同頁首 -->
		<jsp:include page="../../fragment/backTopNav.jsp"></jsp:include>
		<div id="searchBar">
			<div class="searchAll">
				<form action="<c:url value='/mountainHouseBack/selectAll'></c:url>"
					method='get'>
					<input type="hidden" value="1" name="page">
					<input type="hidden" value="1" name="no">
					<input type="hidden" value="" name="parkid">
					<input type="submit" value="全部觀看">
				</form>
			</div>
			<div class="searchSelect">
				<form action="<c:url value='/mountainHouseBack/selectAll'></c:url>"
					method='get'>
					<span>國家公園 :&nbsp </span> 
					<select  name="parkid" id="selectnPark">
					<option>選擇國家公園</option>
<!-- 					<option value="301">玉山國家公園</option> -->
<!-- 					<option value="300">太魯閣國家公園</option> -->
<!-- 					<option value="304">雪霸國家公園</option> -->
					</select>
					<input type="hidden" value="1" name="page">
					<input type="hidden" value="2" name="no">
					<input type="submit" value="查詢">
				</form>
			</div>
			<div class="searchSelect">
				<form
					action="<c:url value='/mountainHouseBack/selectHouse'></c:url>"
					method='get'>
					<span>山中小屋 :&nbsp </span> <input type="text" name="selecthouse">
					<input type="submit" value="查詢">
				</form>
			</div>

		</div>
		<div id="controller">
			<div>
				<form action="<c:url value='/mountainHouseBack/inserjump'></c:url>"
					method='get'>

					<input type="submit" src="#" name="" value="新增">
				</form>
			</div>
			<div>
				<form action="">
					<input type="search" name="searchInsert"> <input
						type="button" src="#" value="修改">
				</form>
			</div>
			<div>
				<form action="">
					<input type="search" name="searchInsert"> <input
						type="button" src="#" value="刪除">
				</form>
			</div>
		</div>
		<div id="mainContainer">
			<table class="table">
				<thead class="thead-light">
					<tr class="a_titleName">
						<th scope="col"><span class="tr_title">編號</span></th>
						<th scope="col"><span class="tr_title">國家公園</span></th>
						<th scope="col"><span class="tr_title">山中小屋</span></th>
						<th scope="col"><span class="tr_title">床位數量</span></th>
						<th scope="col"><span class="tr_title">露營地數量</span></th>
						<th scope="col"><span class="tr_title">海拔</span></th>
						<th scope="col"><span class="tr_title">描述</span></th>
						<th scope="col"><span class="tr_title">照片</span></th>
						<th scope="col"><span class="tr_title"></span></th>
						<th scope="col"><span class="tr_title"></span></th>

					</tr>
				</thead>
				<tbody>
				<div>
					<a href="selectAll?parkid=${parkid }&no=${no }&page=1">«第一頁</a>
					<a href="selectAll?parkid=${parkid }&no=${no }&page=${page-1}">‹上一頁</a>
				
					<select onChange="location = this.options[this.selectedIndex].value">
						<c:forEach var="toPage" begin="1" end="${totalPage}">
						<option value="selectAll?parkid=${parkid }&no=${no }&page=${toPage}" <c:if test="${toPage==page}">selected="selected"</c:if>>第${toPage}頁</option>
						</c:forEach>

					</select>
					<a href="selectAll?parkid=${parkid }&no=${no }&page=${page+1}">下一頁›</a>
					<a href="selectAll?parkid=${parkid }&no=${no }&page=${totalPage}">最末頁»</a>
					
					
					總共<c:out value="${totalData}">${totalData}</c:out>筆資料</div>
					
				
					<!-- 查詢全部 -->
					<c:forEach var="i" items="${House_All}">
						<tr>

							<td>${i.housebasicid}</td>
							<td>${i.nationalPark.name}</td>
							<td>${i.name}</td>
							<td>${i.bed}</td>
							<td>${i.camp}</td>
							<td>${i.height}</td>
							<td>${i.desc}</td>
							<td>
							<c:choose>
							<c:when test="${ empty i.imgid.img}">
							<img height="100" width="100" src="/MountainExploer.com/housecamp/images/housenull.PNG">
							</c:when>
							<c:when test="${not emptyi.imgid.img}">
							<img height="100" width="100"
							src="<c:url value='/mountainHouseBack/showimg?imgid=${i.imgid.id}'/>">
							</c:when>
							</c:choose>
							</td>
							<td>
								<form
									action="<c:url value='/mountainHouseBack/deleteHouse'></c:url>"
									name="form1" method='post'>
									<input type="hidden" name="deletehouse"
										value="${i.housebasicid}"> <input type="button"
										value="刪除"
										onclick="if(confirm('確認要刪除嗎？')) this.form.submit();">
								</form>
							</td>
							<td>
								<form
									action="<c:url value="/mountainHouseBack/updatejump"></c:url>"
									method="get">
									<input type="hidden" name="jumpupdate"
										value="${i.housebasicid}"> <input type="submit"
										value="修改">
								</form>
							</td>
						</tr>
					</c:forEach>
					

					<c:forEach var="m" items="${lookupdate}">
						<tr>
							<td>${m.housebasicid}</td>
							<td>${m.nationalPark.name}</td>
							<td>${m.name}</td>
							<td>${m.bed}</td>
							<td>${m.camp}</td>
							<td>${m.height}</td>
							<td>${m.desc}</td>
							<td>
							<c:choose>
							<c:when test="${ empty i.imgid.img}">
							<img height="100" width="100" src="/MountainExploer.com/housecamp/images/housenull.PNG">
							</c:when>
							<c:when test="${not emptyi.imgid.img}">
							<img height="100" width="100"
							src="<c:url value='/mountainHouseBack/showimg?imgid=${i.imgid.id}'/>">
							</c:when>
							</c:choose>
							</td>
						</tr>
					</c:forEach>
					
			</table>
		</div>

	</div>

	</tbody>
	<script type="text/javascript">
	$(function() {
		var houseUrl = "/MountainExploer.com/mountainHouseBack";

		$.ajax({
			url:houseUrl + "/nParkAlloption",
			method:"GET",
			dataType : "json",
			success:function(nPark){
				for(var i =0 ; i< nPark.length ; i++){
					$("#selectnPark").append(
							"<option value='" + nPark[i].id + "'>"
							+ nPark[i].name + "</option>") }
				let firstArea = $("#selectnPark").find("option").eq(0).val()
				
				}
			})

		})
	</script>
	
	<script>
		function delete_data() {
			if (confirm("確認刪除?")) {
				document.form1.submit();
				return true
				alert('已删除');
			} else {
				return false;
				alert('取消')
			}
		}
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>
	<script type="text/javascript" charset="UTF-8"
		src='<c:url value="/housecamp/css/back/backhousecamp.js"/>'></script>
</html>