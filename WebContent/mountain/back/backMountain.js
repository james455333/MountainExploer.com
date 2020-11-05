
//招出刪除確認視窗及阻擋層
$(".deleteButton").on("click",function(){
	
	
	let routeID = $(this).siblings().val()
	$("#deleteID").append( "路線編號 : " + routeID + `<input type='text' name='deleteID' value='${routeID}' style='display:none;'>`  )
	
	swal({
    title: "確認",
    text: "內容",
    icon: "warning",
    buttons: {
      cancel: {
        text: "取消",
        visible: true
      },
      // danger: {
      //變紅底
      commit: {
        text: "確認",
        visible: true,

      },
      danger: {
        text: "紅色",
        visible: true
      }
    }
  }).then((value) => {
    swal(`你選擇了 ${value}`);
    //要執行的程式碼放在  .then((value) => {` 這邊 `});
    // if(value !==)
    
  });
	
	//$("#deleteConfirm").show();
})
$("#deleteCancel").on("click",function(){
	$("#deleteID").empty()
	$("#deleteBlock").css({
		"opacity" : "1",
		"pointer-events" : "auto",
	})
	$("#deleteConfirm").hide();
	
})

$("")

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


