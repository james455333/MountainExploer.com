	
$(function(){
	
	var npFunctionURL = "/MountainExploer.com/backstage/mountain/search";
	var actHomeURL = "/MountainExploer.com/mountain/act";
	
	$(window).on("load",function(){
		//	預設顯示
		$.ajax({
			url : actHomeURL + "/search/ajaxShow",
			method : "GET",
			data : {
				page : 1,
				showData : 3
			},
			dataType : "json",
			success : function(data){
				insertTable(data);
			},
			error : function(data){
				
			}
		})
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
							url : npFunctionURL+"/navRT",
							method : "GET",
							data : {
								nationalPark : firstNP
							},
							
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
		console.log("click button")
		checkEmpty = true;
		checkError = true;
		checkBefore()
		console.log("checkError :" + checkError)
		console.log("checkEmpty :" + checkEmpty)
		if(checkError && checkEmpty){
			let today = new Date();
			$("input[name='actInfo.postDate']").val(today)
			$("#newActForm").submit();
		}else{
			swal({
				title : "尚未填寫完成或有錯誤填寫",
				icon : "warning",
				button : "重返填寫"
				})
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
	$("input[name='actInfo.title']").on("blur",function(){
		let selectObj = $("input[name='actInfo.title']")
		$.ajax({
			url : actHomeURL + "/crud/titleTest",
			method : "GET",
			data : { title : $(this).val() },
			dataType : "json",
			success : function(data){
				check(data,selectObj)
			}
		})
		
	})
	
	
	// 檢查價格輸入
	$("input[name='actInfo.price']").on("blur",function(){
		let selectObj = $("input[name='actInfo.price']")
		$.ajax({
			url : actHomeURL + "/crud/priceTest",
			method : "GET",
			data :	{price : $(this).val()},
			dataType : "json",
			success : function(data){
				check(data,selectObj)
			}
		})
		
	})
	
	//檢查開始及結束日期輸入
	/*$("input[name='StEndDate']").on("blur",function(){
		let selectObj = $("input[name='StEndDate']")
		$.ajax({
			url : actHomeURL + "/crud/setDateTest",
			method : "GET",
			data :	{StEndDate : $(this).val()},
			dataType : "json",
			success : function(data){
				check(data,selectObj)
			}
		})
		
	})*/
	//檢查報名人數上限輸入
	$("input[name='actInfo.regTop']").on("blur",function(){
		let selectObj = $("input[name='actInfo.regTop']")
		$.ajax({
			url : actHomeURL + "/crud/topRegTest",
			method : "GET",
			data :	{TopReg : $(this).val()},
			dataType : "json",
			success : function(data){
				check(data,selectObj)
			}
		})
		
	})
	//限制圖片上傳個數<5
	$("input[type='file']").on("change",function(){
		let countFile = $(this).get(0).files.length 
		if ( countFile > 5){
			$(this).val("");
			swal("上傳圖片不得大於五張", "請重新選擇", "error");
		}
		
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
	$("#imgForm").submit(function(e){
		$.ajax({
			url: "/MountainExploer.com/mountain/act/crud/newImg",
		    type: 'POST',
		    data:  new FormData( this ),
		    processData: false,
		    contentType: false,
			success : function(){
				swal({
					title: "新增成功",
				    icon: "success"
					})
				},
			error : function(data){
				if(data != null){
					swal("Oops! 出現錯誤囉", "活動資料新增成功，但圖片上傳失敗。\n錯誤原因 : \n"+data, "error")	
				}else{
					swal("Oops! 出現錯誤囉", "活動資料新增成功，但圖片上傳失敗。\n請到'活動管理->編輯活動圖片'重新上傳", "error")
					}
				}
			 });
	   		e.preventDefault();
		})
	$("#newActForm").submit(function(e){
		$.ajax({
			url : actHomeURL + "/crud/newAct",
			method : "POST",
			data :  new FormData( this ),
			processData: false,
		    contentType: "application/json",
			success : function(data){
				console.log(typeof data.error)
				if( !(typeof data.error == undefined)){
					let actID = data.actID;
				}else{
					swal("Oops! 出現錯誤囉", data.error, "error")
				}
			},
			error : function(data){
				swal("Oops! 出現錯誤囉", "送出命令出現錯誤", "error")
			},
			
		})
		e.preventDefault();
	})
	
	//顯示插入
	function insertTable(data){
		for(let i in data){
			$("#showActList").append(
				"<tbody>" +
					"<tr>" +
						"<td>" +
							"<img class='showImage' src='" + actHomeURL +"/search/images?actID=" + data[i].actID +"'>" +
							"<img class='extendImage' src='" + actHomeURL +"/search/images?actID=" + data[i].actID +"'>" +
						"</td>" +
						"<td>" +
							setTag(data[i].tag) + data[i].title + " / " + data[i].price + " / " + data[i].totalDay + " / " + data[i].startDate + " ~ " + data[i].endDate +
						"</td>" +
						"<td>" +
							data[i].postDate + " / " + data[i].authorName +
						"</td>" +
						"<td>" +
							data[i].nowReg + " / " + data[i].topReg +
						"</td>" +
						"<td>" +
							data[i].regEndDate +
						"</td>" +
					"</tr>" +
				"</tbody>"
			)
			
		}
		
	}
	//滑鼠移動呈現放大圖片
	$("#showActList").on("mouseenter",".showImage",function(e){
		//console.log($(this).attr("src"))
		var elm = $(this);
	//	console.log($(this))
		var x = e.pageX - elm.offset().left;
	    var y = e.pageY - elm.offset().top;
		//var x = event.clientX + $("body").scrollLeft();
		//var x = event.clientX;
		//console.log( 'x : ' + event.clientX)
		//var y = event.clientY + $("body").scrollTop(); 
		//var y = event.clientY; 
		//console.log( 'y : ' + event.clientY)
		$(this).siblings().show();
		
		
	}).on("mouseleave",".showImage",function(){
		$(this).siblings().hide();
	})
	
	function checkBefore(){
		var inputs = $("#newAct").find("input")
			for(let i =0 ; i < inputs.length ; i++ ){
				let j = inputs[i].value;
				if( j.length <= 0){
					console.log("No."+i+" : " + j)
					checkEmpty = false;
					break;	
				}
			}
			
			var errorArray = $("#newAct").find(".errorSpan")
			//console.log(errorArray)
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
	}
	
		
})	
function setTag(tag){
		let result = "<div class='tagContainer'>";
		console.log(tag[3])
		if( !tag[3] ){
			
			if( tag[1] ){
				result += ("<div class='actTag'>")
				result += ("新活動")	
				result += ("</div>")	
			}
			if( tag[2] ){
				result += ("<div class='actTag'>")
				result += ("熱門活動")	
				result += ("</div>")
			}
			if( !tag[4] ){
				if( !tag[5] ){
					if( tag[6] ){
						result += ("<div class='regTag'>")
						result += ("尚可報名")	
						result += ("</div>")
					}
					if( tag[7] ){
						result += ("<div class='regTag'>")
						result += ("報名將截止")	
						result += ("</div>")
					}
					if( tag[8] ){
						result += ("<div class='regTag'>")
						result += ("報名將滿")	
						result += ("</div>")
					}
				}else{
				result += ("<div class='regTag'>")
				result += ("報名已滿")	
				result += ("</div>")
				}
			}else{
				result += ("<div class='regTag'>")
				result += ("報名截止")	
				result += ("</div>")
			}
			
		}else{
			result += ("<div class='actTag'>")	
			result += ("歷史活動")	
			result += ("</div>")	
		}
		
		result += ("</div>");
	//	console.log( result )
		return result;
	}
	/*url : actHomeURL + "/crud/newAct",
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
					let actID = data.actID;
					$("#imgForm").find("input[name='actID']").val(actID)
					$("#imgForm").submit();
				},
				error : function(data){
					swal("Oops! 出現錯誤囉", "新增活動出現錯誤", "error")
				},*/
			
