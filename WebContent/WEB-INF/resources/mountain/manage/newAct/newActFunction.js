
function setDefaultRouteSelect( thisElm ){
	let npSelect = thisElm.find("select[id='npSelect']")	
	
	$.ajax({
		url : mountainHome + "/np",
		type : "GET",
		dataType : "json",
		success : function(data){
				console.log(data)
			for(let i in data){
				let npOption = npSelect.find(".hideOP").clone()
				npOption.html(data[i].name).val(data[i].id)
						.removeClass("hideOP")
				if(i==0){
					npOption.attr("selected",true)
					setRouteSelect(data[i].id);
				} 
					
				npSelect.append(npOption)
			}
			npSelect.selectpicker('refresh');

		},
		error : function(){
			swal("查詢國家公園出現錯誤", "請聯絡管理員", "error")
		}
	})
	
		
}

function changeRtOption(){
	$("#rtSelect").find(".hideOP").siblings("option").remove()
	setRouteSelect($(this).val())
}
function changeRtDesp(){
	let rtID = $(this).val()
	$.ajax({
		url : mountainHome + "/rt",
		data : { rtID : rtID},
		dataType : "json",
		type : "GET",
		success : function(data){
			setRouteDesp(data[0].routeInfo)
		}
	})
}


function setRouteSelect(npID){
	let rtSelect = $("#rtSelect")
	
	$.ajax({
		url : mountainHome + "/rt",
		data : { npID : npID},
		dataType : "json",
		type : "GET",
		success : function(data){
			let random
			while(true){
				random = Math.round(Math.random()*data.length)
				if(random >= 0 && random < data.length) break;				
			}
			for(let i in data){
				let rtOption = rtSelect.find(".hideOP").clone()
				rtOption.html(data[i].routeInfo.name).val(data[i].id)
						.removeClass("hideOP")
				
				if(i==random){
					rtOption.attr("selected", true)
					setRouteDesp(data[i].routeInfo)
				} 
				rtSelect.append(rtOption)
			}
			rtSelect.selectpicker('refresh')
		}
	})
	
}

function setRouteDesp(routeInfo){
	$(".route-desp-body").html(routeInfo.desp)
}

function ajaxNewAct(form){
	let formData = new FormData(form)
	let data = CKEDITOR.instances.note.getData()
	formData.set("actInfo.note",data)
	console.log(formData)
	$.ajax({
		url : actCRUDHome + "/newAct",
		type : "POST",
		data : formData,
		processData: false,
	    contentType: false,
		dataType: "json",
		success : function(data){
			if(data.hasOwnProperty("success")){
				swal({
					title : "發表活動成功",
					text : "新發表活動編號 : " + data.actID + "\n\n跳轉至該篇活動詳情頁面",
					icon : "success",
					buttons : {
						confirm :{
							text : "前往活動詳情頁面",
							visible : true,
							value : true
						}
					}
					}).then(() => {
						let goto = detailHome + "page=1&actID=" + data.actID
						window.location.assign(goto)
				})
			}else{
				swal("發表活動失敗","請聯絡管理員","error")
			}
		},
		error : function(){
			swal("發表活動失敗","請聯絡管理員","error")
		}
	})
}


/* 圖片預覽 */
function readURL(input){
	if (input.files && input.files.length >= 0) {
		for(var i = 0; i < input.files.length; i ++){
			var reader = new FileReader();
			reader.onload = function (e) {
				var img = '<div class="newAct-img-container"><img class="showImage" src="' + e.target.result + '">'
				 + '<img class="extendImage" src="' + e.target.result + '"></div>';
				$("#previewMultiple").append(img);
			}
			reader.readAsDataURL(input.files[i]);
		}
	}else{
	var noPictures = $("<p>目前沒有圖片</p>");
	$("#previewMultiple").append(noPictures);
	}

}

/*	日期選單設定 */
function setDatePicker(thisElm){
	thisElm.find("input[name='actInfo.totalDay']").val("單日返還");
	let today = new Date();
	let startDate ;
	let limitStartDay = new Date(Number(today) + (60*60*24*1000)*14) 
	thisElm.find('input[name="actInfo.startDate"]').daterangepicker({
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
		"startDate": limitStartDay,
		"endDate" : limitStartDay,
	    "minDate": limitStartDay,
	    "opens": "center"
		}, function(start) {
			startDate = new Date(start)
			thisElm.find("input[name='actInfo.totalDay']").val("單日返還");
			thisElm.find("input[name='actInfo.endDate']").daterangepicker({
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
				var totalDay = Math.ceil((endDate - startDate)*1.0 /  (60*60*24*1000))+1;
				if( totalDay > 1){
					thisElm.find("input[name='actInfo.totalDay']").val(totalDay + "天" + (totalDay-1) + "夜")
				}else{
					thisElm.find("input[name='actInfo.totalDay']").val("單日返還");
				}
				//	報名截止日
				var regLimit = new Date( Number(startDate) - ( (60*60*24*1000)*7 ) )
				//console.log(regLimit)
				thisElm.find("input[name='actInfo.regEndDate']").daterangepicker({
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
					"minDate" : today,
					"maxDate" : regLimit,
					}, function(end) {
						
					});
			})
	});
	thisElm.find("input[name='actInfo.endDate']").daterangepicker({
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
				"startDate": limitStartDay,
				"endDate" : limitStartDay,
			    "minDate": limitStartDay,
			    "opens": "center"
			},function(end){
				var endDate = new Date(end)
				let startDay = new Date( $("input[name='actInfo.startDate']").val() )
				var totalDay = Math.ceil((endDate - startDay)*1.0 /  (60*60*24*1000))+1;
				if( totalDay > 1){
					thisElm.find("input[name='actInfo.totalDay']").val(totalDay + "天" + (totalDay-1) + "夜")
				}else{
					thisElm.find("input[name='actInfo.totalDay']").val("單日返還");
				}
			});
			
	let regLimit = new Date( Number(limitStartDay) - ( (60*60*24*1000)*7 ) )
	thisElm.find("input[name='actInfo.regEndDate']").daterangepicker({
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
		"startDate" : today,
		"endDate" : today,
		"minDate" : today,
		"maxDate" : regLimit
		}, function(start, end, label) {
		});
	originSD = $("input[name='actInfo.startDate']").val()		    
}

function autoNewAct(){
	
	let thisForm = $(".newAct-form")
	/* title */
	let title = thisForm.find("input[name='actInfo.title']")
	let titleTextArray = [ '登高一探無雲處', '天處一方似無常', '蔥蔥無徑參天路', '遠炊誰人家', '橫看成嶺側成峰', '遠近高低各不同', '不適廬山真面目', '只緣身在此山中', '天若有情天亦老', '月若無恨月長圓']
	let random1;
	while(true){
		random1 = Math.round(Math.random()*10)
		if(random1 < 10) break;
	}
	title.val(titleTextArray[random1])
	/* price */
	let price = thisForm.find("input[name='actInfo.price']")
	let randomPrice;
	randomPrice = Math.round(Math.random()*10000) + Math.round(Math.random()*1000) + Math.round(Math.random()*100)
	price.val(randomPrice)
	
	/* npSelect */
	
	let npOptions = $("#npSelect").find("option")
	while(true){
		let randomNp = Math.round(Math.random()*(npOptions.length))
		if( randomNp < npOptions.length && randomNp >= 1 ){
			console.log(npOptions)
			console.log(randomNp)
			npOptions.eq(randomNp).attr("selected",true).siblings("option").attr("selected",false)
			$("#npSelect").selectpicker('refresh')
			$("#rtSelect").find(".hideOP").siblings("option").remove()
			console.log("npOptions.eq(randomNp).val() : " + npOptions.eq(randomNp).val())
			setRouteSelect(npOptions.eq(randomNp).val())
			break;
		}
	}
	
	console.log(originSD)
	let sdoArray = originSD.split("/")
	let year =  Math.round( Number(sdoArray[0])+ Math.random())
	console.log(year)
	let month, day;
	while(true){
		if(year > Number(sdoArray[0])){
			month = Math.round(Math.random()*120)
			if(month >= 1 && month <= 12) break;			
		}else{
			month = Math.round(Math.random()*120)
			if(month >= Number(sdoArray[1]) && month <= 12) break;
		}
	}
	while(true){
		if(year > Number(sdoArray[0])){
			day = Math.round(Math.random()*31)
			if(day>=1 && day <= 31) break;
		}else{
			day = Math.round(Math.random()*31)
			if(day>=Number(sdoArray[2]) && day <= 31) break;
		}
	}
	let setStartDate = year + "/" + month + "/" +day
	$("input[name='actInfo.startDate']").data('daterangepicker').setStartDate(setStartDate);
	let randomTotalDay = Math.round(Math.random()*3)
	if( randomTotalDay>0){
		$("input[name='actInfo.totalDay']").val( (randomTotalDay+1) + "天" + randomTotalDay + "夜" )
	}else{
		$("input[name='actInfo.totalDay']").val( "單日返還" )
	}
//	let setEndDate = year + "/" + month + "/" + (day+randomTotalDay)
	let setEndDate = new Date(year,month-1,(day+randomTotalDay))
	$("input[name='actInfo.endDate']").data('daterangepicker').setStartDate(setEndDate);
	let setRegEndDate = new Date(year,month-1,(day-7))
	$("input[name='actInfo.regEndDate']").val(setRegEndDate.toLocaleDateString());
	$("input[name='actInfo.regTop']").val( Math.round( Math.random()*15 ) )
}


function activeAnimate(){
	
	$("#titleContainer").toggleClass("d-none animate__fadeInTopRight")
	setTimeout(()=>{
		$("#form-container").toggleClass("d-none animate__lightSpeedInRight")
	},500)
	
}



