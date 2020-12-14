$(".submit").on("click", function(){
	$(document).ajaxStop(function(){
		setTimeout($.unblockUI,500)
	}); 
	
	$(document).ajaxStart(
		$.blockUI({ 
			message: '<div><div class="fas fa-spinner fa-10x fa-spin" style="color: #20c997;"></div><h2 style="color:white">讀取中</h2><div>',
			css : { 
				backgroundColor : 'transparent', 
				border : 'none' ,
				},
			overlayCSS:  { 
				backgroundColor: 'black', 
				opacity:         0.5, 
				cursor:          'wait' 
			    },
			bindEvents: true, 
			})
	)
})