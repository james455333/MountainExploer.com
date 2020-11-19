$(function(){
	var actHomeURL = "/MountainExploer.com/mountain/act/search";
	var actListURL = "/MountainExploer.com/mountain/act/list?";
	var actEnterURL = "/MountainExploer.com/mountain/act/detail?";
	var totalPage, totalData, page, status, actID, login, status;
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
				
				//參數給值
				totalPage = data.totalPage;
				console.log("totalPage : " + totalPage)
				totalData = data.totalData;
				console.log("totalData : " + totalData)
				
				// $("ul[class='third_nav']").find("li").eq(2).append(totalData)
				//	呼叫動態新增資料函式
				insertTable(data);
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
	function insertTable(data){
		
		let actBean = data.actBean;
		insertTitle(actBean);
		insertMainPost(actBean);
		
	}
	
	//	函式 : 動態新增主要標題
	function insertTitle(actBean){
		
		$(".innerContainer").append(
			'<table class="actTitle">'
				+ '<tbody>' 
					+ '<tr>'
						+ '<td>'
							+ '<div>[ '
								+ setTag(actBean.tag)
							+ ' ]</div> '
							+ '<div>'
								+ actBean.title
							+ '</div>'		
						+ '</td>'		
					+ '</tr>'		
				+ '</tbody>'
			+ '</table>'
			
			
		)
		
	}
	
	//	函式 : 呼叫動態新增函式，新增主要內容
	function insertMainPost(actBean){
		insertActPost();
		
		
	}
	
	function insertActPost(){
		$(".innerContainer").append(
			"<div class=''actPost' id=" + actID + ">"
				+"<div></div>"
				+ "<table><tbody>"
					+ "<tr>" 
					
					+ "</tr>
					+ "<tr>" + "</tr>
					+ "<tr>" + "</tr>
				+ "</tbody></table>"
			+ "</div>"
		)
		
	}
	
	//	函式 : 動態新增標籤連結
	function setTag(check){
			let result = "<div class='tagContainer'>";
			let aURL = actListURL.concat("od=2&page=1&")
			console.log(aURL)
			if( !check[3] ){
				if( check[1] ){
					result = result.concat("<div class='actTag'><a href='")
								.concat(aURL + "tag=1'>")
								.concat("新活動")	
								.concat("</a> , </div>")
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
			
			result += ("</div>");
			return result;
		}
	
})