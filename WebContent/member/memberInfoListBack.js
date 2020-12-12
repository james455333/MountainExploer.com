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
                            "<tr><td><button type='button' class='btn btn-danger ban'>停權</button></td>" + 
                            "<td>" + item.seqno + "</td>" + 
                            "<td>" + item.account + "</td>" +
                            "<td>" + item.email + "</td>" + 
                            "<td>" + Gm + "</td>" + 
                            "<td><button type='button' class='btn btn-info sgInfo'>詳細資料</button></td></tr>"
                        )
                    }else if(item.memberStatus.seqno == 110){
                        let Um = "未認證登山者";
                        $allMember.append(
                            "<tr><td><button type='button' class='btn btn-danger ban'>停權</button></td>" + 
                            "<td>" + item.seqno + "</td>" + 
                            "<td>" + item.account + "</td>" +
                            "<td>" + item.email + "</td>" + 
                            "<td>" + Um + "</td>" + 
                            "<td><button type='button' class='btn btn-info sgInfo'>詳細資料</button></td></tr>"
                        )
                    }else if(item.memberStatus.seqno == 120){
                        let Gg = "登山嚮導";
                        $allMember.append(
                            "<tr><td><button type='button' class='btn btn-danger ban'>停權</button></td>" + 
                            "<td>" + item.seqno + "</td>" + 
                            "<td>" + item.account + "</td>" +
                            "<td>" + item.email + "</td>" + 
                            "<td>" + Gg + "</td>" + 
                            "<td><button type='button' class='btn btn-info sgInfo'>詳細資料</button></td></tr>"
                        )
                    }else if(item.memberStatus.seqno == 130){
                        let Ug = "未認證嚮導";
                        $allMember.append(
                            "<tr><td><button type='button' class='btn btn-danger ban'>停權</button></td>" + 
                            "<td>" + item.seqno + "</td>" + 
                            "<td>" + item.account + "</td>" +
                            "<td>" + item.email + "</td>" + 
                            "<td>" + Ug + "</td>" + 
                            "<td><button type='button' class='btn btn-info sgInfo'>詳細資料</button></td></tr>"
                        )
                    }else if(item.memberStatus.seqno == 140){
                        let Sm = "停權登山者";
                        $allMember.append(
                            "<tr><td><button type='button' class='btn btn-warning recover'>復權</button></td>" + 
                            "<td>" + item.seqno + "</td>" + 
                            "<td>" + item.account + "</td>" +
                            "<td>" + item.email + "</td>" + 
                            "<td>" + Sm + "</td>" + 
                            "<td><button type='button' class='btn btn-info sgInfo'>詳細資料</button></td></tr>"
                        )
                    }else if(item.memberStatus.seqno == 160){
                        let Sg = "停權嚮導";
                        $allMember.append(
                            "<tr><td><button type='button' class='btn btn-warning recover'>復權</button></td>" + 
                            "<td>" + item.seqno + "</td>" + 
                            "<td>" + item.account + "</td>" +
                            "<td>" + item.email + "</td>" + 
                            "<td>" + Sg + "</td>" + 
                            "<td><button type='button' class='btn btn-info sgInfo'>詳細資料</button></td></tr>"
                        )
                    }else if(item.memberStatus.seqno == 150){
                        let admin = "管理者";
                        $allMember.append(
                            "<tr><td><button type='button' class='btn btn-danger disabled'>停權</button></td>" + 
                            "<td>" + item.seqno + "</td>" + 
                            "<td>" + item.account + "</td>" +
                            "<td>" + item.email + "</td>" + 
                            "<td>" + admin + "</td>" + 
                            "<td><button type='button' class='btn btn-info sgInfo'>詳細資料</button></td></tr>"
                        )
                    }
                })
            }
        }

    })
})

//重製查詢
$(".reSelect").on("click", function(){
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
                            "<tr><td><button type='button' class='btn btn-danger ban'>停權</button></td>" + 
                            "<td>" + item.seqno + "</td>" + 
                            "<td>" + item.account + "</td>" +
                            "<td>" + item.email + "</td>" + 
                            "<td>" + Gm + "</td>" + 
                            "<td><button type='button' class='btn btn-info sgInfo'>詳細資料</button></td></tr>"
                        )
                    }else if(item.memberStatus.seqno == 110){
                        let Um = "未認證登山者";
                        $allMember.append(
                            "<tr><td><button type='button' class='btn btn-danger ban'>停權</button></td>" + 
                            "<td>" + item.seqno + "</td>" + 
                            "<td>" + item.account + "</td>" +
                            "<td>" + item.email + "</td>" + 
                            "<td>" + Um + "</td>" + 
                            "<td><button type='button' class='btn btn-info sgInfo'>詳細資料</button></td></tr>"
                        )
                    }else if(item.memberStatus.seqno == 120){
                        let Gg = "登山嚮導";
                        $allMember.append(
                            "<tr><td><button type='button' class='btn btn-danger ban'>停權</button></td>" + 
                            "<td>" + item.seqno + "</td>" + 
                            "<td>" + item.account + "</td>" +
                            "<td>" + item.email + "</td>" + 
                            "<td>" + Gg + "</td>" + 
                            "<td><button type='button' class='btn btn-info sgInfo'>詳細資料</button></td></tr>"
                        )
                    }else if(item.memberStatus.seqno == 130){
                        let Ug = "未認證嚮導";
                        $allMember.append(
                            "<tr><td><button type='button' class='btn btn-danger ban'>停權</button></td>" + 
                            "<td>" + item.seqno + "</td>" + 
                            "<td>" + item.account + "</td>" +
                            "<td>" + item.email + "</td>" + 
                            "<td>" + Ug + "</td>" + 
                            "<td><button type='button' class='btn btn-info sgInfo'>詳細資料</button></td></tr>"
                        )
                    }else if(item.memberStatus.seqno == 140){
                        let Sm = "停權登山者";
                        $allMember.append(
                            "<tr><td><button type='button' class='btn btn-warning recover'>復權</button></td>" + 
                            "<td>" + item.seqno + "</td>" + 
                            "<td>" + item.account + "</td>" +
                            "<td>" + item.email + "</td>" + 
                            "<td>" + Sm + "</td>" + 
                            "<td><button type='button' class='btn btn-info sgInfo'>詳細資料</button></td></tr>"
                        )
                    }else if(item.memberStatus.seqno == 160){
                        let Sg = "停權嚮導";
                        $allMember.append(
                            "<tr><td><button type='button' class='btn btn-warning recover'>復權</button></td>" + 
                            "<td>" + item.seqno + "</td>" + 
                            "<td>" + item.account + "</td>" +
                            "<td>" + item.email + "</td>" + 
                            "<td>" + Sg + "</td>" + 
                            "<td><button type='button' class='btn btn-info sgInfo'>詳細資料</button></td></tr>"
                        )
                    }else if(item.memberStatus.seqno == 150){
                        let admin = "管理者";
                        $allMember.append(
                            "<tr><td><button type='button' class='btn btn-danger disabled'>停權</button></td>" + 
                            "<td>" + item.seqno + "</td>" + 
                            "<td>" + item.account + "</td>" +
                            "<td>" + item.email + "</td>" + 
                            "<td>" + admin + "</td>" + 
                            "<td><button type='button' class='btn btn-info sgInfo'>詳細資料</button></td></tr>"
                        )
                    }
                })
            }
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
                        "<tr><td><button type='button' class='btn btn-danger ban'>停權</button></td>" + 
                        "<td>" + item.seqno + "</td>" + 
                        "<td>" + item.account + "</td>" +
                        "<td>" + item.email + "</td>" + 
                        "<td>" + Gm + "</td>" + 
                        "<td><button type='button' class='btn btn-info sgInfo'>詳細資料</button></td></tr>"
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
                        "<tr><td><button type='button' class='btn btn-danger ban'>停權</button></td>" + 
                        "<td>" + item.seqno + "</td>" + 
                        "<td>" + item.account + "</td>" +
                        "<td>" + item.email + "</td>" + 
                        "<td>" + Gg + "</td>" + 
                        "<td><button type='button' class='btn btn-info sgInfo'>詳細資料</button></td></tr>"
                    )
                }

            })
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
                        "<tr><td><button type='button' class='btn btn-warning recover'>復權</button></td>" + 
                        "<td>" + item.seqno + "</td>" + 
                        "<td>" + item.account + "</td>" +
                        "<td>" + item.email + "</td>" + 
                        "<td>" + Sm + "</td>" + 
                        "<td><button type='button' class='btn btn-info sgInfo'>詳細資料</button></td></tr>"
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
                        "<tr><td><button type='button' class='btn btn-warning recover'>復權</button></td>" + 
                        "<td>" + item.seqno + "</td>" + 
                        "<td>" + item.account + "</td>" +
                        "<td>" + item.email + "</td>" + 
                        "<td>" + Sg + "</td>" + 
                        "<td><button type='button' class='btn btn-info sgInfo'>詳細資料</button></td></tr>"
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
                        "<tr><td><button type='button' class='btn btn-danger disabled'>停權</button></td>" + 
                        "<td>" + item.seqno + "</td>" + 
                        "<td>" + item.account + "</td>" +
                        "<td>" + item.email + "</td>" + 
                        "<td>" + admin + "</td>" + 
                        "<td><button type='button' class='btn btn-info sgInfo'>詳細資料</button></td></tr>"
                    )
                }

            })
        }
    }) 
})


//停權
$(".disabled").on("click", function(){
    
})