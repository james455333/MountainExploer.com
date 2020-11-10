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
	var nowDate = Number(new Date());
	var limitStartDate = new Date(nowDate + ((60*60*24*1000)*21)) ;
	//	活動開始~結束日期
	$('input[name="StEndDate"]').daterangepicker({
	    "showDropdowns": true,
	    "minYear": 2010,
		"maxYear": 2099,
		"maxSpan": {
			"days": 30
		},
	    "locale": {
	        "format": "YYYY/MM/DD",
	        "separator": " - ",
	        "applyLabel": "確認",
	        "cancelLabel": "取消",
	        "fromLabel": "自",
	        "toLabel": "到",
	        "customRangeLabel": "Custom",
	        "weekLabel": "W",
	         "daysOfWeek": [
	            "日",
	            "一",
	            "二",
	            "三",
	            "四",
	            "五",
	            "六"
	        ],
	        "monthNames": [
	            "一月",
	            "二月",
	            "三月",
	            "四月",
	            "五月",
	            "六月",
	            "七月",
	            "八月",
	            "九月",
	            "十月",
	            "十一月",
	            "十二月"
	        ],
	        "firstDay": 1
	    },
		"startDate": limitStartDate,
	    "minDate": limitStartDate,
	    "opens": "center"
		}, function(start, end, label) {
			//console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')');
			//console.log("Start Date : " + new Date(start))
	//		console.log("end Date : " + new Date(end))
	//		console.log("End - Start : " + Math.ceil((endDate - startDate) /  (60*60*24*1000) ))
			var startDate = new Date(start)
			var endDate = new Date(end)
			var totalDay = Math.ceil((endDate - startDate) /  (60*60*24*1000));
			if( totalDay > 1){
				$("#totalDay").val(totalDay + "天" + (totalDay-1) + "夜")
			}else{
				$("#totalDay").val("單日返還");
			}
			//	報名截止日
			var regLimit = new Date( Number(startDate) - ( (60*60*24*1000)*7 ) )
			console.log(regLimit)
			$("input[name='RegEndDate']").attr("readonly",false)
			$("input[name='RegEndDate']").daterangepicker({
			    "singleDatePicker": true,
			    "showDropdowns": true,
			    "minYear": 2010,
			    "maxYear": 2099,
			    "maxSpan": {
			        "days": 1
			    },
			    "locale": {
			        "format": "YYYY/MM/DD",
			        "separator": " - ",
			        "applyLabel": "確認",
			        "cancelLabel": "取消",
			        "fromLabel": "自",
			        "toLabel": "到",
			        "customRangeLabel": "Custom",
			        "weekLabel": "W",
			        "daysOfWeek": [
			            "日",
			            "一",
			            "二",
			            "三",
			            "四",
			            "五",
			            "六"
			        ],
			        "monthNames": [
			            "一月",
			            "二月",
			            "三月",
			            "四月",
			            "五月",
			            "六月",
			            "七月",
			            "八月",
			            "九月",
			            "十月",
			            "十一月",
			            "十二月"
			        ],
			        "firstDay": 1
			    },
				"maxDate" : regLimit,
				"minDate" : new Date(),
			    "showCustomRangeLabel": false,
			    "startDate": new Date(),
				}, function(start, end, label) {
				  console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')');
				});
	});
	
	
	
	
	
})