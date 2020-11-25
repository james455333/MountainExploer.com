
$(window).on("load",function(){
	console.log(status)
	checkStatus()
})

$(function(){
	$(".m-si-op").eq(0).on("click",function(){
		post(1);
	});
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
	$(".m-ma-container").on("blur","input[name='title']",checkTitle)
	$(".m-ma-container").on("change","input[name='startDate']",checkStartDate)
	$(".m-ma-container").on("blur","input[name='price']",checkPrice)
	$(".m-ma-container").on("blur","input[name='regTop']",checkRegTop)
	$(".m-ma-container").on("submit",".tr-form",function(e){
		e.preventDefault()
		console.log(this)
		$.ajax({
			url: manageHome+"/post-update",
	    	type: 'PUT',
	     	data: new FormData( this ),
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
})