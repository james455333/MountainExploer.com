$(function(){
	var actHomeURL = "/MountainExploer.com/mountain/act/search";
	var actListURL = "/MountainExploer.com/mountain/list?";
	var actEnterURL = "/MountainExploer.com/mountain/act/detail?";
	var totalPage, totalData, page, actID, login;
	var urlNow = new URL(window.location.href)
	if(urlNow.searchParams.has("page")){
		page = urlNow.searchParams.get("page");
	}else{
		page = 1;
	}
	if(urlNow.searchParams.has("actID")){
		actID = urlNow.searchParams.get("actID");
	}
	
	//	方法 : Load時，傳送參數給函式執行
	$(window).on("load",function(){
		activeMainAjax(page,"/detail");
	})
	
	
	//	函式 : 將參數傳入、組合，並執行Ajax指令，最後得到回傳結果，再將結果交給動態新增函式處理
	function activeMainAjax(page,as){
		let sendData = { page : page, actID}
		$.ajax({
			url : actHomeURL + as,
			method : "GET",
			dataType: 'json',
			data : sendData,
			success:function(data){
				login = data.login
				//參數給值
				totalPage = data.totalPage;
				totalData = data.totalData;
				
				// $("ul[class='third_nav']").find("li").eq(2).append(totalData)
				//	呼叫動態新增資料函式
				insertElement(data);
				//設定按鈕
				setPageController(data.page)
				
				
			}
		})
	}
	
	//	函式 : 計算傳入參數，並於網頁動態新增或修改頁面控制項
	function setPageController(page){
		let url ;
		let pageConNum = $(".pageControl").length	
		for(let i = 0 ; i < pageConNum ; i ++){
			$(".pageControl").eq(i).find("a").eq(2).html("目前 " + page + ' / ' +totalPage + " 頁")
			if(page != 1){
				let first = url + "page=1"
				let previous = url + "page=" + ( Number(page) - 1 ) ;
				$(".pageControl").eq(i).find("a").eq(0).attr("href",first).css("display","block")
				$(".pageControl").eq(i).find("a").eq(1).attr("href",previous).css("display","block")
			}else{
				$(".pageControl").eq(i).find("a").eq(0).css("display","none")
				$(".pageControl").eq(i).find("a").eq(1).css("display","none")
			}
			if(page<totalPage){
				let next = url +"page=" + ( Number(page) + 1 ) ;
				let final = url + "page=" + ( Number(totalPage));
				$(".pageControl").eq(i).find("a").eq(3).attr("href",next).css("display","block")
				$(".pageControl").eq(i).find("a").eq(4).attr("href",final).css("display","block")
			}else{
				$(".pageControl").eq(i).find("a").eq(3).css("display","none")
				$(".pageControl").eq(i).find("a").eq(4).css("display","none")
			}
		}	
	}
	
	//	函式 : 分配參數給正確函式
	function insertElement(data){
		//	主內容
		let thisElm = $(".actPost")
		insertTitle(data)
		insertMemberTD(thisElm, data.actBasic.memberBasic)
		insertMainContent(thisElm,data)
		//	留言
//		insertPost(data.respList);
		
	}
	
	//	函式 : 動態新增主要標題
	function insertTitle(data){
		$(".tagContainer").html(setTag(data.tagMap))		
		let url = actEnterURL + "page=1&actID=" + actID 
		$(".a_title").find("a").attr("href",url)
		$(".a_title").find("a").html(data.actBasic.actInfo.title)
	}
	
	//	函式 : 呼叫動態新增函式，新增主要內容
	function insertPost(respList){
	}
	
	
	//	函式 : 動態新增會員區域
	function insertMemberTD(thisElm, memberBasic){
		thisElm.find(".memberTD").find("a").eq(0).html(memberBasic.memberInfo.neck_name)
		
	}
	
	
	//	函示 : 動態新增主內容區域
	function insertMainContent(thisElm, data){
		let actBasic = data.actBasic
		let actInfo = actBasic.actInfo
		editCheck(thisElm,actInfo.changeDate);
		let hideTag = actInfo.hideTag;
		//	判斷隱藏是否啟動
		if(hideTag != null){
			$(".d_Main").html("本區域已被隱藏顯示")
			return;
		}
		thisElm.find(".d_time").html("發表於 " + dateFormate(actInfo.postDate));
		insertDefault(thisElm,actInfo)
		
//		if(data.login == null){
//			thisElm.find(".memberLocker").css("display","block")
//			thisElm.find(".memberLocker").siblings().remove();
//			return;
//		}
		insertImage(thisElm, data.images)
		thisElm.find(".d_note").html(actInfo.note)
		
				
	}
	// 函式 : 動態新增預設文案
	function insertDefault(thisElm,actInfo){
		
		let result = "";
		result = result.concat("[ 活動名稱 ] : ").concat(actInfo.title).concat("<br><br>")
				.concat("[ 活動總天數 ] : ").concat(actInfo.totalDay).concat("<br><br>")
				.concat("[ 活動開始~結束日期 ] : ")
				.concat(dateFormate(actInfo.startDate))
				.concat("~" + dateFormate(actInfo.endDate)).concat("<br><br>")
				.concat("[ 活動費用 ] : ").concat("$" + actInfo.price).concat("<br><br>")
				.concat("[ 活動路線名稱 ] : ").concat(actInfo.rtBasic.routeInfo.name).concat("<br><br>")
				.concat("[ 活動路線介紹 ] : " ).concat(actInfo.rtBasic.routeInfo.desp).concat("<br><br>")
				.concat("[ 報名人數上限 ] : " ).concat(actInfo.regTop).concat("<br><br>")
				.concat("[ 報名截止日期 ] : " ).concat(dateFormate(actInfo.regEndDate)).concat("<br><br>")
		thisElm.find(".d_text").append(result)
		
	}
	
	// 函示 : 檢查是否有編輯日期並回傳
	function editCheck(thisElm, changeDate){
		let update = "";
		if(changeDate != null){
			update = update.concat('最後一次編輯於    ')
						.concat(dateFormate(changeDate))
		}
		thisElm.find(".d_text").find("i").html(update).css("display","block")
	}
	
	// 函式 : 編排日期並回傳
	function dateFormate(date){
		let result = "";
		result = result.concat(new Date(date).toLocaleDateString())
				.concat(" " + new Date(date).toLocaleTimeString())
		return result;
	}
	
	function insertImage(thisElm, images){
		for(let i in images){
			let imageTag = '<div class="d_act_img"><img alt="" src=""></div>' 
			thisElm.find(".d_act_img_con").append(imageTag)
			let url = actHomeURL + "/images?seqno=" + images[i].seqno
			thisElm.find(".d_act_img").find("img").eq(i).attr("src", url)
			thisElm.find(".d_act_img").find("img").eq(i).attr("alt", images[i].name)
		}
	}
	
	//	函式 : 動態新增標籤連結
	function setTag(check){
			let result = "[ ";
			let aURL = actListURL.concat("od=2&page=1&")
			console.log(aURL)
			if( !check[3] ){
				if( check[1] ){
					result = result.concat("<div class='actTag'><a href='")
								.concat(aURL + "tag=1'>")
								.concat("新活動")	
								.concat("</a>  </div>")
				}
				if( check[2] ){
					result = result.concat("<div class='actTag'><a href='")
								.concat(aURL + "tag=2'>")
								.concat("熱門活動")	
								.concat("</a> , </div>")
				}
				if( !check[4] ){
					if( !check[5] ){
						if( check[6] ){
							result = result.concat("<div class='regTag'><a href='")
										.concat(aURL + "tag=6'>")
										.concat("尚可報名")	
										.concat("</a>  </div>")
						}
						if( check[7] ){
							result = result.concat("<div class='regTag'><a href='")
									.concat(aURL + "tag=7'>")
									.concat("報名將截止")	
									.concat("</a>  </div>")
						}
						if( check[8] ){
							result = result.concat("<div class='regTag'><a href='")
										.concat(aURL + "tag=8'>")
										.concat("報名將滿")	
										.concat("</a> </div>")
						}
					}else{
					result = result.concat("<div class='regTag'><a href='")
								.concat(aURL + "tag=5'>")
								.concat("報名已滿")	
								.concat("</a> </div>")
					}
				}else{
					result = result.concat("<div class='regTag'><a href='")
								.concat(aURL + "tag=4'>")
								.concat("報名截止")	
								.concat("</a> </div>")
				}
				
			}else{
				result = result.concat("<div class='actTag'><a href='")
							.concat(aURL + "tag=3'>")
							.concat("歷史活動")	
							.concat("</a> </div>")	
			}
			
			result += (" ]</div>");
			return result;
		}
	
})