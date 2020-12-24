var routeBaseURL = "/MountainExploer.com/back/mountain/route/crud"
var oldBackStageURL = "/MountainExploer.com/backstage/mountain/search";
var dataTable, countRtChart, usePerNpChart, usePerRtChart;

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
	
	$. noConflict()
	PBBlock({
		countTimes : 5,
		startCount : 25,
	})
	openBlock("#route-Container")
	setTopCard().then(() => {
		countRtChartData()
		usePerNpChartData()
		setSearchBar()
		setTable()
	})
	
	
	$("#npSelect").on("change",changeRtAndTb)
	$("#rtSelect").on("change",changeTbByRt)
	
	/* 表格重置按鈕 */
	$("#selectAll").on("click",reRender)
	$("#tb-container").find("*").on("click",function(){
		$('.btn-ctrl').bootstrapToggle({});
		$('.btn-rt-delete').tooltip();
		$('.btn-rt-update').tooltip();
		$('.btn-rt-info').tooltip();
		$('.btn-rt-upImg').tooltip();
	})
//	$("#routeTable").on("error","img",function(){
//		console.log(123)
//		$(this).attr("src","/MountainExploer.com/mountain/images/defaultMountain.jpg")
//	})
	
	$("#tb-container").on("click", '.toggle', function(){
		let thisRtID = $(this).parents("tr").find("td").eq(2).text()
		let thisToggle ;
		if( !$(this).attr("class").includes("off")){
			thisToggle = 1;
		}else{
			thisToggle = 0;
		}
		setRtToggle(thisRtID, thisToggle)
	})
	
	$("#tb-container").on("click", '.btn-rt-update', function(){
		updateBox($(this))
	})
	$("#tb-container").on("click", '.btn-rt-delete', function(){
		deleteAlert($(this))
	})
	$("#tb-container").on("click", '.btn-rt-info', function(){
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
	$("#usePerNpChart").parents(".row").find(".usePer-chart").on("click",function(){
		usePerNpChartData($(this).val())
	})
	$("#countRtChart").parents(".row").find(".countRt-chart").on("click",function(){
		countRtChartData($(this).val())
	})
	$("#usePerNp-export").on("click",function(){
		downloadChart(usePerNpChart)
	})
	$("#countRt-export").on("click",function(){
		downloadChart(countRtChart)
	})
	$("#usePerNp-export-json").on("click",function(){
		downloadChartJson(1)
	})
	$("#countRt-export-json").on("click",function(){
		downloadChartJson(2)
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
	$.fancybox.defaults.infobar = true;
	$.fancybox.defaults.buttons = [
	    "zoom",
//	    "share",
	    "slideShow",
	    "fullScreen",
	    "download",
	    "thumbs",
	    "close"
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
