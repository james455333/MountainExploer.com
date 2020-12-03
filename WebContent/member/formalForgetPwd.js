$(".submit").on("click", function(){
    if(errors != null){
        swal({
            title: "找回密碼信件發送失敗，請重新輸入",
            icon: "error"
        });
    }else{
        swal({
            title: "暫時密碼已發送到您的信箱，請盡快更新您的密碼。",
            icon: "success"
        });
    }
})