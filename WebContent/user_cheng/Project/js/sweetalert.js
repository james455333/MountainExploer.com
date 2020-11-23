// demo1 確認/完成按鍵
document.getElementById("demo1").addEventListener("click", function () {
  swal("確認!", "已完成!", "success")
});

// dome2 錯誤按鍵
document.getElementById("demo2").addEventListener("click", function () {
  swal("錯誤!", "請從新操作!", "error", { button: "  error後面+  ,{button:'內容'}  " });
});

// demo3 再次確認提醒
document.getElementById("demo3").addEventListener("click", function () {
  swal({
    title: "Are you sure?",
    icon: "warning",
    dangerMode: true,
    //底色變紅色
    buttons: true
    //true預設為 ok和cancel兩個按鈕
  });
});

//  demo4 多個按鍵選項
document.getElementById("demo4").addEventListener("click", function () {
  swal({
    title: "確認",
    text: "內容",
    icon: "warning",
    buttons: {
      cancel: {
        text: "取消",
        visible: true
      },
      // danger: {
      //變紅底
      commit: {
        text: "確認",
        visible: true,

      },
      danger: {
        text: "紅色",
        visible: true
      }
    }
  }).then((value) => {
    swal(`你選擇了 ${value}`);
    //要執行的程式碼放在  .then((value) => {` 這邊 `});
    // if(value !==)

  });
});

// demo5
//icon: success勾勾,error錯誤,warning警告,info訊息
document.getElementById("demo5").addEventListener("click", function () {
  swal({
    title: "標題",
    text: "內容",
    icon: "info",
    buttons: {
      rollback: {
        text: "取消",
        value: "取消鍵"
      },
      danger: {
        text: "確認",
        value: "確認鍵"
      },
      c: {
        text: "Btn C",
        // value: "www.google.com"
      }
    }
  }).then(() => {
    window.location.href = 'http://google.com';
  });
});

// demo6 再次確認提醒
document.getElementById("demo6").addEventListener("click", function () {
  swal({
    title: '確認刪除?',
    text: "刪除將無法復原!",
    icon: "warning",
    buttons: true,
    dangerMode: true,//按鈕不要紅底直接註解此行

  })
    .then((willDelete) => {
      if (willDelete) {
        swal("刪除成功!", "需加第二個雙引號才能把第一個雙引號變為title,皆可以為空字串",
          { icon: "success", }
        )
          .then(function () {
            window.location.href = 'http://google.com'//回個人資料頁面
          })
          ;
      }
      else {
        swal("取消!", "123!", "success")
          .then(function () {
            window.location.href = '../index.html'//回個人資料頁面
          })
          ;
      }
    });
});









document.getElementById("demo9").addEventListener("click", function () {
  swal({
    content: {
      title: "登入",
      text: "your name",
      element: "input",
      attributes: {
        placeholder: "請輸入密碼",
        type: "password",
      },
    }
  })
});




