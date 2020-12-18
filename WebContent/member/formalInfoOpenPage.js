$(function(){
    let seqno = $(".seqno").val();

    $.ajax({
        method:"GET",
        url:"/MountainExploer.com/member/selectSgInfoAction",
        data:{seqno:seqno},
        dataType:"json",
        success:function(mbList){
            $.each(mbList, function(index, item){
                let imgMb = item.memberInfo.img_name;
                if(imgMb != null){
                    let imgMbNm = item.memberInfo.img_name
                    $(".userFile").attr("src", "/MountainExploer.com/images/" + imgMbNm);
                }
            })
        }
    })

    $.ajax({
        method:"GET",
        url:"/MountainExploer.com/member/memberOther",
        data:{seqno:seqno},
        contentType:"application/json; charset=UTF-8",
        dataType:"json",
        success:function(otherLs){
            if(otherLs != null){
                $(".otTr").find(".other").text(otherLs);
            }
        }

    })
})