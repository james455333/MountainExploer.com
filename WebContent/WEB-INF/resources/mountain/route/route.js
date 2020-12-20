


$(function(){
	PBBlock({
		countTimes : 3,
		endCount : 99
	})
	openBlock()
	progressCount("頁面元素載入完成")
	ajaxDefault()
	$(".npList").on("click",'a',function(){
		hideBook()
		.then( success =>{
			console.log("make rt-book display none")
			setTimeout(()=>{
				$('#rt-book').remove()
				new Promise((resolve)=>{
					console.log("go get data")
					ajaxTN( $(this).attr("href").replace("np",""))
					resolve("success")
				})
			},1000)
		})
	})
	$("#rt-info-container").on("click",".btn",function(){
		let rtID = $(this).val()
		ajaxVTN(rtID, $(this));
	})
	$(".page-link").on("click",function(e){
		let order = $(this).attr("id").replace("-page","")
		$( '#rt-book' ).bookblock(order);
		e.preventDefault()
	})
	$("#rtSelect").on("change",function(){
		console.log( $(this)[0].selectedIndex )
		$("#rt-book").bookblock("jump",$(this)[0].selectedIndex+1)
	})
})

