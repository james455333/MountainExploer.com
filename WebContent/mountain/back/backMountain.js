
$(function(){
	//頁面參數
	if( typeof page === 'undefined') var page = 1;
	if( typeof showData === 'undefined') var showData = 3;
	//all MainView Ajax 
	$(window).on("load", function(){
		$.ajax({
			url:"/MountainExploer.com/backstage/search/totalData",
			method : "GET",
			success:function(data){
				var totalData = data;
				var totalPage = Math.ceil(totalData/showData);
			}
		})
		
		console.log("totalData : " + totalData)
		console.log("totalPage : " + totalPage)
		
		$.ajax({
			url : "/MountainExploer.com/backstage/search/all?page="+page+"&showData="+showData,
			method : "GET",
	 		dataType: 'json',
	  		success:function(data){
				//清空所在欄位
				$(".table").find("tbody").empty();
				
				for(let i = 0 ; i < data.length ; i++){
					$(".table").find("tbody").append(
						"<tr>" +
								"<th>" + data[i].seqno + "</th>"+
	  							"<td><div class='ajaxSmallDiv'>" + data[i].name + "</div></td>"+
	  							"<td><div class='ajaxSmallDiv'>" + data[i].npName + "</div></td>"+
								"<td>"+
									'<img src="/MountainExploer.com/backstage/search/images?seqno='+ data[i].seqno+'" class="routeImg" >'+
									'<img src="/MountainExploer.com/backstage/search/images?seqno='+ data[i].seqno+'" class="extendImg" >'+
				    			"</td>"+
	  							"<td><div class='ajaxBigDiv'>" + data[i].description + "</div></td>" +
	  							"<td><div class='ajaxBigDiv'>" + data[i].advice + "</div></td>" +
	  							"<td><div class='ajaxBigDiv'>" + data[i].traffic + "</div></td>" +
								"<td>" +
									"<div>" +
										"<form  action='/MountainExploer.com/backstage/update'>" +
											'<input type="hidden" name="seqno" value="' + data[i].seqno + '" readonly>' +
				    						'<input type="submit" value="修改">' +
										'</form>' +
									"</div>"+
									"<div>"+
										"<form class='hiddenForm' action='/MountainExploer.com/backstage/delete'>"+
											'<input type="hidden" name="seqno" value="' + data[i].seqno + '" readonly>' +
										'</form>' +
										'<input type="button" class="deleteButton" value="刪除">' +
									"</div>"+
								"</td>"+
						"</tr>"
					)
					
				}
			}
		})
	})
	// 頁面轉換
	$("#pageController").on("click","input",function(){
		var page = $(this).attr("name");
		console.log(page)
		$.ajax({
			url : "/MountainExploer.com/backstage/search/all?page="+page+"&showData="+showData,
			method : "GET",
	 		dataType: 'json',
	  		success:function(data){
				$(".table").find("tbody").empty();
				for(let i = 0 ; i < data.length ; i++){
					$(".table").find("tbody").append(
						"<tr>" +
								"<th>" + data[i].seqno + "</th>"+
	  							"<td><div class='ajaxSmallDiv'>" + data[i].name + "</div></td>"+
	  							"<td><div class='ajaxSmallDiv'>" + data[i].npName + "</div></td>"+
								"<td>"+
									'<img src="/MountainExploer.com/backstage/search/images?seqno='+ data[i].seqno+'" class="routeImg" >'+
									'<img src="/MountainExploer.com/backstage/search/images?seqno='+ data[i].seqno+'" class="extendImg" >'+
				    			"</td>"+
	  							"<td><div class='ajaxBigDiv'>" + data[i].description + "</div></td>" +
	  							"<td><div class='ajaxBigDiv'>" + data[i].advice + "</div></td>" +
	  							"<td><div class='ajaxBigDiv'>" + data[i].traffic + "</div></td>" +
								"<td>" +
									"<div>" +
										"<form  action='/MountainExploer.com/backstage/update'>" +
											'<input type="hidden" name="seqno" value="' + data[i].seqno + '" readonly>' +
				    						'<input type="submit" value="修改">' +
										'</form>' +
									"</div>"+
									"<div>"+
										"<form class='hiddenForm' action='/MountainExploer.com/backstage/delete'>"+
											'<input type="hidden" name="seqno" value="' + data[i].seqno + '" readonly>' +
										'</form>' +
										'<input type="button" class="deleteButton" value="刪除">' +
									"</div>"+
								"</td>"+
						"</tr>"
					)
					
				}
			
			
			}
		})
		
	}) 
	
		//招出刪除確認
	$(".deleteButton").on("click",function(){
		
		
		let routeID = $(this).siblings().val()
		//console.log(routeID)
		swal({
	    title: `路線編號 : ${routeID}`,
	    text: "請注意，本操作將刪除本筆資料而無法回復。\n\n\n\n\t確定要執行本操作?",
	    icon: "warning",
		dangerMode: true,
	    buttons: {
	      cancel: {
	        text: "取消",
	        visible: true
	      },
	      
	      danger: {
	        text: "確定執行刪除",
	        visible: true,
			value : true
	      },
	    },
		
	  }).then((value) => {
			if(value){
		   		$("#deleteForm").submit();
			}
	    	
	  });
		
	})
	
	//招出結果視窗
	if(result!=null){
		swal({
			title: result,
		    icon: "success"
		}
		);
	}
	
	//招出錯誤訊息
	if(errors!=null){
		swal("Oops! 出現錯誤了", errors,"errors")
	}
	
	$("#deleteCancel").on("click",function(){
		$("#deleteID").empty()
		$("#deleteBlock").css({
			"opacity" : "1",
			"pointer-events" : "auto",
		})
		$("#deleteConfirm").hide();
		
	})
	
	
	//列表切換與按鈕切換
	$("#nPSelect").on("change",function(){
		
		let thisVal = $(this).val() ;
		let npNum = $("#nPSelect").find("option").length;
		
		for(let i = 0 ; i < npNum ; i++ ){
			
			let optionVal = $("#nPSelect").find("option").eq(i).val()
			let status = $(".rtSubmit").eq(i).parent().siblings("div").find("option").length
			if(thisVal == optionVal){
				$(".scopeQuery").hide();
				$(".scopeQuery").eq(i).show();
				if(status < 1 ){
					$(".npSubmit").prop("disabled",true).val("無路線可查詢")
				}else{
					$(".npSubmit").prop("disabled",false).val("國家公園查詢")
				}
			}
		}
		
	});
	
	
	
	//滑鼠移動呈現放大圖片
	$(".table").on("mouseenter",".routeImg",function(e){
		//console.log($(this).attr("src"))
		var elm = $(this);
		console.log($(this))
		var x = e.pageX - elm.offset().left;
	    var y = e.pageY - elm.offset().top;
		//var x = event.clientX + $("body").scrollLeft();
		//var x = event.clientX;
		//console.log( 'x : ' + event.clientX)
		//var y = event.clientY + $("body").scrollTop(); 
		//var y = event.clientY; 
		//console.log( 'y : ' + event.clientY)
		$(this).siblings().show();
		
		
	}).on("mouseleave",".routeImg",function(){
		$(this).siblings().hide();
	})
	
	
	/*$(".rtSubmit").on("mouseenter",function(){
		let status = $(this).parent().siblings("div").find("option").length
		if(status <= 0){
			$(this).prop("disabled",true)
		}
	}).on("mouseleave",function(){
		$(".rtSubmit").prop("disabled",false)
	})*/
	
	//判斷
	let rtsubmit = $(".rtSubmit").length
	let npsubmit = $(".npsubmit").length
	for(let i = 0 ; i<rtsubmit ; i++){
		let status = $(".rtSubmit").eq(i).parent().siblings("div").find("option").length
		if(status <= 0){
			$(".rtSubmit").eq(i).prop("disabled",true)
		}
		
	}
	
	if($(".rtSubmit").eq(0).prop("disabled")){
		$(".npSubmit").prop("disabled",true).val("無路線可查詢")
	}
	
	
	
	
})




