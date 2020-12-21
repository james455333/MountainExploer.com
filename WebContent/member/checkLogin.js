$(function(){
    $.ajax({
        method:"GET",
        url:"/MountainExploer.com/member/memberChkLogin",
        dataType:"json",
        success:function(data){
            if(data == false){
                Swal.fire({
                    icon:"warning",
                    title:"本頁面為會員專屬，請先登入或註冊"
                }).then(function(){
                    window.location.href="/MountainExploer.com/member/memberLoginEntry";
                })
            }
        }
    })
})