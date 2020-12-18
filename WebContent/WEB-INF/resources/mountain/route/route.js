
$(function(){
	PBBlock({
		countTimes : 3,
		endCount : 99
	})
	openBlock()
	progressCount("頁面元素載入完成")
	$(".npList").on("ready",ajaxDefault())
	.on("click","div",function(){
		let npID = $(this).find("button").val()
		ajaxTN(npID);
	})
	$(".npList").on("click",'a',function(){
		$(this).tab('show');
		ajaxTN( $(this).attr("href").replace("#np",""))
	})
	$("#rt-info-container").on("click",".btn",function(){
		let rtID = $(this).val()
		console.log(rtID)
		ajaxVTN(rtID);
	})
	
})