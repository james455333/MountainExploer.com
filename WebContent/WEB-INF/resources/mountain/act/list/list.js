
/* Controller路徑對應變數 */
var actHomeURL = "/MountainExploer.com/mountain/act/crud";
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
var showData,totalPage, totalData, page, od, tag, search, member,mode;

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

mode = urlNow.searchParams.has("mode") ? urlNow.searchParams.get("mode") : "image";
actEnterURL += ("mode=" + mode + "&")
var defaultMode = "image"
var includeJS = {
	aInternal: true,
	aListener: function(val) {},
  	set status(val) {
    	this.aInternal = val;
    	this.aListener(val);
  	},
 	get status() {
    	return this.aInternal;
  	},
  	registerListener: function(listener) {
    	this.aListener = listener;
  	}
}

$(function(){
	if(mode != defaultMode){
		toggleShowMode()
	}
	
	/*	依照頁面命令變數值(od)，給予呼叫的函式相應的參數	*/
	includeJS.registerListener(function(val) {
		if(val){
			const headerH = $("header").height()
			const bcTop = $("#bc").offset().top
			const trgH = bcTop-headerH
			window.scrollTo(0,trgH)
			PBBlock({
				countTimes : 4,
			})
			openBlock("#info-page")
			progressCount("頁面載入完成")
			ajaxCheckLogin(od)
		}
	});


	/* 掛載活動狀態標籤查詢方法，讓點擊選單選項執行查詢函式 */
	$("input[name='aTag']").on("change",function(){
		activeTagAS( $(this).val() );
	})
	
	/* 掛報名狀態標籤查詢方法，讓點擊選單選項執行查詢函式 */
	$("input[name='rTag']").on("change",function(){
		activeTagAS( $(this).val() );
	})
	
	/* 掛載輸入名稱查詢，讓按鈕被點擊時，執行名稱查詢函式 */
	$(".search").find("button").on("click",function(){
		$("#m-sr-form").submit();
	})
	
	/* 透過事件發生座標與發生所在元素座標組合，讓滑鼠滑入可以顯現大圖於旁 */
	$(".order-table").on("mouseenter",".showImage",function(e){
		var elm = $(this);
		var x = e.pageX - elm.offset().left;
	    var y = e.pageY - elm.offset().top;
		$(this).siblings().show();
	}).on("mouseleave",".showImage",function(){
		$(this).siblings().hide();
	})
	
	$("#btn-newpost").on("click",publishNewAct)
	
	$("input[name='mode']").on("click",modeSwitch)
	
})
