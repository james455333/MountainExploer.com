

function post(page){
	replaceContentPost("/post",page);
}

/* 清空主要容器， */
function replaceContentPost(order,page){
	$(".m-ma-container").empty().css("display","inline-block");
	let model,pageCtrl;
	model = $(".m-ma-ta").clone();
	pageCtrl = $(".m-hide").find(".pageControl").clone()
	let notice = "<h2>已完成活動請至 <i>活動紀錄查看</i></h2>";
//	$(".m-ma-container").append(notice)
	$(".m-ma-container").append(model)
	$(".m-ma-container").append(pageCtrl)
	insertPostInfo(order, page);
	$(".m-dl2-adj").css("height","auto")
}


/* Post 主控制表 */
function insertPostInfo(order, page){
	$.ajax({
		url : manageHome+order,
		method : "GET",
		dataType : "json",
		data : { page : page },
		success : function(data){
//			console.log(data)
			totalPage = data.totalPage
			totalData = data.totalData
			for(let i in data.actList){
				let thisElm = $(".m-ma-ta").eq(0).find(".order-table-tb").eq(i)
				let model = thisElm.clone()
				$(".m-ma-ta").eq(0).append(model);
				setPS_Seqno(data.actList[i],thisElm)
				setPS_Title(data.actList[i],thisElm);
				setPS_StaTime(data.actList[i],thisElm);
				setPS_EndTime(data.actList[i],thisElm);
				setPS_Price(data.actList[i],thisElm)
				setPS_Route(data.actList[i],thisElm)
				setPS_PostTime(data.actList[i],thisElm)
				setPS_RegInfo(data.actList[i],thisElm)
				setPS_RegEnd(data.actList[i],thisElm)
				setPS_Note(data.actList[i],thisElm)
				setPS_Controll(data.actList[i],thisElm);
				setPS_DatePicker(data.actList[i].actBasic.actInfo,thisElm)
				setPS_TotalDay(data.actList[i].actBasic.actInfo,thisElm)
				setPS_Registry(thisElm,data.actList[i].actBasic.seqno)
				thisElm.removeClass("hideTbody")
			}
			$(".m-ma-container").on("click",".cancel-up",function(){
				$(this).parents("tr").addClass("hideTr");
			})
			$(".m-ma-container").find(".hideTbody").eq(0).remove()
			setPS_PageController(order, page);
			
		}
	})
	
}
/*
	設定活動表單元素
 */
function setPS_Seqno(actList,thisElm){
	thisElm.find("td").eq(0).html(actList.actBasic.seqno)
	thisElm.find(".tr-up-form").find("input[name='id']").val(actList.actBasic.actInfo.id)
}
function setPS_Title(actList,thisElm){
	if(actList.actBasic.actInfo.hideTag != null) thisElm.find("td").eq(1).append("<br>[活動已隱藏] ")
	thisElm.find("td").eq(1).find("a").html(actList.actBasic.actInfo.title)
	thisElm.find("td").eq(1).find("a").attr("href",detailURL + actList.actBasic.seqno)
	thisElm.find(".tr-up-form").find("input[name='title']").val(actList.actBasic.actInfo.title)
}
function setPS_StaTime(actList,thisElm){
	let start = dateFormate(actList.actBasic.actInfo.startDate)
	thisElm.find("td").eq(2).html( start)
}
function setPS_EndTime(actList,thisElm){
	let end = dateFormate(actList.actBasic.actInfo.endDate)
	thisElm.find("td").eq(3).html(end)
}
function setPS_Price(actList,thisElm){
	thisElm.find("td").eq(4).html(actList.actBasic.actInfo.price)
	thisElm.find(".tr-up-form").find("input[name='price']").val(actList.actBasic.actInfo.price)
}
function setPS_Route(actList,thisElm){
	thisElm.find("td").eq(5).html(actList.routeBasic.routeInfo.name)
}
function setPS_PostTime(actList,thisElm){
	let post = dateFormate(actList.actBasic.actInfo.postDate)
	thisElm.find("td").eq(6).html(post)
}
function setPS_RegInfo(actList,thisElm){
	let nowReg = actList.nowReg
	let topReg = actList.actBasic.actInfo.regTop
	thisElm.find("td").eq(7).html(nowReg + " / " + topReg)
	thisElm.find(".tr-up-form").find("input[name='regTop']").val(topReg)
}
function setPS_RegEnd(actList,thisElm){
	let regEnd = dateFormate(actList.actBasic.actInfo.regEndDate)
	thisElm.find("td").eq(8).html(regEnd)
}
function setPS_Note(actList,thisElm){
	thisElm.find("tr").eq(1).find("td").html(actList.actBasic.actInfo.addInfo)
	thisElm.find("textarea").attr("id","note"+actList.actBasic.actInfo.id).html(actList.actBasic.actInfo.addInfo)
	CKEDITOR.replace("note"+actList.actBasic.actInfo.id)
	thisElm.find("td").eq(9).on("click",function(){
		let thisNote = thisElm.find(".m-note")
		let thead = $(".order-table-th").find("tr")
		let mainTr = $(".tr-main-post")
		$(".m-ma-container").find("tr").not(thead).not(mainTr).not(thisNote).addClass("hideTr")
		thisElm.find(".m-note").toggleClass("hideTr")
	})
}
function setPS_TotalDay(actInfo,thisElm){
	thisElm.find(".tr-up-form").find("input[name='totalDay']").val(actInfo.totalDay)
}

/* 動態新增控制項元素 */
function setPS_Controll(actList,thisElm){
	let hideTag = actList.actBasic.actInfo.hideTag
	if( hideTag == null){
		thisElm.find(".bt-act-hide").html("隱藏活動")
	}else{
		thisElm.find(".bt-act-hide").html("取消隱藏")
	}	
}


/* 頁面控制 */
function setPS_PageController(order, page) {
	$(".pageControl").find("div").eq(2).html(page + ' / ' + totalPage + " 頁")
	if (page != 1) {
		let first = 1
		let previous = Number(page) - 1;
		$(".pageControl").find("div").eq(0).on("click",function(){
			replaceContentPost(order,first)
		}).css("display", "block")
		$(".pageControl").find("div").eq(1).on("click",function(){
			replaceContentPost(order,previous)
		}).css("display", "block")
	} else {
		$(".pageControl").find("div").eq(0).css("display", "none")
		$(".pageControl").find("div").eq(1).css("display", "none")
	}
	if (page < totalPage) {
		let next = Number(page) + 1;
		let final = Number(totalPage);
		$(".pageControl").find("div").eq(3).on("click",function(){
			replaceContentPost(order,next)
		}).css("display", "block")
		$(".pageControl").find("div").eq(4).on("click",function(){
			replaceContentPost(order,final)
		}).css("display", "block")
	} else {
		$(".pageControl").find("div").eq(3).css("display", "none")
		$(".pageControl").find("div").eq(4).css("display", "none")
	}
}
/* 舉辦活動 - 視窗 */
function successSWAL(){
	swal({
		title : "修改成功",
		icon : "success",
		button : "確定"
	}).then(() => {
    	let pageCon = $(".m-ma-container").find(".pageControl")
					.find("div").eq(2).text();
		let page = pageCon.substring(0,pageCon.indexOf("/")).trim();
		post(page);
	});
}
function errorSWAL(){
	swal({
		title : "修改失敗",
		icon : "error",
		button : "返回"
	})
}

/*	日期選單設定 */
function setPS_DatePicker(actInfo, thisElm){
	thisElm.find('input[name="startDate"]').daterangepicker({
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
		"startDate": new Date(actInfo.startDate),
		"endDate" : new Date(actInfo.startDate),
	    "minDate": new Date(actInfo.startDate),
	    "opens": "center"
		}, function(start) {
			var startDate = new Date(start)
			thisElm.find("input[name='totalDay']").val("單日返還");
			thisElm.find("input[name='endDate']").daterangepicker({
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
//				console.log("endDate : " + endDate)
				var totalDay = Math.ceil((endDate - startDate)*1.0 /  (60*60*24*1000))+1;
//				console.log("s-e /one= " + totalDay )
				if( totalDay > 1){
					thisElm.find("input[name='totalDay']").val(totalDay + "天" + (totalDay-1) + "夜")
				}else{
					thisElm.find("input[name='totalDay']").val("單日返還");
				}
				//	報名截止日
				var regLimit = new Date( Number(startDate) - ( (60*60*24*1000)*7 ) )
				//console.log(regLimit)
				thisElm.find("input[name='regEndDate']").daterangepicker({
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
					}, function(start, end, label) {
					});
			})
	});
	thisElm.find("input[name='endDate']").daterangepicker({
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
				"startDate": new Date(actInfo.endDate),
				"endDate" : new Date(actInfo.endDate),
			    "minDate": new Date(actInfo.endDate),
			    "opens": "center"
			});
	let dbSD = new Date(actInfo.startDate)
	let regLimit = new Date( Number(dbSD) - ( (60*60*24*1000)*7 ) )
	thisElm.find("input[name='regEndDate']").daterangepicker({
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
		"startDate" : new Date(actInfo.regEndDate),
		"endDate" : new Date(actInfo.regEndDate),
		"minDate" : new Date(actInfo.regEndDate),
		"maxDate" : regLimit,
		}, function(start, end, label) {
		});		    
}

function setPS_Registry(thisElm,thisActID){
//	console.log(thisElm)
	$.ajax({
		url : manageHome+"/post-registry",
		method : "GET",
		dataType : "json",
		data : { actID : thisActID},
		success : function(data){
			console.log(data)
			for(let i in data){
				let model = thisElm.find(".tr-reg-con").find(".tr-reg-body").eq(i).clone();
				thisElm.find(".tr-reg-con").append(model)
				let thisBody =  thisElm.find(".tr-reg-order").eq(i)
				setPR_Seqno(thisBody, data[i].seqno)
				setPR_MBName(thisBody, data[i].memberBasic.memberInfo.neck_name)
				setPR_RegNum(thisBody, data[i].actRegInfo.length)
				setPR_RegDate(thisBody, data[i].reqDate)
				setPR_RegAttr(thisBody, data[i]);
				let regInfoBody = thisElm.find(".tr-reg-info").eq(i)
				setPR_RegInfo(regInfoBody, data[i].actRegInfo)
			}
			thisElm.find(".tr-reg-body").eq(data.length).remove()
		},
		error : function(){
			
		}
	})
}

function setPR_Seqno(thisBody, seqno){
	thisBody.find("div").find("a").eq(0).html(seqno).attr("href","#regno="+seqno)
	thisBody.find("a").eq(0).on("click",function(){
		let thisRegInfo = thisBody.parent().find(".tr-reg-info")
		thisBody.parents(".order-table-tb").find(".tr-reg-info").not(thisRegInfo).addClass("hideTr")
		thisBody.parent().find(".tr-reg-info").toggleClass("hideTr")
	})
	thisBody.parent().find(".tr-reg-bar").on("click",function(){
		let thisRegInfo = thisBody.parent().find(".tr-reg-info")
		thisBody.parents(".order-table-tb").find(".tr-reg-info").not(thisRegInfo).addClass("hideTr")
		thisBody.parent().find(".tr-reg-info").toggleClass("hideTr")
	})
}
function setPR_MBName(thisBody, neck_name){
	thisBody.find("div").eq(1).html(neck_name)
}
function setPR_RegNum(thisBody, length){
	thisBody.find("div").eq(2).html(length + " 人")
}
function setPR_RegDate(thisBody, reqDate){
	thisBody.find("div").eq(3).html(dateFormate(reqDate))
}
function setPR_RegAttr(thisBody, data){
	let confirmBT = "<button class='btn btn-success bt-ps-reg-confirm'>確認報名</button>";
	let declineBT = "<button class='btn btn-warning bt-ps-reg-decline'>拒絕報名</button>";
	if(data.cancelTag != null){
		thisBody.find(".tr-reg-attr").html("[ 報名已取消 ]")
		thisBody.find(".tr-reg-control").append("[ 取消原因 ] " + data.cancelRes)
	}else{
		if(data.deniTag == null){
			if(data.confirm == null){
				thisBody.find(".tr-reg-attr").html("[ 未接受報名 ]")
				thisBody.find(".tr-reg-control").append(confirmBT)
				thisBody.find(".tr-reg-control").append(declineBT)
			}else{
				thisBody.find(".tr-reg-attr").html("[ 已接受報名 ]")
				thisBody.find(".tr-reg-control").append(declineBT)
			}
		}else{
			thisBody.find(".tr-reg-attr").html("[ 已拒絕報名 ]" + "<br> [ 拒絕原因 ] <p>" + data.delnReason + "</p>")
			thisBody.find(".tr-reg-control").append(confirmBT)
		}
	}
	
}

function setPR_RegInfo(regInfoCon, actRegInfo){
	console.log()
	for(let i in actRegInfo){
		let model = regInfoCon.find(".tr-reg-info-body").eq(i).clone();
		let regInfoBody = regInfoCon.find(".tr-reg-info-body").eq(i)
		regInfoBody.find("div").eq(0).html(actRegInfo[i].name)
		regInfoBody.find("div").eq(1).html(new Date(actRegInfo[i].birthDay).toLocaleDateString())
		regInfoBody.find("div").eq(2).html(actRegInfo[i].personID)
		regInfoBody.find("div").eq(3).html(actRegInfo[i].contactPhone)
		regInfoBody.find("div").eq(4).html(actRegInfo[i].contactCellphone)
		regInfoBody.find("div").eq(5).html(actRegInfo[i].contactEmail)
		regInfoCon.append(model);
	}
	regInfoCon.find(".tr-reg-info-body").eq(actRegInfo.length).remove()
}

/* 確認視窗 */
function hideConfirm_PS(){
	let thisBT = $(this)
	swal({
		title : $(this).text(),
		text : "確定要執行本操作嗎?",
		icon : "warning",
		dangerMode: true,
		buttons : {
			cancel :{
				visible: true,
				text: "取消",
				value : false
			},
			confirm :{
				visible: true,
				text : "確定",
				value : true
			}
		}
	}).then((value) => {
		if(value){
	    	setActHide(thisBT)
		}
	});
}

function setActHide(thisBT){
	let thisActID = thisBT.parents(".tr-main-post").find("td").eq(0).text()
	$.ajax({
		url : manageHome + "/post-act",
		type : "PUT",
	    contentType: 'application/json',
		dataType : "json",
		data : thisActID,
		success : function(data){
			if(data){
				swal({
					title : "活動隱藏成功",
					icon : "success",
					button :  "OK"
				}).then(() => {
					let pageCon = $(".m-ma-container").find(".pageControl")
								.find("div").eq(2).text();
					let page = pageCon.substring(0,pageCon.indexOf("/")).trim();
					post(page);
				});
			}
		},
		error : function(){
			swal ("","隱藏活動出現問題","error")
		}		
	})
}

/* 危險確認視窗 */
function deleteDanger_PS(){
	thisBT = $(this)
	swal({
	    title: "確定要執行 取消本活動 嗎?",
	    text: "請注意，本操作將取消本活動，\n本用戶將無法對本活動再次操控。\n若有問題請聯絡管理員\n\n\n\t確定要執行本操作?",
	    icon: "warning",
		dangerMode: true,
	    buttons: {
	      cancel: {
	        text: "取消",
	        visible: true,
			value : false
	      },
	      
	      danger: {
	        text: "確定執行刪除",
	        visible: true,
			value : true
	      },
	    },
		
	 }).then((value) => {
		if(value){
			setActDelete(thisBT)
		}
	 });
}
function setActDelete(thisBT){
	let thisActID = thisBT.parents(".tr-main-post").find("td").eq(0).text()
	$.ajax({
		url : manageHome + "/post-act",
		type : "DELETE",
	    contentType: 'application/json',
		dataType : "json",
		data : thisActID,
		success : function(data){
			if(data){
				swal({
					title : "取消活動成功",
					icon : "success",
					button :  "OK"
				}).then(() => {
					let pageCon = $(".m-ma-container").find(".pageControl")
								.find("div").eq(2).text();
					let page = pageCon.substring(0,pageCon.indexOf("/")).trim();
					post(page);
				});
			}
		},
		error : function(){
			swal ("","取消活動出現問題","error")
		}		
	})
}

function confirmReg_PS(){
	let thisBT = $(this)
	let thisRegID = thisBT.parents(".tr-reg-order").find(".tr-reg-seqno").text()
	$.ajax({
		url : manageHome+"/post-act-reg",
		type : "PUT",
		contentType: 'application/json',
		dataType : "json",
		data : thisRegID,
		success : function(data){
			if(data){
				ps_successSWAL(thisBT)
			}
		},
		error : function(data){
			ps_errorSWAL(thisBT)
		}
	})
}
function declineReg_PS(){
	let thisBT = $(this)
	let thisRegID = thisBT.parents(".tr-reg-order").find(".tr-reg-seqno").text()
	swal({
		title : "請輸入拒絕報名原因 (必填,最多250字)",
		icon : "info",
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
			},
		},
		content: {
			element: "input",
			attributes: {
				type: "text",
				'max-length' : "250",
			}
		}
	}).then((value) => {
		if(value){
			$.ajax({
				url : manageHome+"/post-act-reg",
				type : "POST",
				dataType : "json",
				data : {regID : thisRegID, deReason : value},
				success : function(data){
					ps_successSWAL(thisBT)
				},
				error : function(data){
					ps_errorSWAL(thisBT)
				}
			})
		}
s	})
}
function ps_successSWAL(bt){
	swal({
		title : bt.text()+"成功",
		icon : "success",
		button :  "OK"
	}).then(() => {
		let pageCon = $(".m-ma-container").find(".pageControl")
					.find("div").eq(2).text();
		let page = pageCon.substring(0,pageCon.indexOf("/")).trim();
		post(page);
	});
}
function ps_errorSWAL(bt){
	swal({
		title : bt.text()+"失敗",
		icon : "error",
		button :  "OK"
	})
}
