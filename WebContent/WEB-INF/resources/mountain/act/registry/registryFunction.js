function setBreadcrumbURL(){
	let breadcrumbLA = $("#bc").find("a")
	breadcrumbLA.eq(1).attr("href",listHome)
	breadcrumbLA.eq(2).attr("href",detailHome+actID)
}


function activeDataAS(actID){
	$.ajax({
		url : regHome+"/default.data",
		type : "GET",
		dataType : "json",
		data : {actID : actID},
		success : function(data){
			nowReg = data.nowReg
			regTop = data.activityInfo.regTop;
			if(nowReg>=regTop){
				swal("報名上限已滿","報名上限 : " + regTop + "人\n 目前報名人數 : " + nowReg + "人", "warning")
				$("#regInfo-submit").attr("disabled",true)
				$(".reg-ctrl").empty()
			}
			setDefaultData(data)
			
		},
		error : function(){
			swal({
				title : "讀取發生錯誤",
				icon : "error",
				buttons : {
					cofrim :{
						text : "好的"
					}
				} 
			})
		}
	})
}

function setDefaultData(data){
	$(".page-header").html("<h1>" + data.activityInfo.title + " -- 報名資料填寫" +  "</h1>")
	$("#act-simpleinfo").find("div").eq(0).append( "$ " + data.activityInfo.price)
	$("#act-simpleinfo").find("div").eq(1).append(data.nowReg)
	$("#act-simpleinfo").find("div").eq(2).append(regTop)
	$("#act-simpleinfo").find("div").eq(3).append(new Date(data.activityInfo.regEndDate).toLocaleDateString())
	$("#act-simpleinfo").find("div").eq(4).append(new Date(data.activityInfo.startDate).toLocaleDateString())
	$("#act-note").append(data.activityInfo.addInfo)
}

function appedRegInfo(bodyLength){
	let model = $("#regInfo-form-origin").clone();
//	console.log(model)
//	let formLength = $(".regInfo-form").length
//	let inputs = model.find("input")
//	for(let i = 0 ; i < inputs.length ; i++){
//		let originName = inputs.eq(i).attr("name")
//		let newName = originName.substring(0,originName.indexOf("_")) + "_" +formLength
//		inputs.eq(i).attr("name",newName)
//	}
	model.attr("id","").addClass("regInfo-form")
	$(".regInfo").append(model)
	setDatePicker( $(".regInfo-form").eq(bodyLength).find("input[name^='birthDay']"))
}

function removeRegInfo(elmLength){
	console.log(elmLength)
	$(".regInfo-form").eq(elmLength-1).remove()	
}

function ajaxNewRGI(){
	
	let thisStatus
	if(formArray.length === 1){
		thisStatus = true;
	}else{
		thisStatus = false;
	}
	console.log(formArray)
	$.ajax({
		url : regHome + "/new.ajax/" + actID + "." + thisStatus,
		type : "POST",
		data : new FormData(formArray[0]),
		dataType : "json",
		processData: false,
	 	contentType: false,
		success : function(data){
			if(data){
				formArray.shift();
				if(formArray.length === 0){
					swal({
						title : "報名成功",
						text : "報名人數 : " + $(".regInfo-form").length + "人\n\n返回活動詳情頁",
						icon : "success"  
					}).then(() => {
						window.location.assign(detailHome+actID)
					})
				}else{
					ajaxNewRGI()
				}
			}
		},
		error : function(){
			swal("發生錯誤", "系統錯誤", "error")
		}
	})
	
}

function ajaxConfirmSWAL(){
	swal({
		title : "確認發送報名?",
		text : "",
		icon : "warning",
		dangerMode: true,
		buttons : {
			cancel : {
				visible : true,
				value : false,
				text : "返回修改"
			},
			confirm : {
				visible : true,
				value : true,
				text : "確認"
			},
		}
	}).then((value) => {
			if(value){
				console.log(formArray)
				ajaxNewRGI()
			}else{
				formArray = []
			}
	})
}


function setDatePicker(thisElm){
	thisElm.daterangepicker({
		"singleDatePicker": true,
		"showDropdowns": true,
		"minYear": 1970,
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
		"startDate" : new Date(),
		"endDate" : new Date(),
		}, function(start, end, label) {
		});		    
}

function reloadReg(){
	let pageCon = $(".m-ma-container").find(".pageControl")
		.find("div").eq(2).text();
	let page = pageCon.substring(0,pageCon.indexOf("/")).trim();
	registry(page);
}

