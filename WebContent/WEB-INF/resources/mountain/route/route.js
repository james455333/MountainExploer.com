
$(function(){
	
	$(".npList").on("ready",ajaxDefault())
	.on("click","li",function(){
		let npID = $(this).find("button").val()
		ajaxTN(npID);
	})
	
	$(".routeList").on("click","li",function(){
		let rtID = $(this).find("button").val()
		console.log($(this))
		ajaxVTN(rtID);
	})
	
})