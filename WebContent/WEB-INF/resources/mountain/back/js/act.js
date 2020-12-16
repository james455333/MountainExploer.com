var baseURL = "/MountainExploer.com/back/mountain/act/crud"
var baseRouteURL = "/MountainExploer.com/back/mountain/route/crud"
var oldBackStageURL = "/MountainExploer.com/backstage/mountain/search";
var allData,allData_reg, actMode, dataTable, actModeChart, tagModeChart,actTrendChart,monthSliders,actTrend_actData,actTrend_regData;
var tagNames = ["新活動", "熱門活動", "歷史活動", "報名已滿", "報名截止", "尚可報名", "報名將截止","報名將滿"]
// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';
Chart.defaults.global.defaultFontSize = 15;
var chartBackColors = [
	'#4e73df','#1cc88a','#36b9cc',"#B15BFF","#EAC100",
	"#FF8040","#FFD306","#F9F900","#FFB5B5","#FFD9EC",
	"#FF79BC","#D3A4FF","#CECEFF","#BBFFBB","#D3FF93",
	"#FFD1A4",
]

var chatyBackHoverColors = [
	'#2e59d9','#17a673','#2c9faf',"#8600FF","#AE8F00",
	"#D94600","#C6A300","#C4C400","#FF7575","#FFAAD5",
	"#FF359A","#BE77FF","#AAAAFF","#93FF93","#C2FF68",
	"#FFBB77"
]

$(function(){
//	$(document).ajaxStop(function(){
//		setTimeout($.unblockUI,500)
//	}); 
//	$(document).ajaxStart(
//		$.blockUI({ 
//			message: '<div><div class="fas fa-spinner fa-10x fa-spin" style="color: #20c997;"></div><h2 style="color:white">讀取中</h2><div>',
//			css : { 
//				backgroundColor : 'transparent', 
//				border : 'none' ,
//				},
//			overlayCSS:  { 
//				backgroundColor: 'black', 
//				opacity:         0.5, 
//				cursor:          'wait' 
//			    },
//			bindEvents: true, 
//			})
//	)
	$. noConflict()
	reRender()
	
//	setSearchBar()
	$("#npSelect").on("change",changeRtAndTb)
	$("#rtSelect").on("change",changeTbByRt)
	
	/* 表格重置按鈕 */
	$("#selectAll").on("click",resetTable)
	$("#routeTable").on("error","img",function(){
		$(this).attr("src","/MountainExploer.com/mountain/images/defaultMountain.jpg")
	})
	
	$("#tb-container").on("click", '.toggle', function(){
		let thisRtID = $(this).parents("tr").find("td").eq(2).text()
		let thisToggle = $(this).find("input").attr("class");
		let toggleClass = thisToggle.split(" ")
		toggleClass.forEach(function(item){
			item = item.replace(/-/,"")
			if(item.match('btntoggle-') != null ){
				thisToggle = item.replace('btntoggle-',"") + "Tag"
			}
		})
		setRtToggle(thisRtID, thisToggle)
	})
	
	$("#tb-container").on("click", '.btn-act-update', function(){
		updateBox($(this))
	})
	$("#tb-container").on("click", '.btn-act-delete', function(){
		deleteAlert($(this))
	})
	$("#tb-container").on("click", '.btn-act-info', function(){
		console.log(123)		
		showMoreInfo($(this))
	})
	$("#tb-container").on("click", '.btn-rt-upImg', function(){
		updateImage($(this))
	})
	$("#newNp").on('click',newNp)
	$("#updateNp").on('click',updateNp)
	$("#deleteNp").on('click',deleteNp)
	$("#newRoute").on('click',newRoute)
	$("body").on("change", "#imageFile", function() {
		var fileName = $(this).val().split("\\").pop();
		$(this).siblings(".custom-file-label").addClass("selected").html(fileName);
	});
	$("body").on("click", ".update-single",function(){
		updateSingleRow($(this))
	});
	$(".act-mode-chart").on("click",function(){
		
		setActModeChart($(this).val())
	})
	$("#act-mode-export").on("click",function(){
		downloadChart(actModeChart,"活動選擇_國家公園及路線使用率")
	})
	$("#act-mode-export-json").on("click",function(){
		downloadChartJson(1)
	})
	$(".tagMode-chart").on("click",function(){
		setTagModeChart($(this).val())
	})
	$("#tagMode-export").on("click",function(){
		downloadChart(tagModeChart,"標籤狀態")
	})
	$("#tagMode-export-json").on("click",function(){
		downloadChartJson(2)
	})
	$(".actTrend-chart").on("click",function(){
		setActMonthSlider()
		setActYearSelect()
		setActTrendChart($(this).val())
	})
	$("#actTrend-select").on("change",function(){
		let year = $(this).val()
		console.log("year : " + year)
		setActTrendChart(null,null,year)
	})
	$("#actTrend-export").on("click",function(){
		let titleName = actTrendChart.options.title.text
		titleName = titleName.replace(/[\u4e00-\u9fa5]/g,"")
		let exportName = "活動發佈及報名人數趨勢_" + titleName
		downloadChart(actTrendChart,exportName)
	})
	$("#actTrend-export-json").on("click",function(){
		downloadChartJson(3)
	})
	$("a.chart-reset").on("click",function(e){
		let thisElm = $(this)
		let canvasID = thisElm.parents("div.card").find("canvas").attr("id")
		resetChart(canvasID)
		e.preventDefault()
	})
	$("#exportAll").on("click",function(e){
		downloadAllJson()
		e.preventDefault()
	})
	
	
	$("#npChartSelect").on("change",function(){
		let value = $(this).val()
		let options = $(this).find("option")
		for(let i =0; i < options.length ; i++){
			let opValue = options.eq(i).val()
			if(opValue == value) usePerRtChart = options.eq(i).text()
		}
//		console.log(usePerRtChart) 
		usePerNpChartData()
	})
	$("body").on("change","input[type='file']",function(){
		form = $("#update-Image")
		preview($(this)[0])
	})
	$('body').on('click', '[data-fancybox-delete]', function(e) {
    	var src = $.fancybox.getInstance().current.src;
    	var idx = $.fancybox.getInstance().current.opts.$orig;
		imageDelete(src, idx)               
	})
	$('body').on('click', '[data-fancybox-update]', function(e) {
    	var src = $.fancybox.getInstance().current.src;
    	var idx = $.fancybox.getInstance().current.opts.$orig;
		imageUpdate(src, idx)                 
	});
	
	
	$.fancybox.defaults.btnTpl.delete = 
	'<button data-fancybox-delete class="fancybox-button fancybox-button--delete" data-toggle="tooltip" title="刪除"><i class="fas fa-trash" style="color: #ff6b6b;"></i></button>';
	$.fancybox.defaults.btnTpl.update = 
	'<button data-fancybox-update class="fancybox-button fancybox-button--update" data-toggle="tooltip" title="修改"><i class="fas fa-tools" style="color: #ff922b;"></i></button>';
	$.fancybox.defaults.infobar = true;
	$.fancybox.defaults.buttons = [
	    "zoom",
		"update",
		"delete",
//	    "share",
	    "slideShow",
	    "fullScreen",
	    "download",
	    "thumbs",
	    "close",
	  ];
	
})


jQuery.extend(jQuery.validator.messages, {
    required: "必填",
    remote: "Please fix this field.",
    email: "請輸入正確Email格式",
    url: "Please enter a valid URL.",
    date: "Please enter a valid date.",
    dateISO: "Please enter a valid date (ISO).",
    number: "僅能輸入數字",
    digits: "Please enter only digits.",
    creditcard: "Please enter a valid credit card number.",
    equalTo: "Please enter the same value again.",
    accept: "Please enter a value with a valid extension.",
    maxlength: jQuery.validator.format("Please enter no more than {0} characters."),
    minlength: jQuery.validator.format("請輸入至少 {0} 個字"),
    rangelength: jQuery.validator.format("Please enter a value between {0} and {1} characters long."),
    range: jQuery.validator.format("Please enter a value between {0} and {1}."),
    max: jQuery.validator.format("Please enter a value less than or equal to {0}."),
    min: jQuery.validator.format("Please enter a value greater than or equal to {0}."),
	pattern: "格式錯誤"
});
