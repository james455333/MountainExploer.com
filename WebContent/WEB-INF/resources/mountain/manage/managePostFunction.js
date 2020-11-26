
var shareURL = "/MountainExploer.com/mountain/public"
var manageHome = "/MountainExploer.com/mountain/manage/search"
var detailURL = "/MountainExploer.com/mountain/act/detail?page=1&actID="
var mb, status, totalPage, totalData;
var nowDate = Number(new Date());
var limitStartDate = new Date(nowDate + ((60*60*24*1000)*21)) ;
	
var urlNow = new URL(window.location.href)

if(urlNow.searchParams.has("mb")){
	mb = urlNow.searchParams.get("mb")
}else{
	
}
if(urlNow.searchParams.has("status")){
	status = urlNow.searchParams.get("status")
}


function post(page){
	replaceContentPost("/post",page);
}

/* 清空主要容器， */
function replaceContentPost(order,page){
	$(".m-ma-container").empty().css("display","inline-block");
	let model,pageCtrl;
	model = $(".m-ma-ta").clone();
	pageCtrl = $(".m-hide").find(".pageControl").clone()
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
				let thisElm = $(".order-table-tb").eq(i)
				let model = thisElm.clone()
				$(".m-ma-ta").eq(0).append(model);
				setSeqno(data.actList[i],thisElm)
				setTitle(data.actList[i],thisElm);
				setStaTime(data.actList[i],thisElm);
				setEndTime(data.actList[i],thisElm);
				setPrice(data.actList[i],thisElm)
				setRoute(data.actList[i],thisElm)
				setPostTime(data.actList[i],thisElm)
				setRegInfo(data.actList[i],thisElm)
				setRegEnd(data.actList[i],thisElm)
				setNote(data.actList[i],thisElm)
				setControll(data.actList[i],thisElm);
				setDatePicker(data.actList[i].actBasic.actInfo,thisElm)
				setTotalDay(data.actList[i].actBasic.actInfo,thisElm)
				setPostRegistry(thisElm,data.actList[i].actBasic.seqno)
				thisElm.removeClass("hideTbody")
			}
			$(".m-ma-container").on("click",".cancel-up",function(){
				$(this).parents("tr").addClass("hideTr");
			})
			$(".m-ma-container").find(".hideTbody").eq(0).remove()
			setPageController(order, page);
			
		}
	})
	
}
/*
	設定活動表單元素
 */
function setSeqno(actList,thisElm){
	thisElm.find("td").eq(0).html(actList.actBasic.seqno)
	thisElm.find(".tr-up-form").find("input[name='id']").val(actList.actBasic.actInfo.id)
}
function setTitle(actList,thisElm){
	thisElm.find("td").eq(1).find("a").html(actList.actBasic.actInfo.title)
	thisElm.find("td").eq(1).find("a").attr("href",detailURL + actList.actBasic.seqno)
	thisElm.find(".tr-up-form").find("input[name='title']").val(actList.actBasic.actInfo.title)
}
function setStaTime(actList,thisElm){
	let start = dateFormate(actList.actBasic.actInfo.startDate)
	thisElm.find("td").eq(2).html( start)
}
function setEndTime(actList,thisElm){
	let end = dateFormate(actList.actBasic.actInfo.endDate)
	thisElm.find("td").eq(3).html(end)
}
function setPrice(actList,thisElm){
	thisElm.find("td").eq(4).html(actList.actBasic.actInfo.price)
	thisElm.find(".tr-up-form").find("input[name='price']").val(actList.actBasic.actInfo.price)
}
function setRoute(actList,thisElm){
	thisElm.find("td").eq(5).html(actList.routeBasic.routeInfo.name)
}
function setPostTime(actList,thisElm){
	let post = dateFormate(actList.actBasic.actInfo.postDate)
	thisElm.find("td").eq(6).html(post)
}
function setRegInfo(actList,thisElm){
	let nowReg = actList.nowReg
	let topReg = actList.actBasic.actInfo.regTop
	thisElm.find("td").eq(7).html(nowReg + " / " + topReg)
	thisElm.find(".tr-up-form").find("input[name='regTop']").val(topReg)
}
function setRegEnd(actList,thisElm){
	let regEnd = dateFormate(actList.actBasic.actInfo.regEndDate)
	thisElm.find("td").eq(8).html(regEnd)
}
function setNote(actList,thisElm){
	thisElm.find("tr").eq(1).find("td").html(actList.actBasic.actInfo.addInfo)
	thisElm.find("textarea[name='note']").html(actList.actBasic.actInfo.addInfo)
	thisElm.find("td").eq(9).on("click",function(){
		let thisNote = thisElm.find(".m-note")
		let thead = $(".order-table-th").find("tr")
		let mainTr = $(".tr-main-post")
		$(".m-ma-container").find("tr").not(thead).not(mainTr).not(thisNote).addClass("hideTr")
		thisElm.find(".m-note").toggleClass("hideTr")
	})
}
function setTotalDay(actInfo,thisElm){
	thisElm.find(".tr-up-form").find("input[name='totalDay']").val(actInfo.totalDay)
}

/* 動態新增控制項元素 */
function setControll(actList,thisElm){
	let hideTag = actList.actBasic.actInfo.hideTag
	if( hideTag == null){
		thisElm.find("td").eq(11).find("button").eq(2).html("隱藏活動")
	}else{
		thisElm.find("td").eq(11).find("button").eq(2).html("取消隱藏")
	}	
}

/*	日期編譯 */
function dateFormate(date) {
	let result = "";
	result = result.concat(new Date(date).toLocaleDateString())
		.concat(" " + new Date(date).toLocaleTimeString())

	return result;
}


/* 頁面控制 */
function setPageController(order, page) {
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
function setDatePicker(actInfo, thisElm){
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

function setPostRegistry(thisElm,thisActID){
//	console.log(thisElm)
	$.ajax({
		url : manageHome+"/post-registry",
		method : "GET",
		dataType : "json",
		data : { actID : thisActID},
		success : function(data){
//			console.log(data)
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
	if(data.cancelTag != null){
		thisBody.find(".tr-reg-attr").html("[ 報名已取消 ]")
		thisBody.find(".tr-reg-control").append("[ 取消原因 ] " + data.cancelRes)
	}
	if(data.deniTag == null){
		if(data.confirm == null){
			thisBody.find(".tr-reg-attr").html("[ 未接受報名 ]")
			thisBody.find(".tr-reg-control").append("<button>接受報名</button>")
			thisBody.find(".tr-reg-control").append("<button>拒絕報名</button>")
		}else{
			thisBody.find(".tr-reg-attr").html("[ 已接受報名 ]")
			thisBody.find(".tr-reg-control").append("<button>拒絕報名</button>")
		}
	}else{
		thisBody.find(".tr-reg-attr").html("[ 已拒絕報名 ]")
		thisBody.find(".tr-reg-control").append("<button>接受報名</button>")
	}
	
}

function setPR_RegInfo(regInfoCon, actRegInfo){
	console.log()
	for(let i in actRegInfo){
		let model = regInfoCon.find(".tr-reg-info-body").eq(i).clone();
		let regInfoBody = regInfoCon.find(".tr-reg-info-body").eq(i)
		regInfoBody.find("div").eq(0).html(actRegInfo[i].name)
		regInfoBody.find("div").eq(1).html(dateFormate(actRegInfo[i].birthDay))
		regInfoBody.find("div").eq(2).html(actRegInfo[i].personID)
		regInfoBody.find("div").eq(3).html(actRegInfo[i].contactPhone)
		regInfoBody.find("div").eq(4).html(actRegInfo[i].contactCellphone)
		regInfoBody.find("div").eq(5).html(actRegInfo[i].contactEmail)
		regInfoCon.append(model);
	}
	regInfoCon.find(".tr-reg-info-body").eq(actRegInfo.length).remove()
}

