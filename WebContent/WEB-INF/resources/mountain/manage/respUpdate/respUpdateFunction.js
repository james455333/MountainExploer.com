function setOriginResp(){
	console.log(seqno)
	$.ajax({
		url : respHome + "/update."+seqno,
		type : "GET",
		dataType : "json",
		success : function(data){
			console.log(data)
			originResp = data.msg
			CKEDITOR.instances.note.setData(data.msg)
		},
		error : function(){
			swal("發生錯誤","請聯絡管理員","error")
		}
	})

}




function checkSubmit(thisBtn){
	
	let data = CKEDITOR.instances.note.getData()
	if(data != ''){
		swal({
			title : "確認更改?",
			icon : "warning",
			dangerMode : true,
			buttons : {
				confirm : {
					text : "發布更改",
					value : true
				},
				cancel : {
					text : "返回修改",
					value : false,
					visible : true
				}
			}
		}).then((value) => {
			if(value){
				ajaxUpdate(data)
			}
		})
	}else{
		swal("不可為空","","error")
	}
}
function ajaxUpdate(data){
	let goURL = detailHome + "page=" + page + "&actID=" + actID + "#" + seqno
//	formData = new FormData();
//	formData.append("message",data)
	setTimeout(function(){
		window.location.href = goURL
	},2800)

	$.ajax({
		url : respHome + "/update."+seqno,
		type : "PUT",
		data : data ,
		dataType : "json",
		contentType: "application/json; charset=UTF-8",
		success : function(data){
			swal("修改回覆成功", "三秒後跳轉至活動詳情頁","success").then(() => {
				window.location.href = goURL
			})
		},
		error : function(){
			swaL("發生錯誤","請聯絡管理員","error")
		}
	})
	
	
}

