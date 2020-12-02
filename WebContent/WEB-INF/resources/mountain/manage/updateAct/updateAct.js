var mountainHome = "/MountainExploer.com/mountain/route/search"
var actCRUDHome = "/MountainExploer.com/mountain/act/crud"
var detailHome = "/MountainExploer.com/mountain/act/detail?"

var actID,npID,rtID, defaultSD, defaultED, defaultTD, defaultRED;

var urlNow = new URL(window.location.href)
if(urlNow.searchParams.has("actID")){
	actID = urlNow.searchParams.get("actID");
}


$(function(){
	setActInfo();
	$("#npSelect").on("change",changeRtOption)
	$("#rtSelect").on("change",changeRtDesp)
	$("#btn-submit").on("click",function(){
		$("#newAct-form").submit()
	})
	$("#btn-reset").on("click",function(){
		$("#newAct-form")[0].reset()
		setActInfo()
		setDatePicker($("#newAct-form"))
	})
	$("#newAct-form").on("reset",function(){
		
		
//		$("input[name='actInfo.startDate']").data('daterangepicker').setStartDate(defaultSD)
//		$("input[name='aactInfo.endDate']").data('daterangepicker').setStartDate(defaultED)
//		$("input[name='actInfo.regEndDate']").data('daterangepicker').setStartDate(defaultRED)
//		
	})
	$("#newAct-form").validate({
		submitHandler: function(form){
			ajaxNewAct(form)
        }
	})
	
	CKEDITOR.replace("note")
	
	$("input[type='file']").on("change",function(){
		let countFile = $(this).get(0).files.length 
		if ( countFile > 5){
			$(this).val("");
			swal("上傳圖片不得大於五張", "請重新選擇", "error");
		}
	})
	
	$("input[name='files']").on("change", function(){
		$("#previewMultiple").html(""); // 清除預覽
		readURL(this);
	})
	
	$(".newAct-form").on("mouseenter",".showImage",function(e){
		var elm = $(this);
		var x = e.pageX - elm.offset().left;
	    var y = e.pageY - elm.offset().top;
		$(this).siblings().show();
	}).on("mouseleave",".showImage",function(){
		$(this).siblings().hide();
	})
	
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
