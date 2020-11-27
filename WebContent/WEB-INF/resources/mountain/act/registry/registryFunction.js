
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
	$("#title").html("<h2>" + data.activityInfo.title + " -- 報名資料填寫" +  "</h2>")
	$(".reg-ta-th-quick").find("div").eq(0).append(data.nowReg)
	$(".reg-ta-th-quick").find("div").eq(1).append(regTop)
	$(".reg-ta-th-quick").find("div").eq(2).append(new Date(data.activityInfo.regEndDate).toLocaleDateString())
	$(".reg-ta-th-note").append(data.activityInfo.addInfo)
}