//快速填寫
$(".fastIn").on("click", function(){
    $("#birDate").val("1989-05-12");
    $("#phone").val("0922150150");
    $("#exp").val("十年");
})

//防止預設值被清空
document.getElementById("reset").onclick = function(){
    let userSeq = document.getElementById("seqno");
    let statusId = document.getElementById("statusId");
    userSeq.defaultValue = userSeq.value;
    statusId.defaultValue = statusId.value;
    document.forms[0].reset();
}