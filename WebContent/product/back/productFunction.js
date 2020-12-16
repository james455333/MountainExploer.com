//

//改
function setTable(){
	$.ajax({
		url : routeBaseURL + "/backAll",
		type : "GET",
		dataType : "json",
		success : function(data){
			let result = setResultToDT(data)
			setDataTable(result)
		},
		error : function(jqXHR){
			Swal.fire("發生錯誤", "錯誤代碼 : " + jqXHR.status, "error")
		}
	})
}
function setResultToDT(data){
	let result = [];
	let updateBtn = `<button data-toggle='tooltip'  title='修改本商品資料'  class="btn btn-warning btn-rt-update">
                    		<i class="fas fa-exclamation-triangle"></i> 修改
						</button>`
						
						
						
//	let deleteBtn = `<form class='hiddenForm' action='/MountainExploer.com/backstage/product/deleteData'>
//						<input  type="hidden" name="seqno" value= "data[i].seqno" >
//	<button data-toggle='tooltip'  title='刪除本商品資料'  class="btn btn-danger btn-rt-delete deleteButton">
//                    		<i class="fas fa-trash"></i> 刪除
//						</button>
//						</form>
//						`
	let deleteBtn = `<button data-toggle='tooltip'  title='刪除本商品資料'  class="btn btn-danger btn-rt-delete deleteButton">
                    		<i class="fas fa-trash"></i> 刪除
						</button>`
	let infoBtn = `<button data-toggle='tooltip'  title='查看商品資訊'   class="btn btn-info btn-rt-info">
                    		<i class="fas fa-info"></i> 更多
						</button>`
//	let upImgBtn = `<button data-toggle='tooltip'  title='修改路線地圖'   class="btn btn-dark btn-rt-upImg">
//                    		<i class="fas fa-image"></i> 修改路線圖
//						</button>`
	for(let i in data){
//		let toggleBtn = `<input type="checkbox" class='btn-ctrl' checked data-toggle="toggle" data-on="<i class='fas fa-power-off'></i> 啟用" data-off="<i class='fas fa-ban'></i> 禁用" data-onstyle="success" data-offstyle="danger">`
//		let routeInfo = data[i].routeInfo
//		if(routeInfo.toggle != null){
//			toggleBtn = `<input type="checkbox" class='btn-ctrl' data-toggle="toggle"  data-on="<i class='fas fa-power-off'></i> 啟用" data-off="<i class='fas fa-ban'></i> 禁用" data-onstyle="success" data-offstyle="danger">`
//		}
//		let rtImage = '<a data-fancybox="' + "gallery" + routeInfo.id + '" href="' 
//			+ '/MountainExploer.com/back/mountain/route/crud/images?seqno=' + routeInfo.id + "&timestamp=" + new Date().getTime()
//			+ '">'
//			+ '<img src="/MountainExploer.com/back/mountain/route/crud/images?seqno='
//			+ routeInfo.id + "&timestamp=" + new Date().getTime()
//			+ '" class="routeImg" onerror="imgError($(this))"></a>'
//		
		
		let riGroup = {
//			"啟用/禁用" : toggleBtn,
//			"路線圖" : rtImage,
//			"路線編號" : routeInfo.id,
//			"路線名稱" : routeInfo.name,
//			"國家公園名稱" : data[i].np,

			"產品編號" : data[i].seqno,
			"產品名稱" : data[i].name,
			"型號" : data[i].type,
			"主分類" : data[i].firstClass,
			"次分類" : data[i].secondClass,
			"價格" : data[i].price,
			"庫存" : data[i].stock,
			"控制項" : "<div class='d-flex justify-content-between align-items-center' >" + updateBtn + deleteBtn + infoBtn  +"</div>",		
			}
		result.push(riGroup)
	}
	return result;
}
function imgError(thisElm){
//	thisElm.attr("src","/MountainExploer.com/mountain/images/defaultMountain.jpg")
//	thisElm.parent().attr("href","/MountainExploer.com/mountain/images/defaultMountain.jpg")
}

function setDataTable(result){
	console.log(result)
	console.log(dataTable)
	console.log("set DataTable")
	console.log($('#productTable'))
	dataTable = $('#productTable').DataTable( {
		"data" : result,
        "pagingType": "full_numbers",
		"columns": [
            { "data": "產品編號" },
            { "data": "產品名稱" },
            { "data": "型號" },
            { "data": "主分類" },
            { "data": "次分類" },
            { "data": "價格" },
            { "data": "庫存" },
            { "data": "控制項" },
        ],
    } )
	
	console.log("set Complete")
	$('.btn-ctrl').bootstrapToggle();
	$('.btn-rt-delete').tooltip();
	$('.btn-rt-update').tooltip();
	$('.btn-rt-info').tooltip();
	$('.btn-rt-upImg').tooltip();
	
}



//未出貨定單數
function setTopCard(){
	$.ajax({
		url : productBaseURL + "/waitOrder",
		type : "GET",
		dataType : "json",
		success : function(data){

			$("#rt-forbid-num").html(data)
		},
		error : function(jqXHR){
			Swal.fire("發生錯誤", "錯誤代碼 : " + jqXHR.status, "error")
		}
	})
	
}


//營業額
function setRevenue(){
	$.ajax({
		url : productBaseURL + "/revenue",
		type : "GET",
		dataType : "json",
		success : function(data){
			$("#rt-able-num").html(data)
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
	console.log(result)
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
		console.log(e)
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




//********************* */

//-------------------------------------------------


$(function() {
	var homeUrl = "/MountainExploer.com/backstage/product/search";

	//	預設頁面
	$(window).on("load", function() {
		
		setTable()
		
		//查找資料庫總筆數
		$.ajax({
			url: homeUrl + "/totalData",
			method: "GET",
			success: function(data) {
				var totalData = data;
				$("#totalData").html(data)

				// 預設顯示資料
				$.ajax({
//					url: homeUrl + "/backAll",
//					url: homeUrl + "/totalData",
					method: "GET",
					dataType: 'json',
					success: function(data) {
						//	使用回覆方法
						insertTable(data);
						
					}
				})
				//	主類別列表設置
				$.ajax({
					url: homeUrl + "/navFC",
					method: "GET",
					dataType: 'json',
					success: function(result) {
						for (let i = 0; i < result.length; i++) {

							$("#fcSelect").append('<option value="' + result[i].seqno + '">' + result[i].name + "</option>")

						}
						//						let firstFC = $("fcSelect").find("option").eq(0).val()
						let firstFC = $("select[name='firstclass']").find("option").eq(0).val()
						console.log(firstFC)
						//						// 次類別列表預設為第一筆顯示主類別
						navSC(firstFC);
					}
				})
				
	

			}
		})

	})
	//	主類別列表Change觸發切換路線
	$("#fcSelect").on("change", function() {
		var firstSC = $("#fcSelect").val();
		$(".scSelect").empty();
		console.log(firstSC)
		navSC(firstSC);
	})

	function navSC(firstFC) {

		$.ajax({
			url: homeUrl + "/navSC",
			method: "GET",
			dataType: "json",
			data: {
				first: firstFC
			},
			success: function(data) {
				//console.log(data)
				for (let i in data) $(".scSelect").append("<option value='" + data[i].id + "'>" + data[i].name + "</option>")
			}
		})
	}

	// 主類別查詢
	$(".fcSubmit").on("click", function() {
		page = 1;
		//console.log("show : " + showData + "\tpage : " + page)
		let fcID = $("#fcSelect").val();
		//console.log(fcID);
		$.ajax({
			url: homeUrl + "/totalData?firstclass=" + fcID,
			method: "GET",
			success: function(data) {
				totalData = data;
				$("#totalData").html(data)
				//console.log("fc query TotalData : " + data )
				totalPage = Math.ceil(totalData / showData);
				//console.log("fc query TotalPage : " + totalPage)
				$.ajax({
					url: homeUrl + "/navFC?firstclass=" + fcID + "&showData=" + showData,
					method: "GET",
					dataType: "json",
					success: function(data) {

						insertTable(data);
						setPageController(page)
					}

				})
				$("#pageController").off("click", "input")
				$("#pageController").on("click", "input", function() {
					var page = Number($(this).attr("name"));
					//console.log("page Before Click : " + page)
					$.ajax({
						url: homeUrl + "/navFC?firstclass=" + fcID + "&showData=" + showData + "&page=" + page,
						method: "GET",
						dataType: "json",
						success: function(data) {

							insertTable(data);
							setPageController(page)
						}

					})
				})
			}
		})


	})

	// 次類別查詢
	$(".scSubmit").on("click", function() {
		page = 1;
		//console.log("show : " + showData + "\tpage : " + page)
		let scID = $(".scSelect").val();
		console.log(scID);
		$.ajax({
			url: homeUrl + "/totalData?secondclass=" + scID,
			method: "GET",
			success: function(data) {
				totalData = data;
				$("#totalData").html(data)
				//console.log("fc query TotalData : " + data )
				totalPage = Math.ceil(totalData / showData);
				//console.log("fc query TotalPage : " + totalPage)
				$.ajax({
					url: homeUrl + "/scSelect?secondclass=" + scID + "&showData=" + showData,
					method: "GET",
					dataType: "json",
					success: function(data) {

						insertTable(data);
						setPageController(page)
					}

				})
				$("#pageController").off("click", "input")
				$("#pageController").on("click", "input", function() {
					var page = Number($(this).attr("name"));
					//console.log("page Before Click : " + page)
					$.ajax({
						url: homeUrl + "/scSelect?secondclass=" + scID + "&showData=" + showData + "&page=" + page,
						method: "GET",
						dataType: "json",
						success: function(data) {

							insertTable(data);
							setPageController(page)
						}

					})
				})
			}
		})


	})

	// 價格區間查詢
	$(".priceSubmitButton").on("click", function() {

		console.log("priceSubmitButton");
		page = 1;
		//console.log("show : " + showData + "\tpage : " + page)
		let scale = $('input[name*=radioGroup]:checked').val()
		console.log(scale);
		$.ajax({
			url: homeUrl + "/searchPrice?radioGroup=" + scale,
			method: "GET",
			success: function(data) {
				totalData = data;
				$("#totalData").html(data)
				console.log(" query TotalData : " + data )
				totalPage = Math.ceil(totalData / showData);
				//console.log("fc query TotalPage : " + totalPage)
				$.ajax({
					url: homeUrl + "/priceSelect?radioGroup=" + scale + "&showData=" + showData,
					method: "GET",
					dataType: "json",
					success: function(data) {

						insertTable(data);
						setPageController(page)
					}

				})
				$("#pageController").off("click", "input")
				$("#pageController").on("click", "input", function() {
					var page = Number($(this).attr("name"));
					//console.log("page Before Click : " + page)
					$.ajax({
						url: homeUrl + "/priceSelect?radioGroup=" + scale + "&showData=" + showData + "&page=" + page,
						method: "GET",
						dataType: "json",
						success: function(data) {

							insertTable(data);
							setPageController(page)
						}

					})
				})
			}
		})


	})

	// 商品名稱查詢
	$(".nameSubmit").on("click", function() {
		page = 1;
		//console.log("show : " + showData + "\tpage : " + page)
		let search = $(".nameSelect").val();
		console.log(search);
		$.ajax({
			url: homeUrl + "/searchName?nameSelect=" + search,
			method: "GET",
			success: function(data) {
				totalData = data;
				$("#totalData").html(data)
				//console.log("fc query TotalData : " + data )
				totalPage = Math.ceil(totalData / showData);
				//console.log("fc query TotalPage : " + totalPage)
				$.ajax({
					url: homeUrl + "/nameSelect?nameSelect=" + search + "&showData=" + showData,
					method: "GET",
					dataType: "json",
					success: function(data) {

						insertTable(data);
						setPageController(page)
					}

				})
				$("#pageController").off("click", "input")
				$("#pageController").on("click", "input", function() {
					var page = Number($(this).attr("name"));
					//console.log("page Before Click : " + page)
					$.ajax({
						url: homeUrl + "/nameSelect?nameSelect=" + search + "&showData=" + showData + "&page=" + page,
						method: "GET",
						dataType: "json",
						success: function(data) {

							insertTable(data);
							setPageController(page)
						}

					})
				})
			}
		})


	})


	//更換顯示
	$("#changeShowData").on("click", function() {
		showData = $("#showData").val();
		console.log(showData);
	})

	//查詢結果回覆新增表格
	function insertTable(data) {
		$(".productTable").find("tbody").empty();
		for (let i in data) {
			$(".productTable").find("tbody").append(
				"<tr>" +
				"<td>" + data[i].seqno + "</th>" +
				//			  		"<td><div >" + data[i].name + "</div></td>"+
				"<td>" + '<a href="/MountainExploer.com//backstage/product/productInfoEntry?no='+data[i].seqno+'">'+ data[i].name + '</a>' + "</td>" +
				"<td>" + data[i].type + "</td>" +
				"<td>" + data[i].firstClass + "</td>" +
				"<td>" + data[i].secondClass + "</td>" +
//				"<td>" +
//				'<img style="width: 50px; height: 50px;" src="/MountainExploer.com/backstage/product/search/images?seqno=' + data[i].seqno + '" class="productImg" >' +
//				"</td>" +
				"<td>" + data[i].price + "</td>" +
				"<td>" + data[i].stock + "</td>" +
				"<td>" +
				"<div>" +
//				"<form  action='" + homeUrl + "/updateDataPage'>" +
				"<form  action=' '/MountainExploer.com/back/shop/updateDataPage'>" +
				'<input type="hidden" name="seqno" value="' + data[i].seqno + '" readonly>' +
				'<input type="submit" value="修改">' +
				'</form>' +
				"</div>" +
				"<div>" +
//				"<form class='hiddenForm' action='/MountainExploer.com/backstage/product/deleteData'>" +
				"<form class='hiddenForm' action='/MountainExploer.com/back/shop/deleteData'>" +
				'<input  type="hidden" name="seqno" value="' + data[i].seqno + '" readonly>' +
//				'<input id="deleteNp" class="deleteButton" type="button"  value="刪除">' +
				'</form>' +
				'<input class="deleteButton" type="button"  value="刪除">' +
				"</div>" +
				"</td>" +
				"</tr>"
			)
		}
	}

	


})