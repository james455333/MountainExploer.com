
$(function(){
	
	var actHomeURL = "/MountainExploer.com/mountain/test/crud";
	console.log( actHomeURL+"/newImg")
	$("#imgForm").submit(function(e){
		
		$.ajax({
			url: actHomeURL+"/newImg",
	    	type: 'POST',
	     	data: new FormData( this ),
	     	processData: false,
	     	contentType: false
		 });
   		e.preventDefault();
	})
	
})



