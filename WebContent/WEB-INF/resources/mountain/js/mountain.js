
$(function(){
	
	$(document).ajaxStop(function(){
		setTimeout($.unblockUI,500)
	}); 
	
	$(document).ajaxStart(
		$.blockUI({ 
			message: '<div><img src="/MountainExploer.com/images/loading.gif" /><h2>讀取中</h2><div>',
			css : { 
				backgroundColor : 'transparent', 
				border : 'none' ,
				},
			overlayCSS:  { 
				backgroundColor: 'white', 
				opacity:         1, 
				cursor:          'wait' 
			    },
			bindEvents: true, 
			})
	)
	
	
})



/*	日期編譯 */
function dateFormate(date) {
	let result = "";
	result = result.concat(new Date(date).toLocaleDateString())
		.concat(" " + new Date(date).toLocaleTimeString())

	return result;
}

