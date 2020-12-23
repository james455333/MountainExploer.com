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
	console.log(includeJS.status)
	includeJS.registerListener(function(val) {
			console.log("includeJS : " + val)
		if(val){
			console.log("includeJS : " + val)
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
		                console.log("A")
		                $(".userTop ").find("a").addClass("topA");
		                $(".userTop").find("a").removeAttr("href");
		                $(".userTop").find("a").on("click", function(){
		                    loginSwalforImg();
		                })
		            }
		        }
		
		    })   
			
		}
	})
	
	
	
})


// $("body").on("click", "#topImg", function(){
//     console.log("in");
//     $.ajax({
//         method:"GET",
//         url:"/MountainExploer.com/member/memberChkLogin",
//         dataType:"json",
//         success:function(data){
//             if(data){
//                 window.location.href="/MountainExploer.com/member/memberInfoEntry"
//             }else{
//                 loginSwalforImg();
                
                
//             }
//         }

//     })
// })


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
