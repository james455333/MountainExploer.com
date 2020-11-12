//新增活動
	/*$("#newActButton").on("click",function(){
		var inputs = $("#newAct").find("input")
		for(let i =0 ; i < inputs.length ; i++ ){
			let j = inputs[i].value;
			if( j.length <= 0){
				checkEmpty = false;
				break;	
			}
			checkEmpty = true;
		}
		console.log("chekcError : " + checkError)
		if(checkError && checkEmpty){
			$.ajax({
				url : actHomeURL + "/newAct",
				method : "POST",
				data : {
							memberID : $("input[name='memberID']").val(),
							routeID : $("select[name='routeID']").val(),
							title : $("input[name='title']").val(),
							price : $('input[name="price"]').val(),
							StEndDate : $("input[name='StEndDate']").val(),
							totalDay : $("input[name='totalDay']").val(),
							TopReg : $("input[name='TopReg']").val(),
							RegEndDate : $("input[name='RegEndDate']").val(),
							note : $("input[name='note']").val()
						},
				dataType : "json",
				success : function(data){
					swal({
						title: data.success,
			    		icon: "success"
					})
					var fd = new FormData();
					
					if($("input[name="files"]").val() != null){
						$.ajax({
							url : actHomeURL+"/newImg",
							method : "PSOT",
							date : {
								"actID" : data.actID,
								"files" : $("input[name="files"]").val()
							},
							datetype : 
						})
						
					}
				},
				error : function(data){
					swal("Oops! 出現錯誤了")
				},
			
			})
		}else{
			swal("尚未填寫完成或有錯誤填寫")
		}
		
		
	})*/