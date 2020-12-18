var actHomeURL = "/MountainExploer.com/mountain/act/crud";
var actListURL = "/MountainExploer.com/mountain/list?";
var actEnterURL = "/MountainExploer.com/mountain/act/detail?";
var respHome = "/MountainExploer.com/mountain/resp/crud"

var totalPage, totalData, page, actID, member;
var urlNow = new URL(window.location.href)
if(urlNow.searchParams.has("page")){
	page = urlNow.searchParams.get("page");
}else{
	page = 1;
}
if(urlNow.searchParams.has("actID")){
	actID = urlNow.searchParams.get("actID");
}
var anchorThis = window.location.hash
$(function(){
	var originTitleX = $(".actTitle").offset().top
	var originTitleW = $(".actPost").innerWidth()
	var originMemberW = $(".memberinfo-container").innerWidth()
	$(window).scroll(function(){
		let headerBottom = $("header").offset().top + $("header").height()
		let miContainer = $(".memberinfo-container")
		let originMemberH = $(".memberinfo-container").innerHeight()
//		console.log(miContainer)
		for(let i=0 ; i < miContainer.length ; i++){
			let thisElm = miContainer.eq(i)
			let myLeft = thisElm.offset().left
			let thisMembetTD = thisElm.parents(".memberTD")
			let myHeight = thisElm.height()
			let myTop = thisElm.offset().top
			let myBottom = originMemberH + myTop
			let myMTDBottom = thisMembetTD.offset().top + thisMembetTD.height()
			let myMTDTop = thisMembetTD.offset().top
			let headerAndTitleBot = headerBottom + $(".actTitle").height() 
			if(myTop <= myMTDTop || headerBottom<=myMTDTop){
				thisElm.css({
					position : "static"
				})
			}
			if(myBottom > myMTDBottom && (myMTDBottom - headerAndTitleBot)<myHeight ){
				thisElm.css({
					position : "sticky",
					top : myTop,
					left : myLeft
				})
			}else if(myTop >= myMTDTop && (myTop <= headerAndTitleBot && (myMTDBottom - headerAndTitleBot)>myHeight ) || ( thisElm.css("position") == "sticky" && myTop>headerAndTitleBot)){
				thisElm.css({
					position : "fixed",
					top : $("header").height()+$(".actTitle").height(),
					"z-index" : 9,
					width : originMemberW
				})
			}
		}
		
		if(originTitleX <= headerBottom){
			if($(".actTitle").css("position") != "fixed"){
				$(".actTitle").css({
					position : "fixed",
					top : $("header").height(),
					"z-index" : 10,
					width : originTitleW,
				})
				$("#btn-top-container").removeClass("d-none") 
			}
		}else if(originTitleX>headerBottom){
			$(".actTitle").css({
				position : "static"
			})
			$(".actTitle").parents("body").find(".memberinfo-container").css({
				position : "static"
			})
			$("#btn-top-container").addClass("d-none") 
		}
	})
	$("#btn-top").on("click",function(){
		$('html, body').animate({
			scrollTop: $("#bc").offset().top
		},1000);
	})
	
	/* 預設畫面 */
	PBBlock({
		countTimes : 4
	})
	openBlock("body")
	progressCount("頁面元素載入完成")
	activeMainAjax(page,"/detail");
	/* 留言按鈕設定 */
	$(".innerContainer").on("click", ".btn-sideResp",function(){
		thisComment = $(this).parents(".comment-container").find("input[name='message']").val()
		converComment = String(thisComment)
		console.log(converComment)
		if(member != null){
			if(thisComment == ""){
				Swal.fire("留言不得為空","","warning")
				return;
			}
			ajaxAddComment($(this), converComment);
		}else{
			loginConfirmSWAL()
		}
	})
	
	/* 回覆 */
	$(".btn-resp").on("click",checkResp)
	$(".goReg").on("click",".btn-goReg",goReg)
	/* 一鍵輸入 */
//	$(".div_ul").on("click",'.login-alert',function(){
//		 $("#dialog-form").dialog("open");
//	})
	
	$('.innerContainer').on("click" ,'.btn-detail-update-act', function(){
		window.location.assign("/MountainExploer.com/mountain/manage/edite?actID="+actID)
	})
//	$('.innerContainer').on("click" ,'.btn-detail-update', function(){
//		window.location.assign("/MountainExploer.com/mountain/manage/resp/edite?actID="+actID)
//	})
	
})


