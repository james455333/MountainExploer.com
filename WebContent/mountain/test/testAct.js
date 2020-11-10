$(function(){
	var npFunctionURL = "/MountainExploer.com/backstage/mountain/search";
	
	
	$(window).on("load",function(){
		
		//	國家公園列表設置
				$.ajax({
					url : npFunctionURL+"/navNP",
					method : "GET",
			 		dataType: 'json',
			  		success:function(result){
						for(let i = 0 ; i < result.length ; i++){
							
							$("#nPSelect").append('<option value="' + result[i].seqno +'">' + result[i].npName + "</option>" )
							
						}
						let firstNP = $("#nPSelect").find("option").eq(0).val()
						console.log(firstNP)
						// 路線列表預設為第一筆顯示之國家公園
						$.ajax({
							url : npFunctionURL+"/navRT?nationalPark=" + firstNP,
							method : "GET",
							dataType : "json",
							success:function(data){
								//console.log(data)
								for(let i in data) $(".route").append("<option value='" + data[i].seqno + "'>" + data[i].name +"</option>")
							}
						})
					}
				})
		
	})
	//	國家公園列表Change觸發切換路線
	$("#nPSelect").on("change",function(){
		var npID = $("#nPSelect").val();
		//console.log("npID : "  + npID)
		$.ajax({
		url : npFunctionURL + "/navRT?nationalPark="+npID,
		method : "GET",
		dataType: 'json',
		success:function(data){
			//console.log(data)
			$(".route").empty()
			if(data.length != 0){
				for(let i in data) 
					$(".route").append("<option value='" + data[i].seqno + "'>" + data[i].name +"</option>")
			}else{
				$(".rtSubmit").attr("disabled",true)
				$(".npSubmit").attr("disabled",true)
			}
			
			}
		})
	})
	
	
	
	
	
})