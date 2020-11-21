


$(function(){
	

	
	$("#np1").on("click",function(){
			sessionStorage.setItem("npSet","np1");
		})
		$("#np2").on("click",function(){
			sessionStorage.setItem("npSet","np2");
		})
		$("#np3").on("click",function(){
			sessionStorage.setItem("npSet","np3");
		})
	
	
	
	
	$("#c_container nav .first").on("mouseenter",showList).on("mouseleave",shrinkList).
	find("div").on("mouseenter",function(){}).on("mouseleave",function(){});

	$(".third_bar").on("click",showBorder);

	function showBorder(){
		console.log( 123 );
		$(this).siblings(".third_bar").css({"border" : "none"}).end().css({
	    	"border" : "5px solid 	#8CEA00 "
	    })
		$(this).addClass("bar_active").siblings("div").removeClass("bar_active");
		let num = Number($(this).attr("id").substring(4));
		$(".peakList").eq(num-1).addClass("co_active").siblings(".peakList").removeClass("co_active")	
		console.log(num-1);
		let count = $(".peakList").eq(num-1).next().addClass("co_active").siblings(".dataCon").removeClass("co_active");
	}


	$(".peak").on("click",switchSecond);




	//副選單下拉式選單
	for(let i = 1 ; i <=3 ; i++){
	
	$(`#np${i}`).on("click",bondShow);
	
	}
	function bondShow(){
		/*console.log($(this).attr("id"))*/
		let m_np = $(this).attr("id");
		
		$(`${m_np}`).siblings(".third_bar").css({"border" : "none"}).end().css({
        "border" : "5px solid 	#8CEA00 "
    	})
		$(`${m_np}`).addClass("bar_active").siblings("div").removeClass("bar_active");
		let num = Number($(`${m_np}`).attr("id").substring(4));
		$(".peakList").eq(num-1).addClass("co_active").siblings(".peakList").removeClass("co_active")	
		$(".peakList").eq(num-1).next().addClass("co_active").siblings(".dataCon").removeClass("co_active");


	}
	
	



	function showList(){
		let divNum = $(this).find("div").length;
	    $(this).removeClass("use-flexbox")
	    $(this).css({
	        "top" : "10%",
	        "height" : divNum*150+"%",
	        "font-size" : "100%",
	        "background-color" : "blanchedalmond",
	        "border-radius" : "15px",
	        "color" : "	#5A5AAD",
	        "transition" : "0.4s"
		})
    
	    $(this).find("div").css({
	        "position" : "relative",
	        "width" : "80%",
	        "height" : "auto",
	        "margin-top" : "5%",
	        "background-color" : "#FFC78E"
	    })
    
	}

	function shrinkList(){
	    $(this).css({
	        "top" : "auto",
	        "height" : "75%",
	        "color" : "#02DF82",
	        "background-color" : "blanchedalmond",
	        "transition" : "0s"
	    })
	    $(this).addClass("use-flexbox")
	}



	function switchSecond(){
		let total = $(this).parent().find("div");
		let other = $(this).nextAll();
		let self = total.length-other.length
		$(this).parent().nextAll().eq(self-1).addClass("co_active")
		.siblings(".dataCon").removeClass("co_active")
		
	}



})

