
var regHome = "/MountainExploer.com/mountain/registry/crud"
var mountainShare = "/MountainExploer.com/mountain/public";

/* 抓取網域提供參數 */
var urlNow = new URL(window.location.href)
var actID, nowReg, regTop, regModel;
var tbodyNum = 0;
if (urlNow.searchParams.has("actID")) {
	actID = urlNow.searchParams.get("actID");
}else{
	swal("錯誤","無此活動報名","error")
}


$(function(){
	regModel = $(".reg-ta-tb").clone()
	activeDataAS(actID)
	$(".btn-success").on("click", function(){
		if( (nowReg+1) <= regTop ){
			nowReg++;
			appedRegInfo()
		}else{
			swal({
				title : "已達到報名人數上限",
				text : "報名人數上限 : " + regTop,
				icon : "info",
				dangerMode: true,
			})
		}
		
	})
	$(".btn-danger").on("click", function(){
		let bodyLength = $(".regInfo-body-order").length
		if((bodyLength-1)>0){
			nowReg--;
			removeRegInfo(bodyLength)
		}else{
			swal({
				title : "報名資訊欄位不可少於一欄",
				icon : "error",
				dangerMode: true,
			})
		}
	})
	let originModel = $(".regInfo-body-order").clone()
	originModel.attr({ "id":"regInfo-body-order-origin", "class" : ""})
	$(".hideDIV").append( originModel )
	
	$("#regInfo-submit").on("click", function(){
		$(".regInfo-form").validate({debug:true})
		$(".regInfo-form").submit()
	})
	console.log(jQuery.validator.messages.pattern )
	$(".regInfo-form").validate({debug:true})
})
