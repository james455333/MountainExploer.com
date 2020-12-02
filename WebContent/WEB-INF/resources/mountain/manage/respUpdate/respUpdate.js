var mountainHome = "/MountainExploer.com/mountain/route/search"
var respHome = "/MountainExploer.com/mountain/resp/crud"
var actCRUDHome = "/MountainExploer.com/mountain/act/crud"
var detailHome = "/MountainExploer.com/mountain/act/detail?"

var seqno;

var urlNow = new URL(window.location.href)
if(urlNow.searchParams.has("seqno")){
	seqno = urlNow.searchParams.get("seqno");
}


$(function(){
	
	CKEDITOR.replace("note")
	
	setOriginResp()
	
	$("#btn-submit").on("click",function(){
		checkSubmit( $(this) )
	})
	$("#btn-reset").on("click",function(){
		$("#newAct-form")[0].reset()
	})
	/* 圖片放大預覽 */
})


