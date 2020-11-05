
//招出刪除確認
$(".deleteButton").on("click",function(){
	
	let routeID = $(this).siblings().val()
	//console.log(routeID)
	swal({
    title: `路線編號 : ${routeID}`,
    text: "請注意，本操作將刪除本筆資料而無法回復。\n\n\n\n\t確定要執行本操作?",
    icon: "warning",
	dangerMode: true,
    buttons: {
      cancel: {
        text: "取消",
        visible: true
      },
      
      danger: {
        text: "確定執行刪除",
        visible: true,
		value : true
      },
    },
	
  }).then((value) => {
		if(value){
	   		$("#deleteForm").submit();
		}
    	
  });
	
})

//招出結果視窗
if(result!=null){
	swal({
		title: result,
	    icon: "success"
	}
	);
}

//招出錯誤訊息
if(errors!=null){
	swal("Oops! 出現錯誤了", errors,"errors")
}

$("#deleteCancel").on("click",function(){
	$("#deleteID").empty()
	$("#deleteBlock").css({
		"opacity" : "1",
		"pointer-events" : "auto",
	})
	$("#deleteConfirm").hide();
	
})


//列表切換
$("#nPSelect").on("change",function(){
	
	let thisVal = $(this).val() ;
	// console.log(val);
	let npNum = $("#nPSelect").find("option").length;
	// console.log(npNum);
	
	for(let i = 0 ; i < npNum ; i++ ){
		let optionVal = $("#nPSelect").find("option").eq(i).val()
		if(thisVal == optionVal){
			console.log(optionVal)
			$(".scopeQuery").hide();
			$(".scopeQuery").eq(i).show();
		}
	}
	
});

//滑鼠移動呈現放大圖片
$(".routeImg").on("mouseenter",function(e){
	//console.log($(this).attr("src"))
	var elm = $(this);
	var x = e.pageX - elm.offset().left;
    var y = e.pageY - elm.offset().top;
	//var x = event.clientX + $("body").scrollLeft();
	//var x = event.clientX;
	//console.log( 'x : ' + event.clientX)
	//var y = event.clientY + $("body").scrollTop(); 
	//var y = event.clientY; 
	//console.log( 'y : ' + event.clientY)
	$(this).siblings().show();
	
	
}).on("mouseleave",function(){
	$(this).siblings().hide();
})


$(".rtSubmit").on("mouseenter",function(){
	let status = $(this).siblings(".searchSelect").find(".route")
	console.log(status)
})


