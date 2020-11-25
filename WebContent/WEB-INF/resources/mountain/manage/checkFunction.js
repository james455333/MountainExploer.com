/* 標題檢查 */
function checkTitle(){
	let thisElm = $(this)
	$.ajax({
		url : shareURL + "/titleCheck",
		method : "Get",
		data : { title : $(this).val()},
		dataType : "json",
		success : function(data){
			if(data.hasOwnProperty("error")){
				thisElm.siblings("*").empty();
				thisElm.siblings("span").append("<img src='/MountainExploer.com/mountain/images/cancel.png'>")
				thisElm.siblings("div").append(data.error);
			}else{
				thisElm.siblings("*").empty();
				thisElm.siblings("span").append("<img src='/MountainExploer.com/mountain/images/check.png'>")
			}
		},
		error : function(){
			thisElm.siblings("*").empty();
			thisElm.siblings("span").append("<img src='/MountainExploer.com/mountain/images/cancel.png'>")
			thisElm.siblings("div").append("發生不知名錯誤");
		}
	})
}
/* 開始日期檢查 */
function checkStartDate(){
	let thisElm = $(this)
	let actID = thisElm.parents("form").find("input[name='id']").val();
	$.ajax({
		url : shareURL + "/dateCheck",
		method : "Get",
		data : { 
			startDate : $(this).val(),
			actID : actID
		},
		dataType : "json",
		success : function(data){
			console.log(data)
			if(data){
				thisElm.siblings("*").empty();
				thisElm.siblings("span").append("<img src='/MountainExploer.com/mountain/images/check.png'>")
			}else{
				thisElm.siblings("*").empty();
				thisElm.siblings("span").append("<img src='/MountainExploer.com/mountain/images/cancel.png'>")
				let today = new Date();
				let limitDate =new Date(Number(today) + (60*60*24*1000)*14);
				thisElm.siblings("div").html("修改日期不得小於今日起兩周 : <br>" +  dateFormate(limitDate));
			}
		},
		error : function(){
			thisElm.siblings("*").empty();
			thisElm.siblings("span").append("<img src='/MountainExploer.com/mountain/images/cancel.png'>")
			thisElm.siblings("div").append("發生不知名錯誤");
		}
	})
}
/* 檢查價錢 */
function checkPrice(){
	let thisElm = $(this)
	$.ajax({
		url : shareURL + "/priceCheck",
		method : "Get",
		data : { 
			price : thisElm.val()
		},
		dataType : "json",
		success : function(data){
			if(data.hasOwnProperty("error")){
				thisElm.siblings("*").empty();
				thisElm.siblings("span").append("<img src='/MountainExploer.com/mountain/images/cancel.png'>")
				thisElm.siblings("div").append(data.error);
			}else{
				thisElm.siblings("*").empty();
				thisElm.siblings("span").append("<img src='/MountainExploer.com/mountain/images/check.png'>")
			}
			
		},
		error : function(){
			thisElm.siblings("*").empty();
			thisElm.siblings("span").append("<img src='/MountainExploer.com/mountain/images/cancel.png'>")
			thisElm.siblings("div").append("發生不知名錯誤");
		}
	})
}
function checkRegTop(){
	let thisElm = $(this)
	let actID = thisElm.parents("form").find("input[name='id']").val();
	$.ajax({
		url : shareURL + "/topRegCheck",
		method : "Get",
		data : { 
			actID : actID,
			regTop : thisElm.val(),
		},
		dataType : "json",
		success : function(data){
			if(data.hasOwnProperty("error")){
				thisElm.siblings("*").empty();
				thisElm.siblings("span").append("<img src='/MountainExploer.com/mountain/images/cancel.png'>")
				thisElm.siblings("div").append(data.error);
			}else{
				thisElm.siblings("*").empty();
				thisElm.siblings("span").append("<img src='/MountainExploer.com/mountain/images/check.png'>")
			}
			
		},
		error : function(){
			thisElm.siblings("*").empty();
			thisElm.siblings("span").append("<img src='/MountainExploer.com/mountain/images/cancel.png'>")
			thisElm.siblings("div").append("發生不知名錯誤");
		}
	})
	
}
//function checkRegEndDate(){
//	let thisElm = $(this)
//	let actID = thisElm.parents("form").find("input[name='id']").val();
//	$.ajax({
//		url : shareURL + "/topRegCheck",
//		method : "Get",
//		data : { 
//			actID : actID,
//			regTop : thisElm.val(),
//		},
//		dataType : "json",
//		success : function(data){
//			if(data.hasOwnProperty("error")){
//				thisElm.siblings("*").empty();
//				thisElm.siblings("span").append("<img src='/MountainExploer.com/mountain/images/cancel.png'>")
//				thisElm.siblings("div").append(data.error);
//			}else{
//				thisElm.siblings("*").empty();
//				thisElm.siblings("span").append("<img src='/MountainExploer.com/mountain/images/check.png'>")
//			}
//			
//		},
//		error : function(){
//			thisElm.siblings("*").empty();
//			thisElm.siblings("span").append("<img src='/MountainExploer.com/mountain/images/cancel.png'>")
//			thisElm.siblings("div").append("發生不知名錯誤");
//		}
//	})
//	
//	
//}