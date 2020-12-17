$(function(){
    let seqno = $(".seqno").val();
    $.ajax({
        method:"GET",
        url:"/MountainExploer.com/member/selectSgInfoAction",
        data:{seqno:seqno},
        dataType:"json",
        success:function(mbList){
            $.each(mbList, function(index, item){
                $(".acTr").find(".account").text(item.account);
                $(".nmTr").find(".name").text(item.name);
                $(".ncTr").find(".ncName").text(item.memberInfo.neck_name);
                let gender = item.memberInfo.gender;
                if(gender == "male"){
                    $(".gnTr").find(".gender").text("男");
                }else if(gender == "female"){
                    $(".gnTr").find(".gender").text("女");
                }else if(gender == "x"){
                    $(".gnTr").find(".gender").text("X");
                }else if(gender == "mask"){
                    $(".gnTr").find(".mask").text("不透露");
                }
                
                $(".emTr").find(".email").text(item.email);
                $(".gpTr").find(".group").text(item.memberStatus.name);
                $(".exTr").find(".exp").text(item.memberInfo.climb_ex);

                let birDate = item.memberInfo.birthday;
                if(birDate != null){
                    let birDateJS = new Date(birDate);
                    $(".brTr").find(".birDate").text(getFormattedDate(birDateJS));
                }

                let regDate = item.reg_Date;
                let regDateJS = new Date(regDate);
                $(".rgTr").find(".regDate").text(getFormattedDate(regDateJS));

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

        }
    })
})


//日期轉換
function getFormattedDate(date){
    let year = date.getFullYear();
    let month = (1 + date.getMonth()).toString().padStart(2, "0");
    let day = date.getDate().toString().padStart(2, "0");

    return year + "/" + month + "/" + day;
}