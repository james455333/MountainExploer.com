
$(function(){
	//頁面參數
	var page = 1;
	if(typeof showData === 'undefined') var showData = 3;
	console.log("123")
	var totalPage = 0;
	//統一網域名稱設置
	var homeUrl = "/MountainExploer.com/backstage/mountain/search";
	
	
	//	預設頁面
	$(window).on("load", function(){
		//查找資料庫路線總筆數
		$.ajax({
			url: homeUrl+"/totalData",
			method : "GET",
			success:function(data){
				var totalData = data;
				totalPage = Math.ceil(totalData/showData);
				$("#totalData").html(data)
				/*console.log("totalData : " + totalData)
				console.log("totalPage : " + totalPage)*/
				
				// 預設顯示資料
				$.ajax({
					url : homeUrl+"/all?page="+page+"&showData="+showData,
					method : "GET",
			 		dataType: 'json',
			  		success:function(data){
						//	使用回覆方法
						insertTable(data);
						//	預設第一頁
						$("#pageNo").html(page + ' / ' +totalPage)
						if(page>1){
							$("#firstPage").attr("name",1).attr("disabled",false)
							$("#previousPage").attr("name",Number(page)-1).attr("disabled",false)
						}
						if(page<totalPage){
							console.log(page)
							$("#nextPage").attr("name",(Number(page)+1)).attr("disabled",false)
							$("#lastPage").attr("name",totalPage).attr("disabled",false)
						}
					}
				})
				//	國家公園列表設置
				$.ajax({
					url : homeUrl + "/navNP",
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
							url : homeUrl + "/navRT?nationalPark=" + firstNP,
							method : "GET",
							dataType : "json",
							success:function(data){
								//console.log(data)
								for(let i in data) $(".route").append("<option value='" + data[i].seqno + "'>" + data[i].name +"</option>")
							}
						})
					}
				})
				//設置頁面控制按鈕點擊方法
				$("#pageController").on("click","input",function(){
					var page = Number($(this).attr("name"));
					console.log("page Before Click : " + page)
					$.ajax({
						url : homeUrl + "/all?page="+page+"&showData="+showData,
						method : "GET",
				 		dataType: 'json',
				  		success:function(data){
							//變換顯示之資料
							insertTable(data);
							//設定按鈕
							setPageController(page)
						}
					})
					
				}) 
				
			}
		})
		
	})
	//	國家公園列表Change觸發切換路線
	$("#nPSelect").on("change",function(){
		var npID = $("#nPSelect").val();
		//console.log("npID : "  + npID)
		$.ajax({
		url : homeUrl + "/navRT?nationalPark="+npID,
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
	
	// 國家公園查詢
	$(".npSubmit").on("click",function(){
		page = 1;
		//console.log("show : " + showData + "\tpage : " + page)
		let npID = $("#nPSelect").val();
		//console.log(npID);
		$.ajax({
			url: homeUrl+ "/totalData?nationalPark="+npID,
			method : "GET",
			success:function(data){
				totalData = data;
				$("#totalData").html(data)
				//console.log("np query TotalData : " + data )
				totalPage = Math.ceil(totalData/showData);
				//console.log("np query TotalPage : " + totalPage)
				$.ajax({
					url : homeUrl + "/navNP?nationalPark=" + npID+"&showData="+showData ,
					method : "GET",
					dataType : "json",
					success : function(data){
						
						insertTable(data);
						setPageController(page)
					}
					
				})
				$("#pageController").off("click","input")
				$("#pageController").on("click","input",function(){
					var page = Number($(this).attr("name"));
					//console.log("page Before Click : " + page)
					$.ajax({
					url : homeUrl + "/navNP?nationalPark=" + npID+"&showData="+showData+"&page="+page ,
					method : "GET",
					dataType : "json",
					success : function(data){
						
						insertTable(data);
						setPageController(page)
					}
					
					})
				})
			}
		})
		
		
	})
	
	// 路線單筆查詢
	$(".rtSubmit").on("click",function(){
		var routeID = $(".route").val()
		//console.log("routeID = " + routeID)
		$.ajax({
			url : homeUrl + "/navRT?route="+routeID,
			method : "GET",
			dataTpye : "json",
			success : function(data){
				$("#pageNo").html(1 + ' / ' +1)
				$("#pageController").find("input").attr("disabled",true)
				$("#totalData").html(1)
				insertTable(data);
			}
		})
		
	})
	
	//更換顯示
	$("#changeShowData").on("click",function(){
		showData = $("#showData").val();
		console.log(showData);
	})
	
	//查詢結果回覆新增表格
	function insertTable(data){
		$(".table").find("tbody").empty();
		for( let i in data){
			$(".table").find("tbody").append(
				"<tr>" +
					"<th>" + data[i].seqno + "</th>"+
			  		"<td><div class='ajaxSmallDiv'>" + data[i].name + "</div></td>"+
			  		"<td><div class='ajaxSmallDiv'>" + data[i].npName + "</div></td>"+
					"<td>"+
						'<img src="/MountainExploer.com/backstage/mountain/search/images?seqno='+ data[i].seqno+'" class="routeImg" >'+
						'<img src="/MountainExploer.com/backstage/mountain/search/images?seqno='+ data[i].seqno+'" class="extendImg" >'+
					"</td>"+
			  		"<td><div class='ajaxBigDiv'>" + data[i].description + "</div></td>" +
			  		"<td><div class='ajaxBigDiv'>" + data[i].advice + "</div></td>" +
			  		"<td><div class='ajaxBigDiv'>" + data[i].traffic + "</div></td>" +
					"<td>" +
						"<div>" +
							"<form  action='" +homeUrl+"/updateDataPage'>" +
								'<input type="hidden" name="seqno" value="' + data[i].seqno + '" readonly>' +
						    	'<input type="submit" value="修改">' +
							'</form>' +
						"</div>"+
						"<div>"+
							"<form class='hiddenForm' action='/MountainExploer.com/backsatage/mountain/deleteData'>"+
								'<input type="hidden" name="seqno" value="' + data[i].seqno + '" readonly>' +
							'</form>' +
							'<input class="deleteButton" type="button"  value="刪除">' +
						"</div>"+
					"</td>"+
				"</tr>"
			)
		} 
	}
	
	function setPageController(page){
		
		if(page>1){
			$("#pageNo").html(page + ' / ' +totalPage)
		}else if(page == 1){
			$("#pageNo").html(page + ' / ' +totalPage)
		}
		$("#pageController").find("input").attr("disabled",true)
		if(page>1){
			$("#firstPage").attr("name",1).attr("disabled",false)
			$("#previousPage").attr("name",page-1).attr("disabled",false)
		}
		if(page<totalPage){
			$("#nextPage").attr("name",page+1).attr("disabled",false)
			$("#lastPage").attr("name",totalPage).attr("disabled",false)
		}
	}
	
	
		//招出刪除確認
	$(".table").on("click",".deleteButton",function(){
		
		
		let routeID = $(this).siblings().val();
		let formObj = $(this).siblings("form")
		console.log(formObj);
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
		   		formObj.submit();
			}
	    	
	  });
		
	})
	
	//招出結果視窗
	if(result!=null){
		swal({
			title: result,
		    icon: "success"
		});
	}
	
	//招出錯誤訊息
	if(errors!=null){
		swal("Oops! 出現錯誤了", errors,"error")
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
/*	$("#nPSelect").on("change",function(){
		
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
*/	
	
	
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
/*	
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
	
*/	
	
	
})




