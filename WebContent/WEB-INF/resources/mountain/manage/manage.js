
var shareURL = "/MountainExploer.com/mountain/public"
var manageHome = "/MountainExploer.com/mountain/manage/crud"
var detailURL = "/MountainExploer.com/mountain/act/detail?page=1&actID="
var status, totalPage, totalData;
var nowDate = Number(new Date());
var limitStartDate = new Date(nowDate + ((60*60*24*1000)*14)) ;
		
var urlNow = new URL(window.location.href)
	
if(urlNow.searchParams.has("status")){
	status = urlNow.searchParams.get("status")
}

$(function(){
	checkStatus()

	$(".m-si-op").eq(0).on("click",function(){
		post(1);
	});
	$(".m-si-op").eq(1).on("click",function(){
		registry(1);
	});
//	$(".m-si-op").eq(2).on("click",function(){
//		record(1);
//	});
	$(".m-si-op").eq(2).on("click",function(){
		report(1);
	});
	
	/* 
		Post  Controller
		update-Show => show update form 
		reg-show => show Registry
	*/
	/* 顯示 - 修改內容 */
	$(".m-ma-container").on("click",".bt-update-show",function(){
		let thead = $(".order-table-th").find("tr")
		let mainTr = $(".tr-main-post")
		let thisElm = $(this).parents("tbody").find(".tr-up") 
		$(".m-ma-container").find("tr").not(thead).not(mainTr).not(thisElm).addClass("hideTr")
		thisElm.toggleClass("hideTr")
	})
	/* 顯示+啟動 - 報名選單 */
	$(".m-ma-container").on("click",".bt-reg-show",function(){
		let thead = $(".order-table-th").find("tr")
		let mainTr = $(".tr-main-post")
		let thisElm = $(this).parents("tbody").find(".tr-reg") 
		$(".m-ma-container").find("tr").not(thead).not(mainTr).not(thisElm).addClass("hideTr")
		thisElm.toggleClass("hideTr")
	})
	/* 啟動 - 修改內容 - 內部Form檢查及送出 */
	$(".m-ma-container").on("blur","input[name='title']",checkTitle)
	$(".m-ma-container").on("change","input[name='startDate']",checkStartDate)
	$(".m-ma-container").on("blur","input[name='price']",checkPrice)
	$(".m-ma-container").on("blur","input[name='regTop']",checkRegTop)
	$(".m-ma-container").on("submit",".tr-form",function(e){
		e.preventDefault()
		let id= $(this).find("textarea").attr("id")
		let out = CKEDITOR.instances[id].getData()
		let formData = new FormData(this)
		formData.append("note",out)
		$.ajax({
			url: manageHome+"/post-update",
	    	type: 'POST',
	     	data: formData,
	     	processData: false,
	     	contentType: false,
			success : function(data){
				successSWAL()
			},
			error : function(data){
				errorSWAL()
			}
		 });
		
	})
	
	$(".m-ma-container").on("click",".bt-act-hide",hideConfirm_PS)
	$(".m-ma-container").on("click",".bt-act-delete",deleteDanger_PS)
	$(".m-ma-container").on("click", ".bt-ps-reg-confirm", confirmReg_PS)
	$(".m-ma-container").on("click", ".bt-ps-reg-decline", declineReg_PS)
	
	$(".m-ma-container").on("click",".bt-reg-info", showInfo_RG)
	$(".m-ma-container").on("click",".bt-rg-info-update", showInfoUpdateForm_RG)
	$(".m-ma-container").on("click",".bt-reg-cancel", cancelRegistry_RG)
	$(".m-ma-container").on("submit",".rg-info-body-update",function(e){
		let thisForm = $(this)
		e.preventDefault()
		confirmRgInfoUp_RG(thisForm)
	})
	$(".m-ma-container").on("click",".bt-reg-info-update-cancel",function(e){
		e.preventDefault()
		cancelRgInfoUp_RG($(this));
	})
	$(".m-ma-container").on("click", ".bt-rg-info-delete", function(){
		regInfoDeleteSWAL_RG($(this))
	})
	
	$.unblockUI();
	
})

/* 
100	General Member
110	Uncertified Member
120	General Guide
130	Uncertified Guide
140	Suspended Member
150	Suspended Guide
160	Administrator
 *
 */

function checkStatus(){
	if( status == '120' || status == '130'){
		console.log(status)
		setGuideNav();
	}
	if( status == '140' || status == '150'){
		setSuspend();
	}
}

function setGuideNav(){
	$(".sideNav").find(".m-si-op").removeClass("m-hide")
}

function setSuspend(){
	$(".sideNav").find(".m-si-op").remove();
}


