var actHomeURL = "/MountainExploer.com/mountain/act/crud";
var actListURL = "/MountainExploer.com/mountain/list?";
var actEnterURL = "/MountainExploer.com/mountain/act/detail?";

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
$(function(){
	
	activeMainAjax(page,"/detail");
	CKEDITOR.replace("resp")
	$(".innerContainer").on("click", ".btn-sideResp",function(){
		thisComment = $(this).parents(".comment-container").find("input[name='message']").val()
		if(member != null){
			if(thisComment == ""){
				swal("留言不得為空","","warning")
				return;
			}
			ajaxAddComment($(this), thisComment);
		}else{
			loginConfirmSWAL()
		}
		
		
	})
	
})