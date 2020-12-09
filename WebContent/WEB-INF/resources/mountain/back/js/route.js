var routeBaseURL = "/MountainExploer.com/back/mountain/route/crud"
var oldBackStageURL = "/MountainExploer.com/backstage/mountain/search";
var dataTable;


$(function(){
	
	
	$. noConflict()
	setTopCard()
	setSearchBar()
	setTable()
	$("#npSelect").on("change",changeRtAndTb)
	$("#rtSelect").on("change",changeTbByRt)
	
	/* 表格重置按鈕 */
	$("#selectAll").on("click",function(){
		if(typeof dataTable != 'undefined') dataTable.destroy()
		$('#routeTable').find("tbody").remove()
		let btn = $(this)
		btn.find("i").addClass("fa-spin")
		setTimeout(function(){
			setTable()
			btn.find("i").removeClass("fa-spin")
		}, 1000)
	})
	$("#tb-container").find("*").on("click",function(){
		$('.btn-ctrl').bootstrapToggle({});
		$('.btn-rt-delete').tooltip();
		$('.btn-rt-update').tooltip();
		$('.btn-rt-info').tooltip();
		$('.btn-rt-upImg').tooltip();
	})
	
	$("body").on("change",".swal-title", function(){
		
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
	$("#newNp").on('click',newNp)
	$("#updateNp").on('click',updateNp)
	$("#deleteNp").on('click',deleteNp)
	$("#newRoute").on('click',newRoute)
	$("body").on("change", "#imageFile", function() {
		var fileName = $(this).val().split("\\").pop();
		$(this).siblings(".custom-file-label").addClass("selected").html(fileName);
	});
	
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