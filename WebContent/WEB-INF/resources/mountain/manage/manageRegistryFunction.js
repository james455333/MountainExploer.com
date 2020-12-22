
function registry(page){
	replaceContentReg("/registry",page);
}
function showInfo_RG(){
	let thisTR = $(this).parents("tbody").find(".rg-info")
	let thead =$(".order-table-th").find("tr")
	$(".m-ma-reg-ta").find("tr").not(thead).not(".rg-main").not(thisTR).addClass("hideTr")
	thisTR.toggleClass("hideTr")
}
//
function replaceContentReg(order,page){
	$(".m-ma-container").empty().css("display","inline-block");
	$(".m-ma-container").append("<h2>報名管理</h2>")
	let model,pageCtrl;
	model = $(".m-ma-reg-ta").clone();
	pageCtrl = $(".m-hide").find(".pageControl").clone()
	$(".m-ma-container").append(model)
	$(".m-ma-container").append(pageCtrl)
	insertRegInfo(order, page);
	$(".m-dl2-adj").css("height","auto")
}
function showInfoUpdateForm_RG(){
	let parentDIV = $(this).parents(".rg-info-body")
	let targetDIV = parentDIV.find(".rg-info-body-info2")
	let allClassDIV = $(".m-ma-reg-ta").find(".rg-info-body-info2")
	allClassDIV.not(targetDIV).addClass("hideTr")
	targetDIV.toggleClass("hideTr")
}
function cancelRegistry_RG(){
	let targetTDV = $(this).parents(".rg-main").find("td").eq(0).text()
	cancelSWAL($(this).text(),targetTDV)
}
function confirmRgInfoUp_RG(thisForm){
	let reginfoID = thisForm.find("input[name='seqno']").val()
	swal({
		title : "確認修改?",
		text : "報名資訊編號 : " + reginfoID ,
		icon : "warning",
		dangerMode: true,
		closeOnClickOutside: true,
		buttons : {
			confirm : {
				visible : true,
				value : true
			},
			cancle : {
				visible : true,
				value : false
			}
		}
	}).then((value) => {
		if(value)
		regInfoUpdate_RG(thisForm)
	})
}

function regInfoUpdate_RG(thisForm){
	$.ajax({
		url : manageHome + "/reg-info-update",
		type : "POST",
		datType : "json",
		data : new FormData(thisForm[0]),
		processData: false,
 		contentType: false,
		success : function(){
			swal({
				title : "修改成功",
				icon : "success",
				buttons : {
					confirm : {
						text : "好的",
						visible : true
					}
				}
			}).then(() => {
				reloadReg();
			})
		},
		error : function(){
			swal({
				title : "修改失敗",
				icon : "error",
				buttons : {
					cancel : {
						visible : true
					}
				}
			})
		}
	})
}

function cancelRgInfoUp_RG(thisForm){
	let thisParentDIV = thisForm.parents(".rg-info-body-info2")
	thisForm.parents(".m-ma-reg-ta").find(".rg-info-body-info2").not(thisParentDIV).addClass("hideTr")
	thisParentDIV.toggleClass("hideTr")
}

function regInfoDeleteSWAL_RG(thisBT){
	console.log(thisBT)
	let thisRegInfoID = thisBT.parents(".rg-info-body-info").find(".rg-info-seqno").text()
	swal({
		title : "確認" + thisBT.text(),
		text : "報名資訊編號 : " + thisRegInfoID,
		icon : "warning",
		dangerMode: true,
		closeOnClickOutside: true,
		buttons : {
			confirm : {
				visible : true,
				value : true
			},
			cancel : {
				visible : true,
				value : false
			}
		}
		
	}).then((value) => {
		if(value)
		regInfoDeleteAjax(thisRegInfoID);
	})

}

function regInfoDeleteAjax(regInfoID){
	$.ajax({
		url : manageHome + "/reg-info-update",
		type : "DELETE",
		data : regInfoID,
		dataType : "json",
		contentType: 'application/json',
		success : function(){
			swal({
				title : "刪除報名資訊成功",
				icon : "success",
				button : "好的"
			}).then(() => {
				reloadReg();
			})
		},
		error : function(){
			swal({
				title : "刪除報名資訊失敗",
				icon : "error",
				button : "好的"
			})
		}
	})
}


/* Post 主資料表顯示 */
function insertRegInfo(order, page){
	
	$.ajax({
		url : manageHome+order,
		method : "GET",
		dataType : "json",
		data : { page : page },
		success : function(data){
			console.log(data)
			totalPage = data.totalPage
			totalData = data.totalData
			for(let i in data.regList){
				let thisTB = $(".m-ma-reg-ta").eq(0).find(".order-table-tb").eq(i)
				let model = thisTB.clone()
				$(".m-ma-reg-ta").eq(0).append(model);
				let mainTR= thisTB.find(".rg-main")
				setRg_regID(data.regList[i],mainTR)
				setRg_regAttr(data.regList[i],mainTR)
				setRg_ActTitle(data.regList[i],mainTR);
				setRg_RegNnum(data.regList[i],mainTR);
				setRg_RegDate(data.regList[i],mainTR);
				if(data.regList[i].registry.cancelTag == null){
					setRg_infoTR(data.regList[i].registry.actRegInfo,thisTB.find(".rg-info-con"))
				}
//				thisElm.removeClass("hideTbody")
			}
				$(".m-ma-reg-ta").eq(0).find(".order-table-tb").eq(data.regList.length).remove()
				setRg_PageController(order, page);
			
		}
	})
	
}
function setRg_regID(regList,thisElm){
	thisElm.find("td").eq(0).html(regList.registry.seqno)
}
function setRg_regAttr(regList,thisElm){
	let registry = regList.registry
	let result ;
	let rgInfoReg = thisElm.parent(".order-table-tb").find(".rg-info-body").find(".rg-info-controll")
	console.log(rgInfoReg)
	if(registry.cancelTag == null){
		if(registry.deniTag == null){
			if(registry.confirm != null){
				result = "[ 報名已確認 ]"
				setRg_Ctrl(1,thisElm)
				setInfo_controll(1, rgInfoReg)
			}else{
				result = "[ 報名尚未確認 ]"
				setRg_Ctrl(1,thisElm)
				setInfo_controll(2, rgInfoReg)
			}
		}else{
			result = "[ 報名已被拒絕 ]<br> [ 拒絕原因 ]<br>" + registry.delnReason
			setRg_Ctrl(1,thisElm)
			setInfo_controll(2, rgInfoReg)
		}
	}else{
		result = "[ 報名已取消 ]"
		setRg_Ctrl(0,thisElm)
		setInfo_controll(0, rgInfoReg)
	}
	thisElm.find("td").eq(1).html(result)
}
function setRg_ActTitle(regList,thisElm){
	thisElm.find("td").eq(2).find("a").html(regList.actInfo.title)
	thisElm.find("td").eq(2).find("a").attr("href",detailURL + regList.actInfo.id)
}
function setRg_RegNnum(regList,thisElm){
	let regNum = regList.registry.actRegInfo.length
	thisElm.find("td").eq(3).html( regNum + " 人")
}
function setRg_RegDate(regList,thisElm){
	thisElm.find("td").eq(5).html(dateFormate(regList.registry.reqDate))
}
function setRg_Ctrl(order,thisElm){
	if(order == 0 ){
		thisElm.find("td").eq(6).empty()
	}
}

function setRg_infoTR(actRegInfo, thisElm){
	for(let i in actRegInfo){
		let model = thisElm.find(".rg-info-body").eq(i).clone()
		thisElm.append(model)
		let thisBody = thisElm.find(".rg-info-body").eq(i)
		setInfo_seqno(actRegInfo[i], thisBody)
		setInfo_name(actRegInfo[i], thisBody)
		setInfo_bDay(actRegInfo[i], thisBody)
		setInfo_pID(actRegInfo[i], thisBody)
		setInfo_phone(actRegInfo[i], thisBody)
		setInfo_cellphone(actRegInfo[i], thisBody)
		setInfo_email(actRegInfo[i], thisBody)
		
	}
	thisElm.find(".rg-info-body").eq(actRegInfo.length).remove()
}
function setInfo_seqno(actRegInfo, thisBody){
	thisBody.find(".rg-info-body-info").find("div").eq(0).html(actRegInfo.seqno)
	thisBody.find(".rg-info-body-update").find("input").eq(0).val(actRegInfo.seqno)
}
function setInfo_name(actRegInfo, thisBody){
	thisBody.find(".rg-info-body-info").find("div").eq(1).html(actRegInfo.name)
	thisBody.find(".rg-info-body-update").find("input").eq(1).val(actRegInfo.name)
}
function setInfo_bDay(actRegInfo, thisBody){
	thisBody.find(".rg-info-body-info").find("div").eq(2).html(new Date(actRegInfo.birthDay).toLocaleDateString())
	setRG_updateDatePicker(actRegInfo.birthDay,thisBody.find(".rg-info-body-update").find("input").eq(2))
}
function setInfo_pID(actRegInfo, thisBody){
	thisBody.find(".rg-info-body-info").find("div").eq(3).html(actRegInfo.personID)
	thisBody.find(".rg-info-body-update").find("input").eq(3).val(actRegInfo.personID)
}
function setInfo_phone(actRegInfo, thisBody){
	thisBody.find(".rg-info-body-info").find("div").eq(4).html(actRegInfo.contactPhone)
	thisBody.find(".rg-info-body-update").find("input").eq(4).val(actRegInfo.contactPhone)
}
function setInfo_cellphone(actRegInfo, thisBody){
	thisBody.find(".rg-info-body-info").find("div").eq(5).html(actRegInfo.contactCellphone)
	thisBody.find(".rg-info-body-update").find("input").eq(5).val(actRegInfo.contactCellphone)
}
function setInfo_email(actRegInfo, thisBody){
	thisBody.find(".rg-info-body-info").find("div").eq(6).html(actRegInfo.contactEmail)
	thisBody.find(".rg-info-body-update").find("input").eq(6).val(actRegInfo.contactEmail)
}
function setInfo_controll(order,thisBody){
	let updateBT = "<div><button class='btn btn-dark bt-rg-info-update'>修改</button></div>"
	let deleteBT = "<div><button class='btn btn-danger bt-rg-info-delete'>刪除</button></div>"
	if(order > 0){
		if(order==1) thisBody.append(updateBT)
		if(order==2) thisBody.append(updateBT).append(deleteBT)
	}
}

///* 頁面控制 */
function setRg_PageController(order, page) {
	$(".pageControl").find("div").eq(2).html(page + ' / ' + totalPage + " 頁")
	if (page != 1) {
		let first = 1
		let previous = Number(page) - 1;
		$(".pageControl").find("div").eq(0).on("click",function(){
			replaceContentReg(order,first)
		}).css("display", "block")
		$(".pageControl").find("div").eq(1).on("click",function(){
			replaceContentReg(order,previous)
		}).css("display", "block")
	} else {
		$(".pageControl").find("div").eq(0).css("display", "none")
		$(".pageControl").find("div").eq(1).css("display", "none")
	}
	if (page < totalPage) {
		let next = Number(page) + 1;
		let final = Number(totalPage);
		$(".pageControl").find("div").eq(3).on("click",function(){
			replaceContentReg(order,next)
		}).css("display", "block")
		$(".pageControl").find("div").eq(4).on("click",function(){
			replaceContentReg(order,final)
		}).css("display", "block")
	} else {
		$(".pageControl").find("div").eq(3).css("display", "none")
		$(".pageControl").find("div").eq(4).css("display", "none")
	}
}
/* 舉辦活動 - 視窗 */
function cancelSWAL(text,targetTDV){
	swal({
		title : text,
		text : "本操作將執行用戶端無法退回之行動。\n\n\n確定要取消  報名編號 : " + targetTDV + "  嗎?",
		icon : "warning",
		dangerMode: true,
		closeOnClickOutside: true,
		buttons : {
			confirm : {
				visible : true,
				value : true
			},
			cancel : {
				visible : true,
				value : false
			}
		}
	}).then((value) => {
		if(value){
			rg_cancelRegistry(text, targetTDV)
		}
	}) 
}

//function successSWAL(){
//	swal({
//		title : "修改成功",
//		icon : "success",
//		button : "確定"
//	}).then(() => {
//    	let pageCon = $(".m-ma-container").find(".pageControl")
//					.find("div").eq(2).text();
//		let page = pageCon.substring(0,pageCon.indexOf("/")).trim();
//		post(page);
//	});
//}

function rg_cancelRegistry(text, targetTDV){
	$.ajax({
		url : manageHome + "/rg-cancel",
		type : "PUT",
		contentType: 'application/json',
		dataType : "json",
		data : targetTDV,
		success : function(data){
			swal({
				title : text + "成功",
				icon : "success",
				buttons : {
					confirm : {
						visible : true
					}	
				}
			}).then(() => {
				reloadReg();
			})
		},
		error : function(data){
			swal({
				title : text + "失敗",
				icon : "error",
				buttons : {
					confirm : {
						visible : true
					}	
				}
			})
		}
	})
	
}
//function errorSWAL(){
//	swal({
//		title : "修改失敗",
//		icon : "error",
//		button : "返回"
//	})
//}
//
///*	日期選單設定 */
function setRG_updateDatePicker(bDay, thisElm){
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
		"startDate" : new Date(bDay),
		"endDate" : new Date(bDay),
		}, function(start, end, label) {
			console.log(thisElm.val())
		});		    
}

function reloadReg(){
	let pageCon = $(".m-ma-container").find(".pageControl")
		.find("div").eq(2).text();
	let page = pageCon.substring(0,pageCon.indexOf("/")).trim();
	registry(page);
}
