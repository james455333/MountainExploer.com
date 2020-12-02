
//	函式 : 將參數傳入、組合，並執行Ajax指令，最後得到回傳結果，再將結果交給動態新增函式處理
function activeMainAjax(page,as){
	let sendData = { page : page, actID}
	$.ajax({
		url : actHomeURL + as,
		method : "GET",
		dataType: 'json',
		data : sendData,
		success:function(data){
			console.log(data)
			member = data.login
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
	if(data.actBasic.actInfo.deleteTag==null){
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
		let t = $(anchorThis).offset().top
		$(window).scrollTop(t);
	}
}

//	函式 : 動態新增 => 主標題
function insertTitle(data){
	$(".tagContainer").html(setTag(data.tagMap))		
	let url = actEnterURL + "page=1&actID=" + actID 
	$(".a_title").find("a").attr("href",url)
	$(".a_title").find("a").html(data.actBasic.actInfo.title)
}

//	函式 : 動態新增 => 會員區域
function insertMemberTD(thisElm, memberBasic){
	if( member != null ){
		if(member.seqno == memberBasic.seqno){
			thisElm.find(".d_ctrl").css("display","inline-flex")
		}
	}
	thisElm.find(".memberTD").find("a").eq(0).html(memberBasic.memberInfo.neck_name)
}
//	函式 : 動態新增 => 回覆與留言
function insertResp(respElm, respList, posterSeqno){
	respElm.find("input[name='seqno']")
			.attr("id","id_" + respList.actResp.seqno)
			.val(respList.actResp.seqno)
	
	//	回覆
	var postD = dateFormate(respList.actResp.postDate)
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
	thisElm.find(".d_time").html("發表於 " + dateFormate(actInfo.postDate));
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
	let goReg = "<button type='button' class='btn btn-primary'><i class='fas fa-sign-in-alt'></i>前往報名</button>"
	let regTop = "<button type='button' class='btn btn-warning'><i class='fas fa-exclamation-circle'></i> 報名人數達到上限</button>"
	let regEndDate ="<button type='button' class='btn btn-danger'><i class='far fa-calendar-times'></i> 報名已截止</button>"
	let actEnd = "<button type='button' class='btn btn-dark'><i class='fas fa-calendar-times'></i> 活動已開始或結束</button>"
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
		thisElm.find(".goReg").find("a").text(actEnd)
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
					.concat(dateFormate(changeDate))
		console.log(thisElm.find(".d_text").find("i"))
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
		respElm.find(".d_sr_img").eq(i).find("img").attr("src","https://profunder.com/wp-content/uploads/2016/04/default-male.png")
		respElm.find(".d_sr_img").eq(i).find("a").attr("href","")
		respElm.find(".d_sr_text").eq(i).find("a").html(sideRespList[i].memberBasic.memberInfo.neck_name)
				.attr("href","")
		respElm.find(".d_sr_text").eq(i).find("span").eq(0).html(sideRespList[i].msg)
		respElm.find(".d_sr_text").eq(i).find("span").eq(1).append(dateFormate(sideRespList[i].postDate))
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
	swal({
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
	let respSeqno = thisBtn.parents(".actPost")
			.find("input[name='seqno']").val()
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
		error : function(){
			swal("發生錯誤","請通知管理員","error")
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
			error : function(){
				swal("發表回覆失敗",'請聯絡管理員','error')
			}
		})
	}else{
		swal("回覆不得為空白",'','warning')
	}
}

function confirmNewResp(data){
	let goURL = actEnterURL + "page=" + data.totalPage + "&actID=" + actID
	setTimeout(function(){
		console.log(goURL)
		window.location.assign(goURL)
	},2800)
	swal({
		title : "發布回覆成功",
		text : "點擊跳轉或3秒鐘後自動跳轉至留言",
		buttons : {
			confirm : "跳轉"
		}
	}).then(() => {
		console.log(goURL)
		window.location.assign(goURL)
	})
}


