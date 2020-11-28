/*	日期編譯 */
function dateFormate(date) {
	let result = "";
	result = result.concat(new Date(date).toLocaleDateString())
		.concat(" " + new Date(date).toLocaleTimeString())

	return result;
}

/* 會員登入檢查 */

function ajaxCheckLogin(){
	$.ajax({
		url : "/MountainExploer.com/mountain/public/mbInfo",
		type : "GET",
		dataType : "json",
		success : function(data){
			console.log(data.seqno)
			return data.seqno;
		},
		error : function(){
			console.log("error")
			swal("會員登入出錯","請聯絡管理員","error")
		}
	})
}