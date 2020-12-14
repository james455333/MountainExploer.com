$(function(){
    $.ajax({
        method:"GET",
        url:"/MountainExploer.com/back/member/memberListIndexAction",
        dataType:"json",
        success:function(mbList){
            if(mbList != null){
                let $allMember = $("#allMember");
                $.each(mbList, function(index, item){
                    if(item.memberStatus.seqno == 100){
                        let Gm = "一般登山者";
                        
                        $allMember.append(
                            "<tr><td>" + "<form id='banForm' action='/MountainExploer.com/back/member/memberBanAction' method='POST'>" +
                                "<input type='hidden' name='mbBan' class='mbBan' value='" + item.seqno + "'>" +
                                "<button type='button' class='btn btn-danger ban' id='ban'><i class='fa fa-ban'></i>停權</button></td>" + 
                                "</form>"+ 
                            "<td>" + item.seqno + "</td>" + 
                            "<td>" + item.account + "</td>" +
                            "<td>" + item.email + "</td>" + 
                            "<td>" + Gm + "</td>" + 
                            "<td>" + 
                                "<input type='hidden' name='sgSeqno' class='sgSeqno' value='" + item.seqno +"'>" +
                                "<button type='button' id='sgInfo' class='btn btn-info sgInfo'><i class='fa fa-user-circle'></i>詳細資料</button>" + 
                                "<button type='button' style='margin-left:10px' id='chInfo' class='btn btn-secondary chInfo'><i class='fa fa-file-text'></i>修改資料</button></td></tr>"
                        )
                    }else if(item.memberStatus.seqno == 110){
                        let Um = "未認證登山者";
                        $allMember.append(
                            "<tr><td>" + "<form id='banForm' action='/MountainExploer.com/back/member/memberBanAction' method='POST'>" +
                                "<input type='hidden' name='mbBan' class='mbBan' value='" + item.seqno + "'>" +
                                "<button type='button' class='btn btn-danger ban'><i class='fa fa-ban'></i>停權</button></td>" + 
                                "</form>" + 
                            "<td>" + item.seqno + "</td>" + 
                            "<td>" + item.account + "</td>" +
                            "<td>" + item.email + "</td>" + 
                            "<td>" + Um + "</td>" + 
                            "<td>" + 
                                "<input type='hidden' name='sgSeqno' class='sgSeqno' value='" + item.seqno +"'>" +
                                "<button type='button' class='btn btn-info sgInfo'><i class='fa fa-user-circle'></i>詳細資料</button>" + 
                                "<button type='button' style='margin-left:10px' id='chInfo' class='btn btn-secondary chInfo'><i class='fa fa-file-text'></i>修改資料</button></td></tr>"
                        )
                    }else if(item.memberStatus.seqno == 120){
                        let Gg = "登山嚮導";
                        $allMember.append(
                            "<tr><td>" + "<form id='banForm' action='/MountainExploer.com/back/member/memberBanAction' method='POST'>" +
                                "<input type='hidden' name='mbBan' class='mbBan' value='" + item.seqno + "'>" +
                                "<button type='button' class='btn btn-danger ban'><i class='fa fa-ban'></i>停權</button></td>" + 
                                "</form>" + 
                            "<td>" + item.seqno + "</td>" + 
                            "<td>" + item.account + "</td>" +
                            "<td>" + item.email + "</td>" + 
                            "<td>" + Gg + "</td>" + 
                            "<td>" + 
                                "<input type='hidden' name='sgSeqno' class='sgSeqno' value='" + item.seqno +"'>" +
                                "<button type='button' class='btn btn-info sgInfo'><i class='fa fa-user-circle'></i>詳細資料</button>" + 
                                "<button type='button' style='margin-left:10px' id='chInfo' class='btn btn-secondary chInfo'><i class='fa fa-file-text'></i>修改資料</button></td></tr>"
                        )
                    }else if(item.memberStatus.seqno == 130){
                        let Ug = "未認證嚮導";
                        $allMember.append(
                            "<tr><td>" + "<form id='banForm' action='/MountainExploer.com/back/member/memberBanAction' method='POST'>" +
                                "<input type='hidden' name='mbBan' class='mbBan' value='" + item.seqno + "'>" +
                                "<button type='button' class='btn btn-danger ban'><i class='fa fa-ban'></i>停權</button></td>" + 
                                "</form>" + 
                            "<td>" + item.seqno + "</td>" + 
                            "<td>" + item.account + "</td>" +
                            "<td>" + item.email + "</td>" + 
                            "<td>" + Ug + "</td>" + 
                            "<td>" + 
                                "<input type='hidden' name='sgSeqno' class='sgSeqno' value='" + item.seqno +"'>" +
                                "<button type='button' class='btn btn-info sgInfo'><i class='fa fa-user-circle'></i>詳細資料</button>" + 
                                "<button type='button' style='margin-left:10px' id='chInfo' class='btn btn-secondary chInfo'><i class='fa fa-file-text'></i>修改資料</button></td></tr>"
                        )
                    }else if(item.memberStatus.seqno == 140){
                        let Sm = "停權登山者";
                        $allMember.append(
                            "<tr><td>" + "<form id='reForm' action='/MountainExploer.com/back/member/memberRecoverAction' method='POST'>" +
                                "<input type='hidden' name='reSeqno' class='reSeqno' value='" + item.seqno +"'>" + 
                                "<button type='button' class='btn btn-warning recover'><i class='fa fa-refresh'></i>復權</button></td>" +
                                "</form>" + 
                            "<td>" + item.seqno + "</td>" + 
                            "<td>" + item.account + "</td>" +
                            "<td>" + item.email + "</td>" + 
                            "<td>" + Sm + "</td>" + 
                            "<td>" + 
                                "<input type='hidden' name='sgSeqno' class='sgSeqno' value='" + item.seqno +"'>" +
                                "<button type='button' class='btn btn-info sgInfo'><i class='fa fa-user-circle'></i>詳細資料</button>" + 
                                "<button type='button' style='margin-left:10px' id='chInfo' class='btn btn-secondary chInfo'><i class='fa fa-file-text'></i>修改資料</button></td></tr>"
                        )
                    }else if(item.memberStatus.seqno == 150){
                        let Sg = "停權嚮導";
                        $allMember.append(
                            "<tr><td>" + "<form id='reForm' action='/MountainExploer.com/back/member/memberRecoverAction' method='POST'>" +
                                "<input type='hidden' name='reSeqno' class='reSeqno' value='" + item.seqno +"'>" + 
                                "<button type='button' class='btn btn-warning recover'><i class='fa fa-refresh'></i>復權</button></td>" +
                                "</form>" + 
                            "<td>" + item.seqno + "</td>" + 
                            "<td>" + item.account + "</td>" +
                            "<td>" + item.email + "</td>" + 
                            "<td>" + Sg + "</td>" + 
                            "<td>" + 
                                "<input type='hidden' name='sgSeqno' class='sgSeqno' value='" + item.seqno +"'>" +
                                "<button type='button' class='btn btn-info sgInfo'><i class='fa fa-user-circle'></i>詳細資料</button>" + 
                                "<button type='button' style='margin-left:10px' id='chInfo' class='btn btn-secondary chInfo'><i class='fa fa-file-text'></i>修改資料</button></td></tr>"
                        )
                    }else if(item.memberStatus.seqno == 160){
                        let admin = "管理者";
                        $allMember.append(
                            "<tr><td><button type='button' class='btn btn-danger disabled'><i class='fa fa-ban'></i>停權</button></td>" + 
                            "<td>" + item.seqno + "</td>" + 
                            "<td>" + item.account + "</td>" +
                            "<td>" + item.email + "</td>" + 
                            "<td>" + admin + "</td>" + 
                            "<td>" + 
                                "<input type='hidden' name='sgSeqno' class='sgSeqno' value='" + item.seqno +"'>" +
                                "<button type='button' class='btn btn-info sgInfo'><i class='fa fa-user-circle'></i>詳細資料</button>" + 
                                "<button type='button' style='margin-left:10px' id='chInfo' class='btn btn-secondary chInfo'><i class='fa fa-file-text'></i>修改資料</button></td></tr>"
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
                    if(item.memberStatus.seqno == 100){
                        let Gm = "一般登山者";
                        
                        $allMember.append(
                            "<tr><td>" + "<form id='banForm' action='/MountainExploer.com/back/member/memberBanAction' method='POST'>" +
                                "<input type='hidden' name='mbBan' class='mbBan' value='" + item.seqno + "'>" +
                                "<button type='button' class='btn btn-danger ban'><i class='fa fa-ban'></i>停權</button></td>" + 
                                "</form>"+ 
                            "<td>" + item.seqno + "</td>" + 
                            "<td>" + item.account + "</td>" +
                            "<td>" + item.email + "</td>" + 
                            "<td>" + Gm + "</td>" + 
                            "<td>" + 
                                "<input type='hidden' name='sgSeqno' class='sgSeqno' value='" + item.seqno +"'>" +
                                "<button type='button' class='btn btn-info sgInfo'><i class='fa fa-user-circle'></i>詳細資料</button>" + 
                                "<button type='button' style='margin-left:10px' id='chInfo' class='btn btn-secondary chInfo'><i class='fa fa-file-text'></i>修改資料</button></td></tr>"
                        )
                    }else if(item.memberStatus.seqno == 110){
                        let Um = "未認證登山者";
                        $allMember.append(
                            "<tr><td>" + "<form id='banForm' action='/MountainExploer.com/back/member/memberBanAction' method='POST'>" +
                                "<input type='hidden' name='mbBan' class='mbBan' value='" + item.seqno + "'>" +
                                "<button type='button' class='btn btn-danger ban'><i class='fa fa-ban'></i>停權</button></td>" + 
                                "</form>" + 
                            "<td>" + item.seqno + "</td>" + 
                            "<td>" + item.account + "</td>" +
                            "<td>" + item.email + "</td>" + 
                            "<td>" + Um + "</td>" + 
                            "<td>" + 
                                "<input type='hidden' name='sgSeqno' class='sgSeqno' value='" + item.seqno +"'>" +
                                "<button type='button' class='btn btn-info sgInfo'><i class='fa fa-user-circle'></i>詳細資料</button>" + 
                                "<button type='button' style='margin-left:10px' id='chInfo' class='btn btn-secondary chInfo'><i class='fa fa-file-text'></i>修改資料</button></td></tr>"
                        )
                    }else if(item.memberStatus.seqno == 120){
                        let Gg = "登山嚮導";
                        $allMember.append(
                            "<tr><td>" + "<form id='banForm' action='/MountainExploer.com/back/member/memberBanAction' method='POST'>" +
                                "<input type='hidden' name='mbBan' class='mbBan' value='" + item.seqno + "'>" +
                                "<button type='button' class='btn btn-danger ban'><i class='fa fa-ban'></i>停權</button></td>" + 
                                "</form>" + 
                            "<td>" + item.seqno + "</td>" + 
                            "<td>" + item.account + "</td>" +
                            "<td>" + item.email + "</td>" + 
                            "<td>" + Gg + "</td>" + 
                            "<td>" + 
                                "<input type='hidden' name='sgSeqno' class='sgSeqno' value='" + item.seqno +"'>" +
                                "<button type='button' class='btn btn-info sgInfo'><i class='fa fa-user-circle'></i>詳細資料</button>" + 
                                "<button type='button' style='margin-left:10px' id='chInfo' class='btn btn-secondary chInfo'><i class='fa fa-file-text'></i>修改資料</button></td></tr>"
                        )
                    }else if(item.memberStatus.seqno == 130){
                        let Ug = "未認證嚮導";
                        $allMember.append(
                            "<tr><td>" + "<form id='banForm' action='/MountainExploer.com/back/member/memberBanAction' method='POST'>" +
                                "<input type='hidden' name='mbBan' class='mbBan' value='" + item.seqno + "'>" +
                                "<button type='button' class='btn btn-danger ban'><i class='fa fa-ban'></i>停權</button></td>" + 
                                "</form>" + 
                            "<td>" + item.seqno + "</td>" + 
                            "<td>" + item.account + "</td>" +
                            "<td>" + item.email + "</td>" + 
                            "<td>" + Ug + "</td>" + 
                            "<td>" + 
                                "<input type='hidden' name='sgSeqno' class='sgSeqno' value='" + item.seqno +"'>" +
                                "<button type='button' class='btn btn-info sgInfo'><i class='fa fa-user-circle'></i>詳細資料</button>" + 
                                "<button type='button' style='margin-left:10px' id='chInfo' class='btn btn-secondary chInfo'><i class='fa fa-file-text'></i>修改資料</button></td></tr>"
                        )
                    }else if(item.memberStatus.seqno == 140){
                        let Sm = "停權登山者";
                        $allMember.append(
                            "<tr><td><button type='button' class='btn btn-warning recover'><i class='fa fa-refresh'></i>復權</button></td>" + 
                            "<td>" + item.seqno + "</td>" + 
                            "<td>" + item.account + "</td>" +
                            "<td>" + item.email + "</td>" + 
                            "<td>" + Sm + "</td>" + 
                            "<td>" + 
                                "<input type='hidden' name='sgSeqno' class='sgSeqno' value='" + item.seqno +"'>" +
                                "<button type='button' class='btn btn-info sgInfo'><i class='fa fa-user-circle'></i>詳細資料</button>" + 
                                "<button type='button' style='margin-left:10px' id='chInfo' class='btn btn-secondary chInfo'><i class='fa fa-file-text'></i>修改資料</button></td></tr>"
                        )
                    }else if(item.memberStatus.seqno == 150){
                        let Sg = "停權嚮導";
                        $allMember.append(
                            "<tr><td><button type='button' class='btn btn-warning recover'><i class='fa fa-refresh'></i>復權</button></td>" + 
                            "<td>" + item.seqno + "</td>" + 
                            "<td>" + item.account + "</td>" +
                            "<td>" + item.email + "</td>" + 
                            "<td>" + Sg + "</td>" + 
                            "<td>" + 
                                "<input type='hidden' name='sgSeqno' class='sgSeqno' value='" + item.seqno +"'>" +
                                "<button type='button' class='btn btn-info sgInfo'><i class='fa fa-user-circle'></i>詳細資料</button>" + 
                                "<button type='button' style='margin-left:10px' id='chInfo' class='btn btn-secondary chInfo'><i class='fa fa-file-text'></i>修改資料</button></td></tr>"
                        )
                    }else if(item.memberStatus.seqno == 160){
                        let admin = "管理者";
                        $allMember.append(
                            "<tr><td><button type='button' class='btn btn-danger disabled'><i class='fa fa-ban'></i>停權</button></td>" + 
                            "<td>" + item.seqno + "</td>" + 
                            "<td>" + item.account + "</td>" +
                            "<td>" + item.email + "</td>" + 
                            "<td>" + admin + "</td>" + 
                            "<td>" + 
                                "<input type='hidden' name='sgSeqno' class='sgSeqno' value='" + item.seqno +"'>" +
                                "<button type='button' class='btn btn-info sgInfo'><i class='fa fa-user-circle'></i>詳細資料</button>" + 
                                "<button type='button' style='margin-left:10px' id='chInfo' class='btn btn-secondary chInfo'><i class='fa fa-file-text'></i>修改資料</button></td></tr>"
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
                    if(item.memberStatus.seqno == 100){
                        let Gm = "一般登山者";
                        
                        $allMember.append(
                            "<tr><td>" + "<form id='banForm' action='/MountainExploer.com/back/member/memberBanAction' method='POST'>" +
                                "<input type='hidden' name='mbBan' class='mbBan' value='" + item.seqno + "'>" +
                                "<button type='button' class='btn btn-danger ban' id='ban'><i class='fa fa-ban'></i>停權</button></td>" + 
                                "</form>"+ 
                            "<td>" + item.seqno + "</td>" + 
                            "<td>" + item.account + "</td>" +
                            "<td>" + item.email + "</td>" + 
                            "<td>" + Gm + "</td>" + 
                            "<td>" + 
                                "<input type='hidden' name='sgSeqno' class='sgSeqno' value='" + item.seqno +"'>" +
                                "<button type='button' class='btn btn-info sgInfo'><i class='fa fa-user-circle'></i>詳細資料</button>" + 
                                "<button type='button' style='margin-left:10px' id='chInfo' class='btn btn-secondary chInfo'><i class='fa fa-file-text'></i>修改資料</button></td></tr>"
                        )
                    }else if(item.memberStatus.seqno == 110){
                        let Um = "未認證登山者";
                        $allMember.append(
                            "<tr><td>" + "<form id='banForm' action='/MountainExploer.com/back/member/memberBanAction' method='POST'>" +
                                "<input type='hidden' name='mbBan' class='mbBan' value='" + item.seqno + "'>" +
                                "<button type='button' class='btn btn-danger ban'><i class='fa fa-ban'></i>停權</button></td>" + 
                                "</form>" + 
                            "<td>" + item.seqno + "</td>" + 
                            "<td>" + item.account + "</td>" +
                            "<td>" + item.email + "</td>" + 
                            "<td>" + Um + "</td>" + 
                            "<td>" + 
                                "<input type='hidden' name='sgSeqno' class='sgSeqno' value='" + item.seqno +"'>" +
                                "<button type='button' class='btn btn-info sgInfo'><i class='fa fa-user-circle'></i>詳細資料</button>" + 
                                "<button type='button' style='margin-left:10px' id='chInfo' class='btn btn-secondary chInfo'><i class='fa fa-file-text'></i>修改資料</button></td></tr>"
                        )
                    }else if(item.memberStatus.seqno == 120){
                        let Gg = "登山嚮導";
                        $allMember.append(
                            "<tr><td>" + "<form id='banForm' action='/MountainExploer.com/back/member/memberBanAction' method='POST'>" +
                                "<input type='hidden' name='mbBan' class='mbBan' value='" + item.seqno + "'>" +
                                "<button type='button' class='btn btn-danger ban'><i class='fa fa-ban'></i>停權</button></td>" + 
                                "</form>" + 
                            "<td>" + item.seqno + "</td>" + 
                            "<td>" + item.account + "</td>" +
                            "<td>" + item.email + "</td>" + 
                            "<td>" + Gg + "</td>" + 
                            "<td>" + 
                                "<input type='hidden' name='sgSeqno' class='sgSeqno' value='" + item.seqno +"'>" +
                                "<button type='button' class='btn btn-info sgInfo'><i class='fa fa-user-circle'></i>詳細資料</button>" + 
                                "<button type='button' style='margin-left:10px' id='chInfo' class='btn btn-secondary chInfo'><i class='fa fa-file-text'></i>修改資料</button></td></tr>"
                        )
                    }else if(item.memberStatus.seqno == 130){
                        let Ug = "未認證嚮導";
                        $allMember.append(
                            "<tr><td>" + "<form id='banForm' action='/MountainExploer.com/back/member/memberBanAction' method='POST'>" +
                                "<input type='hidden' name='mbBan' class='mbBan' value='" + item.seqno + "'>" +
                                "<button type='button' class='btn btn-danger ban'><i class='fa fa-ban'></i>停權</button></td>" + 
                                "</form>" + 
                            "<td>" + item.seqno + "</td>" + 
                            "<td>" + item.account + "</td>" +
                            "<td>" + item.email + "</td>" + 
                            "<td>" + Ug + "</td>" + 
                            "<td>" + 
                                "<input type='hidden' name='sgSeqno' class='sgSeqno' value='" + item.seqno +"'>" +
                                "<button type='button' class='btn btn-info sgInfo'><i class='fa fa-user-circle'></i>詳細資料</button>" + 
                                "<button type='button' style='margin-left:10px' id='chInfo' class='btn btn-secondary chInfo'><i class='fa fa-file-text'></i>修改資料</button></td></tr>"
                        )
                    }else if(item.memberStatus.seqno == 140){
                        let Sm = "停權登山者";
                        $allMember.append(
                            "<tr><td>" + "<form id='reForm' action='/MountainExploer.com/back/member/memberRecoverAction' method='POST'>" +
                                "<input type='hidden' name='reSeqno' class='reSeqno' value='" + item.seqno +"'>" + 
                                "<button type='button' class='btn btn-warning recover'><i class='fa fa-refresh'></i>復權</button></td>" +
                                "</form>" + 
                            "<td>" + item.seqno + "</td>" + 
                            "<td>" + item.account + "</td>" +
                            "<td>" + item.email + "</td>" + 
                            "<td>" + Sm + "</td>" + 
                            "<td>" + 
                                "<input type='hidden' name='sgSeqno' class='sgSeqno' value='" + item.seqno +"'>" +
                                "<button type='button' class='btn btn-info sgInfo'><i class='fa fa-user-circle'></i>詳細資料</button>" + 
                                "<button type='button' style='margin-left:10px' id='chInfo' class='btn btn-secondary chInfo'><i class='fa fa-file-text'></i>修改資料</button></td></tr>"
                        )
                    }else if(item.memberStatus.seqno == 150){
                        let Sg = "停權嚮導";
                        $allMember.append(
                            "<tr><td>" + "<form id='reForm' action='/MountainExploer.com/back/member/memberRecoverAction' method='POST'>" +
                                "<input type='hidden' name='reSeqno' class='reSeqno' value='" + item.seqno +"'>" + 
                                "<button type='button' class='btn btn-warning recover'><i class='fa fa-refresh'></i>復權</button></td>" +
                                "</form>" + 
                            "<td>" + item.seqno + "</td>" + 
                            "<td>" + item.account + "</td>" +
                            "<td>" + item.email + "</td>" + 
                            "<td>" + Sg + "</td>" + 
                            "<td>" + 
                                "<input type='hidden' name='sgSeqno' class='sgSeqno' value='" + item.seqno +"'>" +
                                "<button type='button' class='btn btn-info sgInfo'><i class='fa fa-user-circle'></i>詳細資料</button>" + 
                                "<button type='button' style='margin-left:10px' id='chInfo' class='btn btn-secondary chInfo'><i class='fa fa-file-text'></i>修改資料</button></td></tr>"
                        )
                    }else if(item.memberStatus.seqno == 160){
                        let admin = "管理者";
                        $allMember.append(
                            "<tr><td><button type='button' class='btn btn-danger disabled'><i class='fa fa-ban'></i>停權</button></td>" + 
                            "<td>" + item.seqno + "</td>" + 
                            "<td>" + item.account + "</td>" +
                            "<td>" + item.email + "</td>" + 
                            "<td>" + admin + "</td>" + 
                            "<td>" + 
                                "<input type='hidden' name='sgSeqno' class='sgSeqno' value='" + item.seqno +"'>" +
                                "<button type='button' class='btn btn-info sgInfo'><i class='fa fa-user-circle'></i>詳細資料</button>" + 
                                "<button type='button' style='margin-left:10px' id='chInfo' class='btn btn-secondary chInfo'><i class='fa fa-file-text'></i>修改資料</button></td></tr>"
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
                    let Gm = "一般登山者"; 
                    $allMember.append(
                        "<tr><td>" + "<form id='banForm' action='/MountainExploer.com/back/member/memberBanAction' method='POST'>" +
                                "<input type='hidden' name='mbBan' class='mbBan' value='" + item.seqno + "'>" +
                                "<button type='button' class='btn btn-danger ban'><i class='fa fa-ban'></i>停權</button></td>" + 
                                "</form>"+ 
                            "<td>" + item.seqno + "</td>" + 
                            "<td>" + item.account + "</td>" +
                            "<td>" + item.email + "</td>" + 
                            "<td>" + Gm + "</td>" + 
                            "<td>" + 
                                "<input type='hidden' name='sgSeqno' class='sgSeqno' value='" + item.seqno +"'>" +
                                "<button type='button' class='btn btn-info sgInfo'><i class='fa fa-user-circle'></i>詳細資料</button>" + 
                                "<button type='button' style='margin-left:10px' id='chInfo' class='btn btn-secondary chInfo'><i class='fa fa-file-text'></i>修改資料</button></td></tr>"
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
                    let Gg = "登山嚮導";
                    $allMember.append(
                        "<tr><td>" + "<form id='banForm' action='/MountainExploer.com/back/member/memberBanAction' method='POST'>" +
                            "<input type='hidden' name='mbBan' class='mbBan' value='" + item.seqno + "'>" +
                            "<button type='button' class='btn btn-danger ban'><i class='fa fa-ban'></i>停權</button></td>" + 
                            "</form>" + 
                        "<td>" + item.seqno + "</td>" + 
                        "<td>" + item.account + "</td>" +
                        "<td>" + item.email + "</td>" + 
                        "<td>" + Gg + "</td>" + 
                        "<td>" + 
                            "<input type='hidden' name='sgSeqno' class='sgSeqno' value='" + item.seqno +"'>" +
                            "<button type='button' class='btn btn-info sgInfo'><i class='fa fa-user-circle'></i>詳細資料</button>" + 
                            "<button type='button' style='margin-left:10px' id='chInfo' class='btn btn-secondary chInfo'><i class='fa fa-file-text'></i>修改資料</button></td></tr>"
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
                    let Um = "未認證登山者";
                        $allMember.append(
                            "<tr><td>" + "<form id='banForm' action='/MountainExploer.com/back/member/memberBanAction' method='POST'>" +
                                "<input type='hidden' name='mbBan' class='mbBan' value='" + item.seqno + "'>" +
                                "<button type='button' class='btn btn-danger ban'><i class='fa fa-ban'></i>停權</button></td>" + 
                                "</form>" + 
                            "<td>" + item.seqno + "</td>" + 
                            "<td>" + item.account + "</td>" +
                            "<td>" + item.email + "</td>" + 
                            "<td>" + Um + "</td>" + 
                            "<td>" + 
                                "<input type='hidden' name='sgSeqno' class='sgSeqno' value='" + item.seqno +"'>" +
                                "<button type='button' class='btn btn-info sgInfo'><i class='fa fa-user-circle'></i>詳細資料</button>" + 
                                "<button type='button' style='margin-left:10px' id='chInfo' class='btn btn-secondary chInfo'><i class='fa fa-file-text'></i>修改資料</button></td></tr>"
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
                            "<tr><td>" + "<form id='banForm' action='/MountainExploer.com/back/member/memberBanAction' method='POST'>" +
                                "<input type='hidden' name='mbBan' class='mbBan' value='" + item.seqno + "'>" +
                                "<button type='button' class='btn btn-danger ban'><i class='fa fa-ban'></i>停權</button></td>" + 
                                "</form>" + 
                            "<td>" + item.seqno + "</td>" + 
                            "<td>" + item.account + "</td>" +
                            "<td>" + item.email + "</td>" + 
                            "<td>" + Ug + "</td>" + 
                            "<td>" + 
                                "<input type='hidden' name='sgSeqno' class='sgSeqno' value='" + item.seqno +"'>" +
                                "<button type='button' class='btn btn-info sgInfo'><i class='fa fa-user-circle'></i>詳細資料</button>" + 
                                "<button type='button' style='margin-left:10px' id='chInfo' class='btn btn-secondary chInfo'><i class='fa fa-file-text'></i>修改資料</button></td></tr>"
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
                    let Sm = "停權登山者";
                        $allMember.append(
                            "<tr><td>" + "<form id='reForm' action='/MountainExploer.com/back/member/memberRecoverAction' method='POST'>" +
                                "<input type='hidden' name='reSeqno' class='reSeqno' value='" + item.seqno +"'>" + 
                                "<button type='button' class='btn btn-warning recover'><i class='fa fa-refresh'></i>復權</button></td>" +
                                "</form>" + 
                            "<td>" + item.seqno + "</td>" + 
                            "<td>" + item.account + "</td>" +
                            "<td>" + item.email + "</td>" + 
                            "<td>" + Sm + "</td>" + 
                            "<td>" + 
                                "<input type='hidden' name='sgSeqno' class='sgSeqno' value='" + item.seqno +"'>" +
                                "<button type='button' class='btn btn-info sgInfo'><i class='fa fa-user-circle'></i>詳細資料</button>" + 
                                "<button type='button' style='margin-left:10px' id='chInfo' class='btn btn-secondary chInfo'><i class='fa fa-file-text'></i>修改資料</button></td></tr>"
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
                            "<tr><td>" + "<form id='reForm' action='/MountainExploer.com/back/member/memberRecoverAction' method='POST'>" +
                                "<input type='hidden' name='reSeqno' class='reSeqno' value='" + item.seqno +"'>" + 
                                "<button type='button' class='btn btn-warning recover'><i class='fa fa-refresh'></i>復權</button></td>" +
                                "</form>" + 
                            "<td>" + item.seqno + "</td>" + 
                            "<td>" + item.account + "</td>" +
                            "<td>" + item.email + "</td>" + 
                            "<td>" + Sg + "</td>" + 
                            "<td>" + 
                                "<input type='hidden' name='sgSeqno' class='sgSeqno' value='" + item.seqno +"'>" +
                                "<button type='button' class='btn btn-info sgInfo'><i class='fa fa-user-circle'></i>詳細資料</button>" + 
                                "<button type='button' style='margin-left:10px' id='chInfo' class='btn btn-secondary chInfo'><i class='fa fa-file-text'></i>修改資料</button></td></tr>"
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
                    let admin = "管理者";
                    $allMember.append(
                        "<tr><td><button type='button' class='btn btn-danger disabled'><i class='fa fa-ban'></i>停權</button></td>" + 
                        "<td>" + item.seqno + "</td>" + 
                        "<td>" + item.account + "</td>" +
                        "<td>" + item.email + "</td>" + 
                        "<td>" + admin + "</td>" + 
                        "<td>" + 
                            "<input type='hidden' name='sgSeqno' class='sgSeqno' value='" + item.seqno +"'>" +
                            "<button type='button' class='btn btn-info sgInfo'><i class='fa fa-user-circle'></i>詳細資料</button>" + 
                            "<button type='button' style='margin-left:10px' id='chInfo' class='btn btn-secondary chInfo'><i class='fa fa-file-text'></i>修改資料</button></td></tr>"
                    )
                }

            })
        }
    }) 
})


//停權
$(".allMember").on("click", ".ban", function(){
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
            Swal.fire(
                "該會員已停權"
            ).then(function(){
                $("#banForm").submit();
            })
        }

        if(result.isDismissed){
            
        }
    })
})


//復權
$(".allMember").on("click", ".recover", function(){
    Swal.fire({
        title: "確定要恢復此會員的權限？",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#3085d6",
        cancelButtonColor: "#d33",
        confirmButtonText: "確認復權",
        cancelButtonText: "取消"
    }).then(function(result){
        if(result.isConfirmed){
            Swal.fire(
                "該會員已復權"
            ).then(function(){
                $("#reForm").submit();
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
                    if(item.memberStatus.seqno == 100){
                        let Gm = "一般登山者";
                        let reDate = new Date(item.reg_Date);
                        let birDate = item.memberInfo.birthday;
                        if(birDate == ""){
                            birDate = "尚未填寫";
                        }else{
                            birDate = new Date(item.memberInfo.birthday);
                        }

                        let imgMb = item.memberInfo.img_name;
                        if(imgMb == ""){
                            let imgMb = "preset.png";
                        }
                        Swal.fire({
                            title: "會員編號" + item.seqno + "的會員資料",
                            html:`<div>
                                    <label>會員編號：</label>
                                    <input type="text" name="seqno" class="swal2-input seqno" value="` + item.seqno + `" readonly>
                                    <br/>
                                    <label>帳號：</label>
                                    <input type="text" name="account" class="swal2-input account" value="` + item.account + `" readonly>
                                    <br/>
                                    <label>姓名：</label>
                                    <input type="text" name="name" class="swal2-input name" value="` + item.name + `" readonly>
                                    <br/>
                                    <label>暱稱：</label>
                                    <input type="text" name="ncName" class="swal2-input ncName" value="` + item.memberInfo.neck_name + `" readonly>
                                    <br/>
                                    <label>身分組：</label>
                                    <input type="text" name="statusId" class="swal2-input statusId" value="` + Gm + `" readonly>
                                    <br/>
                                    <label>Email：</label>
                                    <input type="text" name="email" class="swal2-input email" value="` + item.email + `" readonly>
                                    <br/>
                                    <label>手機：</label>
                                    <input type="text" name="phone" class="swal2-input phone" value="` + item.memberInfo.phone + `" readonly>
                                    <br/>
                                    <label>性別：</label>
                                    <input type="text" name="gender" class="swal2-input gender" value="` + item.memberInfo.gender + `" readonly>
                                    <br/>
                                    <label>生日：</label>
                                    <input type="text" name="birthday" class="swal2-input birthday" value="` + birDate + `" readonly>
                                    <br/>
                                    <label>註冊日期：</label>
                                    <input type="text" name="rgDate" class="swal2-input rgDate" value="` + reDate + `" readonly>
                                    <br/>
                                    <label>登山經驗：</label>
                                    <input type="text" name="exp" class="swal2-input exp" value="` + item.memberInfo.climb_ex + `" readonly>
                                    <br/>
                                    <label>個人簡介：</label>
                                    <input type="text" name="other" class="swal2-input other" value="` + item.memberInfo.other + `" readonly>
                                    <br/>
                                    <label>頭貼：</label>
                                    <img src="/MountainExploer.com/images/` + imgMb + `">
                                    <br/>
                                    </div>` 
                        })
                    }else if(item.memberStatus.seqno == 110){
                        let Um = "未認證登山者";
                        let reDate = new Date(item.reg_Date);
                        let birDate = item.memberInfo.birthday;
                        if(birDate == ""){
                            birDate = "尚未填寫";
                        }else{
                            birDate = new Date(item.memberInfo.birthday);
                        }
                        
                        let imgMb = item.memberInfo.img_name;
                        if(imgMb == ""){
                            let imgMb = "preset.png";
                        }
                        Swal.fire({
                            title: "會員編號" + item.seqno + "的會員資料",
                            html:`<div>
                                    <label>會員編號：</label>
                                    <input type="text" name="seqno" class="swal2-input seqno" value="` + item.seqno + `" readonly>
                                    <br/>
                                    <label>帳號：</label>
                                    <input type="text" name="account" class="swal2-input account" value="` + item.account + `" readonly>
                                    <br/>
                                    <label>姓名：</label>
                                    <input type="text" name="name" class="swal2-input name" value="` + item.name + `" readonly>
                                    <br/>
                                    <label>暱稱：</label>
                                    <input type="text" name="ncName" class="swal2-input ncName" value="` + item.memberInfo.neck_name + `" readonly>
                                    <br/>
                                    <label>身分組：</label>
                                    <input type="text" name="statusId" class="swal2-input statusId" value="` + Um + `" readonly>
                                    <br/>
                                    <label>Email：</label>
                                    <input type="text" name="email" class="swal2-input email" value="` + item.email + `" readonly>
                                    <br/>
                                    <label>手機：</label>
                                    <input type="text" name="phone" class="swal2-input phone" value="` + item.memberInfo.phone + `" readonly>
                                    <br/>
                                    <label>性別：</label>
                                    <input type="text" name="gender" class="swal2-input gender" value="` + item.memberInfo.gender + `" readonly>
                                    <br/>
                                    <label>生日：</label>
                                    <input type="text" name="birthday" class="swal2-input birthday" value="` + birDate + `" readonly>
                                    <br/>
                                    <label>註冊日期：</label>
                                    <input type="text" name="rgDate" class="swal2-input rgDate" value="` + reDate + `" readonly>
                                    <br/>
                                    <label>登山經驗：</label>
                                    <input type="text" name="exp" class="swal2-input exp" value="` + item.memberInfo.climb_ex + `" readonly>
                                    <br/>
                                    <label>個人簡介：</label>
                                    <input type="text" name="other" class="swal2-input other" value="` + item.memberInfo.other + `" readonly>
                                    <br/>
                                    <label>頭貼：</label>
                                    <img src="/MountainExploer.com/images/` + imgMb + `">
                                    <br/>
                                    </div>` 
                        })

                    }else if(item.memberStatus.seqno == 120){
                        let Gg = "登山嚮導";
                        let reDate = new Date(item.reg_Date);
                        let birDate = item.memberInfo.birthday;
                        if(birDate == ""){
                            birDate = "尚未填寫";
                        }else{
                            birDate = new Date(item.memberInfo.birthday);
                        }
                        
                        let imgMb = item.memberInfo.img_name;
                        if(imgMb == ""){
                            let imgMb = "preset.png";
                        }
                        Swal.fire({
                            title: "會員編號" + item.seqno + "的會員資料",
                            html:`<div>
                                    <label>會員編號：</label>
                                    <input type="text" name="seqno" class="swal2-input seqno" value="` + item.seqno + `" readonly>
                                    <br/>
                                    <label>帳號：</label>
                                    <input type="text" name="account" class="swal2-input account" value="` + item.account + `" readonly>
                                    <br/>
                                    <label>姓名：</label>
                                    <input type="text" name="name" class="swal2-input name" value="` + item.name + `" readonly>
                                    <br/>
                                    <label>暱稱：</label>
                                    <input type="text" name="ncName" class="swal2-input ncName" value="` + item.memberInfo.neck_name + `" readonly>
                                    <br/>
                                    <label>身分組：</label>
                                    <input type="text" name="statusId" class="swal2-input statusId" value="` + Gg + `" readonly>
                                    <br/>
                                    <label>Email：</label>
                                    <input type="text" name="email" class="swal2-input email" value="` + item.email + `" readonly>
                                    <br/>
                                    <label>手機：</label>
                                    <input type="text" name="phone" class="swal2-input phone" value="` + item.memberInfo.phone + `" readonly>
                                    <br/>
                                    <label>性別：</label>
                                    <input type="text" name="gender" class="swal2-input gender" value="` + item.memberInfo.gender + `" readonly>
                                    <br/>
                                    <label>生日：</label>
                                    <input type="text" name="birthday" class="swal2-input birthday" value="` + birDate + `" readonly>
                                    <br/>
                                    <label>註冊日期：</label>
                                    <input type="text" name="rgDate" class="swal2-input rgDate" value="` + reDate + `" readonly>
                                    <br/>
                                    <label>登山經驗：</label>
                                    <input type="text" name="exp" class="swal2-input exp" value="` + item.memberInfo.climb_ex + `" readonly>
                                    <br/>
                                    <label>個人簡介：</label>
                                    <input type="text" name="other" class="swal2-input other" value="` + item.memberInfo.other + `" readonly>
                                    <br/>
                                    <label>頭貼：</label>
                                    <img src="/MountainExploer.com/images/` + imgMb + `">
                                    <br/>
                                    </div>` 
                        })

                    }else if(item.memberStatus.seqno == 130){
                        let Ug = "未認證登山嚮導";
                        let reDate = new Date(item.reg_Date);
                        let birDate = item.memberInfo.birthday;
                        if(birDate == ""){
                            birDate = "尚未填寫";
                        }else{
                            birDate = new Date(item.memberInfo.birthday);
                        }
                        
                        let imgMb = item.memberInfo.img_name;
                        if(imgMb == ""){
                            let imgMb = "preset.png";
                        }
                        Swal.fire({
                            title: "會員編號" + item.seqno + "的會員資料",
                            html:`<div>
                                    <label>會員編號：</label>
                                    <input type="text" name="seqno" class="swal2-input seqno" value="` + item.seqno + `" readonly>
                                    <br/>
                                    <label>帳號：</label>
                                    <input type="text" name="account" class="swal2-input account" value="` + item.account + `" readonly>
                                    <br/>
                                    <label>姓名：</label>
                                    <input type="text" name="name" class="swal2-input name" value="` + item.name + `" readonly>
                                    <br/>
                                    <label>暱稱：</label>
                                    <input type="text" name="ncName" class="swal2-input ncName" value="` + item.memberInfo.neck_name + `" readonly>
                                    <br/>
                                    <label>身分組：</label>
                                    <input type="text" name="statusId" class="swal2-input statusId" value="` + Ug + `" readonly>
                                    <br/>
                                    <label>Email：</label>
                                    <input type="text" name="email" class="swal2-input email" value="` + item.email + `" readonly>
                                    <br/>
                                    <label>手機：</label>
                                    <input type="text" name="phone" class="swal2-input phone" value="` + item.memberInfo.phone + `" readonly>
                                    <br/>
                                    <label>性別：</label>
                                    <input type="text" name="gender" class="swal2-input gender" value="` + item.memberInfo.gender + `" readonly>
                                    <br/>
                                    <label>生日：</label>
                                    <input type="text" name="birthday" class="swal2-input birthday" value="` + birDate + `" readonly>
                                    <br/>
                                    <label>註冊日期：</label>
                                    <input type="text" name="rgDate" class="swal2-input rgDate" value="` + reDate + `" readonly>
                                    <br/>
                                    <label>登山經驗：</label>
                                    <input type="text" name="exp" class="swal2-input exp" value="` + item.memberInfo.climb_ex + `" readonly>
                                    <br/>
                                    <label>個人簡介：</label>
                                    <input type="text" name="other" class="swal2-input other" value="` + item.memberInfo.other + `" readonly>
                                    <br/>
                                    <label>頭貼：</label>
                                    <img src="/MountainExploer.com/images/` + imgMb + `">
                                    <br/>
                                    </div>` 
                        })

                    }else if(item.memberStatus.seqno == 140){
                        let Sm = "已停權登山者";
                        let reDate = new Date(item.reg_Date);
                        let birDate = item.memberInfo.birthday;
                        if(birDate == ""){
                            birDate = "尚未填寫";
                        }else{
                            birDate = new Date(item.memberInfo.birthday);
                        }
                        
                        let imgMb = item.memberInfo.img_name;
                        if(imgMb == ""){
                            let imgMb = "preset.png";
                        }
                        Swal.fire({
                            title: "會員編號" + item.seqno + "的會員資料",
                            html:`<div>
                                    <label>會員編號：</label>
                                    <input type="text" name="seqno" class="swal2-input seqno" value="` + item.seqno + `" readonly>
                                    <br/>
                                    <label>帳號：</label>
                                    <input type="text" name="account" class="swal2-input account" value="` + item.account + `" readonly>
                                    <br/>
                                    <label>姓名：</label>
                                    <input type="text" name="name" class="swal2-input name" value="` + item.name + `" readonly>
                                    <br/>
                                    <label>暱稱：</label>
                                    <input type="text" name="ncName" class="swal2-input ncName" value="` + item.memberInfo.neck_name + `" readonly>
                                    <br/>
                                    <label>身分組：</label>
                                    <input type="text" name="statusId" class="swal2-input statusId" value="` + Sm + `" readonly>
                                    <br/>
                                    <label>Email：</label>
                                    <input type="text" name="email" class="swal2-input email" value="` + item.email + `" readonly>
                                    <br/>
                                    <label>手機：</label>
                                    <input type="text" name="phone" class="swal2-input phone" value="` + item.memberInfo.phone + `" readonly>
                                    <br/>
                                    <label>性別：</label>
                                    <input type="text" name="gender" class="swal2-input gender" value="` + item.memberInfo.gender + `" readonly>
                                    <br/>
                                    <label>生日：</label>
                                    <input type="text" name="birthday" class="swal2-input birthday" value="` + birDate + `" readonly>
                                    <br/>
                                    <label>註冊日期：</label>
                                    <input type="text" name="rgDate" class="swal2-input rgDate" value="` + reDate + `" readonly>
                                    <br/>
                                    <label>登山經驗：</label>
                                    <input type="text" name="exp" class="swal2-input exp" value="` + item.memberInfo.climb_ex + `" readonly>
                                    <br/>
                                    <label>個人簡介：</label>
                                    <input type="text" name="other" class="swal2-input other" value="` + item.memberInfo.other + `" readonly>
                                    <br/>
                                    <label>頭貼：</label>
                                    <img src="/MountainExploer.com/images/` + imgMb + `">
                                    <br/>
                                    </div>` 
                        })

                    }else if(item.memberStatus.seqno == 150){
                        let Sg = "已停權嚮導";
                        let reDate = new Date(item.reg_Date);
                        let birDate = item.memberInfo.birthday;
                        if(birDate == ""){
                            birDate = "尚未填寫";
                        }else{
                            birDate = new Date(item.memberInfo.birthday);
                        }
                        
                        let imgMb = item.memberInfo.img_name;
                        if(imgMb == ""){
                            let imgMb = "preset.png";
                        }
                        Swal.fire({
                            title: "會員編號" + item.seqno + "的會員資料",
                            html:`<div>
                                    <label>會員編號：</label>
                                    <input type="text" name="seqno" class="swal2-input seqno" value="` + item.seqno + `" readonly>
                                    <br/>
                                    <label>帳號：</label>
                                    <input type="text" name="account" class="swal2-input account" value="` + item.account + `" readonly>
                                    <br/>
                                    <label>姓名：</label>
                                    <input type="text" name="name" class="swal2-input name" value="` + item.name + `" readonly>
                                    <br/>
                                    <label>暱稱：</label>
                                    <input type="text" name="ncName" class="swal2-input ncName" value="` + item.memberInfo.neck_name + `" readonly>
                                    <br/>
                                    <label>身分組：</label>
                                    <input type="text" name="statusId" class="swal2-input statusId" value="` + Sg + `" readonly>
                                    <br/>
                                    <label>Email：</label>
                                    <input type="text" name="email" class="swal2-input email" value="` + item.email + `" readonly>
                                    <br/>
                                    <label>手機：</label>
                                    <input type="text" name="phone" class="swal2-input phone" value="` + item.memberInfo.phone + `" readonly>
                                    <br/>
                                    <label>性別：</label>
                                    <input type="text" name="gender" class="swal2-input gender" value="` + item.memberInfo.gender + `" readonly>
                                    <br/>
                                    <label>生日：</label>
                                    <input type="text" name="birthday" class="swal2-input birthday" value="` + birDate + `" readonly>
                                    <br/>
                                    <label>註冊日期：</label>
                                    <input type="text" name="rgDate" class="swal2-input rgDate" value="` + reDate + `" readonly>
                                    <br/>
                                    <label>登山經驗：</label>
                                    <input type="text" name="exp" class="swal2-input exp" value="` + item.memberInfo.climb_ex + `" readonly>
                                    <br/>
                                    <label>個人簡介：</label>
                                    <input type="text" name="other" class="swal2-input other" value="` + item.memberInfo.other + `" readonly>
                                    <br/>
                                    <label>頭貼：</label>
                                    <img src="/MountainExploer.com/images/` + imgMb + `">
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
                if(item.memberStatus.seqno == 100){
                    Swal.fire({
                        title: "會員編號" + item.seqno + "的會員資料",
                        html:`<div>
                                <form id="upForm" action="/MountainExploer.com/back/member/updateInfoBack" method="POST">
                                <label>會員編號：</label>
                                <input type="text" name="seqno" class="swal2-input seqno" value="` + item.seqno + `" readonly>
                                <br/>
                                <label>帳號：</label>
                                <input type="text" name="account" class="swal2-input account" value="` + item.account + `" readonly>
                                <br/>
                                <label>姓名：</label>
                                <input type="text" name="name" class="swal2-input name" value="` + item.name + `">
                                <br/>
                                <label>暱稱：</label>
                                <input type="text" name="ncName" class="swal2-input ncName" value="` + item.memberInfo.neck_name + `">
                                <br/>
                                <label>Email：</label>
                                <input type="text" name="email" class="swal2-input email" value="` + item.email + `">
                                <br/>
                                <label>手機：</label>
                                <input type="text" name="phone" class="swal2-input phone" value="` + item.memberInfo.phone + `">
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

                        }
                    })
                }
            })

        }
    })
})