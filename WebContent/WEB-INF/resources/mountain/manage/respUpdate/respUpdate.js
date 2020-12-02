var mountainHome = "/MountainExploer.com/mountain/route/search"
var respHome = "/MountainExploer.com/mountain/resp/crud"
var actCRUDHome = "/MountainExploer.com/mountain/act/crud"
var detailHome = "/MountainExploer.com/mountain/act/detail?"

var seqno, originResp, actID, page;

var urlNow = new URL(window.location.href)
if(urlNow.searchParams.has("seqno")){
	seqno = urlNow.searchParams.get("seqno");
	console.log(seqno)
}
if(urlNow.searchParams.has("actID")){
	actID = urlNow.searchParams.get("actID");
	console.log(actID)
}
if(urlNow.searchParams.has("page")){
	page = urlNow.searchParams.get("page");
	console.log(page)
}


$(function(){
	
	CKEDITOR.replace("note")
	var actDetailURL = detailHome + "page=" + page + "&actID=" + actID
	$("#bc").find("a").eq(2).attr("href", actDetailURL)
	setOriginResp()
	
	$("#btn-submit").on("click",function(){
		checkSubmit( $(this) )
	})
	$("#btn-reset").on("click",function(){
		console.log(originResp)
		CKEDITOR.instances.note.setData(originResp)
	})
	/* 圖片放大預覽 */
})


