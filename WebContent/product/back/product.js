//var routeBaseURL = "/MountainExploer.com/back/mountain/route/crud"
var routeBaseURL = "/MountainExploer.com/backstage/product/search"
var productBaseURL = "/MountainExploer.com/back/shop"
var oldBackStageURL = "/MountainExploer.com/backstage/product/search";
var dataTable, countRtChart, usePerNpChart, usePerRtChart;

// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';
Chart.defaults.global.defaultFontSize = 15;
var chartBackColors = [
	'#4e73df', '#1cc88a', '#36b9cc', "#B15BFF", "#EAC100",
	"#FF8040", "#FFD306", "#F9F900", "#FFB5B5", "#FFD9EC",
	"#FF79BC", "#D3A4FF", "#CECEFF", "#BBFFBB", "#D3FF93",
	"#FFD1A4",
]

var chatyBackHoverColors = [
	'#2e59d9', '#17a673', '#2c9faf', "#8600FF", "#AE8F00",
	"#D94600", "#C6A300", "#C4C400", "#FF7575", "#FFAAD5",
	"#FF359A", "#BE77FF", "#AAAAFF", "#93FF93", "#C2FF68",
	"#FFBB77"
]


$(function() {
	$.noConflict()
	setTopCard()
	countRtChartData()
	usePerNpChartData()
	setRevenue()
	console.log(dataTable)
	setTable()
	
	var homeUrl = "/MountainExploer.com/shop/search";

	//	預設頁面
	$(window).on("load", function() {
		//查找資料庫總筆數
		$.ajax({
			url: homeUrl + "/totalData",
			method: "GET",
			success: function(data) {
				$("#totalData").html(data)
			}
			})
		})
	

	$("#tb-container").find("*").on("click", function() {
		$('.btn-ctrl').bootstrapToggle({});
		$('.btn-rt-delete').tooltip();
		$('.btn-rt-update').tooltip();
		$('.btn-rt-info').tooltip();
		$('.btn-rt-upImg').tooltip();
	})

	$("#selectAll").on("click", reRender)



	$("#tb-container").on("click", '.btn-rt-update', function() {
				let productID = $(this).parents("tr").find("td").eq(0).text()
//		window.location = "/MountainExploer.com/back/shop/updateDataPage?seqno=6000437"
		window.location = "/MountainExploer.com/back/shop/updateDataPage?seqno="+productID
	})
	$("#tb-container").on("click", '.btn-rt-delete', function() {
		deleteAlert($(this))
	})
	$("#tb-container").on("click", '.btn-rt-info', function() {
				let productID = $(this).parents("tr").find("td").eq(0).text()
		//		let productID = btn.parents("tr").find("td").eq(0).text()
		//		console.log(productID)
//		window.location = "/MountainExploer.com/back/shop/productInfoEntry?no=6000000"
		window.location = "/MountainExploer.com/back/shop/productInfoEntry?no="+productID
	})

	//	$("#newNp").on('click',newNp)
	//	$("#updateNp").on('click',updateNp)
	//	$("#deleteNp").on('click',deleteNp)
	//	$("#newRoute").on('click',newRoute)
	//	$("body").on("change", "#imageFile", function() {
	//		var fileName = $(this).val().split("\\").pop();
	//		$(this).siblings(".custom-file-label").addClass("selected").html(fileName);
	//	});
	//	$("#usePerNpChart").parents(".row").find(".usePer-chart").on("click",function(){
	//		usePerNpChartData($(this).val())
	//	})
	$("#countRtChart").parents(".row").find(".countRt-chart").on("click", function() {
		countRtChartData($(this).val())
	})
	$("#usePerNp-export").on("click", function() {
		downloadChart(usePerNpChart)
	})
	$("#countRt-export").on("click", function() {
		downloadChart(countRtChart)
	})
	$("#usePerNp-export-json").on("click", function() {
		downloadChartJson(1)
	})
	$("#countRt-export-json").on("click", function() {
		downloadChartJson(2)
	})
	//	$("a.chart-reset").on("click",function(e){
	//		let thisElm = $(this)
	//		let canvasID = thisElm.parents("div.card").find("canvas").attr("id")
	//		resetChart(canvasID)
	//		e.preventDefault()
	//	})
	$("#exportAll").on("click", function(e) {
		downloadAllJson()
		e.preventDefault()
		Swal.fire({
			title: "匯出商品資料，請稍等...",
			icon: "success",
			confirmButtonText: 'ok',
		})
	})





	$("#npChartSelect").on("change", function() {
		let value = $(this).val()
		let options = $(this).find("option")
		for (let i = 0; i < options.length; i++) {
			let opValue = options.eq(i).val()
			if (opValue == value) usePerRtChart = options.eq(i).text()
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

		