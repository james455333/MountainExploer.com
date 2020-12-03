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

function autoInfo(){
	let length = $(".reg-mainCon").find(".regInfo-form").length
	console.log(length)
	for(let num = 0 ; num < length ; num ++ ){
		
		let nameArray = ['王重陽','宋遠橋','俞蓮舟','俞岱岩','張松溪','張翠山','殷梨亭','莫聲谷','張三丰','張無忌']
		let nameLength = $(".reg-mainCon").find("input[name='name']").length
		for(let j = 0 ; j <nameLength ; j++ ){
			let i = Math.round(Math.random()*10)
			let name = nameArray[i]
			$(".reg-mainCon").find("input[name='name']").eq(j).val(name)
			
		}
		
		
		let dayLength = $(".reg-mainCon").find("input[name='birthDay']").length
		for(let j = 0 ; j < dayLength ; j++){
			let year ;
			while(true){
				year = 1970 + Math.round(Math.random()*100)
				if(year > 1971 && year < 2015) break;
			}
			console.log(year)
			let month, day;
			while(true){
				month = Math.round(Math.random()*10) + Math.round(Math.random()*10)
				if(month >= 1 && month <= 12) break;
			}
			console.log("month : " + month)
			while(true){
				day = Math.round(Math.random()*100) + Math.round(Math.random()*10)
				if(day>=1 && day <= 30) break;
			}
			console.log("day : " + day)
			let setDate = year + "/" + month + "/" +day
			$(".reg-mainCon").find("input[name='birthDay']").eq(j).data('daterangepicker').setStartDate(setDate);
		}
		
		let possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
		let idLength = $(".reg-mainCon").find("input[name='personID']").length
		for(let j = 0 ; j < idLength ; j++){
			let startChar = possible.charAt(Math.floor(Math.random() * possible.length));
			let bodyStart;
			while(true){
				bodyStart = Math.round(Math.random()*10)
				if(bodyStart >0 && bodyStart <3){
					bodyStart *= 100000000
					break;
				} 
			}
			let body
			while(true){
				body = Math.round(Math.random()*100000000)
				if(body > 10000000) break;
			}
			bodyStart += body
			let final = startChar+bodyStart
			$(".reg-mainCon").find("input[name='personID']").eq(j).val(final)
		}
		
		let cpLength = $(".reg-mainCon").find("input[name='contactPhone']").length
		for(let j = 0 ; j < cpLength ; j++){
			let head0 = '0';
			let head2;
			while(true){
				head2 = Math.round(Math.random()*10)
				if(head2 > 0 && head2 <10) break;
			}
			let head = head0+head2+'-'
			let body = Math.round(Math.random()*100000000)
				
			$(".reg-mainCon").find("input[name='contactPhone']").eq(j).val(head+body)
		}
		
		let ccpLength = $(".reg-mainCon").find("input[name='contactCellphone']").length
		for(let j = 0 ; j < ccpLength ; j++){
			let head = '09'
			let body;
			while(true){
				body = Math.round(Math.random()*100000000)
				if(body < 100000000 && body > 10000000)	
				break;		
			}
			$(".reg-mainCon").find("input[name='contactCellphone']").eq(j).val(head+body)
		}
		
		possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
		let mailLength = $(".reg-mainCon").find("input[name='contactEmail']").length
		for(let j = 0 ; j < mailLength ; j++){
			let head = ''
			for(let y = 0 ; y <10 ; y++){
				head += possible.charAt(Math.floor(Math.random() * possible.length));
			}
			head += '@gmail.com'
			$(".reg-mainCon").find("input[name='contactEmail']").eq(j).val(head)
		}
	}
}
