
//	函式 : 將參數傳入、組合，並執行Ajax指令，最後得到回傳結果，再將結果交給動態新增函式處理
function activeMainAjax(page,as){
	let sendData = { page : page, actID}
	progressCount("等待獲取資料")
	$.ajax({
		url : actHomeURL + as,
		method : "GET",
		dataType: 'json',
		data : sendData,
		success:function(data){
			progressCount("資料獲取成功")
			console.log(data)
			member = data.login
			//參數給值
			totalPage = data.totalPage;
			totalData = data.totalData;
			
			// $("ul[class='third_nav']").find("li").eq(2).append(totalData)
			//	呼叫動態新增資料函式
			progressCount("頁面設置完成")
			if(data.actBasic.actInfo.deleteTag!= null){
				Swal.fire({
					title : "本活動已取消",
					html : "將於<span> 2 </span>秒後返回上一頁或活動討論區",
					icon : "error",
					didOpen : function(e){
						timerInterval = setInterval(() => {
					      const content = Swal.getContent()
					      if (content) {
					        const span = content.querySelector('span')
					        if (span) {
					          span.textContent -= 1
					        }
					      }
					    }, 1000)
					},
					showConfirmButton: false,
  					timer: 2750,
					timerProgressBar: true,
					willClose: () => {
				    	clearInterval(timerInterval)
						window.history.go(-1);
						window.location.assign("/MountainExploer.com/mountain/list?page=1&od=1")
				  	}
				})
			}
//			if(data.actBasic.actInfo.hideTag != null ) return;
			//設定按鈕
			insertElement(data);
			setPageController(data.page)
			
			
		},
		error : function(jqXHR){
			console.log(jqXHR.status)
			if(jqXHR.status == 404) {
				let timerInterval
				Swal.fire({
				  title: '活動不存在',
				  icon : "error",
				  html: '將於 <b>2</b>秒內跳回討論區',
				  timer: 2500,
				  timerProgressBar: true,
				  didOpen: () => {
				    Swal.showLoading()
				    timerInterval = setInterval(() => {
				      const content = Swal.getContent()
				      if (content) {
				        const b = content.querySelector('b')
				        if (b) {
							console.log( typeof b)
				          b.textContent = Number(b.textContent)-1
				        }
				      }
				    }, 1000)
				  },
				  willClose: () => {
				    clearInterval(timerInterval)
				  }
				}).then((result) => {
				  if (result.dismiss === Swal.DismissReason.timer) {
					location.assign("/MountainExploer.com/mountain/list?page=1&od=1")
				  }
				})
			}else{
				Swal.fire("發生錯誤 : 讀取頁面", "錯誤代碼 : " + jqXHR.status, "error")
			}
		}
	})
}

//	函式 : 計算傳入參數，並於網頁動態新增或修改頁面控制項
function setPageController(page){
	let url = actEnterURL ;
	let thisAct = "&actID=" + actID
	let pageConNum = $(".pageControl").length	
	for(let i = 0 ; i < pageConNum ; i ++){
		$(".pageControl").eq(i).find("a").eq(2).html("目前 " + page + ' / ' +totalPage + " 頁")
		if(page != 1){
			let first = url + "page=1" + thisAct
			let previous = url + "page=" + ( Number(page) - 1 ) +thisAct;
			$(".pageControl").eq(i).find("a").eq(0).attr("href",first).css("display","block")
			$(".pageControl").eq(i).find("a").eq(1).attr("href",previous).css("display","block")
		}else{
			$(".pageControl").eq(i).find("a").eq(0).css("display","none")
			$(".pageControl").eq(i).find("a").eq(1).css("display","none")
		}
		if(page<totalPage){
			let next = url +"page=" + ( Number(page) + 1 ) +thisAct ;
			let final = url + "page=" + ( Number(totalPage)) +thisAct;
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
	if(data.actBasic.actInfo.deleteTag==null && data.actBasic.actInfo.hideTag==null){
		let model = $(".actPost").clone();
		if(totalData!=0){
			for(let i = 1 ; i<= data.respList.length;i++){
				$(".innerContainer").append(model)
				model = $(".actPost").eq(0).clone()
			}
		}
	}
	//	主內容
	let thisElm = $(".actPost").eq(0)
	insertTitle(data)
	insertMemberTD(thisElm, data.actBasic.memberBasic)
	thisElm.find(".btn-detail-update").removeClass("btn-detail-update").addClass("btn-detail-update-act")
	insertMainContent(thisElm,data)
		//	留言
	for(let i = 0 ; i < data.respList.length ; i++ ){
		let respElm = $(".actPost").eq(i+1);
		insertMemberTD(respElm, data.respList[i].actResp.memberBasic);
		insertResp(respElm, data.respList[i], data.actBasic.memberBasic.seqno);
		let textCK = "d-update-note"+i
		respElm.find(".d-update-note").attr("id",textCK)
	}
	console.log(anchorThis)
	if(anchorThis != ''){
		console.log($(anchorThis))
		let t = $(anchorThis).offset().top
		console.log(t)
		$(window).scrollTop(t);
	}
}

//	函式 : 動態新增 => 主標題
function insertTitle(data){
	$(".tagContainer").html(setTag(data.tagMap))		
	let url = actEnterURL + "page=1&actID=" + actID 
	$(".a_title").find("a").attr("href",url)
	$(".a_title").find("a").html(data.actBasic.actInfo.title)
	$("#bc").find("li").eq(2).html(data.actBasic.actInfo.title)
}

//	函式 : 動態新增 => 會員區域
function insertMemberTD(thisElm, memberBasic){
	if( member != null ){
		if(member.seqno == memberBasic.seqno){
			thisElm.find(".d_ctrl").css("display","inline-flex")
		}
	}
	thisElm.find(".memberTD").find(".memeber-name").find("a").html(memberBasic.memberInfo.neck_name).attr("href", "/MountainExploer.com/member/memberInfoEntry")
	thisElm.find(".memeberImgContainer").find("a").attr("href", "/MountainExploer.com/member/memberInfoEntry")
	thisElm.find(".memeberImgContainer").find("img").attr("src","/MountainExploer.com/member/showUserImg?seqno="+memberBasic.seqno)
				.on("error",function(){
					console.log($(this).attr("src"))
					$(this).attr("src","/MountainExploer.com/images/預設頭像.png")
				})
}
//	函式 : 動態新增 => 回覆與留言
function insertResp(respElm, respList, posterSeqno){
	respElm.attr("id",respList.actResp.seqno)
	//	編輯按鈕走向
//	console.log(respElm.find(".d_ctrl").find("button"))
	respElm.find(".d_ctrl").find("a")
	.attr("href","/MountainExploer.com/mountain/manage/resp/edite?seqno=" 
	+ respList.actResp.seqno + "&actID=" + actID + "&page=" + page)
	//	回覆
	var postD = dateFormate(respList.actResp.postDate) + new Date(respList.actResp.postDate).toLocaleTimeString()
	respElm.find(".d_time").html("最後發表於 " + postD)
	editCheck(respElm,respList.actResp.changeDate);
	
	if(respList.actResp.deleteTag != null){
		respElm.find(".d_Main").html("<div class='hideResp'>本回覆已被隱藏顯示<div>")
		return;
	}
	if(respList.actResp.hideTag != null){
		if( member != null ){
			if(member.seqno != respList.actResp.memberBasic.seqno){
				respElm.find(".d_Main").html("<div class='hideResp'>本回覆已被隱藏顯示<div>")
				return;
			}
		}else{
			respElm.find(".d_Main").html("<div class='hideResp'>本回覆已被隱藏顯示<div>")
			return;
		}
	}
	if(respList.actResp.privateTag != null){
		if( member != null ){
			if(member.seqno != respList.actResp.memberBasic.seqno){
				respElm.find(".d_Main").html("<div class='hideResp'>本回覆為私密回覆<div>")
				return;
			}
		}else{
			respElm.find(".d_Main").html("<div class='hideResp'>本回覆為私密回覆<div>")
			return;
		}
	}
	
	if(respList.actResp.msg != null){
		let noteReasult = "";
		noteReasult = noteReasult.concat(respList.actResp.msg);
		respElm.find(".d_text").append(noteReasult);
	}
	
	//	留言
	insertSideResp(respElm, respList.actResp.actSideResponse)
	//	回覆鈕
	respElm.find(".btn-hide").removeClass("btn-hide")
	
}
//	函示 : 動態新增 => 主內容區域
function insertMainContent(thisElm, data){
	let actBasic = data.actBasic
	let actInfo = actBasic.actInfo
	//	檢查是否有修改時間
	editCheck(thisElm,actInfo.changeDate);
	let hideTag = actInfo.hideTag;
	//	判斷活動是否取消
	if(actInfo.deleteTag != null){
		$(".d_Main").html("活動已取消")
		return;
	}
	//	判斷隱藏是否啟動
	if(hideTag != null){
		$(".d_Main").html("本區域已被隱藏顯示")
		return;
	}
	console.log("主內容繼續")
	thisElm.find(".d_time").html("發表於 " + dateFormate(actInfo.postDate) + new Date(actInfo.postDate).toLocaleTimeString());
	insertDefault(thisElm,data)

	//	測試登入與否
	if(data.login == null){
		thisElm.find(".memberLocker").css("display","block")
		thisElm.find(".memberLocker").siblings().remove();
		let memberLocker = thisElm.find(".memberLocker").clone();
		$(".resp-ckeditor").empty().append(memberLocker)
		return;
	}
	CKEDITOR.replace("resp")
	//	插入圖片
	insertImage(thisElm, data.images)
	//	插入備註
	if(actInfo.addInfo != null){
		let noteReasult = "";
		noteReasult = noteReasult.concat(" [ 備註 ]  ").concat("<br><br>")
					.concat(actInfo.addInfo);
		thisElm.find(".d_noteInfo").find("div").html(noteReasult);
	}
	//	插入報名頁面連結
	let tagMap = data.tagMap
	setGoReg(thisElm, tagMap)
	
}
/* 依據Tag設定報名頁面欄位 */
function setGoReg(thisElm, tagMap){
	let goReg = "<button type='button' id='btn-reg' class='btn btn-primary btn-goReg'><i class='fas fa-sign-in-alt'></i>前往報名</button>"
	let regTop = "<button type='button' id='btn-top'  class='btn btn-warning btn-goReg'><i class='fas fa-exclamation-circle'></i> 報名已滿</button>"
	let regEndDate ="<button type='button' id='btn-regEnd' class='btn btn-danger btn-goReg'><i class='far fa-calendar-times'></i> 報名已截止</button>"
	let actEnd = "<button type='button' id='btn-end' class='btn btn-dark btn-goReg'><i class='fas fa-calendar-times'></i> 活動已結束</button>"
	if (!tagMap[3]) {
		if (!tagMap[4]) {
			if (!tagMap[5]) {
					thisElm.find(".goReg").find("a").html(goReg)
						.attr("href","/MountainExploer.com/mountain/act/registry?actID="+actID);	
			} else {
				thisElm.find(".goReg").find("a").html(regTop)
			}
		} else {
			thisElm.find(".goReg").find("a").html(regEndDate)
		}
	
	} else {
		thisElm.find(".goReg").find("a").html(actEnd)
	}
	
}

//	函式 : 動態新增 => 預設內容 (擴增 : 可修改)
function insertDefault(thisElm,data){
	let actInfo = data.actBasic.actInfo
	let result = "";
	result = result.concat("[ 活動名稱 ] : ").concat(actInfo.title).concat("<br><br>")
			.concat("[ 活動總天數 ] : ").concat(actInfo.totalDay).concat("<br><br>")
			.concat("[ 活動開始~結束日期 ] : ")
			.concat(dateFormate(actInfo.startDate))
			.concat("~" + dateFormate(actInfo.endDate)).concat("<br><br>")
			.concat("[ 活動費用 ] : ").concat("$" + actInfo.price).concat("<br><br>")
			.concat("[ 活動路線名稱 ] : ").concat(actInfo.rtBasic.routeInfo.name).concat("<br><br>")
			.concat("[ 活動路線介紹 ] : " ).concat(actInfo.rtBasic.routeInfo.desp).concat("<br><br>")
			.concat("[ 報名人數上限 ] : " ).concat(data.nowReg).concat(" / ").concat(actInfo.regTop).concat("<br><br>")
			.concat("[ 報名截止日期 ] : " ).concat(dateFormate(actInfo.regEndDate)).concat("<br><br>")
	thisElm.find(".d_text").append(result)
	
}

//	函示 : 回傳 => 檢查空值並編譯
function editCheck(thisElm, changeDate){
	let update = "";
	if(changeDate != null){
		update = update.concat('最後一次編輯於    ')
					.concat(dateFormate(changeDate) + new Date(changeDate).toLocaleTimeString() )
//		console.log(thisElm.find(".d_text").find("i"))
		thisElm.find(".d_text").find("i").html(update).css("display","block")
	}
}

//	函式 : 回傳 => 日期編排
function dateFormate(date){
	let result = "";
	result = result.concat(new Date(date).toLocaleDateString())
			
	return result;
}
//	函式 : 動態新增 => 留言列
function insertSideResp(respElm, sideRespList){
	
	for(let i in sideRespList){
		let sideRespCon = respElm.find(".d-sr-body").eq(i).clone();
		respElm.find(".d-sr-body").eq(i).css("display","flex")
		respElm.find(".d_sr_img").eq(i).find("img")
			.attr("src","/MountainExploer.com/member/showUserImg?seqno=" + sideRespList[i].memberBasic.memberInfo.seqno)
			.on("error",function(){
					$(this).attr("src","/MountainExploer.com/images/預設頭像.png")
				})
		respElm.find(".d_sr_img").eq(i).find("a").attr("href","")
		respElm.find(".d_sr_text").eq(i).find("a").html(sideRespList[i].memberBasic.memberInfo.neck_name)
				.attr("href","")
		respElm.find(".d_sr_text").eq(i).find("span").eq(0).html(sideRespList[i].msg)
		respElm.find(".d_sr_text").eq(i).find("span").eq(1).append(dateFormate(sideRespList[i].postDate) + new Date(sideRespList[i].postDate).toLocaleTimeString())
		respElm.find(".d_sr").append(sideRespCon)
	}
}

//	函式 : 動態新增 => 圖片與照片(上限為5)
function insertImage(thisElm, images){
	for(let i in images){
		let imageTag = '<div class="d_act_img"><img alt="" src=""></div>' 
		thisElm.find(".d_act_img_con").append(imageTag)
		let url = actHomeURL + "/images?seqno=" + images[i].seqno
		thisElm.find(".d_act_img").find("img").eq(i).attr("src", url)
		thisElm.find(".d_act_img").find("img").eq(i).attr("alt", images[i].name)
	}
}

//	函式 : 動態新增 => 標籤連結
function setTag(check){
	let result = "[ ";
	let aURL = actListURL.concat("od=2&page=1&")
	if( !check[3] ){
		if( check[1] ){
			result = result.concat("<div class='actTag'><a href='")
						.concat(aURL + "tag=1'>")
						.concat("<i class='fas fa-tree'></i>新活動")	
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
								.concat("<i class='far fa-calendar-check'></i>尚可報名")	
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
	
	result += ("  ]</div>");
	return result;
}

// 登入提醒視窗
function loginConfirmSWAL(){
	Swal.fire({
			title : "尚未登入",
			text : "必須登入才能使用",
			icon : "warning",
			buttons : {
				confirm : {
					text : "開啟登入視窗",
					visible : true,
					value : true
				},
				cancel : {
					text : "關閉視窗",
					visible : true,
					value : false
				}
			}
		}).then((value) => {
			if(value){
				$("#dialog-form").dialog("open");
			}
		})
}

// 動態新增留言並存入資料庫
function ajaxAddComment(thisBtn, thisComment){
	
	let formData = new FormData();
	let respSeqno = thisBtn.parents(".actPost").attr("id")
	formData.append("message",thisComment)
	
	$.ajax({
		url : respHome + "/sideResp/insert." + respSeqno,
		data : formData,
		type : "POST",
		dataType : "json",
		processData : false,
		contentType : false,
		success : function(data){
			if(data)appendSideResp(thisBtn, thisComment);	
		},
		error : function(jqXHR){
			Swal.fire("發生錯誤 : 新增留言", "錯誤代碼 : " + jqXHR.status, "error")
		}		
	})
	
}
/* 動態新增留言於畫面 */
function appendSideResp(thisBtn, thisComment){
	let commentList = thisBtn.parents("tbody").find(".d_sr")
	let clLength = commentList.find(".d-sr-body").length
	console.log("clLength : " + clLength)
	let model = commentList.find(".d-sr-body").eq(clLength-1).clone()
	commentList.append(model)
	let thisSR = commentList.find(".d-sr-body").eq(clLength-1)
	thisSR.css("display","flex")
	/* 頭像及連結 */
	thisSR.find(".d_sr_img").find("img").attr("src","https://profunder.com/wp-content/uploads/2016/04/default-male.png")
	thisSR.find(".d_sr_img").find("a").attr("href","")
	/* 使用者 */
	thisSR.find(".d_sr_text").find("a").html(member.memberInfo.neck_name)
			.attr("href","")
	thisSR.find(".d_sr_text").find("span").eq(0).html(thisComment)
	thisSR.find(".d_sr_text").find("span").eq(1).append(dateFormate(new Date()))
}

/* 檢查回覆資訊 */

function checkResp(){
	
	let data = CKEDITOR.instances.resp.getData()
	if( data != ''){
		let formData = new FormData();
		formData.append("message",data) 
		let checkPrivate = $("#btn-resp-private").is(':checked') 
		if(checkPrivate){
			formData.append("privateTag",1)
		}
		$.ajax({
			url : respHome + "/resp/insert." + actID,
			type : "POST",
			data : formData,
			dataType : "json",
			processData : false,
			contentType : false,
			success : function(data){
				confirmNewResp(data)				
			},
			error : function(jqXHR){
				Swal.fire("發生錯誤 : 發表回覆", "錯誤代碼 : " + jqXHR.status, "error")
			}
		})
	}else{
		Swal.fire("回覆不得為空白","","warning")
	}
}

function confirmNewResp(data){
	let goURL = actEnterURL + "page=" + data.totalPage + "&actID=" + actID + "#" + data.respID
	setTimeout(function(){
		window.location.href = goURL
		window.location.reload()
	},2800)
	Swal.fire({
		title : "發布回覆成功",
		text : "點擊跳轉或3秒鐘後自動跳轉至留言",
		buttons : {
			confirm : "跳轉"
		}
	}).then(() => {
		window.location.href = goURL
		window.location.reload()
	})
}

function goReg(){
	let btnID = $(this).attr("id").replace("btn-","")
	switch(btnID){
		case "end":
			Swal.fire({
				title : "<h2>本活動已結束</h2>",
				timer: 2000,
  				timerProgressBar: true,
				confirmButtonText : "點擊關閉或 兩秒後自動關閉"
			})
			break;
		case "top":
			Swal.fire({
				title : "<h2>報名已滿</h2>",
				timer: 2000,
  				timerProgressBar: true,
				confirmButtonText : "點擊關閉或 兩秒後自動關閉"
			})
			break;
		case "regEnd":
			Swal.fire({
				title : "<h2>報名已截止</h2>",
				timer: 2000,
  				timerProgressBar: true,
				confirmButtonText : "點擊關閉或 兩秒後自動關閉"
			})
			break;
	}
}


function titleAndMemeberAnimate(){
	var originTitleX = $(".actTitle").offset().top
	var originTitleW = $(".actPost").innerWidth()
	var originMemberW = $(".memberinfo-container").innerWidth()
	$(window).scroll(function(){
		let headerBottom = $("header").offset().top + $("header").height()
		let miContainer = $(".memberinfo-container")
		let originMemberH = $(".memberinfo-container").innerHeight()
//		console.log(miContainer)
		for(let i=0 ; i < miContainer.length ; i++){
			let thisElm = miContainer.eq(i)
			let myLeft = thisElm.offset().left
			let thisMembetTD = thisElm.parents(".memberTD")
			let myHeight = thisElm.height()
			let myTop = thisElm.offset().top
			let myBottom = originMemberH + myTop
			let myMTDBottom = thisMembetTD.offset().top + thisMembetTD.height()
			let myMTDTop = thisMembetTD.offset().top
			let headerAndTitleBot = headerBottom + $(".actTitle").height() 
			if(myTop <= myMTDTop || headerBottom<=myMTDTop){
				thisElm.css({
					position : "static"
				})
			}
			if(myBottom > myMTDBottom && (myMTDBottom - headerAndTitleBot)<myHeight ){
				thisElm.css({
					position : "sticky",
					top : myTop,
					left : myLeft
				})
			}else if(myTop >= myMTDTop && (myTop <= headerAndTitleBot && (myMTDBottom - headerAndTitleBot)>myHeight ) || ( thisElm.css("position") == "sticky" && myTop>headerAndTitleBot)){
				thisElm.css({
					position : "fixed",
					top : $("header").height()+$(".actTitle").height(),
					"z-index" : 9,
					width : originMemberW
				})
			}
		}
		
		if(originTitleX <= headerBottom){
			if($(".actTitle").css("position") != "fixed"){
				$(".actTitle").css({
					position : "fixed",
					top : $("header").height(),
					"z-index" : 10,
					width : originTitleW,
				})
				$("#btn-top-container").removeClass("d-none") 
			}
		}else if(originTitleX>headerBottom){
			$(".actTitle").css({
				position : "static"
			})
			$(".actTitle").parents("body").find(".memberinfo-container").css({
				position : "static"
			})
			$("#btn-top-container").addClass("d-none") 
		}
	})
	$("#btn-top").on("click",function(){
		$('html, body').animate({
			scrollTop: $("#bc").offset().top
		},1000);
	})
}
