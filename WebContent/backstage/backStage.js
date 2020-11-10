$(function(){
	if(errors!=null){
		swal("Oops! 出現錯誤了", errors,"error")
	}
	
	if(result!=null){
		swal({
			title: result,
		    icon: "success"
		}
		);
	}	
	
})


