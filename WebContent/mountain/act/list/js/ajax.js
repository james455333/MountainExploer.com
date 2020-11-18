	
$(function(){
	//	參數設置
	var actHomeURL = "/MountainExploer.com/mountain/act/search";
	var actEnterURL = "/MountainExploer.com/mountain/list?";
	var mountainShare = "/MountainExploer.com/mountain/public";
	var totalPage, totalData, page, od, tag, search;
	var urlNow = new URL(window.location.href)
	if(urlNow.searchParams.has("page")){
		page = urlNow.searchParams.get("page");
		console.log(typeof page)
		console.log(page)
	}else{
		page = 1;
	}
	if(urlNow.searchParams.has("od")){
		od = urlNow.searchParams.get("od");
	}else{
		od = 1;
	}
	if(urlNow.searchParams.has("tag")){
		tag = urlNow.searchParams.get("tag");
	}
	if(urlNow.searchParams.has("search")){
		search = urlNow.searchParams.get("search");
	}
	
	//	方法 : Load時，依照參數執行指定函式
	$(window).on("load",function(){
		if(od == 1){
			activeMainAjax(page,"/defaultAS");			
		}
		if(od == 2){
			activeMainAjax(page,"/tagAS");		
			setSelectOption();	
		}
		if(od == 3){
			activeMainAjax(page,"/searchAS");	
		}
		
	})
	//	方法 : 掛載活動狀態標籤查詢方法，讓點擊選單選項執行查詢函式
	$("select[name='aTag']").on("change",function(){
		activeTagAS( $(this).val() );
	})
	
	//	方法 : 掛報名狀態標籤查詢方法，讓點擊選單選項執行查詢函式
	$("select[name='rTag']").on("change",function(){
		activeTagAS( $(this).val() );
	})
	
	//	方法 : 掛載輸入名稱查詢，讓按鈕被點擊時，執行名稱查詢函式
	$(".search").find("button").on("click",function(){
		$("#m-sr-form").submit();
	})
	
	//	方法 : 透過事件發生座標與發生所在元素座標組合，讓滑鼠滑入可以顯現大圖於旁
	$(".order-table").on("mouseenter",".showImage",function(e){
		var elm = $(this);
		var x = e.pageX - elm.offset().left;
	    var y = e.pageY - elm.offset().top;
		$(this).siblings().show();
	}).on("mouseleave",".showImage",function(){
		$(this).siblings().hide();
	})
	//	函式 : 根據Tag參數配置屬性
	function setSelectOption(){
		let selected = "option[value="+ tag +"]";
		if(tag > 3){
			$("select[name='rTag']").find(selected).attr({selected : true, disaled : true })
		}else{
			$("select[name='aTag']").find(selected).attr({selected : true, disaled : true })
		}
		
	}
	
	//	函式 : 將參數傳入、組合，並執行Ajax指令，最後得到回傳結果，再將結果交給動態新增函式處理
	function activeMainAjax(page,as){
		let sendData = { page : page, tag: tag, search : search}
		$.ajax({
			url : actHomeURL + as,
			method : "GET",
			dataType: 'json',
			data : sendData,
			success:function(data){
				
				//參數給值
				totalPage = data.totalPage;
				totalData = data.totalData;
				if( totalData == 0){
					swal({
						title : "無符合本次查詢條件的資料",
						icon : "info",
					})
				}
				$("ul[class='third_nav']").find("li").eq(2).append(totalData)
				//	呼叫動態新增資料函式
				insertTable(data.actBeans);
				//設定按鈕
				setPageController(data.page,od)
				
				
			}
		})
	}
	
	//	函式 : 將得到結果，於網頁上的指定位置動態新增指定元素
	function insertTable(data){
		$(".order-table").find("thead").siblings().remove()
		for(let i in data){
			$(".order-table").append(
				"<tbody  class='order-table-tb'>" +
					"<tr>" +
						"<td>" +
							"<img class='showImage' src='" + actHomeURL +"/images?actID=" + data[i].actID +"'>" +
							"<img class='extendImage' src='" + actHomeURL +"/images?actID=" + data[i].actID +"'>" +
						"</td>" +
						"<td>" +
							setTag(data[i].tag) + "<br>" + "<a class='ctDeatil' href='#'>" + data[i].title + "</a>" + "<br>" + data[i].totalDay + " / " + data[i].price  +
						"</td>" +
						"<td>" +
							data[i].postDate + " / <br>" + data[i].authorName +
						"</td>" +
						"<td>" +
							data[i].nowReg + " / " + data[i].topReg +
						"</td>" +
						"<td>" +
							data[i].regEndDate +
						"</td>" +
//						"<td>" +
//							
//						"</td>" +
					"</tr>" +
				"</tbody>"
			)
			
		}
		
	}
	
	//	函式 : 組合傳入參數誠一網域，並前往該網域
	function activeTagAS(tag){
		console.log("tag : " + tag)
		if(tag != 0){
			let tagAs = actEnterURL + "od=2&page=1&tag=" + tag;
			window.location.assign(tagAs)	
		}
	}
	
	
	
	//	函式 : 取得指定位置的元素進行條件檢查，並設定參數Boolean值
	function checkBefore(){
		var inputs = $("#newAct").find("input")
			for(let i =0 ; i < inputs.length ; i++ ){
				let j = inputs[i].value;
				if( j.length <= 0){
					checkEmpty = false;
					break;	
				}
			}
			var errorArray = $("#newAct").find(".errorSpan")
			for(let i = 0 ; i < errorArray.length ; i++){
				let j = $("#newAct").find(".errorSpan").eq(i).html();
				if(j.length > 0){
					checkError = false;
				}
			}
		
	}
	
	//	函式 : 計算傳入參數，並於網頁動態新增或修改頁面控制項
	function setPageController(page,od){
		var pageArray = $(".pageControl").find("a")
		let url ;
		if(od ==1){
			url = actEnterURL + "od=1&"
		}
		if(od ==2){
			url = actEnterURL + "od=2&tag="+tag+"&"
		}
		
		$(".pageControl").find("a").eq(2).html("目前 " + page + ' / ' +totalPage + " 頁")
				
			if(page != 1){
				let first = url + "page=1"
				let previous = url + "page=" + ( Number(page) - 1 ) ;
				$(".pageControl").find("a").eq(0).attr("href",first).css("display","block")
				$(".pageControl").find("a").eq(1).attr("href",previous).css("display","block")
			}else{
				$(".pageControl").find("a").eq(0).css("display","none")
				$(".pageControl").find("a").eq(1).css("display","none")
			}
			if(page<totalPage){
				let next = url +"page=" + ( Number(page) + 1 ) ;
				let final = url + "page=" + ( Number(totalPage));
				$(".pageControl").find("a").eq(3).attr("href",next).css("display","block")
				$(".pageControl").find("a").eq(4).attr("href",final).css("display","block")
			}else{
				$(".pageControl").find("a").eq(3).css("display","none")
				$(".pageControl").find("a").eq(4).css("display","none")
			}
	}
	
	//	函式 : 透過傳入參數，於網頁動態新增狀態標籤
	function setTag(check){
			let result = "<div class='tagContainer'>";
			let aURL = actEnterURL.concat("od=2&page=1&")
			console.log(aURL)
			if( !check[3] ){
				if( check[1] ){
					result = result.concat("<div class='actTag'><a href='")
								.concat(aURL + "tag=1'>")
								.concat("新活動")	
								.concat("</a></div>")
				}
				if( check[2] ){
					result = result.concat("<div class='actTag'><a href='")
								.concat(aURL + "tag=2'>")
								.concat("熱門活動")	
								.concat("</a></div>")
				}
				if( !check[4] ){
					if( !check[5] ){
						if( check[6] ){
							result = result.concat("<div class='regTag'><a href='")
										.concat(aURL + "tag=6'>")
										.concat("尚可報名")	
										.concat("</a></div>")
						}
						if( check[7] ){
							result = result.concat("<div class='regTag'><a href='")
									.concat(aURL + "tag=7'>")
									.concat("報名將截止")	
									.concat("</a></div>")
						}
						if( check[8] ){
							result = result.concat("<div class='regTag'><a href='")
										.concat(aURL + "tag=8'>")
										.concat("報名將滿")	
										.concat("</a></div>")
						}
					}else{
					result = result.concat("<div class='regTag'><a href='")
								.concat(aURL + "tag=5'>")
								.concat("報名已滿")	
								.concat("</a></div>")
					}
				}else{
					result = result.concat("<div class='regTag'><a href='")
								.concat(aURL + "tag=4'>")
								.concat("報名截止")	
								.concat("</a></div>")
				}
				
			}else{
				result = result.concat("<div class='actTag'><a href='")
							.concat(aURL + "tag=3'>")
							.concat("歷史活動")	
							.concat("</a></div>")	
			}
			
			result += ("</div>");
			return result;
		}
		
})

	
	/*url : actHomeURL + "/crud/newAct",
				method : "POST",
				data : {
							memberID : $("input[name='memberID']").val(),
							routeID : $("select[name='routeID']").val(),
							title : $("input[name='title']").val(),
							price : $('input[name="price"]').val(),
							StEndDate : $("input[name='StEndDate']").val(),
							totalDay : $("input[name='totalDay']").val(),
							TopReg : $("input[name='TopReg']").val(),
							RegEndDate : $("input[name='RegEndDate']").val(),
							note : $("input[name='note']").val()
						},
				dataType : "json",
				success : function(data){
					let actID = data.actID;
					$("#imgForm").find("input[name='actID']").val(actID)
					$("#imgForm").submit();
				},
				error : function(data){
					swal("Oops! 出現錯誤囉", "新增活動出現錯誤", "error")
				},*/
			
