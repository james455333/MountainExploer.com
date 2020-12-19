<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>星星</title>
    <link rel="stylesheet" href="/MountainExploer.com/css/other.css">
    <link rel="stylesheet" href="/MountainExploer.com/css/font.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <script src=" https://code.jquery.com/jquery-3.5.0.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    
    <style>
.images{
width:25px;
height:25px;
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
            <a class="navbar-brand" href="#"><img src="/MountainExploer.com/images/logo1.png" height="30%" width="30%"></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent" include-html="/MountainExploer.com/forinclude/includeForIndex.html"></div>
        </nav>
    </header>
    <div class="div_ul">
<!--         <div class="secNavbar"> -->
<!--             <nav> -->
<!--                 <ul class="second_nav"> -->
<!--                     更改內容從這邊開始 -->
<!--                     <li class="li1"><a href="#">第二導覽列1</a></li> -->

<!--                     <li class="li1"><a href="#">第二導覽列2</a></li> -->

<!--                     <li class="li1"><a href="#">第二導覽列3</a></li> -->

<!--                     <li class="li1"><a href="#">第二導覽列4</a></li> -->
<!--                     更改內容到這邊結束 -->
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


<!--             </div> -->

            <div class="secDivContent">
                <!--table-->
                <table class="order-table">
<!-- house star update -->
  <c:forEach var="i" items="${list}">
  
<form id="star" action="<c:url value='/mountainHouseAct/updatestar'></c:url>" method='GET'>
    <span><img id="img1" class="images" src="/MountainExploer.com/housecamp/images/blackstar.PNG" />
    <img id="img2" class="images" src="/MountainExploer.com/housecamp/images/blackstar.PNG" />
    <img id="img3" class="images" src="/MountainExploer.com/housecamp/images/blackstar.PNG" />
    <img id="img4" class="images" src="/MountainExploer.com/housecamp/images/blackstar.PNG" />
    <img id="img5" class="images" src="/MountainExploer.com/housecamp/images/blackstar.PNG" />
	</span>
	<input type="text" name="updatestar" value="${i.star}">
	<input type="text" name="updateclick" value="${i.clickcount}">
	<input type="text" name="updateid" value="${i.housebasicid}">
	<input type="reset" value="清除">
	<input type="submit" value="送出">
</form>
  </c:forEach>   
   
<!--    camp star update -->
	 <c:forEach var="j" items="${toupdatestar}">
  
<form id="star" action="<c:url value='/mountainCampAct/updatestar'></c:url>" method='GET'>
    <span><img id="img1" class="images" src="/MountainExploer.com/housecamp/images/blackstar.PNG" />
    <img id="img2" class="images" src="/MountainExploer.com/housecamp/images/blackstar.PNG" />
    <img id="img3" class="images" src="/MountainExploer.com/housecamp/images/blackstar.PNG" />
    <img id="img4" class="images" src="/MountainExploer.com/housecamp/images/blackstar.PNG" />
    <img id="img5" class="images" src="/MountainExploer.com/housecamp/images/blackstar.PNG" />
	</span>
	<input type="hidden" name="updatestar" value="${j.star}">
	<input type="hidden" name="updateclick" value="${j.clickcount}">
	<input type="hidden" name="updateid" value="${j.campbasicid}">
	<input type="reset" value="清除">
	<input type="submit" value="送出">
</form>
  </c:forEach>   
				

	<p>麻煩給個好評</p>
                    <tbody class="order-table-tb">
                    
<!--                     星星評分 -->
                    

                    </tbody>

                </table>

            </div>




            <!-- 每頁不同的內容到這邊結束 -->
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

<script>
let index ;

$("#img1").click(function(){
    $(this).attr("src","/MountainExploer.com/housecamp/images/bringstar.PNG");
}).click(function(){
	$("#img5,#img4,#img3,#img2").attr("src","/MountainExploer.com/housecamp/images/blackstar.PNG");
}).val()

$("#img2").click(function(){
    $("#img2,#img1").attr("src","/MountainExploer.com/housecamp/images/bringstar.PNG");
}).click(function(){
	$("#img5,#img4,#img3").attr("src","/MountainExploer.com/housecamp/images/blackstar.PNG");
})

$("#img3").click(function(){
    $("#img3,#img2,#img1").attr("src","/MountainExploer.com/housecamp/images/bringstar.PNG");
}).click(function(){
	$("#img5,#img4").attr("src","/MountainExploer.com/housecamp/images/blackstar.PNG");
})

$("#img4").click(function(){
    $("#img4,#img3,#img2,#img1").attr("src","/MountainExploer.com/housecamp/images/bringstar.PNG");
}).click(function(){
	$("#img5").attr("src","/MountainExploer.com/housecamp/images/blackstar.PNG");
})

$("#img5").click(function(){
    $("#img5,#img4,#img3,#img2,#img1").attr("src","/MountainExploer.com/housecamp/images/bringstar.PNG");
})

$(document).ready(function(){
	$("img").click(function(){
		index = $(this).index()
	});
	$("#star").on("submit",function(e){

		let originStarV = $("input[name='updatestar']").val()
		let originCount = $("input[name='updateclick']").val()
		$("input[name='updatestar']").val(Number(originStarV) + Number(index+1))
		$("input[name='updateclick']").val(Number(originCount) + Number(1))
// 		e.preventDefault(); // 不會送出submit
	})
});
</script>
</body>

<script src="/MountainExploer.com/js/upLoadImg.js"></script><!-- 上傳頭像 -->
<script src="/MountainExploer.com/js/table.js"></script>
<script src="/MountainExploer.com/js/topBar.js"></script>
<script src="/MountainExploer.com/js/sweetalert.js"></script><!--sweet alert-->
<script src="/MountainExploer.com/js/includejsp.js"></script>
</html>