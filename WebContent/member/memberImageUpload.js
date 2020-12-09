$(".userImg").on("click", function(){
    if(errors != null){
        swal({
            title: errors,
            icon: "error"
        });
    }else{
        swal({
            title: "圖片上傳成功",
            icon: "success"
        }).then(function(){
            window.location.href="/MountainExploer.com/member/memberInfoEntry";
        });
    }
})