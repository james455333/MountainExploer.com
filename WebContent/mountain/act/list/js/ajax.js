	
$(function(){
	
	var npFunctionURL = "/MountainExploer.com/backstage/mountain/search";
	var actHomeURL = "/MountainExploer.com/mountain/act";
	
	$(window).on("load",function(){
		//	預設顯示
		$.ajax({
			url : actHomeURL + "/search/ajaxShow",
			method : "GET",
			/*data : {
				page : 1,
				showData : 10
			},*/
			dataType : "json",
			success : function(data){
				insertTable(data);
			},
			error : function(data){
				
			}
		})
	})
	
	//顯示插入
	function insertTable(data){
		for(let i in data){
			$(".order-table").append(
				"<tbody  class='order-table-tb'>" +
					"<tr>" +
						"<td>" +
							"<img class='showImage' src='" + actHomeURL +"/search/images?actID=" + data[i].actID +"'>" +
							"<img class='extendImage' src='" + actHomeURL +"/search/images?actID=" + data[i].actID +"'>" +
						"</td>" +
						"<td>" +
							setTag(data[i].tag) + data[i].title + " / " + data[i].price + " / " + data[i].totalDay + " / " + data[i].startDate + " ~ " + data[i].endDate +
						"</td>" +
						"<td>" +
							data[i].postDate + " / <br>" + data[i].authorName +
						"</td>" +
						"<td>" +
							data[i].nowReg + " / " + data[i].topReg +
						"</td>" +
						"<td>" +
							data[i].regEndDate +
						"</td>" +
						"<td>" +
							
						"</td>" +
						
					"</tr>" +
				"</tbody>"
			)
			
		}
		
	}
	//滑鼠移動呈現放大圖片
	$(".order-table").on("mouseenter",".showImage",function(e){
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
			
