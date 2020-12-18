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
			if(data.length > 0){
				let display = $(".secDivContent ").attr("display")
				if(display == "none") $(".secDivContent ").show(500)
				setMainContent(data[0].routeInfo);
			}
			else{
				$(".secDivContent ").hide()
			}
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
			$( '#rt-book' ).bookblock();
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
		model.find("a").val(data[i].id).html(data[i].name)
		npList.append(model);
		setTimeout(()=>{
			model.toggleClass("invisible animate__bounceIn")
			if(i==0) model.find("a").toggleClass("active")
			if((Number(i)+1) == data.length){
				console.log("go")
				setVTN(data[0].routeBasic)
			}
		},150*Number(i))
	}
	let num = data.length
}

/* 新增副項元素 */
function setVTN(data) {

//	let routeList = $(".routeList")
//	routeList.empty();
	for (let i =0 ; i < data.length ; i ++) {
		if(data[i].routeInfo.toggle == null){
//			let model = $("#hideElm").find(".li2").clone();
//			model.find("button").val(data[i].id).html(data[i].routeInfo.name)
//			routeList.append(model)
			console.log(i)
			setMainContent(data[i].routeInfo)
		}
	}
	$('#rt-book').bookblock({
		easing : 'ease-in-out',
		shadows	: true,
//		shadowSides	: 0.2,
//		shadowFlip	: 0.1,
		circular	: true,
		onEndFlip : function(){
			$("body").css("overflow","auto")
			$(".div_ul").css("overflow","auto")
		},
		onBeforeFlip :  function(){
			$("body").css("overflow","visible")
			$(".div_ul").css("overflow","visible")
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
	console.log("rtSeqno : " + routeInfo.id)
	let imgURL = rtSearchURL + "/images?rtID=" + routeInfo.id + "&timestamp=" + new Date().getTime()
	console.log("imgURL : " + imgURL)
	bookPage.find(".imgSet").attr("src", imgURL).attr("onerror","imgError( $(this) )")
//	text.eq(0).text(routeInfo.desp)
//	text.eq(1).text(routeInfo.adv)
//	text.eq(2).text(routeInfo.traf)
	console.log(bookPage[0])
	bookBody.append(bookPage)
	console.log("setMainContent")
}

/* 錯誤訊息 */
function showErrorSwal(data) {

}

function imgError(thisElm){
	thisElm.attr("src", "/MountainExploer.com/images/defaultMountain.jpg")
}