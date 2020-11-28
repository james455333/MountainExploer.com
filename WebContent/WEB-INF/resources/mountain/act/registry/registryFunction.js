
function activeDataAS(actID){
	$.ajax({
		url : regHome+"/default.data",
		type : "GET",
		dataType : "json",
		data : {actID : actID},
		success : function(data){
			setDefaultData(data)
			regTop = data.activityInfo.regTop;
		},
		error : function(){
			swal({
				title : "讀取發生錯誤",
				icon : "error",
				buttons : {
					cofrim :{
						text : "好的"
					}
				} 
			})
		}
	})
}

function setDefaultData(data){
	regTop = data.activityInfo.regTop;
	nowReg = data.nowReg
	$(".page-header").html("<h1>" + data.activityInfo.title + " -- 報名資料填寫" +  "</h1>")
	$("#act-simpleinfo").find("div").eq(0).append( "$ " + data.activityInfo.price)
	$("#act-simpleinfo").find("div").eq(1).append(data.nowReg)
	$("#act-simpleinfo").find("div").eq(2).append(regTop)
	$("#act-simpleinfo").find("div").eq(3).append(new Date(data.activityInfo.regEndDate).toLocaleDateString())
	$("#act-simpleinfo").find("div").eq(4).append(new Date(data.activityInfo.startDate).toLocaleDateString())
	$("#act-note").append(data.activityInfo.addInfo)
}

function appedRegInfo(){
	let model = $("#regInfo-body-order-origin").clone();
	console.log(model)
	let formLength = $(".regInfo-body-order").length
	let inputs = model.find("input")
	for(let i = 0 ; i < inputs.length ; i++){
		let originName = inputs.eq(i).attr("name")
		let newName = originName.substring(0,originName.indexOf("_")) + "_" +formLength
		inputs.eq(i).attr("name",newName)
	}
	model.attr("id","").addClass("regInfo-body-order")
	$(".regInfo-form").append(model)
}

function removeRegInfo(formLength){
	$(".regInfo-body-order").eq(formLength-1).remove()	
}

function regformValidate(form){
	
}

