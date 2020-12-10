function setTopCard(){
	$.ajax({
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
		},
		error : function(){
			Swal.fire.fire("發生錯誤","","error")
		}
	})
	
}


function setSearchBar(){
	$("#npSelect").find("option").remove()
	$("#rtSelect").find("option").remove()
	$.ajax({
	url : oldBackStageURL + "/navNP",
	method : "GET",
	dataType: 'json',
	success:function(result){
		for(let i = 0 ; i < result.length ; i++){
			
			$("#npSelect").append('<option value="' + result[i].seqno +'">' + result[i].npName + "</option>" )
			
		}
		
		let firstNP = $("#npSelect").find("option").eq(0).val()
		$.ajax({
			url : oldBackStageURL + "/navRT?nationalPark=" + firstNP,
			method : "GET",
			dataType : "json",
			success:function(data){
				//console.log(data)
				for(let i in data) $("#rtSelect").append("<option value='" + data[i].seqno + "'>" + data[i].name +"</option>")
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
		},
		error : function(){
			Swal.fire.fire("發生錯誤","","error")
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
			+ '/MountainExploer.com/backstage/mountain/search/images?seqno=' + routeInfo.id
			+ '">'
			+ '<img src="/MountainExploer.com/backstage/mountain/search/images?seqno='
			+ routeInfo.id
			+ '" class="routeImg" ></a>'
		
		
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
			//console.log(data)
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
		url : routeBaseURL + "/rtSelect." + rtID,
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
		url : routeBaseURL + "/rtSelect." + rtID,
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
	console.log(result)
	$.ajax({
		url : routeBaseURL + "/update." + result.rtID,
		type : "PUT",
		data : JSON.stringify(result),
	    contentType: "application/json; charset=UTF-8",
		success : function(){
			Swal.fire({
				title : "修改成功",
				icon : "success",
  				confirmButtonText: '了解',
			})
			dataTable.destroy()
			setTable()
			setSearchBar()
		},
		error : function(jqXHR){
			Swal.fire("發生錯誤", "錯誤代碼 : " + jqXHR.status, "error")
		},
	})
}

function deleteAlert(btn){
	let rtID = btn.parents("tr").find("td").eq(2).text()
	
	Swal.fire({
		title : '即將刪除 <i class="fas fa-arrow-right"></i> 路線編號 : ' + rtID,
		icon : "warning",
		html : "!! 警告 !!  <hr>本動作將刪除本路線，並且無法回復",
		showCancelButton: true, 
	  	confirmButtonColor: '#3085d6',
		cancelButtonColor: '#d33',
		confirmButtonText: '確定刪除', 
		cancelButtonText: '取消',
		confirmButtonClass: 'btn btn-success',
		cancelButtonClass: 'btn btn-danger',
		buttonsStyling: false
	}).then(function(e) {
		console.log(e)
		if(e.isConfirmed){
			$.ajax({
				url : routeBaseURL + "/rtSelect." + rtID,
				type : "Delete",
				success:function(){
					dataTable.destroy()
					setTable()
					setSearchBar()
					setTopCard()
					Swal.fire({
						title : "刪除成功",
						icon : "success",
					  	confirmButtonColor: '#3085d6',
						confirmButtonText: '返回', 
						confirmButtonClass: 'btn btn-success',
						buttonsStyling: false
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
		url : routeBaseURL + "/rtSelect." + rtID,
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
		confirmButtonClass: 'btn btn-success',
		cancelButtonClass: 'btn btn-danger',
		buttonsStyling: false
	}).then(function(result){
		if(result.isConfirmed){
			console.log(form)
			let formData = new FormData(form[0])
			$.ajax({
				url : routeBaseURL + "/update-imgae." + rtID,
				type : "POST",
				processData : false,
				contentType : false,
				data : formData,
				success : function(){
					Swal.fire({
						title : "圖片修改成功",
						icon : "success",
					  	confirmButtonColor: '#3085d6',
						confirmButtonText: '返回', 
						confirmButtonClass: 'btn btn-success',
						buttonsStyling: false
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
			$("#swal2-content").append("<div>檔案名稱 <hr>" + input.files[0].name + "</div>")
        }
 
        // 因為上面定義好讀取成功的事情，所以這裡可以放心讀取檔案
        reader.readAsDataURL(input.files[0]);
    }
}
function newNp(){
	Swal.fire({
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
		confirmButtonClass: 'btn btn-success',
		cancelButtonClass: 'btn btn-danger',
		buttonsStyling: false
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
					setSearchBar()
					Swal.fire({
						title : result.value +  " 新增成功",
						icon : "success",
						confirmButtonText: '返回', 
						confirmButtonClass: 'btn btn-primary',
						buttonsStyling: false
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
				confirmButtonClass: 'btn btn-success',
				cancelButtonClass: 'btn btn-danger',
				buttonsStyling: false
			}).then(function(result){
				if(result.isConfirmed){
					let value = result.value
					let npName ;
					for(let i in data ){
						if(data[i].seqno == value) npName = data[i].npName
					}
					Swal.fire({
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
						confirmButtonClass: 'btn btn-success',
						cancelButtonClass: 'btn btn-danger',
						buttonsStyling: false
					}).then(function(final){
						if(final.isConfirmed){
							let finalData = { name : final.value}
							$.ajax({
								url : routeBaseURL + "/np-" + value,
								type : "PUT",
								data : JSON.stringify(finalData),
								contentType: "application/json; charset=UTF-8",
								success : function(){
									setSearchBar()
									if(typeof dataTable != 'undefined') dataTable.destroy()
									setTable()
									Swal.fire({
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
										confirmButtonClass: 'btn btn-primary',
										buttonsStyling: false
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
				confirmButtonClass: 'btn btn-danger',
				showLoaderOnConfirm: true,
				cancelButtonClass: 'btn btn-success',
				buttonsStyling: false
			}).then(function(firstWarning){
				if(firstWarning.isConfirmed){
					Swal.fire({
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
						confirmButtonClass: 'btn btn-danger',
						cancelButtonClass: 'btn btn-success',
						buttonsStyling: false
					}).then(function(selectNP){
						
						if(selectNP.isConfirmed){
							let value = selectNP.value
							let npName;
							for(let i in data ){
								if(data[i].seqno == value) npName = data[i].npName
							}
							Swal.fire({
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
								confirmButtonClass: 'btn btn-danger',
								cancelButtonClass: 'btn btn-success',
								showLoaderOnConfirm: true,
								buttonsStyling: false
							}).then(function(final){
								if(final.isConfirmed){
									$.ajax({
										url : routeBaseURL + "/np-" + value,
										type : "DELETE",
										success : function(){
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
			let final = '<form id="newRt-form">'
						+'<label class="swal2-label">國家公園'
						+ '<select name="npName" class="swal2-select">'
			for(let i in nps){
				if(i == 0 ) {
					final +='<option selected value="' + nps[i].seqno +'">' + nps[i].npName + "</option>"
				}else{
					final +='<option value="' + nps[i].seqno +'">' + nps[i].npName + "</option>" 
				}
			}
			
			final += '</select></label>'
					+ '<hr>'
					+ '<label class="swal2-label">路線名稱'
					+ '<input required pattern="^[\u4e00-\u9fa5]+$" type="text" name="name" class="swal2-input">'
					+ '</label>'
					+ '<hr>'
					+ '<label class="swal2-label">路線介紹'
					+ '<textarea cols="100" style="resize:none" required type="text" name="desp" class="swal2-textarea"></textarea>'
					+ '</label>'
					+ '<hr>'
					+ '<label class="swal2-label">建議行程'
					+ '<textarea cols="100" style="resize:none" required name="adv" class="swal2-textarea"></textarea>'
					+ '</label>'
					+ '<hr>'
					+ '<label class="swal2-label">交通資訊'
					+ '<textarea cols="100" style="resize:none" required name="traf" class="swal2-textarea"></textarea>'
					+ '</label>'
					+ '<hr>'
					+ '<div class="custom-file">'
					+ '<input type="file" accept="*/image" class="custom-file-input" name="fileImge" id="imageFile">'
					+ '<label class="custom-file-label" for="imageFile">選擇圖片</label>'
					+ '</div>'
					+ '</form>'
			
			Swal.fire({
				title : "新增 -- 路線資料",
				html : final,
				validationMessage : "格式錯誤或空白",
				showCancelButton: true, 
				width : "1000px",
				confirmButtonColor: '#3085d6',
				cancelButtonColor: '#d33',
				confirmButtonText: '確定修改', 
				cancelButtonText: '取消',
				confirmButtonClass: 'btn btn-success',
				cancelButtonClass: 'btn btn-danger',
				buttonsStyling: false
			})
		}
	})
	
	
}