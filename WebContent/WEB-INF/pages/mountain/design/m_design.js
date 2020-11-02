$('.sendID').prop('checked',false);


$("#m_present").append("<div id='confirm_box'></div>")
		$("#confirm_box").css({
			
			"position" : "absolute",
			"height" : "10%",
			"width" : "25%",
			"background-color" : "	#E0E0E0",
			"left" : "37.5%",
			"top" : "14%",
			"border" : "2px solid black",
			"display" : "block",
    		"align-items" : "center",
  
		}).append("<div class='innerMsg'>確定刪除?</div><div class='innerMsg'></div>")
		$(".innerMsg").css({
			"position" : "relative",
			"height" : "50%",
			"width" : "100%",
			"text-align" : "center"
		}).eq(1).append("<input type='button' class='innerButton' id='confirm_button' value='是'><input class='innerButton' type='button' id='denied_button' value='否'>")
		$(".innerButton").css({
			"width" : "40px",
		})

$("#confirm_box").hide();

$("#confirm_button").on("click",function(){
	let tf
	for(let i = 0 ; i < $(".sendID").length ; i++){
		tf = $(".sendID").eq(i).prop("checked")
		if( tf == true) {
		tf = $(".sendID").eq(i).val()
		break;
		}
	} 
	window.location.href = `DeleteActServlet?delete_id=${tf}`;
})



$('.sendID').click(function(){
    if($(this).prop('checked')){
    $('.sendID').prop('checked',false);
    	$(this).prop('checked',true);
    }
});		
		
		
$(".controll-bar").find("div").eq(0).on("click",function(){
	$(".act_manage").eq(0).removeClass("act_active");
	sessionStorage.setItem("newActivity","creating");
	$(".act_manage").eq(1).addClass("act_active");
	$(".controll-bar").find("div").hide();
	$(this).show();
})


$(".controll-bar").find("div").eq(1).on("click",function(){
	$(".stocker").eq(1).text("請勾選要修改的活動後，再點選一次'修改模式'進行修改,一次僅能進行一筆。")
	$(".stocker").eq(1).append("<input type='button' id='update_cancel' value='取消'>")
	$(".controll-bar").find("div").hide();
	$(this).show();
	$(".act_row").css("display","block")
	$("#update_cancel").on("click",function(){
		$(".controll-bar").find("div").show();
		$(".act_row").css("display","none")
		$(".stocker").eq(1).empty();
	})
})
$(".controll-bar").find("div").eq(2).on("click",function(){
	$(".stocker").eq(1).text("請勾選要修改的活動後，再點選一次'修改模式'進行刪除,一次僅能進行一筆。")
	$(".stocker").eq(1).append("<input type='button' id='update_cancel' value='取消'>")
	$(".controll-bar").find("div").hide();
	$(this).show();
	$(".act_row").css("display","block")
	$("#update_cancel").on("click",function(){
		$(".controll-bar").find("div").show();
		$(".act_row").css("display","none")
		$(".stocker").eq(1).empty()
	})
	$(".controll-bar").find("div").eq(2).on("click",function(){
		$("#confirm_box").show();		
	})
})



if(sessionStorage.getItem("newActivity") == "creating"){
	$(".act_manage").eq(0).removeClass("act_active");
	$(".act_manage").eq(1).addClass("act_active");
	$(".controll-bar").find("div").hide();
	$(".controll-bar").find("div").eq(0).show();
}else{
	$(".act_manage").eq(1).removeClass("act_active");
	$(".act_manage").eq(0).addClass("act_active");
	$(".controll-bar").find("div").show();

}



$("#act_np_name").on("change",function(){
	let np_name = $(this).val();
	console.log( $(this).val() )
	if( np_name == '玉山國家公園'){
		$("#rt_yu_peak").siblings("select").removeClass("rt_active").addClass("rt_wait")
		.end().addClass("rt_active")
	}else if( np_name == '太魯閣國家公園' ){
		$("#rt_ta_peak").siblings("select").removeClass("rt_active").addClass("rt_wait")
		.end().addClass("rt_active")
	}else if( np_name == '雪霸國家公園' ){
		$("#rt_sh_peak").siblings("select").removeClass("rt_active").addClass("rt_wait")
		.end().addClass("rt_active")
	} 
	
})

$("#from_end_date").on("change",function(){
	let datePick = $("#from_end_date").val()
	let pick1 = new Date( datePick.substring(0,10) );
	let pick2 = new Date( datePick.substring(13) );
	let total = ( pick2 - pick1 ) / (60*60*24*1000) +1 ;
	if(total == '1'){
		$("#total_day").val("單日返還");
	}else{
		$("#total_day").val( total + "天"  +  (total-1) + "夜" );
	}
	
	
})

let controller = true;
$(".invisible_detail").hide();
$(".act_show_detail").on("click",function(){
	$(this).parent().parent().next().toggle();
	
})

$(".act_row").hide();
$(".act_delete").hide();

$(function() {
  $('input[name="from_end_date"]').daterangepicker({
    opens: 'left',
    locale: {
    format: "YYYY-MM-DD"
    }
  }, function(label, start , end) {
  
  });
   $('input[name="confirm_date"]').daterangepicker({
    singleDatePicker: true,
    minYear: 1901,
    locale: {
    format: "YYYY-MM-DD"
    },
    maxYear: parseInt(moment().format('YYYY'),10)
  }, function(start, end, label) {
  });
  
  $("#act_back_button").on("click",function(){
  	sessionStorage.setItem("newActivity","waiting");
  	$(".act_manage").eq(1).removeClass("act_active");
	$(".act_manage").eq(0).addClass("act_active");
	$(".controll-bar").find("div").show()
  	
  })
  
  
  
});

