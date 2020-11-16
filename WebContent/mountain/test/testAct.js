$(function(){
	
	
	var nowDate = Number(new Date());
	var limitStartDate = new Date(nowDate + ((60*60*24*1000)*21)) ;
	//	活動開始~結束日期
	$('input[name="actInfo.startDate"]').daterangepicker({
		"singleDatePicker": true,
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
		"endDate" : limitStartDate,
	    "minDate": limitStartDate,
	    "opens": "center"
		}, function(start) {
			//console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')');
			//console.log("Start Date : " + new Date(start))
	//		console.log("end Date : " + new Date(end))
	//		console.log("End - Start : " + Math.ceil((endDate - startDate) /  (60*60*24*1000) ))
			var startDate = new Date(start)
			console.log("startDate : " + startDate)
			$("input[name='actInfo.endDate']").daterangepicker({
				"singleDatePicker": true,
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
				"startDate": startDate,
				"endDate" : startDate,
			    "minDate": startDate,
			    "opens": "center"
			},function(end){
				var endDate = new Date(end)
				console.log("endDate : " + endDate)
				var totalDay = Math.ceil((endDate - startDate)*1.0 /  (60*60*24*1000))+1;
				console.log("s-e /one= " + totalDay )
				if( totalDay > 1){
					$("#totalDay").val(totalDay + "天" + (totalDay-1) + "夜")
				}else{
					$("#totalDay").val("單日返還");
				}
				//	報名截止日
				var regLimit = new Date( Number(startDate) - ( (60*60*24*1000)*7 ) )
				//console.log(regLimit)
				$("input[name='actInfo.regEndDate']").daterangepicker({
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
					});
			})
	});
	$("input[name='actInfo.endDate']").daterangepicker({
				"singleDatePicker": true,
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
				"endDate" : limitStartDate,
			    "minDate": limitStartDate,
			    "opens": "center"
			});
	
	
	
	
})