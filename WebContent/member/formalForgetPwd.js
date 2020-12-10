$(".submit").on("click", function(){
    let account = $(".account").val();
    let email = $(".email").val();

    if(!account || !email){
        Swal.fire({
            icon:"error",
            title:"尋找密碼失敗",
            text:"請輸入帳號與註冊時用的密碼"
        }).then(function(){
            window.location.reload();
        })
    }else{
        $.ajax({
            method:"GET",
            url:"",
        })
    }
})