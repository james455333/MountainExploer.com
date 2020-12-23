function number_format(number, decimals, dec_point, thousands_sep) {
  // *     example: number_format(1234.56, 2, ',', ' ');
  // *     return: '1 234,56'
  number = (number + '').replace(',', '').replace(' ', '');
  var n = !isFinite(+number) ? 0 : +number,
    prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
    sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
    dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
    s = '',
    toFixedFix = function (n, prec) {
      var k = Math.pow(10, prec);
      return '' + Math.round(n * k) / k;
    };
  // Fix for IE parseFloat(0.55).toFixed(0) = 0;
  s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
  if (s[0].length > 3) {
    s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
  }
  if ((s[1] || '').length < prec) {
    s[1] = s[1] || '';
    s[1] += new Array(prec - s[1].length + 1).join('0');
  }
  return s.join(dec);
}
function downloadChart(chartElm,fileName){
	const openURL = chartElm.toBase64Image()
	const chartType = chartElm.config.type
	let exportName = fileName + "_" + chartType
//	console.log(openURL)
	const a = $("a.export")[0]
	console.log(a)
	// 設定下載的檔名
	a.download =  exportName + ".png"
	// 設定網址
	a.href = openURL
	// 模擬使用者按下連結
	a.click()
	// 5 秒後清除產生的網址，這時候使用者應該按下了下載的按鈕了
	// 不清除的話會造成記憶體的浪費，這不會中斷使用者的下載
	// 不過若你下載完就要跳轉到下一頁的話，其實這個可以不用
	setTimeout(() => window.URL.revokeObjectURL(openURL), 5000)
}
function downloadChartJson(order){
	if( order == 1 ){
		let newData = {
			活動總數 : actMode[0] + actMode[1] + actMode[2],
			活躍狀態活動 : actMode[0],
			非活躍狀態活動 : actMode[1],
			歷史狀態活動 : actMode[2],
		}
		activeJsonDownload(newData,"活動選擇_國家公園及路線使用率")
	}else if( order == 2 ){
		$.ajax({
			url : baseURL+"/countRt",
			type : "GET",
			dataType : "json",
			success : function(data){
				console.log(data)
				let newData = {}
				for(let i in data){
					newData[i] = {路線總數 : data[i]}
				}
				activeJsonDownload(newData,"標籤狀態")
			},
			error : function(jqXHR){
				Swal.fire("發生錯誤", "下載時發生錯誤，錯誤代碼 : " + jqXHR.status, "error")
			}
		})
	}else if( order=3 ){
		let newData = {
			活動發布數量 : {},
			報名人數 : {}
		}
		let labels = actTrendChart.config.data.labels
		for(let i = 0 ; i < labels.length ; i++ ){
			newData.活動發布數量 [labels[i]] = actTrend_actData[i];
			newData.報名人數[labels[i]] = actTrend_regData[i];
		}
		let titleName = actTrendChart.options.title.text
		titleName = titleName.replace(/[\u4e00-\u9fa5]/g,"")
		let exportName = "活動發佈及報名人數趨勢_" + titleName
		activeJsonDownload(newData,exportName)
	}
}

function activeJsonDownload(jsonObj,fileName){
	$("<a />", {
	    "download": fileName+ new Date().toLocaleDateString() +".json",
	    "href" : "data:application/json," + encodeURIComponent(JSON.stringify(jsonObj))
	}).appendTo("body")
	.click(function() {
		$(this).remove()
	})[0].click()	
}
function downloadAllJson(){
	$.ajax({
		url : baseURL + "/all",
		type : "GET",
		dataType : "json",
		success : function(data){
			let actList =data.actList
			for(let i in actList){
				let actBasic = actList[i].actBasic
				let actInfo = actList[i].actBasic.actInfo
				delete actBasic.memberBasic
				delete actBasic.id
				delete actBasic.name
				delete actInfo.name
				delete actInfo.seqno
				delete actInfo.rtBasic.name
				delete actInfo.rtBasic.seqno
				delete actInfo.rtBasic.routeInfo.seqno
			}
			activeJsonDownload(data,"全活動資料")
		},
		error : function(jqXHR){
			Swal.fire("getAllData發生錯誤", "錯誤代碼 : " + jqXHR.status, "error")
		}
	})
}
function reRender(){
	PBBlock({
		startCount : 25,
		endCount : 99,
		countTimes : 9,
	})
	progressCount("等待資料存取")
	$("body").css("overflow", "hidden")
	openBlock("#actBack")
	$("#actBack").loading("resize")
	$.ajax({
		url : baseURL + "/all",
		type : "GET",
		dataType : "json",
		success : function(data){
			$("#actBack").loading("resize")
			progressCount("獲得活動資料")
			allData = data
			$.ajax({
				url : baseURL + "/reg/all",
				type : "GET",
				dataType : "json",
				success : function(data){
					allData_reg = data
					progressCount("獲得報名資料")
					setTopCard()
					progressCount("字卡，設置完成")
					setActModeChart()
					progressCount("活動狀態圖，設置完成")
					setTagModeChart()
					progressCount("報名狀態圖，設置完成")
					setActMonthSlider()
					setActYearSelect()
					setActTrendChart()
					progressCount("活動與報名趨勢圖，設置完成")
					setTable()
					progressCount("資料表格，設置完成")
					progressCount("頁面準備完畢", 1000)
					$("body").css("overflow", "auto")
				}
			})
		},
		error : function(jqXHR){
			Swal.fire("getAllData發生錯誤", "錯誤代碼 : " + jqXHR.status, "error")
		}
	})

}
function resetTable(){
	PBBlock({
		countTimes : 5,
	})
	$("#resetAll").addClass("fa-spin")
	openBlock("#tableBody")
	progressCount("表格重置")
	progressCount("獲取活動資料")
	$.ajax({
		url : baseURL + "/all",
		type : "GET",
		dataType : "json",
		success : function(data){
			allData = data
			progressCount("獲取活動註冊資料")
			$.ajax({
				url : baseURL + "/reg/all",
				type : "GET",
				dataType : "json",
				success : function(data){
					progressCount("設置表格中...")
					allData_reg = data
					if(typeof dataTable != 'undefined') {
						dataTable.destroy()
					}
					setTable()
					progressCount("表格重置完成..")
					$("#resetAll").removeClass("fa-spin")
					
				}
			})
		},
		error : function(jqXHR){
			Swal.fire("getAllData發生錯誤", "錯誤代碼 : " + jqXHR.status, "error")
		}
	})
}

function resetChart(canvasID){
	let parentDiv = $("#"+canvasID).parent("div")
	PBBlock({
		countTimes :4,
	})
	openBlock(parentDiv)
	progressCount("清除當前畫面")
	window[canvasID].destroy()
	let syncSign = $("#"+canvasID).parents(".card").find(".chart-reset").find("i")
	syncSign.addClass("fa-spin")
	progressCount("獲取資料中")
	$.ajax({
		url : baseURL + "/all",
		type : "GET",
		dataType : "json",
		success : function(data){
			allData = data
			$.ajax({
				url : baseURL + "/reg/all",
				type : "GET",
				dataType : "json",
				success : function(data){
					progressCount("資料讀取完成")
					allData_reg = data
					progressCount("重新設置完成")
					switch(canvasID){
						case "actModeChart" : 
							setActModeChart();
							break;
						case "tagModeChart" :
							setTagModeChart();
							
							break;
						case "actTrendChart" :
							setActMonthSlider()
							setActYearSelect()
							setActTrendChart()
							break;													
					}
					syncSign.removeClass("fa-spin")
				}
			})
		},
		error : function(jqXHR){
			Swal.fire("getAllData發生錯誤", "錯誤代碼 : " + jqXHR.status, "error")
		}
	})
}
function executeFunctionByName(functionName, context /*, args */) {
  var args = Array.prototype.slice.call(arguments, 2);
  var namespaces = functionName.split(".");
  var func = namespaces.pop();
  for(var i = 0; i < namespaces.length; i++) {
    context = context[namespaces[i]];
  }
  return context[func].apply(context, args);
}

var getAllData = function getAllData(){
	$.ajax({
		url : baseURL + "/all",
		type : "GET",
		dataType : "json",
		success : function(data){
			allData = data
		},
		error : function(jqXHR){
			Swal.fire("getAllData發生錯誤", "錯誤代碼 : " + jqXHR.status, "error")
		}
	})
}
var getAllData_Reg = function getAllData_Reg(){
	$.ajax({
		url : baseURL + "/reg/all",
		type : "GET",
		dataType : "json",
		success : function(data){
			allData_reg = data
		},
		error : function(jqXHR){
			Swal.fire("getAllData發生錯誤", "錯誤代碼 : " + jqXHR.status, "error")
		}
	})
}
var setTopCard = function setTopCard(){
	let active = 0;
	let inactive = 0;
	let expired = 0;
	let actList = allData.actList
	for(let i in actList){
		if( !actList[i].tagMap[3] ) {
			if(actList[i].tagMap[4] || actList[i].tagMap[5]){
				inactive++;
				continue;
			}
			active++
			continue;
		}
		expired++;
	}
	actMode = [active, inactive, expired];	
	$("#act-total-num").html(allData.totalData)
	$("#act-active-num").html(actMode[0])
	$("#act-inactive-num").html(actMode[1])
	$("#act-expired-num").html(actMode[2])
}


var setSearchBar = function setSearchBar(){
//	$("#npChartSelect").find("option").remove()
//	$("#npSelect").find("option").remove()
//	$("#rtSelect").find("option").remove()
//	$.ajax({
//	url : oldBackStageURL + "/navNP",
//	method : "GET",
//	dataType: 'json',
//	success:function(result){
//		$("#npChartSelect").append("<option selected disabled>請選擇指定國家公園</option>")
//		$("#npSelect").append("<option selected disabled>請選擇指定國家公園</option>")
//		for(let i = 0 ; i < result.length ; i++){
//			$("#npChartSelect").append('<option value="' + result[i].seqno +'">' + result[i].npName + "</option>" )
//			$("#npSelect").append('<option value="' + result[i].seqno +'">' + result[i].npName + "</option>" )
//		}
//		
//		let firstNP = $("#npSelect").find("option").eq(0).val()
//		$.ajax({
//			url : oldBackStageURL + "/navRT?nationalPark=" + firstNP,
//			method : "GET",
//			dataType : "json",
//			success:function(data){
//				//console.log(data)
//				$("#rtSelect").append("<option selected disabled>請選擇特定路線</option>")
//				for(let i in data) $("#rtSelect").append("<option value='" + data[i].seqno + "'>" + data[i].name +"</option>")
//			}
//		})
//	}
//})
	
	
}

var setTable = function setTable(){
	result = setResultToDT(allData)
	setDataTable(result)
		
}
function setResultToDT(data){
	let result = [];
	let updateBtn = `<button data-toggle='tooltip'  title='修改本筆路線資料'  class="btn btn-warning btn-act-update">
                    		<i class="fas fa-edit"></i> 修改
						</button>`
	let deleteBtn = `<button data-toggle='tooltip'  title='刪除本筆路線資料'  class="btn btn-danger btn-act-delete">
                    		<i class="fas fa-trash"></i> 刪除
						</button>`
	let infoBtn = `<button data-toggle='tooltip'  title='查看更多資訊'   class="btn btn-info btn-act-info">
                    		<i class="fas fa-info"></i> 更多
						</button>`
	let upImgBtn = `<button data-toggle='tooltip'  title='修改路線地圖'   class="btn btn-dark btn-rt-upImg">
                    		<i class="fas fa-image"></i> 修改路線圖
						</button>`
	let actList = data.actList
	for(let i in actList){
		let hideToogle = `<input type="checkbox" class='btn-ctrl btn-toggle-hide' `
				+ `checked data-toggle="toggle"`
				+ ` data-on="<i class='fas fa-power-off'></i> 顯示" `
				+ ` data-off="<i class='fas fa-ban'></i> 隱藏" data-onstyle="success" data-offstyle="danger">`
		let deleteToogle = `<input type="checkbox" class='btn-ctrl btn-toggle-delete' `
				+ `checked data-toggle="toggle"`
				+ ` data-on="<i class='fas fa-power-off'></i> 正常" `
				+ ` data-off="<i class='fas fa-ban'></i> 取消" data-onstyle="success" data-offstyle="danger">`
		let actBasic = actList[i].actBasic
		let actInfo = actBasic.actInfo
		if(actInfo.hideTag != null){
			hideToogle = `<input type="checkbox" class='btn-ctrl btn-toggle-hide' data-toggle="toggle"  data-on="<i class='fas fa-power-off'></i> 顯示" data-off="<i class='fas fa-ban'></i> 隱藏" data-onstyle="success" data-offstyle="danger">`
		}
		if(actInfo.deleteTag != null){
			deleteToogle = `<input type="checkbox" class='btn-ctrl btn-toggle-delete' data-toggle="toggle"  data-on="<i class='fas fa-power-off'></i> 正常" data-off="<i class='fas fa-ban'></i> 取消" data-onstyle="success" data-offstyle="danger">`
		}
//		let rtImage = '<a data-fancybox="' + "gallery" + routeInfo.id + '" href="' 
//			+ '/MountainExploer.com/back/mountain/route/crud/images?seqno=' + routeInfo.id + "&timestamp=" + new Date().getTime()
//			+ '">'
//			+ '<img src="/MountainExploer.com/back/mountain/route/crud/images?seqno='
//			+ routeInfo.id + "&timestamp=" + new Date().getTime()
//			+ '" class="routeImg" onerror="imgError($(this))"></a>'
		
		let riGroup = {
			"狀態項" : "<div>" + hideToogle + "</div>" + "<div class='mt-2'>" + deleteToogle + "</div>",
			"活動發布日期" : new Date(actInfo.postDate).toLocaleDateString(),
			"活動編號" : actBasic.seqno,
			"活動名稱" : "<a href='/MountainExploer.com/mountain/act/detail?page=1&actID=" + actBasic.seqno + "'>" + actInfo.title + "</a>"
				+ '<button class="btn update-single" ><i href="#" class="fas fa-edit"  style="color: #ff922b;" ></i></button >',
			"活動開始-結束日期" : new Date(actInfo.startDate).toLocaleDateString() + " - " 
						+ new Date(actInfo.endDate).toLocaleDateString()
						+'<button class="btn update-single" ><i href="#" class="fas fa-edit"  style="color: #ff922b;" ></i></button >',
			"活動報名期限" : new Date(actInfo.regEndDate).toLocaleDateString()
						+ '<button class="btn update-single" ><i href="#" class="fas fa-edit"  style="color: #ff922b;" ></i></button >',
			"控制項" :"<div class='d-flex justify-content-between align-items-center' >" + updateBtn + deleteBtn + infoBtn + "</div>",		
			}
//			"<div class='d-flex justify-content-between align-items-center' >" + updateBtn + deleteBtn + infoBtn + upImgBtn +"</div>"
		result.push(riGroup)
	}
	return result;
}
function imgError(thisElm){
	thisElm.attr("src","/MountainExploer.com/mountain/images/defaultMountain.jpg")
	thisElm.parent().attr("href","/MountainExploer.com/mountain/images/defaultMountain.jpg")
}

function setDataTable(result){
	dataTable = $('#routeTable').DataTable( {
		"data" : result,
        "pagingType": "full_numbers",
		"columns": [
            { "data": "狀態項" },
            { "data": "活動發布日期" },
            { "data": "活動編號" },
            { "data": "活動名稱" },
            { "data": "活動開始-結束日期" },
            { "data": "活動報名期限" },
            { "data": "控制項" },
        ],
		"drawCallback": function( settings ) {
			$('.btn-ctrl').bootstrapToggle()
			$('.btn-act-delete').tooltip();
			$('.btn-act-update').tooltip();
			$('.btn-act-info').tooltip();
			$('.btn-rt-upImg').tooltip();
	    }
    } )
	
}
function updateSingleRow(btn, updateDate){
	let thisBtn = btn != null ? btn : $(this);
	let thisData = updateDate != null? updateDate : thisBtn.parent().text()
	let thisSeqno = thisBtn.parents("tr").find("td").eq(2).text()
	let thisTdIndex = thisBtn.parents("tr").find("td").index( thisBtn.parent() )
	let thisTrIndex = thisBtn.parents("tbody").find("tr").index( thisBtn.parents("tr") )
	let thisHead = $("#routeTable").find("thead").find("td").eq(thisTdIndex).text()
	let thisHtml = "<h3>" + thisHead + "</h3>" 
				+ "<hr>最多輸入50中文字，不得為空白"
	let readOnly = thisData.match(/[0-9]{4}\/[0-9]+\/[0-9]+/)
	let thisType = getThisDataType(thisHead)
	let swal = {
		title : "修改活動編號 : " + thisSeqno,
		html : thisHtml,
		icon : "info",
		input : "text",
		inputValue :  thisData,
		inputAttributes: {
			required : true,
			maxlength : 50,
		},
		inputPlaceholder: '最多輸入50中文字，不得為空白',
		validationMessage : "請勿輸入空白",
		customClass: {
			confirmButton: 'btn btn-success',
		    cancelButton: 'btn btn-danger',
		},
		buttonsStyling: false,
		showCancelButton: true, 
	  	confirmButtonColor: '#3085d6',
		reverseButtons: true,
		cancelButtonColor: '#d33',
		confirmButtonText: '修改', 
		cancelButtonText: '取消',
		didOpen : function(){
			!readOnly ? null : setDatePicker($(".swal2-input"),thisData)
		},
	}
	readOnly ? swal.inputAttributes.readonly = true : null
	
	Swal.fire(swal).then((result) => {
		if(result.isConfirmed){
			let newData = result.value
			Swal.fire({
				title : "確認修改? ",
				icon : "question",
				html : "<i class='text-primary'>"
					+  thisData + "</i>"
					+ "為<hr>"
					+ "<i class='text-danger'>"
					+ result.value + "</i>",
					showCancelButton: true, 
					confirmButtonColor: '#3085d6',
					reverseButtons: true,
					cancelButtonColor: '#d33',
					confirmButtonText: '確認修改', 
					cancelButtonText: '返回',
			}).then((result) => {
				if(result.isConfirmed){
					activeUpdateAjax(newData,thisSeqno,thisType)
					reDrawRow(btn,newData)
				}else {
					updateSingleRow(thisBtn,newData)
				}
				
			})
		}
	})
}

function getThisDataType(thisHead){
	let result ;
	switch(thisHead){
		case "名稱" :
			return result = "title";
		case "開始-結束日期" :
			return result = "startEndDate";
		case "報名期限" :
			return result = "regEndDate";
	}
}

function setDatePicker(thisElm,date){
	let dateArray = date.split("-")
	let startDate = dateArray[0].trim()
	let endDate = dateArray.length > 1 ? dateArray[1].trim() : null
	console.log(startDate)
	console.log(endDate)
	let today = new Date()
	thisElm.daterangepicker({
		"singleDatePicker": dateArray.length > 1 ? false : true,
		"showDropdowns": true,
		"drops": "up",
		"minYear": 1970,
		"maxYear": 2099,
		"maxSpan": {
		    "days": dateArray.length > 1 ? 365 : 1
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
		"startDate" : new Date(startDate),
		"endDate" : dateArray.length > 1 ? new Date(endDate) : null,
		}, function(start, end, label) {
		});		    
}


function activeUpdateAjax(newData,actID,dataType){
	console.log(dataType)
	let name, startDate, endDate, regEndDate, sentData;
	switch(dataType){
		case "title" :
			sentData = {
				title : newData
			}
			break;
		case "startEndDate" :
			let dateArray = newData.split("-")
			sentData = {
				startDate : new Date(dateArray[0].trim()),
				endDate : new Date(dateArray[1].trim()),
			}
			break;
		case "regEndDate" :
			sentData = {
				regEndDate : new Date(newData)
			}
			break;
	}
	console.log(sentData)
	$.ajax({
		url : baseURL + "/act-" + actID,
		type : "PUT",
		data : JSON.stringify(sentData),
		contentType: "application/json; charset=UTF-8",
		success : function(){
			Swal.fire({
				title : "修改成功" ,
				icon : "success",
				customClass: {
					confirmButton: 'btn btn-success',
				},
				buttonsStyling: false,
			  	confirmButtonColor: '#3085d6',
				cancelButtonColor: '#d33',
				confirmButtonText: '返回', 
			})
			
			
		},
		error : function(jqXHR){
			Swal.fire("修改" + dataType + "發生錯誤", "錯誤代碼 : " + jqXHR.status, "error")
		}		
	})
	
//	Swal.fire(newData)
}
function reDrawRow(btn,newData){
	let originHtml = btn.parents("td").html()
	let newHtml = newData + originHtml.substring(originHtml.indexOf("<button"))
	btn.parents("td").html(newHtml)
	setTopCard()
}
function changeRtAndTb(){
	var npID = $("#npSelect").val();
	$.ajax({
		url : oldBackStageURL + "/navRT?nationalPark="+npID,
		type : "GET",
		dataType: 'json',
		success:function(data){
			//console.log(data)
			$("#rtSelect").empty()
			if(data.length != 0){
				for(let i in data) 
					$("#rtSelect").append("<option value='" + data[i].seqno + "'>" + data[i].name +"</option>")
			}
			
		}
	})
	
	$.ajax({
		url : baseURL + "/npSelect." + npID,
		type : "GET",
		dataType: 'json',
		success:function(data){
			let result = setResultToDT(data)
			dataTable.destroy()
			setDataTable(result)
		}
	})
	
}

function changeTbByRt(){
	var rtID = $("#rtSelect").val();
	$.ajax({
		url : baseURL + "/rt-" + rtID,
		type : "GET",
		dataType: 'json',
		success:function(data){
			let result = setResultToDT(data)
			dataTable.destroy()
			setDataTable(result)
		}
	})
	
}

function setRtToggle(thisRtID, thisToggle){
	$.ajax({
		url : baseURL + "/toggle-" + thisRtID + "-" + thisToggle,
		type : "PUT",
		success : function(){
			setTopCard()
		},
		error : function(jqXHR){
			Swal.fire("發生錯誤", "錯誤代碼 : " + jqXHR.status, "error")
		}
	})
}
function updateBox(btn){
	let actID = btn.parents("tr").find("td").eq(2).text()
	let nps;
	$.ajax({
		url : baseRouteURL + "/allRoute",
		method : "GET",
		dataType: 'json',
		success:function(result){
			nps = result
		}
	}).then( () => {
		
		$.ajax({
			url : baseURL + "/act-" + actID,
			type : "GET",
			dataType: 'json',
			success:function(data){
				let thisRtID = data.rtBasic.id
//				console.log(data)
//				console.log(nps)
				let npArray = []
				let routeArray = []
				let final = '<form id="newAct-form">'
							+ "<div class='row  justify-content-between'>"
							+ "<div class='col-md-6'>"
							+ '<label class="swal2-label">國家公園'
							+ '<select id="update-np" class="swal2-select">'
				for(let i in nps){
					if(thisRtID == nps[i].routeInfo.id ) {
						routeArray.push( nps[i].routeInfo.id + ":" + nps[i].routeInfo.name+ ":" + "selected" )
						for(let j in nps){
							if(nps[i].np == nps[j].np && nps[i].routeInfo.id != nps[j].routeInfo.id)
							routeArray.push( nps[j].routeInfo.id + ":" + nps[j].routeInfo.name )
						}
						if(!npArray.includes(nps[i].np)){
							npArray.push(nps[i].np)
							final +='<option selected value="' + nps[i].npID +'">' + nps[i].np + "</option>"
						}
					}else {
						if(!npArray.includes(nps[i].np)){
							npArray.push(nps[i].np)
							final +='<option value="' + nps[i].npID +'">' + nps[i].np + "</option>" 
						}
					}
				}
				final += '</select>'
						+ '</label>'
						+ '</div>'
						+ '<div class="col-md-6">'
						+  '<label class="swal2-label">路線選擇'
						+ '<select id="update-rt" class="swal2-select">'
				for(let i in routeArray){
					let routeOption = routeArray[i].split(":")
					if(routeOption.length>2){
						final += '<option selected value="' + routeOption[0] +'">' + routeOption[1] + "</option>"
					}else{
						final += '<option value="' + routeOption[0] +'">' + routeOption[1] + "</option>"
					}
				}
				let regColumn = btn.parents("tr").find("td").eq(6).text()
				let regTop = regColumn.substring(regColumn.indexOf("/")+1).trim()
				final += '</select>'
						+ '</label>'
						+ '</div>'
						+ '</div>'
						+ '<hr>' 
						+ '<div class="row justify-content-between">'
							+ "<div class='col-md-4'>"
								+ '<label class="swal2-label">名稱' 
									+'<input required id="updatetitle" pattern="^[\u4e00-\u9fa5_a-zA-Z0-9]+$" type="text" class="swal2-input" value="'+ data.title +'" >'
								+ '</labe>'
							+ "</div>"
							+ "<div class='col-md-4'>"
								+ '<label class="swal2-label">報名價格' 
									+'<input required id="updateprice" pattern="^[0-9]+$" maxlength="8" type="text" class="swal2-input" value="'+ data.price +'" >'
								+ '</labe>'
							+ "</div>"
							+ "<div class='col-md-4'>"
								+ '<label class="swal2-label">報名人數上限' 
									+'<input required id="updateregTop" pattern="^[0-9]+$" maxlength="5" type="text" class="swal2-input" value="'+ regTop +'" >'
								+ '</labe>'
							+ "</div>"
						+ '</div>'
						+ '<hr>' 
						+ '<label class="swal2-label col-md-12 pb-3">訊息<br>' 
						
							+'<textarea id="updateNote" style="resize : none;" cols="150" class="swal2-textarea"></textarea >'
						+ '</labe>'
						+ '</form>'
//					console.log(data)
					let updateData
					Swal.fire({
						customClass: {
							confirmButton: 'btn btn-success',
						    cancelButton: 'btn btn-danger'
						},
						showCancelButton: true,
						cancelButtonText: '取消修改',
	  					confirmButtonText: '確認修改',
						title : "資料修改 --- 活動編號 : " + data.id ,
						html : final,
						width : "1000px",
						showLoaderOnConfirm: true,
						focusConfirm: false,
						preConfirm : (result) => {
							console.log(result)
							updateData = {
								id : actID,
								rtID : $('#update-rt').val(),
								title : $('#updatetitle').val(),
								price : $('#updateprice').val(),
								regTop : $('#updateregTop').val(),
								note : CKEDITOR.instances.updateNote.getData(),
							}
							ajaxUpdate(updateData)
						},
						didOpen : function(){
							console.log($("#newAct-form"))
							$("#update-np").on("change",changeUpdateAllRt)
							CKEDITOR.replace("updateNote")
							CKEDITOR.instances.updateNote.setData(data.addInfo)
							
						},
						
					}).then((confirm) => {
						if(confirm.isConfirmed){
							let parentTr = btn.parents("tr")
							let updateTitle = updateData.title + '<button class="btn update-single"><i href="#" class="fas fa-edit" style="color: #ff922b;"></i></button>'
							parentTr.find("td").eq(3).html(updateTitle)
							let updateReg = parentTr.find("td").eq(6).text().replace(/\/ [0-9]*/, "/ " + updateData.regTop)
							parentTr.find("td").eq(6).text(updateReg)
							if(parentTr.next().attr("class") == "append-info"){
								parentTr.next().next().find("td").eq(0).html("<div>" + updateData.note + "</div>")
							}
						}
					})
			}
		})
	})
}
function changeUpdateAllRt(){
	let npValue = $(this).val()
	$("#update-rt").find("option").remove()
	$.ajax({
		url : baseRouteURL + "/npSelect." + npValue,
		type : "GET",
		dataType : "json",
		success : function(data){
			for(let i in data){
				let rtID = data[i].routeInfo.id
				let rtName = data[i].routeInfo.name
				$("#update-rt").append("<option value='" + rtID + "'>" + rtName + "</option>")
			}
		}
	})
}

function ajaxUpdate(result){
	let data = JSON.stringify(result)
	$.ajax({
	url : baseURL + "/act-all-" + result.id ,
		type : "PUT",
		data : data,
	    contentType: "application/json; charset=UTF-8",
		success : function(){
			
			Swal.fire({
				title : "修改成功",
				icon : "success",
  				confirmButtonText: '返回',
			})
		},
		error : function(jqXHR){
			Swal.fire("發生錯誤", "錯誤代碼 : " + jqXHR.status, "error")
		},
	})
}

function deleteAlert(btn){
	let rtID = btn.parents("tr").find("td").eq(2).text()
	
	Swal.fire({
		title : '即將刪除 <i class="fas fa-arrow-right"></i> 活動編號 : ' + rtID,
		icon : "warning",
		html : "!! 警告 !!  <hr>本動作將刪除本活動，並且無法回復",
		customClass: {
			confirmButton: 'btn btn-success',
		    cancelButton: 'btn btn-danger'
		},
		buttonsStyling: false,
		showCancelButton: true, 
	  	confirmButtonColor: '#3085d6',
		cancelButtonColor: '#d33',
		confirmButtonText: '確定刪除', 
		cancelButtonText: '取消',
	}).then(function(e) {
		console.log(e)
		if(e.isConfirmed){
			$.ajax({
				url : baseURL + "/act-" + rtID,
				type : "Delete",
				success:function(){
					reRender()
					Swal.fire({
						customClass: {
							confirmButton: 'btn btn-success',
						    cancelButton: 'btn btn-danger'
						},
						buttonsStyling: false,
						title : "刪除成功",
						icon : "success",
					  	confirmButtonColor: '#3085d6',
					})
				},
				error : function(jqXHR){
					Swal.fire("發生錯誤", "錯誤代碼 : " + jqXHR.status, "error")
				}
				
			})
		}
	})
}

function showMoreInfo(btn){
	let actID = btn.parents("tr").find("td").eq(2).text()
	console.log(actID)
	let nextTr = btn.parents("tr").next()
	if(nextTr.attr("class") == "append-info") {
		nextTr.toggle(500)
		nextTr.next().toggle(500)
		nextTr.siblings(".append-info").not(nextTr).not(nextTr.next()).hide(500)
		return;
	}
	$(".append-info").hide(500)
	$.ajax({
		url : baseURL + "/act-" + actID,
		type : "GET",
		dataType: 'json',
		success : function(data){
			console.log(data)
			let note = data.addInfo
			
			$.ajax({
				url : baseURL + "/images-list-" + actID,
				type : "GET",
				dataType : "json",
				success : function(imgList){
					console.log(imgList)
					let appendInfo = "<tr class='append-info'>"
										+ "<th colspan='4'>備註</th>"
										+ "<th colspan='4'>圖片庫 (可點擊放大) </th>"
									+ "</tr>"
									+ "<tr class='append-info'>"
										+ "<td colspan='4'>"
										+ "<div>" + note + "</div>"
										+ "</th>"
					appendInfo +=	"<td colspan='4'><div style='border-width:3px;' class='row mx-2 '>"
					if(imgList.length != 0){
						let containerWidth = "17.5"
						for(let i in imgList){
							appendInfo += "<div class='mx-1 border border-dark rounded '   style='height: 50px; width:" + containerWidth + "%;'>"
										+ "<a data-fancybox='gallery" + actID + "' href='" 
										+ baseURL + "/image-" + imgList[i] + "?timestamp=" + new Date().getTime() + "'>"
										+ "<img class='more-image-a' data-toggle='tooltip' title='點擊放大'  style='width:100%;height:100%' src='" + baseURL + "/image-" + imgList[i] + "?timestamp=" + new Date().getTime() +  "'></a>"
										+ "</div>"
						}
					}else{
						appendInfo += "<h3 class='text-primary'>無上傳圖片</h3>"
					} 
					appendInfo +=	"</div></th>"
									+ "</tr>"
					
					btn.parents("tr").after(appendInfo)
					btn.parents("tr").nextAll().slice(0,2).show(500)
				},
				error : function(jqXHR){
					Swal.fire("更多資訊 : 發生錯誤", "錯誤代碼 : " + jqXHR.status, "error")
				}
			})
		},
		error : function(jqXHR){
			Swal.fire("更多資訊 : 發生錯誤", "錯誤代碼 : " + jqXHR.status, "error")
		}
	})
}
function updateImage(btn){
	let rtID = btn.parents("tr").find("td").eq(2).text()
	let rtName = btn.parents("tr").find("td").eq(3).text()
	let innerHtml = "<form id='update-Image'><input accept='*/image' name='imgFile' type='file' class='swal2-input'></form>"
	let form ;
	$("body").on("change","input[type='file']",function(){
		form = $("#update-Image")
		preview($(this)[0])
	})
	Swal.fire({
		customClass: {
			confirmButton: 'btn btn-success',
		    cancelButton: 'btn btn-danger'
		},
		buttonsStyling: false,
		title : rtName + "\n路線圖",
		imageUrl: '/MountainExploer.com/backstage/mountain/search/images?seqno=' + rtID + "&timestamp=" + new Date().getTime(),
		imageHeight: "auto",
		imageWidth: 500,
		width : "750px",
		html : innerHtml,
		showCancelButton: true, 
	  	confirmButtonColor: '#3085d6',
		cancelButtonColor: '#d33',
		confirmButtonText: '確定修改', 
		cancelButtonText: '取消修改',
	}).then(function(result){
		if(result.isConfirmed){
			console.log(form)
			let formData = new FormData(form[0])
			$.ajax({
				url : baseURL + "/update-imgae." + rtID,
				type : "POST",
				processData : false,
				contentType : false,
				data : formData,
				success : function(){
					Swal.fire({
						customClass: {
							confirmButton: 'btn btn-success',
						    cancelButton: 'btn btn-danger'
						},
						buttonsStyling: false,
						title : "圖片修改成功",
						icon : "success",
					  	confirmButtonColor: '#3085d6',
						confirmButtonText: '返回', 
					})
					btn.parents("tr").find("td").eq(1).find("img").attr("src",'/MountainExploer.com/backstage/mountain/search/images?seqno=' + rtID + "&timeStamp" + new Date().getTime())
					btn.parents("tr").find("td").eq(1).find("a").attr("href",'/MountainExploer.com/backstage/mountain/search/images?seqno=' + rtID + "&timeStamp" + new Date().getTime())
					
				},
				error : function(jqXHR){
					Swal.fire("發生錯誤", "錯誤代碼 : " + jqXHR.status, "error")
				}
			})
		}
	})
	
}

function preview(input) {
 	console.log(input)
    // 若有選取檔案
    if (input.files && input.files[0]) {
 		console.log(input.files[0])
        // 建立一個物件，使用 Web APIs 的檔案讀取器(FileReader 物件) 來讀取使用者選取電腦中的檔案
        var reader = new FileReader();
 
        // 事先定義好，當讀取成功後會觸發的事情
        reader.onload = function (e) {
 
            // 這裡看到的 e.target.result 物件，是使用者的檔案被 FileReader 轉換成 base64 的字串格式，
            // 在這裡我們選取圖檔，所以轉換出來的，會是如 『data:image/jpeg;base64,.....』這樣的字串樣式。
            // 我們用它當作圖片路徑就對了。
            $('.swal2-image').attr('src', e.target.result);
			$(".swal2-title").html("狀態 : 修改圖片")
			$("#update-Image").siblings("*").remove()
			$(".custom-file-label").html(input.files[0].name)
        }
        // 因為上面定義好讀取成功的事情，所以這裡可以放心讀取檔案
        reader.readAsDataURL(input.files[0]);
    }
}
function newNp(){
	Swal.fire({
		customClass: {
			confirmButton: 'btn btn-success',
		    cancelButton: 'btn btn-danger'
		},
		buttonsStyling: false,
		title : '新增 -- 國家公園',
		icon : "info",
		text : '最多輸入50中文字，不得為空白',
		input: 'text',
		inputAttributes: {
			required : true,
			maxlength : 50,
			pattern : "^[\u4e00-\u9fa5]+$"
		},
		inputPlaceholder: '最多輸入50中文字，不得為空白',
		validationMessage : "格式錯誤或空白",
		showCancelButton: true, 
	  	confirmButtonColor: '#3085d6',
		cancelButtonColor: '#d33',
		confirmButtonText: '確定新增', 
		cancelButtonText: '取消',
	}).then(function(result){
		if(result.isConfirmed){
			let formData = new FormData()
			formData.append("name",result.value)
			$.ajax({
				url : baseURL + "/np",
				data : formData,
				type : "POST",
				processData : false,
				contentType : false,
				success : function(){
					reRender()
					Swal.fire({
						customClass: {
							confirmButton: 'btn btn-success',
						    cancelButton: 'btn btn-danger'
						},
						buttonsStyling: false,
						title : result.value +  " 新增成功",
						icon : "success",
						confirmButtonText: '返回', 
					})
				},
				error : function(jqXHR){
					Swal.fire("發生錯誤", "錯誤代碼 : " + jqXHR.status, "error")
				}
			})
		}
	})
}
function updateNp(){
	let nps = {};
	$.ajax({
		url : oldBackStageURL + "/navNP",
		method : "GET",
		dataType: 'json',
		success:function(data){
			for(let i in data){
				nps[data[i].seqno] = data[i].npName 
			}
			Swal.fire({
				customClass: {
					confirmButton: 'btn btn-success',
				    cancelButton: 'btn btn-danger'
				},
				buttonsStyling: false,
				title : '修改 -- 國家公園',
				icon : "info",
				text : "選擇你所要修改的國家公園",
				input: 'select',
				inputOptions : nps, 
				showCancelButton: true, 
			  	confirmButtonColor: '#3085d6',
				cancelButtonColor: '#d33',
				confirmButtonText: '選擇', 
				cancelButtonText: '取消',
			}).then(function(result){
				if(result.isConfirmed){
					let value = result.value
					let npName ;
					for(let i in data ){
						if(data[i].seqno == value) npName = data[i].npName
					}
					Swal.fire({
						customClass: {
							confirmButton: 'btn btn-success',
						    cancelButton: 'btn btn-danger'
						},
						buttonsStyling: false,
						title : "修改 -- " + npName,
						icon : "info",
						text : '最多輸入50中文字，不得為空白',
						input: 'text',
						inputAttributes: {
							required : true,
							maxlength : 50,
							pattern : "^[\u4e00-\u9fa5]+$"
						},
						inputPlaceholder: '最多輸入50中文字，不得為空白',
						validationMessage : "格式錯誤或空白",
						showCancelButton: true, 
					  	confirmButtonColor: '#3085d6',
						cancelButtonColor: '#d33',
						confirmButtonText: '確定修改', 
						cancelButtonText: '取消',
					}).then(function(final){
						if(final.isConfirmed){
							let finalData = { name : final.value}
							$.ajax({
								url : baseURL + "/np-" + value,
								type : "PUT",
								data : JSON.stringify(finalData),
								contentType: "application/json; charset=UTF-8",
								success : function(){
									reRender()
									Swal.fire({
										customClass: {
											confirmButton: 'btn btn-success',
										    cancelButton: 'btn btn-danger'
										},
										buttonsStyling: false,
										title : "修改成功",
										icon : "success",
										html : "<div>" 
											+ "<h3 class='text-warning'>" + npName 
											+ "</h3><hr>"
											+ '<i class="fas fa-arrow-down"></i>'
											+ "<hr>"
											+ "<h3 class='text-success'>" 
											+ final.value 
												+ "</h3></div>",
										confirmButtonText: '返回', 
									})
								},
								error : function(jqXHR){
									Swal.fire("發生錯誤", "錯誤代碼 : " + jqXHR.status, "error")
								}
							})
						}
					})
					
					
				}
			})
		}
	})
}
function deleteNp(){
	let nps = {};
	$.ajax({
		url : oldBackStageURL + "/navNP",
		method : "GET",
		dataType: 'json',
		success:function(data){
			for(let i in data){
				nps[data[i].seqno] = data[i].npName 
			}
			Swal.fire({
				customClass: {
					confirmButton: 'btn btn-success',
				    cancelButton: 'btn btn-danger'
				},
				buttonsStyling: false,
				title : '<h2 class="text-danger">刪除 -- 國家公園</h2>',
				icon : "warning",
				html :  "<h2 class='text-warning'>" 
						+ '<i class="fas fa-skull-crossbones fa-lg fa-pulse"></i>' 
						+ "  警告  "
						+ '<i class="fas fa-skull-crossbones fa-lg fa-pulse"></i>'
						+ "</h2>"
						+ "<hr>"
						+ "本動作將永久刪除主類別及其下所有路線，並且<br>"
						+ "<i class='text-lg text-danger'>永久無法回復"
						+ "<hr>"
						+ "您是否確認執行?",
				showCancelButton: true, 
			  	confirmButtonColor: '#d33',
				cancelButtonColor: '#3085d6',
				confirmButtonText: '確定', 
				cancelButtonText: '取消',
				showLoaderOnConfirm: true,
			}).then(function(firstWarning){
				if(firstWarning.isConfirmed){
					Swal.fire({
						customClass: {
							confirmButton: 'btn btn-success',
						    cancelButton: 'btn btn-danger'
						},
						buttonsStyling: false,
						title : '<h2 class="text-danger">刪除 -- 國家公園</h2>',
						icon : "warning",
						text : "選擇你所要刪除的國家公園",
						input: 'select',
						inputOptions : nps, 
						showCancelButton: true, 
						showLoaderOnConfirm: true,
					  	confirmButtonColor: '#d33',
						cancelButtonColor: '#3085d6',
						confirmButtonText: '選擇', 
						cancelButtonText: '取消',
					}).then(function(selectNP){
						
						if(selectNP.isConfirmed){
							let value = selectNP.value
							let npName;
							for(let i in data ){
								if(data[i].seqno == value) npName = data[i].npName
							}
							Swal.fire({
								customClass: {
									confirmButton: 'btn btn-success',
								    cancelButton: 'btn btn-danger'
								},
								buttonsStyling: false,
								title : "即將刪除 : " 
										+ "<h2 class='text-danger'> "
										+ npName
										+ "</h2>",
								icon : "warning",
								html : "<h3>"
										+ "現在回頭還來得及...</h3>",
								background: '#fff url(/MountainExploer.com/images/regret.jpg)',
								showCancelButton: true, 
							  	confirmButtonColor: '#d33',
								cancelButtonColor: '#3085d6',
								confirmButtonText: '墮落成魔', 
								cancelButtonText: '回頭是岸',
								showLoaderOnConfirm: true,
							}).then(function(final){
								if(final.isConfirmed){
									$.ajax({
										url : baseURL + "/np-" + value,
										type : "DELETE",
										success : function(){
											reRender()
											Swal.fire({
												title : "<h1 class='text-light'>刪除成功</h1>",
												html : "<h3 class='text-danger'>一切都已太遲...</h3>",
												showConfirmButton: false,
												background: '#fff url(/MountainExploer.com/images/no-regret.jpg)',
												timer : 2500,
												showLoaderOnConfirm: true,
												timerProgressBar: true, 
											})
										},
										error : function(jqXHR){
											Swal.fire("發生錯誤", "錯誤代碼 : " + jqXHR.status, "error")
										}
									})
								}
							})
						}
					})
				}
			})
		}
	})
}

function newRoute(){
	let nps;
	$.ajax({
		url : oldBackStageURL + "/navNP",
		method : "GET",
		dataType: 'json',
		success:function(result){
			nps = result
			let final = setNewRtHtml(nps)
			Swal.queue([{
				customClass: {
					confirmButton: 'btn btn-success',
				    cancelButton: 'btn btn-danger'
				},
				buttonsStyling: false,
				title : "新增 -- 路線資料",
				html : final,
				width : "1000px",
				showCancelButton: true, 
				confirmButtonColor: '#3085d6',
				cancelButtonColor: '#d33',
				confirmButtonText: '確定修改', 
				cancelButtonText: '取消',
				preConfirm : (result) => {
					$("#newRt-form").on("submit",function(e){ 
						e.preventDefault()
						return true;
					})
					$("#newRt-form").validate({
						submitHandler: function(form){
							ajaxNewRt(form)
				        }
					})
					$("#newRt-form").submit()
					return false;
				}
			}])
		}
	})
}
function setNewRtHtml(nps){
	let final = '<form id="newRt-form">'
			+'<label class="swal2-label"><span>國家公園</span>'
			+ '<br>'
			+ '<div>選擇主類別&nbsp&nbsp</div>'
			+ '<select name="npID" class="swal2-select">'
	for(let i in nps){
		if(i == 0 ) {
			final +='<option selected value="' + nps[i].seqno +'">' + nps[i].npName + "</option>"
		}else{
			final +='<option value="' + nps[i].seqno +'">' + nps[i].npName + "</option>" 
		}
	}
	
	final += '</select></label>'
		+ '<hr>'
		+ '<label class="swal2-label"><span>路線名稱</span>'
		+ '<br>'
		+ '<div><i class="text-danger">1. 必填&nbsp&nbsp</i></div>'
		+ '<div>2. 限制50字&nbsp&nbsp</div>'
		+ '<div> 3. 僅能輸入中文&nbsp&nbsp</div>'
		+ '<input required pattern="^[\u4e00-\u9fa5]+$" type="text" name="name" class="swal2-input">'
		+ '</label>'
		+ '<hr>'
		+ '<br>'
		+ '<div>'
		+ '<div>1. 以下為<i class="text-danger">選填資料</i></div>'
		+ '<div>2. 字數不限</div>'
		+ '<div>3. 若不輸入或輸入空白將以「尚無資料」方式呈現</div>'
		+ '<br>'
		+ '<label class="swal2-label"><span>路線介紹</span>'
		+ '</div>'
		+ '<textarea cols="100" style="resize:none" type="text" name="description" class="swal2-textarea"></textarea>'
		+ '</label>'
		+ '<label class="swal2-label"><span>建議行程</span>'
		+ '<textarea cols="100" style="resize:none" name="advice" class="swal2-textarea"></textarea>'
		+ '</label>'
		+ '<label class="swal2-label"><span>交通資訊</span>'
		+ '<textarea cols="100" style="resize:none" name="traffic" class="swal2-textarea"></textarea>'
		+ '</label>'
		+ '<div class="custom-file">'
		+ '<input type="file"  class="custom-file-input" name="fileImge" id="imageFile">'
		+ '<label class="custom-file-label" for="imageFile">選擇圖片</label>'
		+ '</div>'
		+ '</form>'
		
	return final;
}
function ajaxNewRt(form){
	$.ajax({
		url : baseURL + "/rt",
		type : "POST",
		data : new FormData(form),
		processData : false,
		contentType : false,
		success : function(){
			reRender()
			Swal.fire({
				customClass: {
					confirmButton: 'btn btn-success',
				},
				buttonsStyling: false,
				title : "路線新增成功",
				icon : "success",
				html : "<h3 class='text-primary'>新增的路線將預設為<i class='text-danger'>禁用</i></h3>",
				confirmButtonText : "返回"
			})
		},
		error : function(jqXHR){
			Swal.fire("發生錯誤", "錯誤代碼 : " + jqXHR.status, "error")
		}
	})
}

var setActModeChart = function setActModeChart(cType){
	var ctx = $("#actModeChart");
	if(actModeChart != null ) actModeChart.destroy()
	let setType = 'pie';
	if(typeof cType != 'undefined') setType = cType

	var chartSet =  {
	  type: setType,
	  data: {
	    labels: ["活躍狀態", "非活躍狀態", "歷史狀態"],
	    datasets: [{
	      data: actMode,
	      backgroundColor: chartBackColors,
	      hoverBackgroundColor: chatyBackHoverColors,
	      hoverBorderColor: "rgba(234, 236, 244, 1)",
	    }],
	  },
	  options: {
	    maintainAspectRatio: false,
	    tooltips: {
		  bodyFontSize : 20,
	      borderWidth: 5,
	      xPadding: 15,
	      yPadding: 15,
	      caretPadding: 10,
	    },
	    legend: {
	      display: true
	    },
	  },
	}
	if(setType == 'bar' || setType == 'horizontalBar') chartSet.options.legend.display = false;
	actModeChart = new Chart(ctx,chartSet);
//	$("#actModeChart")[0].toDataURL("image/jpg")
}

var setTagModeChart = function setTagModeChart(cType){
	
	let actList = allData.actList
	let tagData = setTagData(actList)
	
	var ctx = $("#tagModeChart");
	if(tagModeChart != null ) tagModeChart.destroy()
	let setType = 'pie';
	if(typeof cType != 'undefined') setType = cType
	
	let chartSet =  {
	  type: setType,
	  data: {
		  labels: tagNames,
	    datasets: [
			{
		      data: tagData,
		      backgroundColor: chartBackColors,
		      hoverBackgroundColor: chatyBackHoverColors,
		      hoverBorderColor: "rgba(234, 236, 244, 1)",
	    	},
		],
	  },
	  options: {
	    maintainAspectRatio: false,
	    tooltips: {
		  bodyFontSize : 20,
	      borderWidth: 5,
	      xPadding: 15,
	      yPadding: 15,
		  displayColors: false,
	      caretPadding: 10,
	    },
	    legend: {
	      display: true
	    },
	  },
	}
	if(setType == 'bar' || setType == 'horizontalBar') chartSet.options.legend.display = false;
	tagModeChart = new Chart(ctx,chartSet);
}

function setTagData(actList){
	let newAct = 0
	let hotAct = 0
	let oldAct = 0
	let regClz = 0
	let regFull = 0
	let regAvl = 0
	let regAlmClz = 0
	let regAlmFull = 0
	
	for(let i in actList){
		let tagMap = actList[i].tagMap
		if (!tagMap[3]) {
			if (tagMap[1]) {
				newAct++;
			}
			if (tagMap[2]) {
				hotAct++;
			}
			if (!tagMap[4]) {
				if (!tagMap[5]) {
					if (tagMap[6]) {
						regAvl++;
					}
					if (tagMap[7]) {
						regAlmClz++
					}
					if (tagMap[8]) {
						regAlmFull++
					}
				} else {
					regFull++;
				}
			} else {
				regClz++;
			}
	
		} else {
			oldAct++;
		}
	}
	
	
	
	return [newAct, hotAct, oldAct, regClz, regFull, regAvl, regAlmClz, regAlmFull];
}

var setActTrendChart = function setActTrendChart(cType,month,year){
	var ctx = $("#actTrendChart");
	let setType = 'line'; 
	if(actTrendChart != null ) {
		setType = actTrendChart.config.type
		actTrendChart.destroy()
	}
	if(cType != null) setType = cType;
	let dateLabel = ["一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月"]
	let actData = []
	let regData = []
	var totalDay;
	var defaultYear = new Date().getFullYear()
	if(year!=null){
		defaultYear=year
	}
	if(month != null){
		totalDay = new Date(defaultYear,month+1,0).getDate()
		dateLabel = []
		for(let i = 1 ; i <= totalDay ; i++){
			let date = new Date(defaultYear, month, i).toLocaleDateString()
			dateLabel.push(date)
		}
	}
	actData = actTrend_setActData(month,defaultYear,dateLabel)
	console.log(actData)
	regData = actTrend_setRegData(month,defaultYear,dateLabel)
	console.log(regData)
	
	for(let i in dateLabel){
		let origin = dateLabel[i]
		dateLabel[i] = origin.substring(origin.indexOf("/")+1)
	}
	console.log(dateLabel)
	let chartSet = {
	  type: setType,
	  data: {
	    labels: dateLabel, //顯示區間名稱
	    datasets: [
	      {
			label : "活動發佈數量",
	        lineTension: 0,//折線圖取線彎曲度 0為直線
	        backgroundColor: "rgba(78, 115, 223, 0.05)",//折線圖底下顏色
	        borderColor: "rgba(78, 115, 223, 1)",//折線顏色
	        pointRadius: 3,//圓點半徑
	        //圓點顏色
	        pointBackgroundColor: "rgba(78, 115, 223, 1)",
	        pointBorderColor: "rgba(78, 115, 223, 1)",
	        pointHoverRadius: 3,
	        pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
	        pointHoverBorderColor: "rgba(78, 115, 223, 1)",
	        pointHitRadius: 10,
	        pointBorderWidth: 2,
	        data: actData,//資料內容
	      },
		  {
	        label: '報名人數',//tootip 出現的名稱
	        lineTension: 0,//折線圖取線彎曲度 0為直線
	        // fill: false, 是否要折線圖底下顏色 預設為true
	        backgroundColor: "rgba(41,178,136,0.05)",
	        borderColor: "rgba(41,178,136,1)",
	        pointRadius: 3,//圓點半徑
	        //圓點顏色
	        pointBackgroundColor: "rgba(41,178,136, 1)",
	        pointBorderColor: "rgba(41,178,136, 1)",
	        pointRadius: 3,
	        // pointHoverBackgroundColor: "rgba(41,178,136, 1)",
	        // pointHoverBorderColor: "rgba(41,178,136, 1)",
	        pointHitRadius: 10,
	        pointBorderWidth: 2,
	        data: regData,
	      }
	    ],
	  },
	  //折線圖外觀表現樣式
	  options: {
		title : {
			display : true,
			fontSize : 17.5,
			text : defaultYear + "年"
		},
	    maintainAspectRatio: false,
	    layout: {    //顯示樣式   display: true,
	      padding: {
	        left: 10,
	        right: 25,
	        top: 25,
	        bottom: 0
	      }
	
	    },
	       // x,y軸內容
	    scales: {
	      xAxes: [{
	        gridLines: {
	          display: false,
	          drawBorder: false
	        },
	        ticks: {
	          maxTicksLimit: 31,
	        }
	      }],
	      yAxes: [{
	        ticks: {
	          maxTicksLimit: 5,
			  min : 0,
	          // padding: 0,
	          // Include a dollar sign in the ticks
	          callback: function (value, index, values) {
	            return  number_format(value);
	          }
	        }
	        ,
	        gridLines: {
	          color: "rgb(234, 236, 244)",
	          zeroLineColor: "rgb(234, 236, 244)",
	          drawBorder: false,
	          borderDash: [2],
	          zeroLineBorderDash: [2]
	        }
	      }],
	    },
	     //是否顯示 tooltip
	    legend: {
	      display: true
	    },
	    //以下為折線圖滑入比較詳細資料
	    tooltips: {
	      backgroundColor: "rgb(255,255,255)",
	      bodyFontColor: "#858796",
	      titleMarginBottom: 10,
	      titleFontColor: '#6e707e',
	      titleFontSize: 14,
	      borderColor: '#dddfeb',
	      borderWidth: 1,
	      xPadding: 15,
	      yPadding: 15,
	      displayColors: false,
	      intersect: false,
	      mode: 'index',
	      caretPadding: 10,
	      callbacks: {
	        label: function (tooltipItem, chart) {
	          var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
	          return datasetLabel + ': 人數' + number_format(tooltipItem.yLabel) + "人";
	        }
	      }
	    }
	  }
	}
	if(month!=null) chartSet.options.title.text = defaultYear + "年" + (month+1) + "月" 
	if(setType == "bar" || setType == "horizontalBar" ){
		let datasets = chartSet.data.datasets
		for(let i in datasets){
			delete datasets[i].pointRadius
			delete datasets[i].pointBackgroundColor
			delete datasets[i].pointBorderColor
			delete datasets[i].pointHoverRadius
			delete datasets[i].pointHoverBackgroundColor
			delete datasets[i].pointHoverBorderColor
			delete datasets[i].pointHitRadius
			delete datasets[i].pointBorderWidth
			datasets[i].backgroundColor = chartBackColors[i]
		    datasets[i].hoverBackgroundColor = chatyBackHoverColors[i]
			
		}
	}
	console.log(ctx)
	console.log(chartSet)
	actTrendChart = new Chart(ctx,chartSet);
}

var setActMonthSlider = function setActMonthSlider(){
	if(monthSliders!=null) monthSliders.destroy()
	monthSliders = new Slider("#monthSlider",{
		min : 0,
		max : 11,
		ticks : [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11],
		ticks_labels : ["一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月"],
		step : 1,
		value : 6,
		tooltip : "hide"
	})
	monthSliders.on("slideStop",function(e){
		let month = e
		let year = $("#actTrend-select").val()
		console.log(year)
		setActTrendChart(null,month,year)
	})
}
var setActYearSelect = function setActYearSelect(){
	let thisYear = new Date().getFullYear()
	$("#actTrend-select").empty()
	for(let i = 1970 ; i <= 2099 ; i++){
		$("#actTrend-select").append(`<option value="${i}">${i}年</option>`)
		if(i == thisYear) $("#actTrend-select").find("option").last().attr("selected",true)
	}
}
function actTrend_setActData(month,defaultYear,dateLabel){
	result = []
	for(let i in dateLabel){
		result.push(0)
	}
	let actList = allData.actList
	for(let rt in actList){
		let postDate = new Date(actList[rt].actBasic.actInfo.postDate)
		if(postDate.getFullYear() == defaultYear){
			if(month == null){
				result[postDate.getMonth()] += 1
			}else{
				let parseDate = postDate.toLocaleDateString()
				for(let i in dateLabel){
					if(parseDate == dateLabel[i]) result[i] += 1
				}
			}
		}
	}
	actTrend_actData = result
	return result
}
function actTrend_setRegData(month,defaultYear,dateLabel){
	result = []
	for(let i in dateLabel){
		result.push(0)
	}
	for(let i in allData_reg){
		let resultRegDate = new Date(allData_reg[i].actRegistry.reqDate)
		if(resultRegDate.getFullYear() == defaultYear){
			if( month==null){
				result[resultRegDate.getMonth()] += allData_reg[i].regNum
			}else{
				let parseDate = resultRegDate.toLocaleDateString()
				for(let j in dateLabel){
					
					if(parseDate == dateLabel[j]) result[j] += 1
				}
			}
		}
	}
	actTrend_regData = result
	return result
}

function imageDelete(src, aTag){
	$.fancybox.close();
	Swal.fire({
		title : "<h1 class='text-danger' ><i class='fas fa-skull-crossbones fa-pulse'></i>警告<i class='fas fa-skull-crossbones fa-pulse'></i></h1>",
		icon : "warning",
		html : "<h3>即將刪除圖片</h3>",
		imageUrl:src,
		imageHeight: "auto",
		imageWidth: 500,
		customClass: {
			confirmButton: 'btn btn-success',
			cancelButton: 'btn btn-danger'
		},
		buttonsStyling: false,
		showCancelButton: true, 
		confirmButtonColor: '#3085d6',
		cancelButtonColor: '#d33',
		confirmButtonText: '確定刪除', 
		cancelButtonText: '取消',
		showLoaderOnConfirm: true,
	}).then((result) => {
		if(result.isConfirmed){
			ajaxDeleteImage(aTag)
		}else{
			$.fancybox.open({
				src : src,
				type : "image"
			})
		}
	})
	
}

function imageUpdate(src, aTag){
	console.log(aTag)
//	let innerHtml = "<form id='update-Image'><div class='custom-file'><input type='file' accept='*/image' name='image' class='custom-file-input' id='files'><label class='custom-file-label' for='files'>選擇圖片</label></div></form>"
	$.fancybox.close();
	Swal.fire({
		title : "修改圖片",
		icon : "warning",
//		html : innerHtml,										    
		imageUrl:src,
		imageHeight: "auto",
		imageWidth: 500,
		input: 'file',
  		inputLabel: '選擇圖片',
		inputAttributes: {
			required : true,
			accept : "image/*",
			name : "image"
		},
		inputValidator: (value) => {
		    if (value) {
				let fileType = value.type.match(/^\image/)
				if(!fileType)return "必須為圖片檔"
		    }else{
			    return '請選擇圖片'
			}
		},
		customClass: {
			confirmButton: 'btn btn-success',
			cancelButton: 'btn btn-danger'
		},
		buttonsStyling: false,
		showCancelButton: true, 
		confirmButtonColor: '#3085d6',
		cancelButtonColor: '#d33',
		confirmButtonText: '確定修改', 
		cancelButtonText: '取消',
		showLoaderOnConfirm: true,
	}).then((result) => {
		console.log(result)
		if(!result.isConfirmed){
			console.log(result.value)
			
			$.fancybox.open({
				src : src,
				type : "image"
			})
		}else{
			ajaxUpdateImg(result.value,aTag)
		} 
	})
}
function ajaxUpdateImg(file,aTag){
	console.log(aTag)
	let href = aTag.attr("href")
	let formData = new FormData()
	formData.append("image",file)
	let newURL;
	let catchID = href.match(/\-[0-9]+\?/)[0].replace(/[-?]/g,"")
	$.ajax({
		url : baseURL + "/image-" + catchID,
		type : "POST",
		data : formData,
		processData: false,
		contentType : false,
		success : function(){
			newURL = baseURL + "/image-" + catchID + "?timestamp=" + new Date().getTime()
			aTag.attr("href",newURL)
			aTag.find("img").attr("src",newURL)
			Swal.fire({
				title : "修改成功",
				icon : "success",
				timer : 1500,
				timerProgressBar : true,
				allowOutsideClick : false,
				allowEscapeKey : false,
				allowEnterKey : false,
				showConfirmButton : false
				}).then(() => {
					$.fancybox.open({
						src : newURL,
						type : "image"
				})
			})			
		},
		error : function(jqXHR){
			Swal.fire("發生錯誤 : 修改圖片", "錯誤代碼 : " + jqXHR.status, "error")
		}
	})
}

function ajaxDeleteImage(aTag){
	let href = aTag.attr("href")
	let catchID = href.match(/\-[0-9]+\?/)[0].replace(/[-?]/g,"")
	console.log(catchID)
	
	$.ajax({
		url : baseURL + "/image-" + catchID,
		type : "Delete",
		success : function(){
			Swal.fire({
				title : "刪除成功",
				icon : "success",
				timer : 1500,
				timerProgressBar : true,
				allowOutsideClick : false,
				allowEscapeKey : false,
				allowEnterKey : false,
				showConfirmButton : false
				}).then(() => {
					aTag.parent("div").remove()
			})			
		},
		error : function(jqXHR){
			Swal.fire("發生錯誤 : 修改圖片", "錯誤代碼 : " + jqXHR.status, "error")
		}
	})
}
