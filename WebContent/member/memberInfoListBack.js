$(function(){
    $.ajax({
        method:"GET",
        url:"/MountainExploer.com/back/member/countMemberAction",
        dataType:"json",
        success:function(data){
            $(".countMb").html(data);
        }
    })
})


$(function(){
    $.ajax({
        method:"GET",
        url:"/MountainExploer.com/back/member/memberListIndexAction",
        dataType:"json",
        success:function(mbList){
            if(mbList != null){
                let $allMember = $("#allMember");
                $.each(mbList, function(index, item){
                    //非停權會員
                    if(item.memberStatus.seqno == 100 || item.memberStatus.seqno == 110 || item.memberStatus.seqno == 120 || item.memberStatus.seqno == 130){
                        $allMember.append(
                            "<tr><td>" +
                                "<input type='hidden' name='mbBan' class='mbBan' value='" + item.seqno + "'>" +
                                "<button type='button' class='btn btn-danger ban' id='ban'><i class='fa fa-ban'></i>停權</button></td>" +
                            "<td>" + item.seqno + "</td>" + 
                            "<td>" + item.account + "</td>" +
                            "<td>" + item.email + "</td>" + 
                            "<td>" + item.memberStatus.name + "</td>" + 
                            "<td>" + 
                                "<input type='hidden' name='sgSeqno' class='sgSeqno' value='" + item.seqno +"'>" +
                                "<button type='button' id='sgInfo' class='btn btn-info sgInfo'><i class='fa fa-user-circle' style='margin-right:3px'></i>詳細資料</button>" + 
                                "<button type='button' style='margin-left:10px' id='chInfo' class='btn btn-secondary chInfo'><i class='fa fa-file-text' style='margin-right:3px'></i>修改資料</button>" + 
                                "<button type='button' style='margin-left:10px' class='btn btn-secondary chGroup'><i class='fas fa-users-cog' style='margin-right:3px'></i>更變身分組</button></td></tr>"
                            )
                    //停權會員
                    }else if(item.memberStatus.seqno == 140 || item.memberStatus.seqno == 150){
                        $allMember.append(
                            "<tr><td>" + "<input type='hidden' name='reSeqno' class='reSeqno' value='" + item.seqno +"'>" +
                            "<button type='button' class='btn btn-warning recover'><i class='fa fa-refresh'></i>復權</button></td>" + 
                            "<td>" + item.seqno + "</td>" + 
                            "<td>" + item.account + "</td>" +
                            "<td>" + item.email + "</td>" + 
                            "<td>" + item.memberStatus.name + "</td>" + 
                            "<td>" + 
                                "<input type='hidden' name='sgSeqno' class='sgSeqno' value='" + item.seqno +"'>" +
                                "<button type='button' class='btn btn-info sgInfo'><i class='fa fa-user-circle' style='margin-right:3px'></i>詳細資料</button>" + 
                                "<button type='button' style='margin-left:10px' id='chInfo' class='btn btn-secondary chInfo'><i class='fa fa-file-text' style='margin-right:3px'></i>修改資料</button>" + 
                                "<button type='button' style='margin-left:10px' class='btn btn-secondary disabled'><i class='fas fa-users-cog' style='margin-right:3px'></i>更變身分組</button></td></tr>"
                        )
                    }else{
                        $allMember.append(
                            "<tr><td><button type='button' class='btn btn-danger disabled'><i class='fa fa-ban'></i>停權</button></td>" + 
                            "<td>" + item.seqno + "</td>" + 
                            "<td>" + item.account + "</td>" +
                            "<td>" + item.email + "</td>" + 
                            "<td>" + item.memberStatus.name + "</td>" + 
                            "<td>" + 
                                "<input type='hidden' name='sgSeqno' class='sgSeqno' value='" + item.seqno +"'>" +
                                "<button type='button' class='btn btn-info disabled'><i class='fa fa-user-circle' style='margin-right:3px'></i>詳細資料</button>" + 
                                "<button type='button' style='margin-left:10px' id='chInfo' class='btn btn-secondary chInfo'><i class='fa fa-file-text' style='margin-right:3px'></i>修改資料</button>" + 
                                "<button type='button' style='margin-left:10px' class='btn btn-secondary disabled'><i class='fas fa-users-cog' style='margin-right:3px'></i>更變身分組</button></td></tr>"
                        )

                    }
                })
            }
        }

    })
})

//重置查詢
$(".reSelect").on("click", function(){
    $("#allMember").html("");

    $.ajax({
        method:"GET",
        url:"/MountainExploer.com/back/member/memberListIndexAction",
        dataType:"json",
        success:function(mbList){
            if(mbList != null){
                var $allMember = $("#allMember");
                $.each(mbList, function(index, item){
                    if(item.memberStatus.seqno == 100 || item.memberStatus.seqno == 110 || item.memberStatus.seqno == 120 || item.memberStatus.seqno == 130){
                        $allMember.append(
                            "<tr><td>" +
                                "<input type='hidden' name='mbBan' class='mbBan' value='" + item.seqno + "'>" +
                                "<button type='button' class='btn btn-danger ban' id='ban'><i class='fa fa-ban'></i>停權</button></td>" +
                            "<td>" + item.seqno + "</td>" + 
                            "<td>" + item.account + "</td>" +
                            "<td>" + item.email + "</td>" + 
                            "<td>" + item.memberStatus.name + "</td>" + 
                            "<td>" + 
                                "<input type='hidden' name='sgSeqno' class='sgSeqno' value='" + item.seqno +"'>" +
                                "<button type='button' id='sgInfo' class='btn btn-info sgInfo'><i class='fa fa-user-circle' style='margin-right:3px'></i>詳細資料</button>" + 
                                "<button type='button' style='margin-left:10px' id='chInfo' class='btn btn-secondary chInfo'><i class='fa fa-file-text' style='margin-right:3px'></i>修改資料</button>" + 
                                "<button type='button' style='margin-left:10px' class='btn btn-secondary chGroup'><i class='fas fa-users-cog' style='margin-right:3px'></i>更變身分組</button></td></tr>"
                            )
                    }else if(item.memberStatus.seqno == 140 || item.memberStatus.seqno == 150){
                        $allMember.append(
                            "<tr><td>" + "<input type='hidden' name='reSeqno' class='reSeqno' value='" + item.seqno +"'>" +
                            "<button type='button' class='btn btn-warning recover'><i class='fa fa-refresh'></i>復權</button></td>" + 
                            "<td>" + item.seqno + "</td>" + 
                            "<td>" + item.account + "</td>" +
                            "<td>" + item.email + "</td>" + 
                            "<td>" + item.memberStatus.name + "</td>" + 
                            "<td>" + 
                                "<input type='hidden' name='sgSeqno' class='sgSeqno' value='" + item.seqno +"'>" +
                                "<button type='button' class='btn btn-info sgInfo'><i class='fa fa-user-circle' style='margin-right:3px'></i>詳細資料</button>" + 
                                "<button type='button' style='margin-left:10px' id='chInfo' class='btn btn-secondary chInfo'><i class='fa fa-file-text' style='margin-right:3px'></i>修改資料</button>" + 
                                "<button type='button' style='margin-left:10px' class='btn btn-secondary disabled'><i class='fas fa-users-cog' style='margin-right:3px'></i>更變身分組</button></td></tr>"
                        )
                    }else{
                        $allMember.append(
                            "<tr><td><button type='button' class='btn btn-danger disabled'><i class='fa fa-ban'></i>停權</button></td>" + 
                            "<td>" + item.seqno + "</td>" + 
                            "<td>" + item.account + "</td>" +
                            "<td>" + item.email + "</td>" + 
                            "<td>" + item.memberStatus.name + "</td>" + 
                            "<td>" + 
                                "<input type='hidden' name='sgSeqno' class='sgSeqno' value='" + item.seqno +"'>" +
                                "<button type='button' class='btn btn-info sgInfo'><i class='fa fa-user-circle' style='margin-right:3px'></i>詳細資料</button>" + 
                                "<button type='button' style='margin-left:10px' id='chInfo' class='btn btn-secondary chInfo'><i class='fa fa-file-text' style='margin-right:3px'></i>修改資料</button>" + 
                                "<button type='button' style='margin-left:10px' class='btn btn-secondary disabled'><i class='fas fa-users-cog' style='margin-right:3px'></i>更變身分組</button></td></tr>"
                        )

                    }
                })
            }
        }

    })
})


//單獨查詢
$(".sgSelect").on("click", function(){
    $("#allMember").html("");
    let account = $(".account").val();
    
    $.ajax({
        method: "GET",
        url: "/MountainExploer.com/back/member/memberSingleAction",
        data:{account:account},
        dataType:"json",
        success:function(mbList){
            if(mbList != null){
                let $allMember = $("#allMember");
                $.each(mbList, function(index, item){
                    if(item.memberStatus.seqno == 100 || item.memberStatus.seqno == 110 || item.memberStatus.seqno == 120 || item.memberStatus.seqno == 130){
                        $allMember.append(
                            "<tr><td>" +
                                "<input type='hidden' name='mbBan' class='mbBan' value='" + item.seqno + "'>" +
                                "<button type='button' class='btn btn-danger ban' id='ban'><i class='fa fa-ban'></i>停權</button></td>" +
                            "<td>" + item.seqno + "</td>" + 
                            "<td>" + item.account + "</td>" +
                            "<td>" + item.email + "</td>" + 
                            "<td>" + item.memberStatus.name + "</td>" + 
                            "<td>" + 
                                "<input type='hidden' name='sgSeqno' class='sgSeqno' value='" + item.seqno +"'>" +
                                "<button type='button' id='sgInfo' class='btn btn-info sgInfo'><i class='fa fa-user-circle' style='margin-right:3px'></i>詳細資料</button>" + 
                                "<button type='button' style='margin-left:10px' id='chInfo' class='btn btn-secondary chInfo'><i class='fa fa-file-text' style='margin-right:3px'></i>修改資料</button>" + 
                                "<button type='button' style='margin-left:10px' class='btn btn-secondary chGroup'><i class='fas fa-users-cog' style='margin-right:3px'></i>更變身分組</button></td></tr>"
                            )
                    }else if(item.memberStatus.seqno == 140 || item.memberStatus.seqno == 150){
                        $allMember.append(
                            "<tr><td>" + "<input type='hidden' name='reSeqno' class='reSeqno' value='" + item.seqno +"'>" +
                            "<button type='button' class='btn btn-warning recover'><i class='fa fa-refresh'></i>復權</button></td>" + 
                            "<td>" + item.seqno + "</td>" + 
                            "<td>" + item.account + "</td>" +
                            "<td>" + item.email + "</td>" + 
                            "<td>" + item.memberStatus.name + "</td>" + 
                            "<td>" + 
                                "<input type='hidden' name='sgSeqno' class='sgSeqno' value='" + item.seqno +"'>" +
                                "<button type='button' class='btn btn-info sgInfo'><i class='fa fa-user-circle' style='margin-right:3px'></i>詳細資料</button>" + 
                                "<button type='button' style='margin-left:10px' id='chInfo' class='btn btn-secondary chInfo'><i class='fa fa-file-text' style='margin-right:3px'></i>修改資料</button>" + 
                                "<button type='button' style='margin-left:10px' class='btn btn-secondary disabled'><i class='fas fa-users-cog' style='margin-right:3px'></i>更變身分組</button></td></tr>"
                        )
                    }else{
                        $allMember.append(
                            "<tr><td><button type='button' class='btn btn-danger disabled'><i class='fa fa-ban'></i>停權</button></td>" + 
                            "<td>" + item.seqno + "</td>" + 
                            "<td>" + item.account + "</td>" +
                            "<td>" + item.email + "</td>" + 
                            "<td>" + item.memberStatus.name + "</td>" + 
                            "<td>" + 
                                "<input type='hidden' name='sgSeqno' class='sgSeqno' value='" + item.seqno +"'>" +
                                "<button type='button' class='btn btn-info disabled'><i class='fa fa-user-circle' style='margin-right:3px'></i>詳細資料</button>" + 
                                "<button type='button' style='margin-left:10px' id='chInfo' class='btn btn-secondary disabled'><i class='fa fa-file-text' style='margin-right:3px'></i>修改資料</button>" + 
                                "<button type='button' style='margin-left:10px' class='btn btn-secondary disabled'><i class='fas fa-users-cog' style='margin-right:3px'></i>更變身分組</button></td></tr>"
                        )

                    }
                })
            }else{
                Swal,fire({
                    icon:"error",
                    title:"查無此會員"
                })
            }
        },
        error:function(){
            Swal,fire({
                icon:"error",
                title:"查無此會員"
            })
        }



    })
})


//一般登山者
$(".seGM").on("click", function(){
	$("#allMember").html("");
	
    let statusId = $(".seGM").val();
    let $allMember = $("#allMember");
    $.ajax({
        method:"GET",
        url:"/MountainExploer.com/back/member/memberListGmSelect",
        data:{statusId:statusId},
        dataType:"json",
        success:function(mbList){
            $.each(mbList, function(index, item){
                if(mbList != null){
                    $allMember.append(
                        "<tr><td>"+
                                "<input type='hidden' name='mbBan' class='mbBan' value='" + item.seqno + "'>" +
                                "<button type='button' class='btn btn-danger ban'><i class='fa fa-ban'></i>停權</button></td>" +
                            "<td>" + item.seqno + "</td>" + 
                            "<td>" + item.account + "</td>" +
                            "<td>" + item.email + "</td>" + 
                            "<td>" + item.memberStatus.name + "</td>" + 
                            "<td>" + 
                                "<input type='hidden' name='sgSeqno' class='sgSeqno' value='" + item.seqno +"'>" +
                                "<button type='button' class='btn btn-info sgInfo'><i class='fa fa-user-circle' style='margin-right:3px'></i>詳細資料</button>" + 
                                "<button type='button' style='margin-left:10px' id='chInfo' class='btn btn-secondary chInfo'><i class='fa fa-file-text' style='margin-right:3px'></i>修改資料</button>" + 
                                "<button type='button' style='margin-left:10px' class='btn btn-secondary chGroup'><i class='fas fa-users-cog' style='margin-right:3px'></i>更變身分組</button></td></tr>"
                    )
                }

            })
        }
    }) 
})


//登山嚮導
$(".seGU").on("click", function(){
	$("#allMember").html("");
	
    let statusId = $(".seGU").val();
    let $allMember = $("#allMember");
    $.ajax({
        method:"GET",
        url:"/MountainExploer.com/back/member/memberListGmSelect",
        data:{statusId:statusId},
        dataType:"json",
        success:function(mbList){
            $.each(mbList, function(index, item){
                if(mbList != null){
                    $allMember.append(
                        "<tr><td>" +
                            "<input type='hidden' name='mbBan' class='mbBan' value='" + item.seqno + "'>" +
                            "<button type='button' class='btn btn-danger ban'><i class='fa fa-ban'></i>停權</button></td>" +
                        "<td>" + item.seqno + "</td>" + 
                        "<td>" + item.account + "</td>" +
                        "<td>" + item.email + "</td>" + 
                        "<td>" + item.memberStatus.name + "</td>" + 
                        "<td>" + 
                            "<input type='hidden' name='sgSeqno' class='sgSeqno' value='" + item.seqno +"'>" +
                            "<button type='button' class='btn btn-info sgInfo'><i class='fa fa-user-circle' style='margin-right:3px'></i>詳細資料</button>" + 
                            "<button type='button' style='margin-left:10px' id='chInfo' class='btn btn-secondary chInfo'><i class='fa fa-file-text' style='margin-right:3px'></i>修改資料</button>" + 
                            "<button type='button' style='margin-left:10px' class='btn btn-secondary chGroup'><i class='fas fa-users-cog' style='margin-right:3px'></i>更變身分組</button></td></tr>"
                    )
                }

            })
        }
    }) 
})


//未認證會員
$(".unGroup").on("click", function(){
    $("#allMember").html("");

    let statusUM = 110;
    let statusUG = 130;
    let $allMember = $("#allMember");
    $.ajax({
        method:"GET",
        url:"/MountainExploer.com/back/member/memberListGmSelect",
        data:{statusId:statusUM},
        dataType:"json",
        success:function(mbList){
            if(mbList != null){
                $.each(mbList, function(index, item){
                    
                        $allMember.append(
                            "<tr><td>" +
                                "<input type='hidden' name='mbBan' class='mbBan' value='" + item.seqno + "'>" +
                                "<button type='button' class='btn btn-danger ban'><i class='fa fa-ban'></i>停權</button></td>" +
                            "<td>" + item.seqno + "</td>" + 
                            "<td>" + item.account + "</td>" +
                            "<td>" + item.email + "</td>" + 
                            "<td>" + item.memberStatus.name + "</td>" + 
                            "<td>" + 
                                "<input type='hidden' name='sgSeqno' class='sgSeqno' value='" + item.seqno +"'>" +
                                "<button type='button' class='btn btn-info sgInfo'><i class='fa fa-user-circle' style='margin-right:3px'></i>詳細資料</button>" + 
                                "<button type='button' style='margin-left:10px' id='chInfo' class='btn btn-secondary chInfo'><i class='fa fa-file-text' style='margin-right:3px'></i>修改資料</button>" + 
                                "<button type='button' style='margin-left:10px' class='btn btn-secondary chGroup'><i class='fas fa-users-cog' style='margin-right:3px'></i>更變身分組</button></td></tr>"
                        )
                })
            }
        }
    })

    $.ajax({
        method:"GET",
        url:"/MountainExploer.com/back/member/memberListGmSelect",
        data:{statusId:statusUG},
        dataType:"json",
        success:function(mbList){
            if(mbList != null){
                $.each(mbList, function(index, item){
                    let Ug = "未認證嚮導";
                        $allMember.append(
                            "<tr><td>" +
                                "<input type='hidden' name='mbBan' class='mbBan' value='" + item.seqno + "'>" +
                                "<button type='button' class='btn btn-danger ban'><i class='fa fa-ban'></i>停權</button></td>" +
                            "<td>" + item.seqno + "</td>" + 
                            "<td>" + item.account + "</td>" +
                            "<td>" + item.email + "</td>" + 
                            "<td>" + item.memberStatus.name + "</td>" + 
                            "<td>" + 
                                "<input type='hidden' name='sgSeqno' class='sgSeqno' value='" + item.seqno +"'>" +
                                "<button type='button' class='btn btn-info sgInfo'><i class='fa fa-user-circle' style='margin-right:3px'></i>詳細資料</button>" + 
                                "<button type='button' style='margin-left:10px' id='chInfo' class='btn btn-secondary chInfo'><i class='fa fa-file-text' style='margin-right:3px'></i>修改資料</button>" + 
                                "<button type='button' style='margin-left:10px' class='btn btn-secondary chGroup'><i class='fas fa-users-cog' style='margin-right:3px'></i>更變身分組</button></td></tr>"
                        )
                })
            }
        }
    })


})


//停權會員
$(".banGroup").on("click", function(){
	$("#allMember").html("");
	
    let statusSM = 140;
    let statusSG = 150;
    let $allMember = $("#allMember");
    $.ajax({
        method:"GET",
        url:"/MountainExploer.com/back/member/memberListGmSelect",
        data:{statusId:statusSM},
        dataType:"json",
        success:function(mbList){
            $.each(mbList, function(index, item){
                if(mbList != null){
                    
                        $allMember.append(
                            "<tr><td>" +
                                "<input type='hidden' name='reSeqno' class='reSeqno' value='" + item.seqno +"'>" + 
                                "<button type='button' class='btn btn-warning recover'><i class='fa fa-refresh'></i>復權</button></td>" +
                            "<td>" + item.seqno + "</td>" + 
                            "<td>" + item.account + "</td>" +
                            "<td>" + item.email + "</td>" + 
                            "<td>" + item.memberStatus.name + "</td>" + 
                            "<td>" + 
                                "<input type='hidden' name='sgSeqno' class='sgSeqno' value='" + item.seqno +"'>" +
                                "<button type='button' class='btn btn-info sgInfo'><i class='fa fa-user-circle' style='margin-right:3px'></i>詳細資料</button>" + 
                                "<button type='button' style='margin-left:10px' id='chInfo' class='btn btn-secondary chInfo'><i class='fa fa-file-text' style='margin-right:3px'></i>修改資料</button>" + 
                                "<button type='button' style='margin-left:10px' class='btn btn-secondary disabled'><i class='fas fa-users-cog' style='margin-right:3px'></i>更變身分組</button></td></tr>"
                        )
                }

            })
        }
    })
    
    $.ajax({
        method:"GET",
        url:"/MountainExploer.com/back/member/memberListGmSelect",
        data:{statusId:statusSG},
        dataType:"json",
        success:function(mbList){
            $.each(mbList, function(index, item){
                if(mbList != null){
                    let Sg = "停權嚮導";
                        $allMember.append(
                            "<tr><td>" +
                                "<input type='hidden' name='reSeqno' class='reSeqno' value='" + item.seqno +"'>" + 
                                "<button type='button' class='btn btn-warning recover'><i class='fa fa-refresh'></i>復權</button></td>" +
                            "<td>" + item.seqno + "</td>" + 
                            "<td>" + item.account + "</td>" +
                            "<td>" + item.email + "</td>" + 
                            "<td>" + item.memberStatus.name + "</td>" + 
                            "<td>" + 
                                "<input type='hidden' name='sgSeqno' class='sgSeqno' value='" + item.seqno +"'>" +
                                "<button type='button' class='btn btn-info sgInfo'><i class='fa fa-user-circle' style='margin-right:3px'></i>詳細資料</button>" + 
                                "<button type='button' style='margin-left:10px' id='chInfo' class='btn btn-secondary chInfo'><i class='fa fa-file-text' style='margin-right:3px'></i>修改資料</button>" + 
                                "<button type='button' style='margin-left:10px' class='btn btn-secondary disabled'><i class='fas fa-users-cog' style='margin-right:3px'></i>更變身分組</button></td></tr>"
                        )
                }

            })
        }
    })
})


//管理者
$(".admin").on("click", function(){
	$("#allMember").html("");
	
    let statusId = $(".admin").val();
    let $allMember = $("#allMember");
    $.ajax({
        method:"GET",
        url:"/MountainExploer.com/back/member/memberListGmSelect",
        data:{statusId:statusId},
        dataType:"json",
        success:function(mbList){
            $.each(mbList, function(index, item){
                if(mbList != null){
                    
                    $allMember.append(
                        "<tr><td><button type='button' class='btn btn-danger disabled'><i class='fa fa-ban'></i>停權</button></td>" + 
                        "<td>" + item.seqno + "</td>" + 
                        "<td>" + item.account + "</td>" +
                        "<td>" + item.email + "</td>" + 
                        "<td>" + item.memberStatus.name + "</td>" + 
                        "<td>" + 
                            "<input type='hidden' name='sgSeqno' class='sgSeqno' value='" + item.seqno +"'>" +
                            "<button type='button' class='btn btn-info disabled'><i class='fa fa-user-circle' style='margin-right:3px'></i>詳細資料</button>" + 
                            "<button type='button' style='margin-left:10px' id='chInfo' class='btn btn-secondary disabled'><i class='fa fa-file-text' style='margin-right:3px'></i>修改資料</button>" + 
                            "<button type='button' style='margin-left:10px' class='btn btn-secondary disabled'><i class='fas fa-users-cog' style='margin-right:3px'></i>更變身分組</button></td></tr>"
                    )
                }

            })
        }
    }) 
})


//停權
$(".allMember").on("click", ".ban", function(){
    let banSeqno = $(this).prev(".mbBan").val();
    Swal.fire({
        title: "確定要停權此會員？",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#3085d6",
        cancelButtonColor: "#d33",
        confirmButtonText: "確認停權",
        cancelButtonText: "取消"
    }).then(function(result){
        if(result.isConfirmed){
            $.ajax({
                method:"GET",
                url:"/MountainExploer.com/back/member/memberBanAction",
                data:{banSeqno:banSeqno},
                dataType:"json",
                success:function(data){
                    if(data){
                        Swal.fire(
                            "該會員已停權"
                        ).then(function(){
                            window.location.reload();
                        })
                    }else{
                        Swal.fire(
                            "停權程序出錯"
                        ).then(function(){
                            window.location.reload();
                        })
                    }
                }

            })
        }

        if(result.isDismissed){
            
        }
    })
})


//復權
$(".allMember").on("click", ".recover", function(){
    let reSeqno = $(this).prev(".reSeqno").val();
    Swal.fire({
        title: "確定要恢復此會員的權限？",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#3085d6",
        cancelButtonColor: "#d33",
        confirmButtonText: "確認恢復權限",
        cancelButtonText: "取消"
    }).then(function(result){
        if(result.isConfirmed){
            $.ajax({
                method:"GET",
                url:"/MountainExploer.com/back/member/memberRecoverAction",
                data:{reSeqno:reSeqno},
                dataType:"json",
                success:function(data){
                    if(data){
                        Swal.fire(
                            "該會員已恢復權限"
                        ).then(function(){
                            window.location.reload();
                        })
                    }else{
                        Swal.fire(
                            "恢復權限程序出錯"
                        ).then(function(){
                            window.location.reload();
                        })
                    }
                }
            })
        }

        if(result.isDismissed){
            
        }
    })
})

//詳細資料閱覽
$(".allMember").on("click", ".sgInfo", function(){
    let sgSeqno = $(this).prev(".sgSeqno").val();

    $.ajax({
        method:"GET",
        url:"/MountainExploer.com/back/member/memberInfoBackListAction",
        data:{sgSeqno:sgSeqno},
        dataType:"json",
        success:function(mbList){
            $.each(mbList, function(index, item){
                if(mbList != null){
                    if(item.memberStatus.seqno == 100 || item.memberStatus.seqno == 110 || item.memberStatus.seqno == 120 || item.memberStatus.seqno == 130 || item.memberStatus.seqno == 140 || item.memberStatus.seqno == 150){

                        let seqno = item.seqno;

                        let ncName = item.memberInfo.neck_name;
                        if(ncName == null){
                            var ncInfo = "尚未填寫"
                        }else{
                            var ncInfo = ncName;
                        }

                        let phone = item.memberInfo.phone;
                        if(phone == null){
                            var phInfo = "尚未填寫";
                        }else{
                            var phInfo = phone;
                        }

                        let gender = item.memberInfo.gender;
                        if(gender == "male"){
                            var genderInfo = "男";
                        }else if(gender == "female"){
                            var genderInfo = "女";
                        }else if(gender == "x"){
                            var genderInfo = "X";
                        }else if(gender == "mask"){
                            var genderInfo = "不透露";
                        }else if(gender == null){
                            var genderInfo = "尚未填寫";
                        }
                        
                        let reDate = new Date(item.reg_Date);
                        let reInfo = getFormattedDate(reDate);


                        let birDate = item.memberInfo.birthday;
                        if(birDate == null){
                            var birInfo = "尚未填寫";
                        }else{
                            let birTurn = new Date(item.memberInfo.birthday);
                            var birInfo = getFormattedDate(birTurn);
                        }

                        let imgMb = item.memberInfo.img_name;
                        if(imgMb == null){
                            var imgInfo = "/MountainExploer.com/images/preset.png";
                        }else{
                            var imgInfo = "/MountainExploer.com/member/showUserImg?seqno=" + seqno;
                        }

                        let exp = item.memberInfo.climb_ex;
                        if(exp == null){
                            var expInfo = "尚未填寫";
                        }else{
                            var expInfo = exp;
                        }


                        $.ajax({
                            method:"GET",
                            url:"/MountainExploer.com/member/memberOther",
                            data:{seqno:seqno},
                            contentType:"application/json; charset=UTF-8",
                            dataType:"json",
                            success:function(otherLs){
                                if(otherLs != null){
                                    $("#page-top").find(".other").text(otherLs);
                                }
                            }
            
                        })


                        Swal.fire({
                            title: "會員編號" + item.seqno + "的會員資料",
                            html:`<div>
                                    <div>
                                        <label>會員編號：</label>
                                        <span name="seqno" class="seqno">` + seqno + `</span>
                                        <br/>
                                        <label style="margin-left:10px">帳號：</label>
                                        <span name="account" class="account">` + item.account + `</span>
                                    </div>
                                    
                                    <div>
                                        <label>姓名：</label>
                                        <span name="name" class="name">` + item.name + `</span>
                                        <br/>   
                                        <label  style="margin-left:10px">暱稱：</label>
                                        <span name="ncName" class="ncName">` + ncInfo + `</span>
                                    </div>

                                    <div>
                                        <label>身分組：</label>
                                        <span name="statusId" class="statusId">` + item.memberStatus.name + `</span>
                                        <br/>
                                        <label>Email：</label>
                                        <span name="email" class="email">` + item.email + `</span>
                                    </div>

                                    <div>
                                        <label>手機：</label>
                                        <span name="phone" class="phone">` + phInfo + `</span>
                                        <br/>
                                        <label>性別：</label>
                                        <span name="gender" class="gender">` + genderInfo + `</span>
                                    </div>

                                    <div>
                                        <label>生日：</label>
                                        <span name="birthday" class="birthday">` + birInfo + `</span>
                                        <br/>
                                        <label style="margin-left:10px">註冊日期：</label>
                                        <span name="rgDate" class="rgDate">` + reInfo + `</span>
                                    </div>

                                    <div>
                                        <label>登山經驗：</label>
                                        <span name="exp" class="exp">` + expInfo + `</span>
                                        <br/>
                                        <label>個人簡介：</label>
                                        <span name="other" class="other" value="尚未填寫"></span>
                                    </div>
                                    <br/>
                                    
                                    <img style="width:300px;height:300px;" src="` + imgInfo + `">
                                    <br/>
                                    </div>` 
                        })
                    }
                }
            })
        }
    })
})


//修改資料
$(".allMember").on("click", ".chInfo", function(){
    let chInfo = $(this).siblings(".sgSeqno").val();

    $.ajax({
        method:"GET",
        url:"/MountainExploer.com/back/member/memberInfoBackListAction",
        data:{sgSeqno:chInfo},
        dataType:"json",
        success:function(mbList){
            $.each(mbList, function(index, item){
                let itNm = item.name;
                if(itNm == ""){
                    var itupNm = "尚未填入";
                }else{
                    var itupNm = itNm;
                }

                let itNc = item.memberInfo.neck_name;
                if(itNc == null){
                    var itupNc = "尚未填入";
                }else{
                    var itupNc = itNc;
                }

                let itPh = item.memberInfo.phone;
                if(itPh == null){
                    var itupPh = "尚未填入";
                }else{
                    var itupPh = itPh;
                }
                    Swal.fire({
                        title: "會員編號" + item.seqno + "的會員資料",
                        html:`<div>
                                <form id="upForm" action="/MountainExploer.com/back/member/updateInfoBack" method="POST">
                                <label>會員編號：</label>
                                <strong>` + item.seqno + `</strong>
                                <input type="hidden" name="seqno" class="seqno" value="` + item.seqno + `">
                                <br/>
                                <br/>

                                <label>帳號：</label>
                                <strong type="text" name="account" class="account">` + item.account + `</strong>
                                <br/>
                                <br/>

                                <strong>姓名：</strong>
                                <input type="text" name="name" class="name" value="` + itupNm + `">
                                <br/>
                                <br/>

                                <strong>暱稱：</strong>
                                <input type="text" name="ncName" class="ncName" value="` + itupNc + `">
                                <br/>
                                <br/>

                                <strong>Email：</strong>
                                <input type="text" name="email" class="email" value="` + item.email + `">
                                <br/>
                                <br/>

                                <strong>手機：</strong>
                                <input type="text" name="phone" class="phone" value="` + itupPh + `">
                                <br/>
                                </form>
                                </div>`,
                        showCancelButton: true,
                        confirmButtonColor: "#3085d6",
                        cancelButtonColor: "#d33",
                        confirmButtonText: "修改會員資料",
                        cancelButtonText: "取消"
                    }).then(function(result){
                        if(result.isConfirmed){
                            $("#upForm").submit();        
                            Swal.fire(
                                "會員資料修改成功"
                            )
                        }

                        if(result.isDismissed){
                            // window.location.reload();
                        }
                    })
                
            })

        }
    })
})


//更變身份組
$(".allMember").on("click", ".chGroup", function(){
    let seqno = $(this).siblings(".sgSeqno").val();
    (async () => {

        const {value:group} = await Swal.fire({
            title:"選擇身分組",
            input:"select",
            inputOptions:{
                Gm:"一般登山者",
                Um:"未認證登山者",
                Gg:"登山嚮導",
                Ug:"未認證嚮導",
            },
            inputPlaceholder:"身分組",
            showCancelButton:true,
            confirmButtonText:"確認變更",
            cancelButtonText:"取消",
            inputValidator:function(value){
                return new Promise(function(){
                    if(value === "Gm"){
                        let statusId = 100;
                        $.ajax({
                            method:"GET",
                            url:"/MountainExploer.com/back/member/memberChangeGroup",
                            data:{
                                seqno:seqno,
                                statusId:statusId
                            },
                            dataType:"json",
                            success:function(data){
                                if(data){
                                    Swal.fire(
                                        "身分組更變成功"
                                    ).then(function(){
                                        window.location.reload();
                                    })
                                }else{
                                    Swal.fire(
                                        "身分組更變失敗"
                                    )
                                }
                            },
                            error:function(){
                                Swal.fire(
                                    "身分組變更出錯"
                                )
                            }
                        })
    
                    }else if(value === "Um"){
                        let statusId = 110;
                        $.ajax({
                            method:"GET",
                            url:"/MountainExploer.com/back/member/memberChangeGroup",
                            data:{
                                seqno:seqno,
                                statusId:statusId
                            },
                            dataType:"json",
                            success:function(data){
                                if(data){
                                    Swal.fire(
                                        "身分組更變成功"
                                    ).then(function(){
                                        window.location.reload();
                                    })
                                }else{
                                    Swal.fire(
                                        "身分組更變失敗"
                                    )
                                }
                            },
                            error:function(){
                                Swal.fire(
                                    "身分組變更出錯"
                                )
                            }
                        })
    
                    }else if(value === "Gg"){
                        let statusId = 120;
                        $.ajax({
                            method:"GET",
                            url:"/MountainExploer.com/back/member/memberChangeGroup",
                            data:{
                                seqno:seqno,
                                statusId:statusId
                            },
                            dataType:"json",
                            success:function(data){
                                if(data){
                                    Swal.fire(
                                        "身分組更變成功"
                                    ).then(function(){
                                        window.location.reload();
                                    })
                                }else{
                                    Swal.fire(
                                        "身分組更變失敗"
                                    )
                                }
                            },
                            error:function(){
                                Swal.fire(
                                    "身分組變更出錯"
                                )
                            }
                        })
    
                    }else if(value === "Ug"){
                        let statusId = 130;
                        $.ajax({
                            method:"GET",
                            url:"/MountainExploer.com/back/member/memberChangeGroup",
                            data:{
                                seqno:seqno,
                                statusId:statusId
                            },
                            dataType:"json",
                            success:function(data){
                                if(data){
                                    Swal.fire(
                                        "身分組更變成功"
                                    ).then(function(){
                                        window.location.reload();
                                    })
                                }else{
                                    Swal.fire(
                                        "身分組更變失敗"
                                    )
                                }
                            },
                            error:function(){
                                Swal.fire(
                                    "身分組變更出錯"
                                )
                            }
                        })
                    }
                })
            }
        })
    })()
})


//日期轉換
function getFormattedDate(date){
    let year = date.getFullYear();
    let month = (1 + date.getMonth()).toString().padStart(2, "0");
    let day = date.getDate().toString().padStart(2, "0");

    return year + "-" + month + "-" + day;
}


//匯出Json
$("#exporJsonAll").on("click", function(e){
    infoDownload()
    e.preventDefault();
})

function infoDownload(){
    $.ajax({
        method:"GET",
        url:"/MountainExploer.com/back/member/memberListIndexAction",
        dataType:"json",
        success:function(mbList){
            $.each(mbList, function(index, item){
                delete item.password
                delete item.statusId
                
            })
            jsonDownload(mbList, "會員資料");
        },
        error:function(){
            Swal.fire({
                icon:"error",
                title:"下載發生錯誤"
            })
        }
    })
}

function jsonDownload(jsonList, fileName){
    $("<a />", {
        "download":fileName + new Date().toLocaleDateString() + ".json",
        "href": "data:application/json," + encodeURIComponent(JSON.stringify(jsonList))
    }).appendTo("body")
    .click(function(){
        $(this).remove();
    })[0].click()
}


//批量註冊
$(".fakeDate").on("click", function(){
	$.ajax({
		method:"GET",
		url:"/MountainExploer.com/back/member/randomMbDate",
		dataType:"json",
		success:function(data){
			Swal.fire({
				icon:"success",
				title:"資料輸入成功",
				text:"共新增" + data +"筆資料"
			}).then(function(){
				window.location.reload();
			})
		},
		error:function(){
			Swal.fire({
				icon:"error",
				title:"資料輸入失敗"
			})
		}
	})
})

$(".inpAnt").on("click", function(){
	$(".account").val("Asterius298");
})