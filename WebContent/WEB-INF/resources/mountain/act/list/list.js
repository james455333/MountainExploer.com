	
$(function(){
	/*	依照頁面命令變數值(od)，給予呼叫的函式相應的參數	*/
	if(od == 1){
		activeMainAjax(page,"/defaultAS");			
	}
	if(od == 2){
		activeMainAjax(page,"/tagAS");		
		setSelectOption();	
	}
	if(od == 3){
		activeMainAjax(page,"/searchAS");	
	}

	/* 掛載活動狀態標籤查詢方法，讓點擊選單選項執行查詢函式 */
	$("select[name='aTag']").on("change",function(){
		activeTagAS( $(this).val() );
	})
	
	/* 掛報名狀態標籤查詢方法，讓點擊選單選項執行查詢函式 */
	$("select[name='rTag']").on("change",function(){
		activeTagAS( $(this).val() );
	})
	
	/* 掛載輸入名稱查詢，讓按鈕被點擊時，執行名稱查詢函式 */
	$(".search").find("button").on("click",function(){
		$("#m-sr-form").submit();
	})
	
	/* 透過事件發生座標與發生所在元素座標組合，讓滑鼠滑入可以顯現大圖於旁 */
	$(".order-table").on("mouseenter",".showImage",function(e){
		var elm = $(this);
		var x = e.pageX - elm.offset().left;
	    var y = e.pageY - elm.offset().top;
		$(this).siblings().show();
	}).on("mouseleave",".showImage",function(){
		$(this).siblings().hide();
	})
	
})
	/*
//		函式 : 取得指定位置的元素進行條件檢查，並設定參數Boolean值
	function checkBefore(){
		var inputs = $("#newAct").find("input")
			for(let i =0 ; i < inputs.length ; i++ ){
				let j = inputs[i].value;
				if( j.length <= 0){
					checkEmpty = false;
					break;	
				}
			}
			var errorArray = $("#newAct").find(".errorSpan")
			for(let i = 0 ; i < errorArray.length ; i++){
				let j = $("#newAct").find(".errorSpan").eq(i).html();
				if(j.length > 0){
					checkError = false;
				}
			}
		
	}
	*/
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
			
