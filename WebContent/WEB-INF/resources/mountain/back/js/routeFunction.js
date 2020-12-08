
function setSearchBar(){
	$.ajax({
	url : oldBackStageURL + "/navNP",
	method : "GET",
	dataType: 'json',
	success:function(result){
		for(let i = 0 ; i < result.length ; i++){
			
			$("#npSelect").append('<option value="' + result[i].seqno +'">' + result[i].npName + "</option>" )
			
		}
		let firstNP = $("#npSelect").find("option").eq(0).val()
		console.log(firstNP)
		// 路線列表預設為第一筆顯示之國家公園
		$.ajax({
			url : oldBackStageURL + "/navRT?nationalPark=" + firstNP,
			method : "GET",
			dataType : "json",
			success:function(data){
				//console.log(data)
				for(let i in data) $("#rtSelect").append("<option value='" + data[i].seqno + "'>" + data[i].name +"</option>")
			}
		})
	}
})
	
	
}

function setTable(){
	$.ajax({
		url : routeBaseURL + "/allRoute",
		type : "GET",
		dataType : "json",
		success : function(data){
			console.log(data)
			setDataTable(data)
		},
		error : function(){
			swal("發生錯誤","","error")
		}
	})
}

function setDataTable(data){
	let result = [];
	
	for(let i in data){
		let routeInfo = data[i].routeInfo
		let riGroup = {
			"路線編號" : routeInfo.id,
			"路線名稱" : routeInfo.name,
			"國家公園名稱" : data[i].np,
			"路線介紹" : "<div>" + routeInfo.desp + "</div>",
			"建議路線" : "<div>" + routeInfo.adv + "</div>",
			"交通資訊" : "<div>" + routeInfo.traf + "</div>",
			
		}
		result.push(riGroup)
	}
	console.log(result)
	var table =  $('#routeTable').DataTable( {
		"data" : result,
        "pagingType": "full_numbers",
		"columns": [
            { "data": "路線編號" },
            { "data": "路線名稱" },
            { "data": "國家公園名稱" },
            { "data": "路線介紹" },
            { "data": "建議路線" },
            { "data": "交通資訊" }
        ],
    } )
}
function changeRtandTb(){
	var npID = $("#npSelect").val();
	$.ajax({
		url : oldBackStageURL + "/navRT?nationalPark="+npID,
		method : "GET",
		dataType: 'json',
		success:function(data){
			//console.log(data)
			$("#rtSelect").empty()
			if(data.length != 0){
				for(let i in data) 
					$("#rtSelect").append("<option value='" + data[i].seqno + "'>" + data[i].name +"</option>")
			}
			
		}
	})
}