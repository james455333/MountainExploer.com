	
$(function(){
	
	var npFunctionURL = "/MountainExploer.com/backstage/mountain/search";
	var actHomeURL = "/MountainExploer.com/mountain/test";
	
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
						//console.log(firstNP)
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
	//新增活動
	$("#newActButton").on("click",function(){
		var checkEmpty = true;
		var checkError = true;
		var inputs = $("#newAct").find("input")
		for(let i =0 ; i < inputs.length ; i++ ){
			let j = inputs[i].value;
			if( j.length <= 0){
				console.log("No."+i+" : " + j)
				checkEmpty = false;
				break;	
			}
			checkEmpty = true;
		}
		
		var errorArray = $("#newAct").find(".errorSpan")
		console.log(errorArray)
		for(let i = 0 ; i < errorArray.length ; i++){
			let j = $("#newAct").find(".errorSpan").eq(i).html();
			console.log("No."+i+" : " + j)
			if(j.length > 0){
				console.log("No."+i+" : " + j.length)
				checkError = false;
			}
		}
		console.log("checkError :" + checkError)
		console.log("checkEmpty :" + checkEmpty)
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
					
					/*if($("input[name="files"]").val() != null){
						$.ajax({
							url : actHomeURL+"/newImg",
							method : "PSOT",
							date : {
								"actID" : data.actID,
								"files" : $("input[name="files"]").val()
							},
							datetype : 
						})
						
					}*/
				},
				error : function(data){
					swal("Oops! 出現錯誤了")
				},
			
			})
		}else{
			swal("尚未填寫完成或有錯誤填寫")
		}
		
		
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
	
	//檢查名稱輸入
	$("input[name='title']").on("blur",function(){
		let selectObj = $("input[name='title']")
		$.ajax({
			url : actHomeURL + "/titleTest",
			method : "GET",
			data : {title : $(this).val()},
			dataType : "json",
			success : function(data){
				check(data,selectObj)
			}
		})
		
	})
	
	
	// 檢查價格輸入
	$("input[name='price']").on("blur",function(){
		let selectObj = $("input[name='price']")
		$.ajax({
			url : actHomeURL + "/priceTest",
			method : "GET",
			data :	{price : $(this).val()},
			dataType : "json",
			success : function(data){
				check(data,selectObj)
			}
		})
		
	})
	
	//檢查開始及結束日期輸入
	$("input[name='StEndDate']").on("blur",function(){
		let selectObj = $("input[name='StEndDate']")
		$.ajax({
			url : actHomeURL + "/seDateTest",
			method : "GET",
			data :	{StEndDate : $(this).val()},
			dataType : "json",
			success : function(data){
				check(data,selectObj)
			}
		})
		
	})
	//檢查報名人數上限輸入
	$("input[name='TopReg']").on("blur",function(){
		let selectObj = $("input[name='TopReg']")
		$.ajax({
			url : actHomeURL + "/topRegTest",
			method : "GET",
			data :	{TopReg : $(this).val()},
			dataType : "json",
			success : function(data){
				check(data,selectObj)
			}
		})
		
	})
	
	function check(data,selectObj){
		if(data.hasOwnProperty("error")){
			selectObj.siblings(".correctSpan").empty();
			selectObj.siblings(".errorSpan").html(data.error);
		}else{
			selectObj.siblings(".errorSpan").empty();
			selectObj.siblings(".correctSpan").html("<img src='../images/check.png'>")
		}
	}
	
})	