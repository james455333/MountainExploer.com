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
function downloadAllJson(){
	$.ajax({
		url : routeBaseURL + "/allRoute",
		type : "GET",
		dataType : "json",
		success : function(data){
			let newData = {}
			for(let i in data){
					let npName = data[i].np
				if( newData[npName] == null){
					newData[npName] = []
				}
				let routeInfo = data[i].routeInfo
				let status = "啟用";
				if(routeInfo.toggle != null) status = "禁用"
				let newRoute = {
					路線編號 : routeInfo.id,
					路線名稱 : routeInfo.name,
					路線介紹 : routeInfo.desp,
					建議行程 : routeInfo.adv,
					交通資訊 : routeInfo.traf,
					狀態 : status
				}
				newData[npName].push(newRoute)
			}
			activeJsonDownload(newData,"路線總資料表")
		},
		error : function(jqXHR){
			Swal.fire("發生錯誤", "下載時發生錯誤，錯誤代碼 : " + jqXHR.status, "error")
		}
	})
}

function downloadChart(chartElm){
	const openURL = chartElm.toBase64Image()
	const chartType = chartElm.config.type
	const a = $("a.export")[0]
	// 設定下載的檔名
	a.download = chartType+"_countRtChart.png"
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
		$.ajax({
			url : routeBaseURL+"/usePerNp",
			type : "GET",
			dataType : "json",
			success : function(data){
				let newData = {}
				for(let i in data){
					let rt = data[i]
					let newRt = {路線總數 : 0}
					newData[i] = newRt
					for(let j in rt){
						if(j == "npNums"){
							newRt["路線總數"] = rt[j]
						}else{
							newRt[j] = {路線被選取數 : rt[j] }
						}
					}
				}
				activeJsonDownload(newData,"活動選擇_國家公園及路線使用率")
			},
			error : function(jqXHR){
				Swal.fire("發生錯誤", "下載時發生錯誤，錯誤代碼 : " + jqXHR.status, "error")
			}
		})
	}else if( order == 2 ){
		$.ajax({
			url : routeBaseURL+"/countRt",
			type : "GET",
			dataType : "json",
			success : function(data){
				let newData = {}
				for(let i in data){
					newData[i] = {路線總數 : data[i]}
				}
				activeJsonDownload(newData,"各國家公園路線總數量")
			},
			error : function(jqXHR){
				Swal.fire("發生錯誤", "下載時發生錯誤，錯誤代碼 : " + jqXHR.status, "error")
			}
		})
	}
}

function activeJsonDownload(jsonObj,fileName){
	$("<a />", {
	    "download": fileName+".json",
	    "href" : "data:application/json," + encodeURIComponent(JSON.stringify(jsonObj))
	}).appendTo("body")
	.click(function() {
		$(this).remove()
	})[0].click()	
}

function reRender(){
	usePerRtChart = null;
	setTopCard()
	countRtChartData()
	usePerNpChartData()
	setSearchBar()
	if(typeof dataTable != 'undefined') dataTable.destroy()
	$('#routeTable').find("tbody").remove()
	let btn = $(this)
	btn.find("i").addClass("fa-spin")
	setTimeout(function(){
		setTable()
		btn.find("i").removeClass("fa-spin")
	}, 1000)
}

function resetChart(canvasID){
	if(canvasID == 'usePerNpChart'){
		usePerRtChart = null;
		usePerNpChartData()
	}else if(canvasID == 'countRtChart'){
		countRtChartData()
	}
}

function setTopCard(){
	return $.ajax({
		url : routeBaseURL + "/allRoute",
		type : "GET",
		dataType : "json",
		success : function(data){
			let able = 0; 
			let forbid = 0;
			for(let i in data){
				let routeInfo = data[i].routeInfo
				if(routeInfo.toggle != null){
					forbid++;
				}else{
					able++;
				}
			}	
			
			$("#rt-total-num").html(data.length)
			$("#rt-able-num").html(able)
			$("#rt-forbid-num").html(forbid)
			progressCount("圖卡設置完成")
			return;
		},
		error : function(jqXHR){
			Swal.fire("發生錯誤", "錯誤代碼 : " + jqXHR.status, "error")
		}
	})
	
}


function setSearchBar(){
	$("#npChartSelect").find("option").remove()
	$("#npSelect").find("option").remove()
	$("#rtSelect").find("option").remove()
	$.ajax({
	url : oldBackStageURL + "/navNP",
	method : "GET",
	dataType: 'json',
	success:function(result){
		$("#npChartSelect").append("<option selected disabled>請選擇指定國家公園</option>")
		$("#npSelect").append("<option selected disabled>請選擇指定國家公園</option>")
		for(let i = 0 ; i < result.length ; i++){
			$("#npChartSelect").append('<option value="' + result[i].seqno +'">' + result[i].npName + "</option>" )
			$("#npSelect").append('<option value="' + result[i].seqno +'">' + result[i].npName + "</option>" )
		}
		
		let firstNP = $("#npSelect").find("option").eq(0).val()
		$.ajax({
			url : oldBackStageURL + "/navRT?nationalPark=" + firstNP,
			method : "GET",
			dataType : "json",
			success:function(data){
				$("#rtSelect").append("<option selected disabled>請選擇特定路線</option>")
				for(let i in data) $("#rtSelect").append("<option value='" + data[i].seqno + "'>" + data[i].name +"</option>")
				progressCount("搜尋列設置完成")
			}
		})
	}
})
	
	
}

function setTable(){
	$.ajax({
		url : routeBaseURL + "/allRoute",
		type : "GET",
		dataType : "json",
		success : function(data){
			let result = setResultToDT(data)
			setDataTable(result)
			progressCount("資料表格設置完成")
			progressCount("準備完成")
		},
		error : function(jqXHR){
			Swal.fire("發生錯誤", "錯誤代碼 : " + jqXHR.status, "error")
		}
	})
}
function setResultToDT(data){
	let result = [];
	let updateBtn = `<button data-toggle='tooltip'  title='修改本筆路線資料'  class="btn btn-warning btn-rt-update">
                    		<i class="fas fa-exclamation-triangle"></i> 修改
						</button>`
	let deleteBtn = `<button data-toggle='tooltip'  title='刪除本筆路線資料'  class="btn btn-danger btn-rt-delete">
                    		<i class="fas fa-trash"></i> 刪除
						</button>`
	let infoBtn = `<button data-toggle='tooltip'  title='查看更多資訊'   class="btn btn-info btn-rt-info">
                    		<i class="fas fa-info"></i> 更多
						</button>`
	let upImgBtn = `<button data-toggle='tooltip'  title='修改路線地圖'   class="btn btn-dark btn-rt-upImg">
                    		<i class="fas fa-image"></i> 修改路線圖
						</button>`
	for(let i in data){
		let toggleBtn = `<input type="checkbox" class='btn-ctrl' checked data-toggle="toggle" data-on="<i class='fas fa-power-off'></i> 啟用" data-off="<i class='fas fa-ban'></i> 禁用" data-onstyle="success" data-offstyle="danger">`
		let routeInfo = data[i].routeInfo
		if(routeInfo.toggle != null){
			toggleBtn = `<input type="checkbox" class='btn-ctrl' data-toggle="toggle"  data-on="<i class='fas fa-power-off'></i> 啟用" data-off="<i class='fas fa-ban'></i> 禁用" data-onstyle="success" data-offstyle="danger">`
		}
		let rtImage = '<a data-fancybox="' + "gallery" + routeInfo.id + '" href="' 
			+ '/MountainExploer.com/back/mountain/route/crud/images?seqno=' + routeInfo.id + "&timestamp=" + new Date().getTime()
			+ '">'
			+ '<img src="/MountainExploer.com/back/mountain/route/crud/images?seqno='
			+ routeInfo.id + "&timestamp=" + new Date().getTime()
			+ '" class="routeImg" onerror="imgError($(this))"></a>'
		
		
		let riGroup = {
			"啟用/禁用" : toggleBtn,
			"路線圖" : rtImage,
			"路線編號" : routeInfo.id,
			"路線名稱" : routeInfo.name,
			"國家公園名稱" : data[i].np,
			"控制項" : "<div class='d-flex justify-content-between align-items-center' >" + updateBtn + deleteBtn + infoBtn + upImgBtn +"</div>",		
			}
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
            { "data": "啟用/禁用" },
            { "data": "路線圖" },
            { "data": "路線編號" },
            { "data": "路線名稱" },
            { "data": "國家公園名稱" },
            { "data": "控制項" },
        ],
    } )
	
	$('.btn-ctrl').bootstrapToggle();
	$('.btn-rt-delete').tooltip();
	$('.btn-rt-update').tooltip();
	$('.btn-rt-info').tooltip();
	$('.btn-rt-upImg').tooltip();
	
}
function changeRtAndTb(){
	var npID = $("#npSelect").val();
	$.ajax({
		url : oldBackStageURL + "/navRT?nationalPark="+npID,
		type : "GET",
		dataType: 'json',
		success:function(data){
			$("#rtSelect").empty()
			if(data.length != 0){
				for(let i in data) 
					$("#rtSelect").append("<option value='" + data[i].seqno + "'>" + data[i].name +"</option>")
			}
			
		}
	})
	
	$.ajax({
		url : routeBaseURL + "/npSelect." + npID,
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
		url : routeBaseURL + "/rt-" + rtID,
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
		url : routeBaseURL + "/update-toggle." + thisRtID + "-" + thisToggle,
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
	let rtID = btn.parents("tr").find("td").eq(2).text()
	let npName = btn.parents("tr").find("td").eq(4).text()
	let nps;
	$.ajax({
		url : oldBackStageURL + "/navNP",
		method : "GET",
		dataType: 'json',
		success:function(result){
			nps = result
		}
	})
	$.ajax({
		url : routeBaseURL + "/rt-" + rtID,
		type : "GET",
		dataType: 'json',
		success:function(data){
			let final = '<label class="swal2-label">國家公園'
						+ '<select id="update-np" class="swal2-select">'
			for(let i in nps){
				if(npName == nps[i].npName ) {
					final +='<option selected value="' + nps[i].seqno +'">' + nps[i].npName + "</option>"
				}else{
					final +='<option value="' + nps[i].seqno +'">' + nps[i].npName + "</option>" 
				}
			}
			final += '</select>'
					+ '</label>'
					+ '<hr>' 
					+ '<label class="swal2-label">路線名稱' 
						+'<input required id="update-name" type="text" class="swal2-input" value="'+ data[0].routeInfo.name +'" >'
					+ '</labe>'
					+ '<hr>' 
					+ '<label class="swal2-label">路線介紹' 
						+'<textarea id="update-desp" style="resize : none;" cols="150" class="swal2-textarea">'+ data[0].routeInfo.desp +'</textarea >'
					+ '</labe>'
					+ '<hr>' 
					+ '<label class="swal2-label">建議行程' 
						+'<textarea id="update-adv" style="resize : none;" cols="150" class="swal2-textarea">'+ data[0].routeInfo.adv +'</textarea >'
					+ '</labe>'
					+ '<hr>' 
					+ '<label class="swal2-label">交通資訊' 
						+'<textarea id="update-traf" style="resize : none;" cols="150" class="swal2-textarea">'+ data[0].routeInfo.traf +'</textarea >'
					+ '</labe>'
					+ '<hr>' ;
				Swal.fire({
					title : "資料修改 --- 路線編號 : " + data[0].routeInfo.id ,
					html : final,
					width : "1000px",
					focusConfirm: false,
					preConfirm : function(){
					    return new Promise(function (resolve) {
						    resolve({
								rtID : data[0].routeInfo.id,
						    	npID : Number($('#update-np').val()),
								name : $('#update-name').val(),
								desp : $('#update-desp').val(),
								adv : $('#update-adv').val(),
								traf : $('#update-traf').val(),
								
						    })
					    })
					},
					showCancelButton: true,
					cancelButtonText: '取消修改',
  					confirmButtonText: '確認修改',
				}).then(function(result){
					if(result.isConfirmed)
					ajaxUpdate(result.value)
				})
		}
	})
}

function ajaxUpdate(result){
	$.ajax({
		url : routeBaseURL + "/update." + result.rtID,
		type : "PUT",
		data : JSON.stringify(result),
	    contentType: "application/json; charset=UTF-8",
		success : function(){
			reRender()
			Swal.fire({
				title : "修改成功",
				icon : "success",
  				confirmButtonText: '了解',
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
		customClass: {
			confirmButton: 'btn btn-success',
		    cancelButton: 'btn btn-danger'
		},
		buttonsStyling: false,
		title : '即將刪除 <i class="fas fa-arrow-right"></i> 路線編號 : ' + rtID,
		icon : "warning",
		html : "!! 警告 !!  <hr>本動作將刪除本路線，並且無法回復",
		showCancelButton: true, 
	  	confirmButtonColor: '#3085d6',
		cancelButtonColor: '#d33',
		confirmButtonText: '確定刪除', 
		cancelButtonText: '取消',
	}).then(function(e) {
		if(e.isConfirmed){
			$.ajax({
				url : routeBaseURL + "/rt-" + rtID,
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
	let rtID = btn.parents("tr").find("td").eq(2).text()
	let nextTr = btn.parents("tr").next()
	if(nextTr.attr("class") == "append-info") {
		nextTr.toggle(500)
		nextTr.next().toggle(500)
		nextTr.siblings(".append-info").not(nextTr).not(nextTr.next()).hide(500)
		return;
	}
	$(".append-info").hide(500)
	$.ajax({
		url : routeBaseURL + "/rt-" + rtID,
		type : "GET",
		dataType: 'json',
		success : function(data){
			let routeInfo = data[0].routeInfo;
			let appendInfo = "<tr class='append-info'>"
								+ "<th colspan='3'>路線介紹</th>"
								+ "<th colspan='2'>建議行程</th>"
								+ "<th colspan='1'>交通資訊</th>"
							+ "</tr>"
							+ "<tr class='append-info'>"
								+ "<td colspan='3'><div>" + routeInfo.desp + "</div></th>"
								+ "<td colspan='2'><div>" + routeInfo.adv + "</div></th>"
								+ "<td colspan='1'><div>" + routeInfo.traf + "</div></th>"
							+ "</tr>"
			
			btn.parents("tr").after(appendInfo)
			btn.parents("tr").nextAll().slice(0,2).show(500)
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
			let formData = new FormData(form[0])
			$.ajax({
				url : routeBaseURL + "/update-imgae." + rtID,
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
    // 若有選取檔案
    if (input.files && input.files[0]) {
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
			$("#swal2-content").append("<div>檔案名稱 <hr>" + input.files[0].name + "</div>")
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
				url : routeBaseURL + "/np",
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
								url : routeBaseURL + "/np-" + value,
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
										url : routeBaseURL + "/np-" + value,
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
		url : routeBaseURL + "/rt",
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
function countRtChartData(cType){
	$.ajax({
		url : routeBaseURL + "/countRt",
		type : "GET",
		dataType : "json",
		success : function(data){
			setCountRtChart(data,cType)
			progressCount("路線數量圖設置完成")
			return;
		},
		error : function(jqXHR){
			Swal.fire("設定路線圓餅圖發生錯誤", "錯誤代碼 : " + jqXHR.status, "error")
		}
	})
}
function setCountRtChart(data,cType){
	let names = []
	let rtNums = []
	for(let i in data){
		names.push([i])
		rtNums.push(data[i])
	}
	var ctx = $("#countRtChart");
	if(countRtChart != null ) countRtChart.destroy()
	let setType = 'doughnut';
	if(typeof cType != 'undefined') setType = cType
	var chartSet =  {
	  type: setType,
	  data: {
	    labels: names,
	    datasets: [{
	      data: rtNums,
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
	countRtChart = new Chart(ctx,chartSet);
//	$("#countRtChart")[0].toDataURL("image/jpg")
}

function usePerNpChartData(cType){
	
	$.ajax({
		url : routeBaseURL + "/usePerNp",
		type : "GET",
		dataType : "json",
		success : function(data){
			setUsePerNpChart(data,cType)
			progressCount("國家公園與路線選擇圖設置完成")
		},
		error : function(jqXHR){
			Swal.fire("設定國家公園與路線圓餅圖 發生錯誤", "錯誤代碼 : " + jqXHR.status, "error")
		}
	})
}
function setUsePerNpChart(data,cType){
	if(usePerRtChart != null){
		setUsePerRtChart(data,cType)
		return
	}
	
	let names = []
	let usePer =[]
	for(let i in data){
		names.push([i])
		usePer.push(data[i].npNums)
	}
	
	var ctx = $("#usePerNpChart");
	if(usePerNpChart != null ) usePerNpChart.destroy()
	let setType = 'pie';
	if(typeof cType != 'undefined') setType = cType
	
	let chartSet =  {
	  type: setType,
	  data: {
		  labels: names,
	    datasets: [
			{
		      data: usePer,
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
	usePerNpChart = new Chart(ctx,chartSet);
}

function setUsePerRtChart(data,cType){
	let rtNames = []
	let usePerRt =[]
	for(let i in data){
		if( i == usePerRtChart){
			let rt = data[i]
			for(let j in rt){
				if(j != "npNums"){
					
					rtNames.push(j)
					usePerRt.push(rt[j])
				}
			}
		}
	}
	var ctx = $("#usePerNpChart");
	if(usePerNpChart != null ) usePerNpChart.destroy()
	let setType = 'pie';
	if(typeof cType != 'undefined') setType = cType
	
	let chartRtSet =  {
	  type: setType,
	  data: {
		  labels: rtNames,
	    datasets: [
			{
		      data: usePerRt,
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
		scales: {
            yAxes: [{
                ticks: {
                    suggestedMin: 0,
                }
            }]
        }
	  },
	}
	if(setType == 'bar' || setType == 'horizontalBar') chartRtSet.options.legend.display = false;
	usePerNpChart = new Chart(ctx,chartRtSet);
}
