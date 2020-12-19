$(function(){
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
            }
        }

    })
})
