$(".swalLogin").on("click", function(){

    Swal.fire({
        title: "註冊／登入",
        html: `<div>
				<input type="text" id="account" class="swal2-input account" placeholder="請輸入帳號">
                <input type="password" id="password" class="swal2-input password" placeholder="請輸入密碼">
                <input type="checkbox" id="rememberMe" name="rememberMe" class="rememberMe" value="true"><label>記住我</label>
				</div>
				<div><a href="/MountainExploer.com/member/memberPwdFoundEntry">忘記密碼</a></div>
				<div style="text-align: center;">立即<a href="/MountainExploer.com/member/memberRegisterEntry">註冊</a>帳號或<a href="/MountainExploer.com/member/memberLoginEntry">使用Facebook帳號登入</div>
				`,
        confirmButtonText: "登入",
        focusConfirm: false,
		allowOutsideClick: false,
		onOpen:function(){
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
		},
        preConfirm: function(){
            const account = Swal.getPopup().querySelector("#account").value;
            const password = Swal.getPopup().querySelector("#password").value;
//			const rm = Swal.getPopup().querySelector("#rememberMe").value;
            if(!account || !password){
                Swal.showValidationMessage(`請輸入帳號和密碼`);
            }
            return {
                account:account,
                password:password
            }
        }
    }).then(function(){
		
		let account = $(".account").val();
		let password = $(".password").val();
		let isChecked = $(".rememberMe").prop("checked");
		if(isChecked){
			var rm = "true";
		}else{
			var rm = null;
		}
		
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
						text:"帳號或密碼錯誤"
					}).then(function(){
						window.location.reload();
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
		
    })
})
