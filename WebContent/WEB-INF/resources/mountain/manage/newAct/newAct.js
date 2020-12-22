var mountainHome = "/MountainExploer.com/mountain/route/search"
var actCRUDHome = "/MountainExploer.com/mountain/act/crud"
var detailHome = "/MountainExploer.com/mountain/act/detail?"

var originSD;
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
	PBBlock({
		countTimes : 2,
	})
	let count = 0 ;
	openBlock()
	progressCount("頁面基本元素載入中")
	includeJS.registerListener(function(val) {
		if(val){
			progressCount("載入完成")
			const headerH = $("header").height()
			const bcTop = $("#bc").offset().top
			const trgH = bcTop-headerH
			
			setTimeout(()=>{
				$("html").animate({ scrollTop: trgH }, 1000,function(){
						console.log("count : " + count++)
						console.log("scrollTop end")
						activeAnimate()
					});
				
			},1000)
			setDefaultRouteSelect( $(".newAct-form") )
			setDatePicker($(".newAct-form"))
			$("#npSelect").on("change",changeRtOption)
			$("#rtSelect").on("change",changeRtDesp)
			$("#btn-submit").on("click",function(){
				$("#newAct-form").submit()
			})
			$("#newAct-form").validate({
				submitHandler: function(form){
					ajaxNewAct(form)
		        }
			})
			
		}
	});
	
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
	
	
	$("#btn-click-auto").on("click",autoNewAct)
	$("#btn-menu-auto").on("click",function(){
		$("#btn-click-auto").toggle()
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
