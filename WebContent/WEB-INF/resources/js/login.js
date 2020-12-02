
$(function () {
	var name = $("#account"),
    password = $("#password"),
    allFields = $([]).add(name).add(password),
    tips = $(".validateTips");
	$("#dialog-form").dialog({
	    autoOpen: false,
	    modal: true,
	    show:'true',
	    // hide:'puff',
	    height: 350,
	    width: 300,
	    resizable: false,
	    buttons: {
	      登入: function () {
	        // window.location.href = '../index.html'
	        let userAnt = $.trim($("#account").val());
	        let userPwd = $.trim($("#password").val());
	        let rm = $.trim($("#rememberMe").val());
	        $.ajax({
	          method:"GET",
	          url:"/MountainExploer.com/member/memberLogin",
	          data:{account:userAnt, password:userPwd, rememberMe:rm},
	          dataType:"json",
	          success: function(response){
	            if(response == 100 || response == 120){
					alert("登入成功");
					window.location.reload();
	            }else if(response == 110 || response == 130){
					alert("登入成功");
					window.location.href = "/MountainExploer.com/member/memberFirstInfoEntry";
	            }else if(response == 0){
					alert("登入失敗");
					window.location.reload();
				}else{
					alert("登入失敗");
					window.location.reload();;
				}
	          }
	
	        })
      },
      取消: function () {
        $(this).dialog("close");
      }
    },
    close: function () {
      allFields.val("").removeClass("ui-state-error");
    }
  });

  $("#create-user")
    .button()
    .click(function () {
      $("#dialog-form").dialog("open");
    });
});