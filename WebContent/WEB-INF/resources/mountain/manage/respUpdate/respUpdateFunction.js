function setOriginResp(){
	
	$.ajax({
		url : respHome + "/update."+seqno,
		type : "GET",
		dataType : "json",
		success : function(data){
			CKEDITOR.instances.note.setData(data.msg)
		},
		error : function(){
			swaL("發生錯誤","請聯絡管理員","error")
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
	
	formData = new FormData();
	formData.append("message",data)
	$.ajax({
		url : respHome + "/update."+seqno,
		type : "POST",
		data : formData,
		dataType : "json",
		processData : false,
		contentType : false,
		success : function(data){
			swal("修改回覆成功", "三秒後跳轉至活動詳情頁","success").then(() => {
				window.location.href = window.location.history(-1)
			})
		},
		error : function(){
			swaL("發生錯誤","請聯絡管理員","error")
		}
	})
	
	
}

