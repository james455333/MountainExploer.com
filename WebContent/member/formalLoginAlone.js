$(".submit").on("click", function(){
    if(errors != null){
       swal({
           title: "登入失敗",
           icon: "error"
       });
    }else{
        swal({
            title: "登入成功",
            icon: "success"
        });
    }

})

$(".userLog1").on("click", function(){
    let userNo1 = $(".userLog1").val();

    $.ajax({
        method:"GET",
        url:"/MountainExploer.com/member/FastLoginOne",
        data:{userLog1:userNo1},
        dataType:"json",
        success:function(flag){
            if(flag){
                window.location.href="/MountainExploer.com/member/memberInfoEntry";
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
                window.location.href="/MountainExploer.com/member/memberInfoEntry";
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
                window.location.href="/MountainExploer.com/backStageEntry";
            }else{
                window.location.reload();
            }
        }
    })
})

// $(".test").on("click", function(){
//     swal({
//         title: "測試成功",
//         icon: "success"
//     })

// })