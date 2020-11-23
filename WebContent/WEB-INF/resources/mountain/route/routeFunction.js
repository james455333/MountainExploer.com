var rtSearchURL = "/MountainExploer.com/mountain/route/search"
var buttonModel = '<li class="li2"><button type="button" class="btn btn-outline-info"></button></li>'
/* 預設AJAX */
function ajaxDefault(){
	$.ajax({
		url : rtSearchURL+"/np",
		method : "GET",
		dataType : "json",
		success : function(data){
			setTN(data);
			
		},
		error : function(){
			showErrorSwal();
		}
		
	})
}
/* 主項AJAX */
function ajaxTN(npID){
	$.ajax({
		url : rtSearchURL+"/rt",
		method : "GET",
		data : { npID : npID },
		dataType : "json",
		success : function(data){
			setVTN(data);
			setMainContent(data[0].routeInfo);
		},
		error : function(){
			showErrorSwal();
		}
		
	})
}
/* 副項AJAX */
function ajaxVTN(rtID){
	$.ajax({
		url : rtSearchURL+"/rt",
		method : "GET",
		dataType : "json",
		data : { rtID : rtID },
		success : function(data){
			setMainContent(data[0].routeInfo);
		},
		error : function(){
			showErrorSwal();
		}
	})
}


/* 新增主項元素 */
function setTN(data){
	let npList = $(".npList")
	for(let i in data){npList.append(buttonModel);
		npList.find("button").eq(i)
				.val(data[i].id).html(data[i].name)
		if(i==0){
			ajaxTN(data[0].id);
		}
	}
	let num = data.length
}

/* 新增副項元素 */
function setVTN(data){
	let routeList = $(".routeList")
	routeList.empty();
	for(let i in data){
		routeList.append(buttonModel)
		routeList.find("button").eq(i)
				.val(data[i].id).html(data[i].routeInfo.name)
	}
}

/* 新增主內容元素 */
function setMainContent(routeInfo){
	let imgContent = $(".forImage")
	let imgSet = '<img class="imgSet" src="" alt="">'
	let text = $(".sec-div-text")
	imgContent.empty();
	imgContent.append(imgSet)
	let imgURL = rtSearchURL + "/images?rtID=" + routeInfo.id
	$(".imgSet").attr("src",imgURL)
	text.empty();
	text.eq(0).text(routeInfo.desp)
	text.eq(1).text(routeInfo.adv)
	text.eq(2).text(routeInfo.traf)
	
}

/* 錯誤訊息 */
function showErrorSwal(data){
	
}
