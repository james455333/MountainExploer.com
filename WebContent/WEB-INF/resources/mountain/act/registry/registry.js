
var regHome = "/MountainExploer.com/mountain/registry/crud"
var mountainShare = "/MountainExploer.com/mountain/public";

/* 抓取網域提供參數 */
var urlNow = new URL(window.location.href)
var actID, regTop, regModel;
var tbodyNum = 1;
if (urlNow.searchParams.has("actID")) {
	actID = urlNow.searchParams.get("actID");
}else{
	swal("錯誤","無此活動報名","error")
}


$(function(){
	regModel = $(".reg-ta-tb").clone()
	activeDataAS(actID)
	$(".reg-ta").on("click",".btn-success",function(){
		console.log( $(this) )
	})
	$(".reg-ta").on("click",".btn-danger",function(){
		if(tbodyNum>1){
			tbodyNum--;
			
		}else{
			swal("最少需要")
		}
	})
	
})