

/* 會員登入檢查 */
function ajaxCheckLogin(od){
	$.ajax({
		url : "/MountainExploer.com/mountain/public/mbInfo",
		type : "GET",
		dataType : "json",
		success : function(data){
			PBBlock({
				startCount : 25
			})
			openBlock("body")
			member = data.seqno
			if(od == 1){
				activeMainAjax(page,"/defaultAS");			
			}
			if(od == 2){
				LoadingCount.nowCount = 50
				activeMainAjax(page,"/tagAS")
				setSelectOption();	
			}
			if(od == 3){
				LoadingCount.nowCount = 50
				activeMainAjax(page,"/searchAS")
			}
		},
		error : function(){
//			console.log("error")
			swal("會員偵測出錯","請聯絡管理員","error")
		}
	})
}

function publishNewAct(){
//	console.log(member)
	if(member != null && member != 0 ){
		window.location.assign("/MountainExploer.com/mountain/manage/new")
	}else{
		swal({
			title : "尚未登入",
			text : "必須登入才能使用",
			icon : "warning",
			buttons : {
				confirm : {
					text : "前往登入頁面",
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
//				$("#dialog-form").dialog("open");
				window.location.href = "/MountainExploer.com/member/memberLoginEntry"
			}
		})
	}
}

/*	函式 : 圖片錯誤(空值)時處理 */
function imgError(){
	$(this).attr("src","../images/defaultMountain.jpg")
}

/*	函式 : 根據Tag參數配置屬性 */
function setSelectOption() {
	let selected = "option[value=" + tag + "]";
	if (tag > 3) {
		$("select[name='rTag']").find(selected).attr({ selected: true, disaled: true })
	} else {
		$("select[name='aTag']").find(selected).attr({ selected: true, disaled: true })
	}

}

/*	函式	:
	將參數傳入、組合，並執行Ajax指令，最後得到回傳結果，
	再將結果交給動態新增函式處理 
*/
function activeMainAjax(page, as) {
//	console.log(member)
	let sendData = { page: page, tag: tag, search: search }
	
	$.ajax({
		url: actHomeURL + as,
		method: "GET",
		dataType: 'json',
		data: sendData,
		success: function(data) {
			
			PBBlock({
				countTimes : data.actList.length
			})
//			console.log(data)
			//參數給值
			totalPage = data.totalPage;
			totalData = data.totalData;
			if (totalData == 0) {
				swal({
					title: "無符合本次查詢條件的資料",
					icon: "info",
				})
			}
			//	本次查詢資料總數
			$("ul[class='third_nav']").find("li").eq(2).append(totalData)
			//	呼叫動態新增資料函式
			insertTable(data.actList);
			//	設定按鈕
			setPageController(data.page,totalPage)
			

		}
	})
}

/* 函式 : 將得到結果，於網頁上的指定位置動態新增指定元素 */
function insertTable(data) {
	for (let i = 0; i < data.length; i++) {
		let model = $(".order-table").find(".order-table-tb").eq(i).clone();
		let thisElm = $(".order-table-tb").eq(i)
		
		/**呼叫動態新增網頁元素之函式 */
//		console.log("actBasic.seqno : " + data[i].actBasic.seqno)
		setActImg(data[i].actBasic.seqno, thisElm)
		setTitle(data[i].actBasic, thisElm)
		setTag(data[i].tagMap, thisElm)
		setPostTime(data[i].actBasic, thisElm)
		setRegNum(data[i], thisElm)
		setRegEndDate(data[i].actBasic.actInfo, thisElm)
		$(".order-table").append(model)
		$(".order-table").find(".order-table-tb").eq(i).removeClass("hideTbody");
		progressCount()
	}
}

/*	
	動態新增網頁元素之函式
	setActImg		=	預覽圖片欄位
	setTag			=	名稱欄位 => [標籤]
	setTitle		=	名稱欄位 => 標題/總天數/價格
	setPostTime		=	發布欄位 => 活動發布時間
	setRegNum		=	報名人數欄位 => 目前人數/人數上限
	setRegEndDate	=	報名截止日期欄位 => 報名截止日期
	
*/
function setActImg(seqno, thisElm) {
//	console.log("get seqno : " + seqno)
	let thisTD = $(thisElm).find("td").eq(0)
	let imgURL = actHomeURL + "/images?actID=" + seqno + "&defImage=1"

	thisTD.find("a").attr("href", detailURL + seqno);
	thisTD.find("img").attr("src", imgURL).on("error",imgError);
	
}
function setTitle(actBasic, thisElm) {
	
	let thisTD = thisElm.find("td").eq(1).find("a")
	let title = actBasic.actInfo.title 
	thisTD.attr("href", detailURL + actBasic.seqno)
	thisTD.append(title)
}
function setPostTime(actBasic, thisElm) {
	
	let thisTD = thisElm.find("td").eq(2)
	let postTime = " / <br>"
		.concat(dateFormate(actBasic.actInfo.postDate))
		.concat(new Date(actBasic.actInfo.postDate).toLocaleTimeString())
	
	thisTD.append(postTime);
	thisTD.find("a").html(actBasic.memberBasic.memberInfo.neck_name)
	thisTD.find("a").attr("href", "");
}

function setRegNum(data, thisElm) {
	
	let thisTD = thisElm.find("td").eq(3)
	
	thisTD.text(data.nowReg + " / " + data.actBasic.actInfo.regTop)
}

function setRegEndDate(actInfo, thisElm) {

	let thisTD = thisElm.find("td").eq(4)
	
	thisTD.text(dateFormate(actInfo.regEndDate))
}

/* 組合變數成網址並導向 */
function activeTagAS(tag) {
	if (tag != 0) {
		let tagAs = actEnterURL + "od=2&page=1&tag=" + tag;
		window.location.assign(tagAs)
	}else{
		let defaultAs = actEnterURL + "od=1&page=1"
		window.location.assign(defaultAs)
	}
}

/* 函式 : 
	計算傳入參數，並於網頁動態新增或修改頁面控制項 
*/
function setPageController(page, totalPage) {
	//判別目前
	let url;
	if (od == 1) {
		url = actEnterURL + "od=1&"
	}
	if (od == 2) {
		url = actEnterURL + "od=2&tag=" + tag + "&"
	}
	let maxShow = 5
	let thisPage = Number(page)
	let pageController = $(".pageController")
	for(let j = 0; j < pageController.length ; j++){
		let pageCtrl = pageController.eq(j).find("li")
		let first = url + "page=1"
		let previous = url + "page=" + (thisPage - 1);
		let next = url + "page=" + (thisPage + 1);
		let final = url + "page=" + (Number(totalPage));
		let morePage = '<li class="page-item page-number disabled"><a class="page-link"  href="">...</a></li>'
		
		if (page == 1) {
			pageCtrl.eq(0).addClass("disabled")
			pageCtrl.eq(1).addClass("disabled")
		}else{
			pageCtrl.eq(0).find("a").attr("href", first)
			pageCtrl.eq(1).find("a").attr("href", previous)
		}
		if (page >= totalPage){
			pageCtrl.eq(2).addClass("disabled")
			pageCtrl.eq(3).addClass("disabled")
		}else{
			pageCtrl.eq(2).find("a").attr("href", next)
			pageCtrl.eq(3).find("a").attr("href", final)
		}
		let startPage = page-2 > 1 ? page-2 : 1
		let endPage = page+2 < totalPage ? page+2 : totalPage
		let startPot = pageCtrl.eq(1)
		if(startPage > 1){
			startPot.after(morePage)
			startPot = startPot.next()
		}
//		console.log(startPot)
//		console.log(startPage)
//		console.log(endPage)
		for(let i =startPage; i <= endPage ; i++){
			let pageNumElm = '<li class="page-item page-number"><a class="page-link"  href="'+ url +"page="+ i +'">' + i + '</a></li>'
			if(i == thisPage)pageNumElm = '<li class="page-item active page-number"><a class="page-link"  href="'+ url +"page="+ i +'">' + i + '</a></li>'
			startPot.after(pageNumElm)
			startPot = startPot.next()
		}
		if(endPage < totalPage ){
			startPot.after(morePage)
		}
	}
}

/*	函式 : 透過傳入參數，於網頁動態新增狀態標籤 */
function setTag(check, thisElm) {
	let container = thisElm.find("td").eq(1)
	let aURL = actEnterURL.concat("od=2&page=1&tag=")
	let aTagStart = "<div class='actTag'><a href='"
	let aTagEnd = "</a></div>"
	let regTagStart = "<div class='regTag'><a href='"
	let regTagEnd = "</a></div>"

	if (!check[3]) {
		if (check[1]) {
			container.append(aTagStart + aURL + "1'><i class='fas fa-tree'></i>" + aTagEnd)
		}
		if (check[2]) {
			container.append(aTagStart + aURL + "2'><i class='fab fa-hotjar'></i>" + aTagEnd)
		}
		if (!check[4]) {
			if (!check[5]) {
				if (check[6]) {
					container.append(regTagStart + aURL + "6'><i class='far fa-calendar-check'></i>" + regTagEnd)
				}
				if (check[7]) {
					container.append(regTagStart + aURL + "7'><i class='fa fa-exclamation-circle'></i>" + regTagEnd)
				}
				if (check[8]) {
					container.append(regTagStart + aURL + "8'><i class='fa fa-battery-three-quarters'></i>" + regTagEnd)

				}
			} else {
				container.append(regTagStart + aURL + "5'><i class='fa fa-battery'></i>" + regTagEnd)
			}
		} else {
			container.append(regTagStart + aURL + "4'><i class='fa fa-exclamation-triangle'></i>" + regTagEnd)
		}

	} else {
		container.append(aTagStart + aURL + "3'><i class='far fa-calendar-times'></i>" + aTagEnd)
	}
}


/*	函式 : 回傳 => 日期編排 */
function dateFormate(date) {
	let result = "";
	result = result.concat(new Date(date).toLocaleDateString())

	return result;
}