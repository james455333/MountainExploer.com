
function setDefaultRouteSelect( thisElm ){
	let npSelect = thisElm.find("select[id='npSelect']")	
	
	$.ajax({
		url : mountainHome + "/np",
		type : "GET",
		dataType : "json",
		success : function(data){
			for(let i in data){
				let npOption = npSelect.find(".hideOP").clone()
				npOption.html(data[i].name).val(data[i].id)
						.removeClass("hideOP")
				if(data[i].id==npID){
					npOption.attr("selected",true)
					setRouteSelect(npID);
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
		success : function(result){
//			console.log(data.length)
			for(let j =0 ; j < result.length ; j++){
				let routeInfo = result[j].routeInfo
				let rtOption = rtSelect.find(".hideOP").clone()
				rtOption.html(routeInfo.name).val(result[j].id)
						.removeClass("hideOP")
				if(result[j].id == rtID){
					rtOption.attr("selected", true)
					rtOption.siblings("option").attr("selected",false)
					setRouteDesp(result[j].routeInfo)
				} else if(j==0){
					rtOption.attr("selected", true)
					setRouteDesp(result[j].routeInfo)
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

function ajaxUpdateAct(form){
	let formData = new FormData(form)
	let data = CKEDITOR.instances.note.getData()
	formData.set("actInfo.note",data)
	console.log(formData)
	$.ajax({
		url : actCRUDHome + "/updateAct." + actID,
		type : "Post",
		data : formData,
		processData: false,
	    contentType: false,
		dataType: "json",
		success : function(data){
			if(data.hasOwnProperty("success")){
				swal({
					title : "新增活動成功",
					text : "活動編號 : " + data.actID + "\n\n跳轉至該篇活動詳情頁面",
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
				swal("新增活動失敗","請聯絡管理員","error")
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
	thisElm.find("input[name='actInfo.totalDay']").val(defaultTD);
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
	$("input[name='actInfo.startDate']").val(defaultSD.toLocaleDateString())		    
	$("input[name='actInfo.totalDay']").val(defaultTD)		    
	$("input[name='actInfo.endDate']").val(defaultED.toLocaleDateString())		    
	$("input[name='actInfo.regEndDate']").val(defaultRED.toLocaleDateString())		    
}

function setActInfo(){
	
	$.ajax({
		url : actCRUDHome + "/act-update." + actID,
		type : "GET",
		dataType : "json",
		success : function(data){
			if( !data.hasOwnProperty('error')){
				setBasicInfo(data)	
				setRouteDefault(data)
				setDateDefault(data)
				setRegInfo(data)
				setImgInfo(data)
				setNoteInfo(data)
			}
		}
	})
	
}

function setBasicInfo(data){
	$("input[name='actInfo.title']").val(data.actInfo.title)
	$("input[name='actInfo.price']").val(data.actInfo.price)
}
function setRouteDefault(data){
	
	let actInfo = data.actInfo
	npID = data.npID;
	rtID = actInfo.rtBasic.id
	setDefaultRouteSelect( $("#newAct-form") )
}
function setDateDefault(data){
	$("#npSelect").find(".hideOP").siblings("option").remove()
	$("#rtSelect").find(".hideOP").siblings("option").remove()
	let actInfo = data.actInfo
	defaultSD = new Date(actInfo.startDate)
	defaultED = new Date(actInfo.endDate)
	defaultTD = actInfo.totalDay
	defaultRED = new Date(actInfo.regEndDate)
	setDatePicker($("#newAct-form"),data)
}
function setRegInfo(data){
	$("input[name='actInfo.regTop']").val(data.actInfo.regTop)
}
function setImgInfo(data){
//	$("#img-container").remove()
	let originImages = data.actImage
	let baseURL = '/MountainExploer.com/mountain/act/crud/images?seqno='
	for (let i in originImages){
		
		let model = $(".hideElm").clone()
		model.find("a").attr({
			"data-fancybox":'gallery',
			"href" : baseURL+ originImages[i].seqno
		})
		.find("img").attr("src",baseURL+ originImages[i].seqno)
		model.removeClass("hideElm")
		if( originImages[i].defaultImage != null ){
			model.css("border","3px solid #551b96")
			model.find("img").attr("title",'(預設圖)\n\n點擊放大')
			model.find(".btn-img-default").remove()
		}
		$("#previewMultiple").append(model)
	}
	$('[data-toggle="tooltip"]').tooltip();
	
}
function setNoteInfo(data){
	
	CKEDITOR.instances.note.setData(data.actInfo.addInfo)
}

function activeAnimate(){
	
	$("#titleContainer").toggleClass("d-none animate__fadeInTopRight")
	setTimeout(()=>{
		$("#form-container").toggleClass("d-none animate__lightSpeedInRight")
	},500)
	
}

