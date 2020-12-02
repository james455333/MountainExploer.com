$(".submit").on("click", function(){
    if(errors != null){
       swal({
           title: "登入失敗",
           icon: "error"
       });
    }else{
        swal({
            title: "登入成功",
            icon: "success"
        });
    }

})

// $(".test").on("click", function(){
//     swal({
//         title: "測試成功",
//         icon: "success"
//     })

// })