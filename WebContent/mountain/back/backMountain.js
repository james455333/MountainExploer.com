


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


//列表切換與按鈕切換
$("#nPSelect").on("change",function(){
	
	let thisVal = $(this).val() ;
	let npNum = $("#nPSelect").find("option").length;
	
	for(let i = 0 ; i < npNum ; i++ ){
		
		let optionVal = $("#nPSelect").find("option").eq(i).val()
		let status = $(".rtSubmit").eq(i).parent().siblings("div").find("option").length
		if(thisVal == optionVal){
			$(".scopeQuery").hide();
			$(".scopeQuery").eq(i).show();
			if(status < 1 ){
				$(".npSubmit").prop("disabled",true).val("無路線可查詢")
			}else{
				$(".npSubmit").prop("disabled",false).val("國家公園查詢")
			}
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


/*$(".rtSubmit").on("mouseenter",function(){
	let status = $(this).parent().siblings("div").find("option").length
	if(status <= 0){
		$(this).prop("disabled",true)
	}
}).on("mouseleave",function(){
	$(".rtSubmit").prop("disabled",false)
})*/

//判斷
let rtsubmit = $(".rtSubmit").length
let npsubmit = $(".npsubmit").length
for(let i = 0 ; i<rtsubmit ; i++){
	let status = $(".rtSubmit").eq(i).parent().siblings("div").find("option").length
	if(status <= 0){
		$(".rtSubmit").eq(i).prop("disabled",true)
	}
	
}

if($(".rtSubmit").eq(0).prop("disabled")){
	$(".npSubmit").prop("disabled",true).val("無路線可查詢")
}




