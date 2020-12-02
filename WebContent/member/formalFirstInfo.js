//快速填寫
$(".fastIn").on("click", function(){
    $("#ncName").val("布姊");
    $("#birDate").val("1977-11-09");
    $("#phone").val("0933777333");
    $("#exp").val("英靈殿就在山頂之上");
})

//防止預設值被清空
document.getElementById("reset").onclick = function(){
    let userSeq = document.getElementById("seqno");
    let statusId = document.getElementById("statusId");
    userSeq.defaultValue = userSeq.value;
    statusId.defaultValue = statusId.value;
    document.forms[0].reset();
}