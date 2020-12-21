var rtSearchURL = "/MountainExploer.com/mountain/route/search"
var buttonModel = '<div class="d-inline-block mx-3 animated animate__bounceIn my-3"><button type="button" class="btn btn-outline-info"></button></div>'
/* 預設AJAX */
function ajaxDefault() {
	progressCount("等待獲取資料")
	$.ajax({
		url: rtSearchURL + "/np",
		method: "GET",
		dataType: "json",
		success: function(data) {
			progressCount("成功獲得資料")
			setTimeout(()=>{
				setTN(data);
			},1200)
		},
		error: function() {
			showErrorSwal();
		}

	})
}
/* 主項AJAX */
function ajaxTN(npID) {
	$.ajax({
		url: rtSearchURL + "/rt",
		method: "GET",
		data: { npID: npID },
		dataType: "json",
		success: function(data) {
			setVTN(data);
//			setMainContent(data[0].routeInfo);
		},
		error: function() {
			showErrorSwal();
		}
	});
}
/* 副項AJAX */
function ajaxVTN(rtID) {
	$.ajax({
		url: rtSearchURL + "/rt",
		method: "GET",
		dataType: "json",
		data: { rtID: rtID },
		success: function(data) {
			setMainContent(data[0].routeInfo);
		},
		error: function() {
			showErrorSwal();
		}
	})
	
}


/* 新增主項元素 */
function setTN(data) {
	console.log(data)
	let npList = $(".npList")
	for (let i in data) {
		let model = $("#hideElm").find(".npModel").clone()
		model.find("a").attr("href","np"+data[i].id).html(data[i].name)
		npList.append(model);
		model.toggleClass("invisible animate__bounceIn")
		if(i==0) model.find("a").toggleClass("active")
		if((Number(i)+1) == data.length){
			setVTN(data[0].routeBasic)
		}
	}
}

function hideBook(){
	return new Promise((resolve, reject) => {
		console.log("animate book")
		$("#rt-book").toggleClass("animate__bounceOutDown animate__bounceInUp")
		$(".rt-container").height($(".rt-container").height())
		console.log("animate book complete")
		resolve("success")
	})
}

/* 新增副項元素 */
function setVTN(data) {
	$("#rt-container").append(`<div id="rt-book" class="bb-bookblock shadow-lg animate__animated  animate__bounceInUp"></div>`)
	$("#rtSelect").empty()
	for (let i =0 ; i < data.length ; i ++) {
		if(data[i].routeInfo.toggle == null){
			setMainContent(data[i].routeInfo)
		}
	}
	let prevShowing;
	$('#rt-book').bookblock({
		easing : 'ease-in-out',
		shadows	: true,
		shadowSides	: 1,
		shadowFlip	: 1,
		circular	: true,
		onEndFlip : function(){
			$("body").css("overflow","auto")
			$(".div_ul").css("overflow","auto")
			$(".div_li2").css("overflow","hidden")
			let showing = $("#rt-book .rt-page")
				.filter(function() { return $(this).css("display") == "block" })
			let indexShowing = $("#rt-book .rt-page").index(showing)
			$("#rtSelect option").eq(prevShowing).prop("selected",false)
			$("#rtSelect option").eq(indexShowing).prop("selected",true)
			
		},
		onBeforeFlip :  function(){
			$("body").css("overflow","visible")
			$(".div_ul").css("overflow","visible")
			$(".div_li2").css("overflow","visible")
			let showing = $("#rt-book .rt-page")
				.filter(function() { return $(this).css("display") == "block" })
			prevShowing = $("#rt-book .rt-page").index(showing)
			
		},
	});
}

/* 新增主內容元素 */
function setMainContent(routeInfo) {
//	console.log(routeInfo)
	let bookBody = $("#rt-book")
	let bookPage = $("#hideElm").find(".rt-page").clone()
	let imgContent = bookPage.find(".imgAdjust")
	let imgSet = '<img class="imgSet" src="" alt="">'
	let text = bookPage.find(".sec-div-text")
	imgContent.html(imgSet)
	$("#rtSelect").append("<option>" + routeInfo.name + "</option>")
	let imgURL = rtSearchURL + "/images?rtID=" + routeInfo.id + "&timestamp=" + new Date().getTime()
	bookPage.find(".imgSet").attr("src", imgURL).attr("onerror","imgError( $(this) )")
	
	bookPage.find(".sec-div-title").eq(0).text(routeInfo.name)
	bookPage.find(".rt-Info").attr("id","rt-Info" + routeInfo.id)
	bookPage.find(".nav-link").eq(0)
		.attr("href","#rt-pane-desp"+routeInfo.id)
		.attr("id","rt-tab-desp"+routeInfo.id)
		.attr("aria-controls","rt-pane-desp"+routeInfo.id)
	bookPage.find(".tab-pane").eq(0)
		.attr("id","rt-pane-desp"+routeInfo.id)
		.attr("aria-labelledby","rt-tab-desp"+routeInfo.id)
	bookPage.find(".nav-link").eq(1)
		.attr("href","#rt-pane-adv"+routeInfo.id)
		.attr("id","rt-tab-adv"+routeInfo.id)
		.attr("aria-controls","rt-pane-adv"+routeInfo.id)
	bookPage.find(".tab-pane").eq(1)
		.attr("id","rt-pane-adv"+routeInfo.id)
		.attr("aria-labelledby","rt-tab-adv"+routeInfo.id)
	bookPage.find(".nav-link").eq(2)
		.attr("href","#rt-pane-traf"+routeInfo.id)
		.attr("id","rt-tab-traf"+routeInfo.id)
		.attr("aria-controls","rt-pane-traf"+routeInfo.id)
	bookPage.find(".tab-pane").eq(2)
		.attr("id","rt-pane-traf"+routeInfo.id)
		.attr("aria-labelledby","rt-tab-traf"+routeInfo.id)
	console.log(routeInfo.desp)
	text.eq(0).text(routeInfo.desp)
	text.eq(1).text(routeInfo.adv)
	text.eq(2).text(routeInfo.traf)
	bookBody.append(bookPage)
	
	$("#rt-Info"+routeInfo.id+" a").on('click', function (e) {
		console.log($(this).tab('show'))
		e.preventDefault()
		
	})
}

/* 錯誤訊息 */
function showErrorSwal(data) {

}

function imgError(thisElm){
	thisElm.attr("src", "/MountainExploer.com/images/defaultMountain.jpg")
}