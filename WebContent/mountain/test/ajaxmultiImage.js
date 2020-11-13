
$(function(){
	
	var actHomeURL = "/MountainExploer.com/mountain/test/crud";
	$("#imgForm").submit(function(e){
		
		$.ajax({
			url: actHomeURL+"/newImg",
	    	type: 'POST',
	     	data: new FormData( this ),
	     	processData: false,
	     	contentType: false,
			success : function(data){
				
			},
			error : function(data){
				
			}
		 });
   		e.preventDefault();
	})
	
})



