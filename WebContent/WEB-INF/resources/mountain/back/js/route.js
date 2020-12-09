var routeBaseURL = "/MountainExploer.com/back/mountain/route/crud"
var oldBackStageURL = "/MountainExploer.com/backstage/mountain/search";
var dataTable;


$(function(){
	
	
	$. noConflict()
	setSearchBar()
	setTable()
	$("#npSelect").on("change",changeRtAndTb)
	$("#rtSelect").on("change",changeTbByRt)
	$("#selectAll").on("click",setTable)
	$("#tb-container").find("*").on("click",function(){
		$('.btn-ctrl').bootstrapToggle({});
		$('.btn-rt-delete').tooltip();
		$('.btn-rt-update').tooltip();
		$('.btn-rt-info').tooltip();
		$('.btn-rt-upImg').tooltip();
	})
	
	$("#tb-container").on("click", '.toggle', function(){
		let thisRtID = $(this).parents("tr").find("td").eq(2).text()
		let thisToggle ;
		if( !$(this).attr("class").includes("off")){
			console.log(thisRtID + " set to off")
			thisToggle = 1;
		}else{
			console.log(thisRtID + " set to on")
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