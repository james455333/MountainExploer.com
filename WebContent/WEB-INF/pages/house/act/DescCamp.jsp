<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>露營地</title>
    <link rel="stylesheet" href="/MountainExploer.com/css/other.css">
    <link rel="stylesheet" href="/MountainExploer.com/css/font.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/sweetalert2@9.17.2/dist/sweetalert2.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9.17.2/dist/sweetalert2.all.min.js"></script>
    
    <style>
    .images{
width:25px;
height:25px;
}
	.topname{margin : 50px 45px 40px 5px;
	float: left;
	padding : 50px 0px 40px 5px;
	}
	.body{margin : 20px;
	clear : left;
	width:90%;
	height :100%;
	}
	.counties{float:left;
	padding : 0px 20px 40px 50px;
	clear:left;}
.img{width:100%;
	transition: all 0.6s;}
.img:hover{transform: scale(1.5);}
    </style>
</head>

<body>
    <div class="count1">
        <div class="count1_img">
            <img src="/MountainExploer.com/images/logo1.png">
            <hr>
            <h1 class="font">可能改成輪播</h1>
            <!-- <a class="font">岳進者</a> -->
        </div>
    </div>
   <header>
		<nav class="navbar navbar-expand-lg navbar-light bg-light zline">
			<a class="navbar-brand" href="/MountainExploer.com/"><img
				src="/MountainExploer.com/images/logo1.png" height="30%" width="30%"></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent"
				include-html="/MountainExploer.com/forinclude/includeForIndex.html"></div>
		</nav>
	</header>
    <div class="div_ul">
<!--         <div class="secNavbar"> -->
<!--             <nav> -->
<!--                 <ul class="second_nav"> -->
<!--                     <li class="li1"><a href="#">第二導覽列1</a></li> -->

<!--                     <li class="li1"><a href="#">第二導覽列2</a></li> -->

<!--                     <li class="li1"><a href="#">第二導覽列3</a></li> -->

<!--                     <li class="li1"><a href="#">第二導覽列4</a></li> -->
<!--                 </ul> -->
<!--             </nav> -->
<!--         </div> -->
        <div class="div_li1">
<!--             <a>保留區</a> -->
        </div>
        <div class="div_li3">
<!--             <a>保留區</a> -->
        </div>
        <div class="div_li2">
            <!-- 每頁不同的內容從這裡開始 -->
            

            <div class="secDivContent">

                <div class="forImage">
<!--                     <img src="/MountainExploer.com/images/BGI.jpg" alt="" class="forImagesImg"> -->
                    <!-- 調整參考網址 https://segmentfault.com/q/1010000018971940 -->
               			<c:forEach var="i" items="${selectcamp}">
					<c:choose>
								<c:when test="${ empty i.campimgid.img}">
								<img style="height: 100%" src="/MountainExploer.com/housecamp/images/campimagnotfound.png">
								</c:when>
								<c:when test="${not empty i.campimgid.img}">
								<img style="height: 100%"
								src="<c:url value='/mountainCampBack/showimg?imgid=${i.campimgid.id}'/>">
								</c:when>
					</c:choose>
						</c:forEach>
                </div>
<!-- 右邊 -->
                <div class="forFrom ">
	         <!-- 評價 -->
                <c:forEach var="j" items="${selectcamp}">
                <div class="topname">
                				<c:choose>
									<c:when test="${(j.star*1.0 / j.clickcount) lt 1 || empty j.star}">
												<span><img class="images" src="/MountainExploer.com/housecamp/images/blackstar.PNG"></span>
												<span><img class="images" src="/MountainExploer.com/housecamp/images/blackstar.PNG"></span>
												<span><img class="images" src="/MountainExploer.com/housecamp/images/blackstar.PNG"></span>
												<span><img class="images" src="/MountainExploer.com/housecamp/images/blackstar.PNG"></span>
												<span><img class="images" src="/MountainExploer.com/housecamp/images/blackstar.PNG"></span>
									</c:when>
									<c:when test="${ j.star*1.0/j.clickcount ge 1 && j.star*1.0/j.clickcount lt 2}">
												<span><img class="images" src="/MountainExploer.com/housecamp/images/bringstar.PNG"></span>
												<span><img class="images" src="/MountainExploer.com/housecamp/images/blackstar.PNG"></span>
												<span><img class="images" src="/MountainExploer.com/housecamp/images/blackstar.PNG"></span>
												<span><img class="images" src="/MountainExploer.com/housecamp/images/blackstar.PNG"></span>
												<span><img class="images" src="/MountainExploer.com/housecamp/images/blackstar.PNG"></span>
									</c:when>
									<c:when test="${j.star*1.0/j.clickcount ge 2 && j.star*1.0/j.clickcount lt 3}">
												<span><img class="images" src="/MountainExploer.com/housecamp/images/bringstar.PNG"></span>
												<span><img class="images" src="/MountainExploer.com/housecamp/images/bringstar.PNG"></span>
												<span><img class="images" src="/MountainExploer.com/housecamp/images/blackstar.PNG"></span>
												<span><img class="images" src="/MountainExploer.com/housecamp/images/blackstar.PNG"></span>
												<span><img class="images" src="/MountainExploer.com/housecamp/images/blackstar.PNG"></span>
									</c:when>
									<c:when test="${j.star*1.0/j.clickcount ge 3 && j.star*1.0/j.clickcount lt 4}">
												<span><img class="images" src="/MountainExploer.com/housecamp/images/bringstar.PNG"></span>
												<span><img class="images" src="/MountainExploer.com/housecamp/images/bringstar.PNG"></span>
												<span><img class="images" src="/MountainExploer.com/housecamp/images/bringstar.PNG"></span>
												<span><img class="images" src="/MountainExploer.com/housecamp/images/blackstar.PNG"></span>
												<span><img class="images" src="/MountainExploer.com/housecamp/images/blackstar.PNG"></span>
									</c:when>
									<c:when test="${j.star*1.0/j.clickcount ge 4 && j.star*1.0/j.clickcount lt 4.8}">
												<span><img class="images" src="/MountainExploer.com/housecamp/images/bringstar.PNG"></span>
												<span><img class="images" src="/MountainExploer.com/housecamp/images/bringstar.PNG"></span>
												<span><img class="images" src="/MountainExploer.com/housecamp/images/bringstar.PNG"></span>
												<span><img class="images" src="/MountainExploer.com/housecamp/images/bringstar.PNG"></span>
												<span><img class="images" src="/MountainExploer.com/housecamp/images/blackstar.PNG"></span>
									</c:when>
									<c:when test="${j.star*1.0 / j.clickcount ge 4.8}">
												<span><img class="images" src="/MountainExploer.com/housecamp/images/bringstar.PNG"></span>
												<span><img class="images" src="/MountainExploer.com/housecamp/images/bringstar.PNG"></span>
												<span><img class="images" src="/MountainExploer.com/housecamp/images/bringstar.PNG"></span>
												<span><img class="images" src="/MountainExploer.com/housecamp/images/bringstar.PNG"></span>
												<span><img class="images" src="/MountainExploer.com/housecamp/images/bringstar.PNG"></span>
									</c:when>
							</c:choose>
					<c:choose>
					<c:when test="${j.clickcount <= 0 || empty j.clickcount}">(0人評分過)</c:when>
					<c:otherwise>(${j.clickcount }人評分過)</c:otherwise>
					</c:choose>
					<div>
						<form action="<c:url value='/mountainCampAct/jumpupdatestar'></c:url>">

<%-- 						<input type="hidden" name="selectcampid" value="${j.campbasicid}"> --%>

						<input type="hidden" name="selectcampid" value="${j.campbasicid}">
						

						<c:choose>
								<c:when test="${empty Member}">
									<input type="button" class="swalLogin" value="評分">
								</c:when>
							<c:otherwise><input type="submit" value="評分"></c:otherwise>
						</c:choose>	
										
						</form>
					</div>
						<div style="margin: 10px">
							
							<a href="#selecttoorder"><input type="button" class="btn btn-outline-success" value="現在預定房間"></a>
											
						</div>	
					</div>
					<div><a href="${j.url}" target="_blank" >前往部落格</a></div>
					</c:forEach>
                </div>
<!-- 左邊 -->
                <div class="forText">
	                <div>
	                <c:forEach var="i" items="${selectcamp}">
	                
	                <div class = "topname"><h3>${i.name}</h3>地址 : ${i.counties.area.name}${i.counties.name}</div>
					
<%-- 	                <div class = "counties">地址 : ${i.counties.area.name}${i.counties.name}</div> --%>
	               
	                <div class="body" style="height: px">${i.desc}</div>
	                </c:forEach>
	                </div>
                
                </div>
            </div>
<!-- 下框 -->
             <div class="secDivContent">
             <div style="padding: 20px 0 0 0 "><h3>查詢住宿日期</h3>
             	<form action="<c:url value='/mountaincCampActOrder/selectamount#tablePreview'></c:url>">
             	
             <c:forEach var="i" items="${selectcamp}">
 <!-- 營地編號 -->
				<input type="hidden" name="selectcampid" value="${i.campbasicid}">
             </c:forEach>	
				<div>入住時間 : <input type="text" id="from" name="select_bookdate" size="45" readonly></div>             
             	<div>
             		<c:choose>
						<c:when test="${empty Member}">
             				<input type="button" class="swalLogin" value="查詢">
             			</c:when>	
						<c:otherwise><input type="submit"  value="查詢"></c:otherwise>             		
             		</c:choose>
             	</div>
             	</form>
             </div>	
<!-- 顯示查詢日期 -->  
				<div id="selecttoorder" >
			<form action="<c:url value='/mountaincCampActOrder/orderjump'></c:url>">
				 <c:forEach var="i" items="${camp}">
				 	<input type="hidden" name = "orderjump_campid" value="${i.campbasicid}">
				 	<input type="hidden" name = "orderjump_bookdate" value="${selectdate}">
		             <div><h2>${selectdate}</h2>
		             <h4>共選了${bookneight}晚</h4></div>
					 <table class="order-table table table-hover" id="tablePreview"
							style="background-color: white;">
							<thead class="order-table-th">
							<tr>
									<!-- thead更改從這邊開始 -->
									<th scope="col">營地類型</th>
		            				<th scope="col">價格</th>
		            				<th scope="col">選擇數量</th>
		            				<th scope="col"></th>
		            		</tr>
							</thead>
		
							<tbody class="order-table-tb">
							<tr>
					             <td class="img">
					             <c:choose>
						             <c:when test="${leftcampamount <= 5 && leftcampamount >= 1}">
						             	<p style="color: red">*&nbsp剩餘${leftcampamount}區&nbsp*!!</p>
						             </c:when>
						             <c:when test="${leftcampamount <= 0}">
						           	 	 <p style="color: red">無剩餘區域</p>
						             </c:when>
						             <c:when test="${leftcampamount > 5}">
						          		   <p style="color: blue">剩餘5區</p>
						             </c:when>
					             </c:choose>
					             <img style="height: 60%" src="/MountainExploer.com/housecamp/images/tent1.jpg">
					             </td>		                       
					             
					             <c:choose>
						           	 <c:when test="${leftcampamount <= 0}"> </c:when>
						             <c:when test="${leftcampamount > 0}">
							             <td>TWD. ${i.campprice}</td> 
							             <td><select id="campleftamount" name="orderjump_amount"></select></td>
							             <td><input type="text" readonly class=" border-0 text-dark" name="orderjump_totalprice" id="camporderprice" ><p><input class="btn btn-outline-success" type="submit" value="立即下訂"></p></td>
<!-- 						             		 <td name="orderjump_totalprice"></td> -->
						             </c:when>
					             </c:choose>
			             	</tr>
			             </tbody>
					 </table>
				 </c:forEach>
				</form> 
				 </div>
             </div>



            <!-- 每頁不同的內容到這裡結束 -->
        </div>
    </div>

    <footer id="footer">
        <a>全站導覽</a>
        <button id="demo1">確認demo1</button>
        <button id="demo2">錯誤demo2</button>
        <button id="demo3">確認提醒demo3</button>
        <button id="demo4">多重選項&提醒視窗demo4</button>
        <button id="demo5">Demo5</button>
        <button id="demo6">Demo6</button>



    </footer>

<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

    
<script type="text/javascript">
$("#from").daterangepicker({
//  "singleDatePicker": true,
 "autoApply": true,
 "maxSpan": {
     "days": 7
 },
	"locale": {
 "format": "YYYY年MM月DD日",
 "separator": " ~ ",
 "applyLabel": "確認",
 "cancelLabel": "取消",
 "customRangeLabel": "自訂義範圍",
 "daysOfWeek": [
     "日",
     "一",
     "二",
     "三",
     "四",
     "五",
     "日"
 ],
 "monthNames": [
     "1 月",
     "2 月",
     "3 月",
     "4 月",
     "5 月",
     "6 月",
     "7 月",
     "8 月",
     "9 月",
     "10 月",
     "11 月",
     "12 月"
 ],
 "firstDay": 1
	},
	"startDate": 0,
	"endDate": moment().subtract(-1, 'days'),
	"minDate": moment(),
	"maxDate": moment().subtract(-6, 'month')
	});

</script>  

<script type="text/javascript">
$(document).ready(function(){
	var campleftamount = "${leftcampamount}";
	if (campleftamount >= 5){
		campleftamount = "5"
		};
	var campid = "${campid}";
	var campprice = "${campprice}"
	
	var ordercamp = "/MountainExploer.com/mountaincCampActOrder";

	
	$.ajax({
		url:ordercamp + "/ordercampamount?selectcampid=" + campid,
		method: "GET",
		dateType:"json",
		success : function(order){
			for(var i = -1 ; i < campleftamount ; i++){
				$("#campleftamount").append(
					"<option value='"+(i+1)+"' >"+ (i+1)+"&nbsp&nbsp&nbsp"+"(" +"TWD:"+ (i+1)*campprice+")" +"</option>")
					
			
				}
			let str = $("#campleftamount").find("option").eq(0).val();
			
			}
	
})	
$("#campleftamount").change(function(){
	var str = $("#campleftamount").val();
	$("#camporderprice").empty();
	console.log(str)
	$("#camporderprice").val(campprice*str);
// 	$("#camporderprice").append("<option value='"+(campprice*str)+"'>"+"金額總和 : "+campprice*str+"</option>");
	
	
})

		
})
</script>

    
</body>

<script src="/MountainExploer.com/housecamp/js/swalLogin.js"></script>
<script src="/MountainExploer.com/js/upLoadImg.js"></script><!-- 上傳頭像 -->
<script src="/MountainExploer.com/js/table.js"></script>
<script src="/MountainExploer.com/js/topBar.js"></script>
<script src="/MountainExploer.com/js/sweetalert.js"></script><!--sweet alert-->
<script src="/MountainExploer.com/js/includejsp.js"></script>
</html>