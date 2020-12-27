
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
	
	includeJS.registerListener(function(val){
		if(val){
			memberTopBar()
			PBBlock({
				countTimes : 2
			})
			openBlock("body")
			progressCount("頁面載入中...")
				/* */
			setBreadcrumbURL();
			/* 取得本頁面資訊 */
			activeDataAS(actID)
			
			/* 掛載日期選擇器 */
			setDatePicker( $("input[name^='birthDay']"))
			var originBCTop = $("#btn-controller").offset().top
//			var originTitleW = $(".actPost").innerWidth()
			$(window).scroll(function(){
				let headerBottom = $("header").offset().top + $("header").height()
				let bc = $("#btn-controller")
				let originBCLeft = $("#btn-controller").offset().left
				let originBCHeight = $("#btn-controller").innerHeight()
				if( headerBottom >= originBCTop && bc.css("position") != "fixed" ){
					bc.css({
						position : "fixed",
						top : $("header").height(),
						left : originBCLeft,
						"z-index" : 9,
					})
				}else if( headerBottom <= originBCTop && bc.css("position") == "fixed" ){
					bc.css({
						position : "static",
					})
				}
			})
			progressCount("頁面載入完成")
			
		}
	})
	
	
	/* 設定按鈕功能 新增人數 */
	$("body").on("click",".btn-regInfo-plus", function(){
		if( (nowReg+1) < regTop ){
			nowReg++;
			let bodyLength = $(".regInfo-form").length
			appedRegInfo(bodyLength)
			$(".regInfo-form").eq(bodyLength).validate({
				submitHandler: function(form){
					
					let errors = $(".error")
					for(let i = 0 ; i < errors.length ; i++){
						let thisDis = errors.eq(i).css("display")
						if(thisDis != "none") return
					}
					let formLength = $(".regInfo-form").length
					formArray.push(form)
					if(formArray.length == formLength){
						console.log("add")	
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
			let errors = $(".error")
			for(let i = 0 ; i < errors.length ; i++){
				let thisDis = errors.eq(i).css("display")
				if(thisDis != "none") return
			}
			let formLength = $(".regInfo-form").length
			formArray.push(form)
			if(formArray.length == formLength){
				console.log("origin")
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
function memberTopBar(){
	$.ajax({
		method:"GET",
		url:"/MountainExploer.com/member/memberChkLogin",
		dataType:"json",
		success:function(data){
		    if(data){
		        $.ajax({
		        	method:"GET",
		        	url:"/MountainExploer.com/member/getSession",
		       		dataType:"json",
		        	success:function(mbList){
		        	$.each(mbList, function(index, item){
		            	$(".userTop").find(".topSp").html("歡迎回來，" + item.memberInfo.neck_name);
			                let img = item.memberInfo.img_name;
		                    if(img != null){
		                    	let imgTop = "/MountainExploer.com/member/showUserImg?seqno=" + item.seqno;
		                        	$(".userTop").find(".topImg").attr("src", imgTop);
		                    }
		
		                 })
		            }
		      	})
		    }else{
		        $(".userTop ").find("a").addClass("topA");
		        $(".userTop").find("a").removeAttr("href");
		        $(".userTop").find("a").on("click", function(){
		        	loginSwalforImg();
		        })
		   }
		}
	})
}
function loginSwalforImg(){
	Swal.fire({
	    title: "註冊／登入",
	    html: `<div>
				<input type="text" id="account" class="swal2-input account" placeholder="請輸入帳號">
	            <input type="password" id="password" class="swal2-input password" placeholder="請輸入密碼">
	            <input type="checkbox" id="rememberMe" name="rememberMe" class="rememberMe" value="true"><label>記住我</label>
				</div>
				<div><a href="/MountainExploer.com/member/memberPwdFoundEntry">忘記密碼</a></div>
				<div style="text-align: center;">立即<a href="/MountainExploer.com/member/memberRegisterEntry">註冊</a>帳號或<a href="/MountainExploer.com/member/memberLoginEntry">使用Facebook帳號登入</a></div>
				<div>
				<input type="button" name="userLog1" class="btn btn-info userLog1" value="一般登入">
				<input type="button" name="userLog2" class="btn btn-warning userLog2" value="登山嚮導登入">
				<input type="button" name="adminLog" class="btn btn-secondary adminLog" value="管理員登入">
				</div>
				`,
		customClass: {
			confirmButton: 'btn btn-success mx-3',
		    cancelButton: 'btn btn-danger mx-3',
		},
		buttonsStyling: false,
	    confirmButtonText: "登入",
	    cancelButtonText: "返回",
		showCancelButton : true,
	    focusConfirm: false,
		didOpen:function(){
			$.ajax({
					method:"GET",
					url:"/MountainExploer.com/member/cookieSelect",
					dataType:"json",
					success:function(cookieMap){
						if(cookieMap.length != 0 || cookieMap.length != null){
								$.each(cookieMap, function(key, value){
								if(key == "rmAnt"){
									$(".account").val(value);
								}
								if(key == "rmPwd"){
									$(".password").val(value);
								}
								if(key == "rememberMe"){
									if(value != null){
										console.log(value);
										$(".rememberMe").prop("checked", true);										
									}else{
										console.log(value);
										$(".rememberMe").prop("checked", false);
									}
								}
							})
						}
						
					}
					
				})

				//快速登入寫這裡
				$(".userLog1").on("click", function(){
					let userNo1 = $(".userLog1").val();
				
					$.ajax({
						method:"GET",
						url:"/MountainExploer.com/member/FastLoginOne",
						data:{userLog1:userNo1},
						dataType:"json",
						success:function(flag){
							if(flag){
								window.location.reload();
							}else{
								window.location.reload();
							}
						}
					})
				})
				$(".userLog2").on("click", function(){
					let userNo2 = $(".userLog2").val();
				
					$.ajax({
						method:"GET",
						url:"/MountainExploer.com/member/FastLoginTwo",
						data:{userLog2:userNo2},
						dataType:"json",
						success:function(flag){
							if(flag){
								window.location.reload();
							}else{
								window.location.reload();
							}
						}
					})
				})
				
				$(".adminLog").on("click", function(){
					let adminLog = $(".adminLog").val();
				
					$.ajax({
						method:"GET",
						url:"/MountainExploer.com/member/FastLoginAdmin",
						data:{adminLog:adminLog},
						dataType:"json",
						success:function(flag){
							if(flag){
								window.location.href="/MountainExploer.com/back";
							}else{
								window.location.reload();
							}
						}
					})
				})


		},
	    preConfirm: function(){
	        const account = Swal.getPopup().querySelector("#account").value;
	        const password = Swal.getPopup().querySelector("#password").value;
		//	const rm = Swal.getPopup().querySelector("#rememberMe").value;
	        if(!account || !password){
	            Swal.showValidationMessage(`請輸入帳號和密碼`);
	        }
	        return {
	            account:account,
	            password:password
	        }
	    }
	}).then(function(result){
		if(result.isConfirmed){
			
			let account = $(".account").val();
			let password = $(".password").val();
			let isChecked = $(".rememberMe").prop("checked");
			var rm = isChecked ? "true" : null;
			
			$.ajax({
				method:"GET",
				url:"/MountainExploer.com/member/memberLogin",
				data:{
					account:account,
					password:password,
					rememberMe:rm
				},
				dataType:"json",
				success:function(data){
					if(data == 0){
						Swal.fire({
							icon:"error",
							title:"登入失敗",
							text:"帳號或密碼錯誤",
							confirmButtonText : "重新輸入"
						}).then(function(){
							loginSwal()
						})
					}else if(data == 100 || data == 120){
						Swal.fire({
							icon:"success",
							title:"登入成功",
						}).then(function(){
							window.location.reload();
						})
					}else if(data == 110 || data == 130){
						Swal.fire({
							icon:"success",
							title:"初次登入成功",
							text:"請繼續填寫認證資料"
						}).then(function(){
							window.location.href="/MountainExploer.com/member/memberFormalFirstInfoEntry";
						})
					}else if(data == 140 || data == 150){
						Swal.fire({
							icon:"warning",
							title:"登入失敗，帳號已被停權",
							text:"您的帳號已被停權，無法使用本系統"
						}).then(function(){
							window.location.href="/MountainExploer.com";
						})
					}else if(data == 160){
						Swal.fire({
							icon:"success",
							title:"管理員登入成功"
						}).then(function(){
							window.location.href="/MountainExploer.com/back";
						})
					}else{
						Swal.fire({
							icon:"error",
							title:"登入失敗",
							text:"帳號或密碼錯誤"
						}).then(function(){
							window.location.reload();
						})
					}
				},
				error:function(){
					Swal.fire({
						icon:"error",
						title:"登入出錯，請聯繫管理員"
					}).then(function(){
						window.location.href="/MountainExploer.com";
					})
				}
			})
		}
			
	  })
}
