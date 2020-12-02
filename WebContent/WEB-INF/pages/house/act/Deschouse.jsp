<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>山屋</title>
    <link rel="stylesheet" href="/MountainExploer.com/css/other.css">
    <link rel="stylesheet" href="/MountainExploer.com/css/font.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    
    <style>
    .images{
width:25px;
height:25px;
}
	.topname{margin : 50px 50px 50px 5px;
	float: left;
	padding : 50px 50px 50px 5px;
	}
	.body{margin : 10px;
	clear : left;
	
	width:500px;
	height :50px;
	}
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
            <a class="navbar-brand" href="#"><img src="/MountainExploer.com/images/logo1.png" height="30%"
                    width="30%"></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
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
                    <img src="/MountainExploer.com/images/BGI.jpg" alt="" class="forImagesImg">
                    <!-- 調整參考網址 https://segmentfault.com/q/1010000018971940 -->
                </div>
<!-- 右邊 -->
                <div class="forFrom ">
	         <!-- 評價 -->
                <c:forEach var="j" items="${selecthouseid}">
                <div class="topname">
                				<c:choose>
									<c:when test="${(j.star*1.0 / j.clickcount) lt 1 || empty j.star}">
												<span><jmg class="images" src="/MountainExploer.com/housecamp/images/blackstar.PNG"></span>
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
					(${j.clickcount }人評分過)
					<div>
					<form action="<c:url value='/mountainHouseAct/jumpupdatestart'></c:url>">
					<input type="hidden" name="selecthouseid" value="${j.housebasicid}">
					<input type="submit" value="評分"></form>
					</div>
					</div>
					</c:forEach>
                </div>
<!-- 左邊 -->
                <div class="forText">
	                <div>
	                <c:forEach var="i" items="${selecthouseid}">
	                <div style="float: left ; margin : 30px" >
					<c:choose>
								<c:when test="${ empty i.imgid.img}">
								<img height="250" width="250" src="/MountainExploer.com/housecamp/images/housenull.PNG">
								</c:when>
								<c:when test="${not empty i.imgid.img}">
								<img height="250" width="250"
								src="<c:url value='/mountainHouseBack/showimg?imgid=${i.imgid.id}'/>">
								</c:when>
								</c:choose>
					</div>
	                <div class = "topname"><h3>${i.name}</h3></div>
	                <div class="body">山屋床位${i.bed}  營地數量${i.camp}</div>					
	                <div class="body" style="height: 300px">${i.desc}</div>
	                </c:forEach>
	                </div>
                
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
</body>

<script src="/MountainExploer.com/js/upLoadImg.js"></script><!-- 上傳頭像 -->
<script src="/MountainExploer.com/js/table.js"></script>
<script src="/MountainExploer.com/js/topBar.js"></script>
<script src="/MountainExploer.com/js/sweetalert.js"></script><!--sweet alert-->
<script src="/MountainExploer.com/js/includejsp.js"></script>
</html>