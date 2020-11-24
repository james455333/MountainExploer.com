
var shareURL = "/MountainExploer.com/mountain/public"
var manageHome = "/MountainExploer.com/mountain/manage/search"
var detailURL = "/MountainExploer.com/mountain/act/detail?page=1&actID="
var mb, status;
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

/* 
100	General Member
110	Uncertified Member
120	General Guide
130	Uncertified Guide
140	Suspended Member
150	Suspended Guide
160	Administrator
 *
 */

function checkStatus(){
	console.log("check begin")
	console.log( status == "120" )
	if( status == '120' || status == '130'){
		setGuideNav();
	}
	if( status == '140' || status == '150'){
		setSuspend();
	}
}

function setGuideNav(){
	$(".sideNav").find(".m-si-op").removeClass("m-hide")
}

function setSuspend(){
	$(".sideNav").find(".m-si-op").remove();
}

function post(){
	console.log("post")
	$(".m-ma-container").empty().css("display","block");
	replaceContent("post");
}
function registry(){
	console.log("registry")
	$(".m-ma-container").empty().css("display","block");
	replaceContent("registry");
}
function record(){
	console.log("record")
	$(".m-ma-container").empty().css("display","block")
	replaceContent("record");
}
function report(){
	console.log("report")
	$(".m-ma-container").empty().css("display","block")
	replaceContent("report");
}

function replaceContent(order,page){
	let model,pageCtrl;
	if( order == "post"){
	 	model = $(".m-ma-ta").clone();
		pageCtrl = $(".m-hide").find(".pageControl").clone()
		$(".m-ma-container").append(model)
		$(".m-ma-container").append(pageCtrl)
		insertInfo(1);
	}
}

function insertInfo(page){
	
	$.ajax({
		url : manageHome+"/post",
		method : "GET",
		dataType : "json",
		data : { page : page },
		success : function(data){
			console.log(data)
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
				setResp(data.actList[i],thisElm);
				setControll(data.actList[i],thisElm);
				setDatePicker(data.actList[i].actBasic.actInfo,thisElm)
				setTotalDay(data.actList[i].actBasic.actInfo,thisElm)
				thisElm.removeClass("hideTbody")
			}
			$(".m-ma-container").find(".hideTbody").eq(0).remove()
		}
	})
	
}
function setSeqno(actList,thisElm){
	thisElm.find("td").eq(0).html(actList.actBasic.seqno)
	
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
		$(".m-ma-container").find(".m-note").not(thisNote).addClass("hideTr")
		thisElm.find(".m-note").toggleClass("hideTr")
	})
}
function setTotalDay(actInfo,thisElm){
	thisElm.find(".tr-up-form").find("input[name='totalDay']").val(actInfo.totalDay)
}

function setResp(){
	
}

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

/*	頁面控制*/
function setPageController(page) {
	//判別目前
	let url;
	if (od == 1) {
		url = actEnterURL + "od=1&"
	}
	if (od == 2) {
		url = actEnterURL + "od=2&tag=" + tag + "&"
	}

	$(".pageControl").find("a").eq(2).html("目前 " + page + ' / ' + totalPage + " 頁")
	if (page != 1) {
		let first = url + "page=1"
		let previous = url + "page=" + (Number(page) - 1);
		$(".pageControl").find("div").eq(0).attr("href", first).css("display", "block")
		$(".pageControl").find("div").eq(1).css("display", "block")
	} else {
		$(".pageControl").find("div").eq(0).css("display", "none")
		$(".pageControl").find("div").eq(1).css("display", "none")
	}
	if (page < totalPage) {
		let next = url + "page=" + (Number(page) + 1);
		let final = url + "page=" + (Number(totalPage));
		$(".pageControl").find("div").eq(3).attr("href", next).css("display", "block")
		$(".pageControl").find("div").eq(4).attr("href", final).css("display", "block")
	} else {
		$(".pageControl").find("div").eq(3).css("display", "none")
		$(".pageControl").find("div").eq(4).css("display", "none")
	}
}
/*	日期選單設定 */
function setDatePicker(actInfo, thisElm){
	console.log(actInfo)
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
			console.log("startDate : " + startDate)
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
				console.log(endDate)
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
					"minDate" : new Date(),
				    "showCustomRangeLabel": false,
				    "startDate": new Date(),
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
				    "showCustomRangeLabel": false,
				    "startDate": new Date(),
					}, function(start, end, label) {
					});
}
