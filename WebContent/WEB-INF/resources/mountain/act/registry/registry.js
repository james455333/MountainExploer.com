
var regHome = "/MountainExploer.com/mountain/registry/crud"
var mountainShare = "/MountainExploer.com/mountain/public";
var detailHome = "/MountainExploer.com/mountain/act/detail?page=1&actID="
var listHome = "/MountainExploer.com/mountain/list?page=1&od=1"
/* 抓取網域提供參數 */
var urlNow = new URL(window.location.href)
var actID, nowReg, regTop;
var formArray = [];
var count = 0;
if (urlNow.searchParams.has("actID")) {
	actID = urlNow.searchParams.get("actID");
}else{
	swal("錯誤","無此活動報名","error")
}


$(function(){
	/* */
	setBreadcrumbURL();
	/* 取得本頁面資訊 */
	activeDataAS(actID)
	
	/* 掛載日期選擇器 */
	setDatePicker( $("input[name^='birthDay']"))
	
	/* 設定按鈕功能 新增人數 */
	$("body").on("click",".btn-regInfo-plus", function(){
		if( (nowReg+1) < regTop ){
			nowReg++;
			let bodyLength = $(".regInfo-form").length
			appedRegInfo(bodyLength)
			$(".regInfo-form").eq(bodyLength).validate({
				submitHandler: function(form){
					let formLength = $(".regInfo-form").length
					formArray.push(form)
					if(formArray.length == formLength){
						ajaxConfirmSWAL()
					}else if (formArray.length > formLength){
						formArray=[]
					}
		        }
			})	
		}else{
			swal({
				title : "已達到報名人數上限",
				text : "報名人數上限 : " + regTop,
				icon : "warning",
				dangerMode: true,
			})
		}
		
	})
	/* 設定按鈕功能 減少人數 */
	$("body").on("click",".btn-regInfo-minus", function(){
		let bodyLength = $(".regInfo-form").length
		console.log(bodyLength)
		if((bodyLength-1)>0){
			nowReg--;
			removeRegInfo(bodyLength)
		}else{
			swal({
				title : "報名資訊欄位不可少於一欄",
				icon : "error",
				dangerMode: true,
			})
		}
	})
	
	$("body").on("click",".btn-warning-reset",function(){
		$(this).parents(".regInfo-container").find("input").not("input[name^='birthDay']").val("")
		let restDate = $(this).parents(".regInfo-container").find("input[name^='birthDay']")
		setDatePicker(restDate)
	})

	
	/* 抓取元素 新增報名表單元素設置 */
	let originModel = $(".regInfo-form").clone()
	originModel.attr({ "id":"regInfo-form-origin", "class" : ""})
	$(".hideDIV").append( originModel )
	/* 設定按鈕功能 送出 */
	$("#regInfo-submit").on("click", function(){
		$(".regInfo-form").submit()
	})
//	console.log(jQuery.validator.messages.pattern )
	/* 表單掛載jQuery validator */
	$(".regInfo-form").validate({
		submitHandler: function(form){
			let formLength = $(".regInfo-form").length
			formArray.push(form)
			if(formArray.length == formLength){
				ajaxConfirmSWAL()
			}else if (formArray.length > formLength){
				formArray=[]
			}
        }
	})
	$("#btn-click-auto").on("click", autoInfo)
	
})


/* jQuery validator 錯誤顯示設定 */
jQuery.extend(jQuery.validator.messages, {
    required: "必填",
    remote: "Please fix this field.",
    email: "請輸入正確Email格式",
    url: "Please enter a valid URL.",
    date: "Please enter a valid date.",
    dateISO: "Please enter a valid date (ISO).",
    number: "僅能輸入數字",
    digits: "Please enter only digits.",
    creditcard: "Please enter a valid credit card number.",
    equalTo: "Please enter the same value again.",
    accept: "Please enter a value with a valid extension.",
    maxlength: jQuery.validator.format("Please enter no more than {0} characters."),
    minlength: jQuery.validator.format("請輸入至少 {0} 個字"),
    rangelength: jQuery.validator.format("Please enter a value between {0} and {1} characters long."),
    range: jQuery.validator.format("Please enter a value between {0} and {1}."),
    max: jQuery.validator.format("Please enter a value less than or equal to {0}."),
    min: jQuery.validator.format("Please enter a value greater than or equal to {0}."),
	pattern: "格式錯誤"
});
