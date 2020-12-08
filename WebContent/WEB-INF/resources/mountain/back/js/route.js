
var routeBaseURL = "/MountainExploer.com/back/mountain/route/crud"
var oldBackStageURL = "/MountainExploer.com/backstage/mountain/search";

$(function(){
	$. noConflict()
	setSearchBar()
	setTable()
	$("#npSelect").on("change",changeRtandTb)
})