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
var includeJS = {
	aInternal: true,
	aListener: function(val) {},
		set status(val) {
		this.aInternal = val;
    	this.aListener(val);
  		},
  		get status() {
   		return this.aInternal;
  		},
  	registerListener: function(listener) {
    	this.aListener = listener;
  	}
}



$(function(){
	includeJS.registerListener(function(val){
		if(val){
			/* 預設畫面 */
			titleAndMemeberAnimate()
			PBBlock({
				countTimes : 4
			})
			openBlock("body")
			progressCount("頁面元素載入完成")
			activeMainAjax(page,"/detail");
		}
	})
	
	
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


