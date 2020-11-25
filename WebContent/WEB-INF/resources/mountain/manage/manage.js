
	var shareURL = "/MountainExploer.com/mountain/public"
	var manageHome = "/MountainExploer.com/mountain/manage/search"
	var detailURL = "/MountainExploer.com/mountain/act/detail?page=1&actID="
	var mb, status, totalPage, totalData;
	var nowDate = Number(new Date());
	var limitStartDate = new Date(nowDate + ((60*60*24*1000)*21)) ;
		
	var urlNow = new URL(window.location.href)
	
	if(urlNow.searchParams.has("mb")){
		mb = urlNow.searchParams.get("mb")
	}else{
		
	}
	if(urlNow.searchParams.has("status")){
		status = urlNow.searchParams.get("status")
	}

$(function(){
	
		
	
	console.log(status)
	checkStatus()

	
	$(".m-si-op").eq(0).on("click",function(){
		post(1);
	});
	$(".m-si-op").eq(1).on("click",function(){
		registry(1);
	});
	$(".m-si-op").eq(2).on("click",function(){
		record(1);
	});
	$(".m-si-op").eq(3).on("click",function(){
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
		$.ajax({
			url: manageHome+"/post-update",
	    	type: 'POST',
	     	data: new FormData(this),
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
	
	$(".m-ma-container").on("click",".bt-act-hide",confirmSWAL)
	$(".m-ma-container").on("click",".bt-act-delete",dangerSWAL)
	
	
})
/* 確認視窗 */
function confirmSWAL(){
	let thisBT = $(this)
	swal({
		title : $(this).text(),
		text : "確定要執行本操作嗎?",
		icon : "warning",
		dangerMode: true,
		buttons : {
			cancel :{
				visible: true,
				text: "取消",
				value : false
			},
			confirm :{
				visible: true,
				text : "確定",
				value : true
			}
		}
	}).then((value) => {
		if(value){
			
			console.log( thisBT )
	//    	setActHide()
			
		}
	});
}
/* 危險確認視窗 */
function dangerSWAL(){
	swal({
	    title: "確定要執行 取消本活動 嗎?",
	    text: "請注意，本操作將取消本活動，\n本用戶將無法對本活動再次操控。\n若有問題請聯絡管理員\n\n\n\t確定要執行本操作?",
	    icon: "warning",
		dangerMode: true,
	    buttons: {
	      cancel: {
	        text: "取消",
	        visible: true
	      },
	      
	      danger: {
	        text: "確定執行刪除",
	        visible: true,
			value : true
	      },
	    },
		
	 }).then((value) => {
		if(value){
		}
	 });
}
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