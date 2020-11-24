
$(window).on("load",function(){
	console.log(status)
	checkStatus()
})

$(function(){
	$(".m-si-op").eq(0).on("click",post);
	$(".m-si-op").eq(1).on("click",registry);
	$(".m-si-op").eq(2).on("click",record);
	$(".m-si-op").eq(3).on("click",report);
	
	$(".m-ma-container").on("click",".cancel-up",function(){
		$(this).parents("tr").addClass("hideTr");
	})
	$(".m-ma-container").on("click",".update-show",function(){
		let thisElm = $(this).parents("tbody").find(".tr-up") 
		$(".m-ma-container").find(".tr-up").not(thisElm).addClass("hideTr")
		thisElm.toggleClass("hideTr")
	})
	
})