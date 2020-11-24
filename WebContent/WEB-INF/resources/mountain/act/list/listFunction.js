
/* Controller路徑對應變數 */
var actHomeURL = "/MountainExploer.com/mountain/act/search";
var actEnterURL = "/MountainExploer.com/mountain/list?";
var mountainShare = "/MountainExploer.com/mountain/public";
var detailURL = "/MountainExploer.com/mountain/act/detail?page=1&actID="

/* 預先設定要使用的變數名稱 
	totalPage	=	本條件查詢頁面總數
	totalData	=	本條件查詢總筆數
	page 		=	當前頁面
	od			=	本次命令
	(1 = 預設, 2 = 標籤, 3 = 搜尋)
	tag			=	本次查詢標籤號碼
	search		=	本次搜尋內容
*/
var totalPage, totalData, page, od, tag, search;

/* 抓取網域提供參數 */
var urlNow = new URL(window.location.href)

/* 設置預先設定的變數 */
if (urlNow.searchParams.has("page")) {
	page = urlNow.searchParams.get("page");
} else {
	page = 1;
}
if (urlNow.searchParams.has("od")) {
	od = urlNow.searchParams.get("od");
} else {
	od = 1;
}
if (urlNow.searchParams.has("tag")) {
	tag = urlNow.searchParams.get("tag");
}
if (urlNow.searchParams.has("search")) {
	search = urlNow.searchParams.get("search");
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
	let sendData = { page: page, tag: tag, search: search }
	$.ajax({
		url: actHomeURL + as,
		method: "GET",
		dataType: 'json',
		data: sendData,
		success: function(data) {

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
			setPageController(data.page)


		}
	})
}

/* 函式 : 將得到結果，於網頁上的指定位置動態新增指定元素 */
function insertTable(data) {
	for (let i = 0; i < data.length; i++) {
		let model = $(".order-table").find(".order-table-tb").eq(i).clone();
		let thisElm = $(".order-table-tb").eq(i)
		
		/**呼叫動態新增網頁元素之函式 */
		console.log("actBasic.seqno : " + data[i].actBasic.seqno)
		setActImg(data[i].actBasic.seqno, thisElm)
		setTag(data[i].tagMap, thisElm)
		setTitle(data[i].actBasic, thisElm)
		setPostTime(data[i].actBasic, thisElm)
		setRegNum(data[i], thisElm)
		setRegEndDate(data[i].actBasic.actInfo, thisElm)
		
		$(".order-table").append(model)
		$(".order-table").find(".order-table-tb").eq(i).removeClass("hideTbody")
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
	console.log("get seqno : " + seqno)
	let thisTD = $(thisElm).find("td").eq(0)
	let imgURL = actHomeURL + "/images?actID=" + seqno + "&defImage=1"

	thisTD.find("a").attr("href", detailURL + seqno);
	thisTD.find("img").attr("src", imgURL).on("error",imgError);
	
}
function setTitle(actBasic, thisElm) {
	
	let thisTD = thisElm.find(".tagContainer").siblings("a")
	let title = "<br>" + actBasic.actInfo.title + "<br>"
	
	thisTD.attr("href", detailURL + actBasic.seqno)
		+ actBasic.actInfo.totalDay + " / " + actBasic.actInfo.price;
	thisTD.html(title)
}
function setPostTime(actBasic, thisElm) {
	
	let thisTD = thisElm.find("td").eq(2)
	let postTime = " / <br>"
		.concat(dateFormate(actBasic.actInfo.postDate));
	
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
	}
}

/* 函式 : 
	計算傳入參數，並於網頁動態新增或修改頁面控制項 
*/
function setPageController(page) {
	//判別目前
	let url;
	if (od == 1) {
		url = actEnterURL + "od=1&"
	}
	if (od == 2) {
		url = actEnterURL + "od=2&tag=" + tag + "&"
	}

	$(".pageControl").find("a").eq(2).html("目前 " + page + ' / ' + totalPage + " 頁")
	if (page != 1) {
		let first = url + "page=1"
		let previous = url + "page=" + (Number(page) - 1);
		$(".pageControl").find("a").eq(0).attr("href", first).css("display", "block")
		$(".pageControl").find("a").eq(1).attr("href", previous).css("display", "block")
	} else {
		$(".pageControl").find("a").eq(0).css("display", "none")
		$(".pageControl").find("a").eq(1).css("display", "none")
	}
	if (page < totalPage) {
		let next = url + "page=" + (Number(page) + 1);
		let final = url + "page=" + (Number(totalPage));
		$(".pageControl").find("a").eq(3).attr("href", next).css("display", "block")
		$(".pageControl").find("a").eq(4).attr("href", final).css("display", "block")
	} else {
		$(".pageControl").find("a").eq(3).css("display", "none")
		$(".pageControl").find("a").eq(4).css("display", "none")
	}
}

/*	函式 : 透過傳入參數，於網頁動態新增狀態標籤 */
function setTag(check, thisElm) {
	let container = thisElm.find(".tagContainer")
	let aURL = actEnterURL.concat("od=2&page=1&tag=")
	let aTagStart = "<div class='actTag'><a href='"
	let aTagEnd = "</a></div>"
	let regTagStart = "<div class='regTag'><a href='"
	let regTagEnd = "</a></div>"

	if (!check[3]) {
		if (check[1]) {
			container.append(aTagStart + aURL + "1'>新活動" + aTagEnd)
		}
		if (check[2]) {
			container.append(aTagStart + aURL + "2'>熱門活動" + aTagEnd)
		}
		if (!check[4]) {
			if (!check[5]) {
				if (check[6]) {
					container.append(regTagStart + aURL + "6'>尚可報名" + regTagEnd)
				}
				if (check[7]) {
					container.append(regTagStart + aURL + "7'>報名將截止" + regTagEnd)
				}
				if (check[8]) {
					container.append(regTagStart + aURL + "8'>報名將滿" + regTagEnd)

				}
			} else {
				container.append(regTagStart + aURL + "5'>報名已滿" + regTagEnd)
			}
		} else {
			container.append(regTagStart + aURL + "4'>報名截止" + regTagEnd)
		}

	} else {
		container.append(aTagStart + aURL + "3'>歷史活動" + aTagEnd)
	}
}


/*	函式 : 回傳 => 日期編排 */
function dateFormate(date) {
	let result = "";
	result = result.concat(new Date(date).toLocaleDateString())
		.concat(" " + new Date(date).toLocaleTimeString())

	return result;
}