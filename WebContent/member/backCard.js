// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

// 身分組分布
$(function(){
  var datas = [];
  var gmAjax = $.ajax({
      method:"GET",
      url:"/MountainExploer.com/back/member/countGMember",
      dataType:"json",
      success:function(pieMap){
          datas[0] = pieMap.gmSize;
          datas[1] = pieMap.ggSize;
          datas[2] = pieMap.uaSize;
          datas[3] = pieMap.saSize;
          datas[4] = pieMap.adSiza;
          console.log(datas);
      }
  }).then(()=>{
  
      var ctx = document.getElementById("mbModeChart");
      var myModeChart = new Chart(ctx, {
        type: 'pie',
        data: {
      
          labels: ["一般登山者", "登山嚮導", "未認證會員", "停權會員", "管理者"],
          datasets: [{
            data: datas,
            backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc', '#FF0000', '#8E8E8E'],
            hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf', '#EA0000', '#7B7B7B'],
            hoverBorderColor: "rgba(234, 236, 244, 1)",
          }],
        },
        options: {
          maintainAspectRatio: false,
          tooltips: {
            backgroundColor: "rgb(255,255,255)",
            bodyFontColor: "#858796",
            borderColor: '#dddfeb',
            borderWidth: 5,
            xPadding: 15,
            yPadding: 15,
            displayColors: false,
            caretPadding: 10,
          },
          legend: {
            display: true
          },
          cutoutPercentage: 0,
        },
      });
  
      $("#mb-mode-export").on("click", function(){
          // var image = myPieChart.toBase64Image();
          // console.log(image);
          downloadChart(myModeChart, "會員身分組占比圓餅圖");
      })
  
      $("#mb-mode-export-json").on("click", function(){
          let newData = {
              一般登山者:datas[0],
              登山嚮導:datas[1],
              未認證會員:datas[2],
              停權會員:datas[3],
              管理員:datas[4]
          }
          jsonDownload(newData, "會員身分組占比");
      })
      
  })

})

$(".pieMode").on("click", function(){
  $("#mbModeChart").remove();
  $(".chart-area").append("<canvas id='mbModeChart'></canvas>");
    var datasPie = [];
    var gmAjax = $.ajax({
        method:"GET",
        url:"/MountainExploer.com/back/member/countGMember",
        dataType:"json",
        success:function(pieMap){
          datasPie[0] = pieMap.gmSize;
          datasPie[1] = pieMap.ggSize;
          datasPie[2] = pieMap.uaSize;
          datasPie[3] = pieMap.saSize;
          datasPie[4] = pieMap.adSiza;
            // console.log(datasPie);
        }
    }).then(()=>{
    
        var ctx = document.getElementById("mbModeChart");
        var myPieChart = new Chart(ctx, {
          type: 'pie',
          data: {
        
            labels: ["一般登山者", "登山嚮導", "未認證會員", "停權會員", "管理者"],
            datasets: [{
              data: datasPie,
              backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc', '#FF0000', '#8E8E8E'],
              hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf', '#EA0000', '#7B7B7B'],
              hoverBorderColor: "rgba(234, 236, 244, 1)",
            }],
          },
          options: {
            maintainAspectRatio: false,
            tooltips: {
              backgroundColor: "rgb(255,255,255)",
              bodyFontColor: "#858796",
              borderColor: '#dddfeb',
              borderWidth: 5,
              xPadding: 15,
              yPadding: 15,
              displayColors: false,
              caretPadding: 10,
            },
            legend: {
              display: true
            },
            cutoutPercentage: 0,
          },
        });
    
        $("#mb-mode-export").on("click", function(){
            // var image = myPieChart.toBase64Image();
            // console.log(image);
            downloadChart(myPieChart, "會員身分組占比圓餅圖");
        })
    
        $("#mb-mode-export-json").on("click", function(){
            let newData = {
                一般登山者:datasPie[0],
                登山嚮導:datasPie[1],
                未認證會員:datasPie[2],
                停權會員:datasPie[3],
                管理員:datasPie[4]
            }
            jsonDownload(newData, "會員身分組占比");
        })
        
    })
})


$(".doughnut").on("click", function(){
  $("#mbModeChart").remove();
  $(".chart-area").append("<canvas id='mbModeChart'></canvas>");

  var datasDg = [];
  var dgAjax = $.ajax({
      method:"GET",
      url:"/MountainExploer.com/back/member/countGMember",
      dataType:"json",
      success:function(pieMap){
        datasDg[0] = pieMap.gmSize;
        datasDg[1] = pieMap.ggSize;
        datasDg[2] = pieMap.uaSize;
        datasDg[3] = pieMap.saSize;
        datasDg[4] = pieMap.adSiza;
          console.log(datasDg);
      }
  }).then(()=>{
  
      var ctx = document.getElementById("mbModeChart");
      var myDgChart = new Chart(ctx, {
        type: 'pie',
        data: {
      
          labels: ["一般登山者", "登山嚮導", "未認證會員", "停權會員", "管理者"],
          datasets: [{
            data:datasDg,
            backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc', '#FF0000', '#8E8E8E'],
            hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf', '#EA0000', '#7B7B7B'],
            hoverBorderColor: "rgba(234, 236, 244, 1)",
          }],
        },
        options: {
          maintainAspectRatio: false,
          tooltips: {
            backgroundColor: "rgb(255,255,255)",
            bodyFontColor: "#858796",
            borderColor: '#dddfeb',
            borderWidth: 5,
            xPadding: 15,
            yPadding: 15,
            displayColors: false,
            caretPadding: 10,
          },
          legend: {
            display: true
          },
          cutoutPercentage: 70,
        },
      });
  
      $("#mb-mode-export").on("click", function(){

          // var image = myPieChart.toBase64Image();
          // console.log(image);
          downloadChart(myDgChart, "會員身分組占比甜甜圈圖");
      })
  
      $("#mb-mode-export-json").on("click", function(){
          let newData = {
              一般登山者:datasDg[0],
              登山嚮導:datasDg[1],
              未認證會員:datasDg[2],
              停權會員:datasDg[3],
              管理員:datasDg[4]
          }
          jsonDownload(newData, "會員身分組占比");
      })
      
  })

})

$(".bar").on("click", function(){
  $("#mbModeChart").remove();
  $(".chart-area").append("<canvas id='mbModeChart' style='height:100px'></canvas>");

  var datasBar = [];
  var barAjax = $.ajax({
    method:"GET",
    url:"/MountainExploer.com/back/member/countGMember",
    dataType:"json",
    success:function(barMap){
      datasBar[0] = barMap.gmSize;
      datasBar[1] = barMap.ggSize;
      datasBar[2] = barMap.uaSize;
      datasBar[3] = barMap.saSize;
      datasBar[4] = barMap.adSiza;
        console.log(datasBar);
    }
  }).then(function(){
    var ctx = $("#mbModeChart");
    var myBarChart = new Chart(ctx, {
      type:"bar",
      data: {
        labels: ["一般登山者", "登山嚮導", "未認證會員", "停權會員", "管理者"],
        datasets: [{
          data: datasBar,
          backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc', '#FF0000', '#8E8E8E'],
          hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf', '#EA0000', '#7B7B7B'],
          hoverBorderColor: "rgba(234, 236, 244, 1)",

        }],
      },
      options: {
        maintainAspectRatio: false
      }
    })

      $("#mb-mode-export").on("click", function(){
        // var image = myPieChart.toBase64Image();
        // console.log(image);
        downloadChart(myBarChart, "會員身分組占比長條圖");
      })

    $("#mb-mode-export-json").on("click", function(){
        let newData = {
            一般登山者:datasBar[0],
            登山嚮導:datasBar[1],
            未認證會員:datasBar[2],
            停權會員:datasBar[3],
            管理員:datasBar[4]
        }
        jsonDownload(newData, "會員身分組占比");
    })
  })
})


$(".horizontalBar").on("click", function(){
  $("#mbModeChart").remove();
  $(".chart-area").append("<canvas id='mbModeChart' style='height:100px'></canvas>");

  var horDatas = [];
  var horAjax = $.ajax({
    method:"GET",
    url:"/MountainExploer.com/back/member/countGMember",
    dataType:"json",
    success:function(barMap){
      horDatas[0] = barMap.gmSize;
      horDatas[1] = barMap.ggSize;
      horDatas[2] = barMap.uaSize;
      horDatas[3] = barMap.saSize;
      horDatas[4] = barMap.adSiza;
        // console.log(horDatas);
    }
  }).then(function(){
    var ctx = $("#mbModeChart");
    var myHorChart = new Chart(ctx, {
      type:"horizontalBar",
      data: {
        labels: ["一般登山者", "登山嚮導", "未認證會員", "停權會員", "管理者"],
        datasets: [{
          data: horDatas,
          backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc', '#FF0000', '#8E8E8E'],
          hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf', '#EA0000', '#7B7B7B'],
          hoverBorderColor: "rgba(234, 236, 244, 1)",

        }],
      },
      options: {
        maintainAspectRatio: false
      }
    })
      $("#mb-mode-export").on("click", function(){
        // var image = myPieChart.toBase64Image();
        // console.log(image);
        downloadChart(myHorChart, "會員身分組占比橫條圖");
      })

    $("#mb-mode-export-json").on("click", function(){
        let newData = {
            一般登山者:horDatas[0],
            登山嚮導:horDatas[1],
            未認證會員:horDatas[2],
            停權會員:horDatas[3],
            管理員:horDatas[4]
        }
        jsonDownload(newData, "會員身分組占比");
    })
  })
})



function downloadChart(chartElm, fileName){
    const openURL = chartElm.toBase64Image();
    const chartType = chartElm.config.type;
    let exportName = fileName + "_" + chartType;
    console.log(openURL);
    const a = $("a.export")[0];
    console.log(a);

    a.download = exportName + ".png";
    a.href = openURL;
    a.click()
    setTimeout(function(){
        window.URL.revokeObjectURL(openURL),5000
    })
}

function jsonDownload(jsonList, fileName){
    $("<a />", {
        "download":fileName + new Date().toLocaleDateString() + ".json",
        "href": "data:application/json," + encodeURIComponent(JSON.stringify(jsonList))
    }).appendTo("body")
    .click(function(){
        $(this).remove();
    })[0].click()
}


//性別分布

$(function(){
  var gdDatas = [];
  var gdAjax = $.ajax({
      method:"GET",
      url:"/MountainExploer.com/back/member/countGender",
      dataType:"json",
      success:function(gdMap){
          gdDatas[0] = gdMap.mlList;
          gdDatas[1] = gdMap.fmList;
          gdDatas[2] = gdMap.xList;
          gdDatas[3] = gdMap.maskList;
          console.log(gdDatas);
      }
  }).then(()=>{
  
      var ctx = $("#gdModeChart");
      var gdModeChart = new Chart(ctx, {
        type: 'pie',
        data: {
      
          labels: ["男性", "女性", "第三性", "不透露"],
          datasets: [{
            data: gdDatas,
            backgroundColor: ['#4e73df', '#FF0000', '#1cc88a', '#8E8E8E'],
            hoverBackgroundColor: ['#2e59d9', '#EA0000', '#00CACAc', '#7B7B7B'],
            hoverBorderColor: "rgba(234, 236, 244, 1)",
          }],
        },
        options: {
          maintainAspectRatio: false,
          tooltips: {
            backgroundColor: "rgb(255,255,255)",
            bodyFontColor: "#858796",
            borderColor: '#dddfeb',
            borderWidth: 5,
            xPadding: 15,
            yPadding: 15,
            displayColors: false,
            caretPadding: 10,
          },
          legend: {
            display: true
          },
          cutoutPercentage: 0,
        },
      });
  
      $("#gd-Mode-export").on("click", function(){
          // var image = myPieChart.toBase64Image();
          // console.log(image);
          downloadChart(gdModeChart, "會員性別比例圓餅圖");
      })
  
      $("#gd-Mode-export-json").on("click", function(){
          let newData = {
              男性:gdDatas[0],
              女性:gdDatas[1],
              第三性:gdDatas[2],
              不透露:gdDatas[3]
          }
          jsonDownload(newData, "會員性別比例");
      })
      
  })

})


$(".pieGd").on("click", function(){
  $("#gdModeChart").remove();
  $(".gdArea").append("<canvas id='gdModeChart'></canvas>");

  var gdDatasPie = [];
  var gdAjax = $.ajax({
      method:"GET",
      url:"/MountainExploer.com/back/member/countGender",
      dataType:"json",
      success:function(gdMap){
          gdDatasPie[0] = gdMap.mlList;
          gdDatasPie[1] = gdMap.fmList;
          gdDatasPie[2] = gdMap.xList;
          gdDatasPie[3] = gdMap.maskList;
          // console.log(gdDatasPie);
      }
  }).then(()=>{
  
      var ctx = $("#gdModeChart");
      var gdPieChart = new Chart(ctx, {
        type: 'pie',
        data: {
      
          labels: ["男性", "女性", "第三性", "不透露"],
          datasets: [{
            data: gdDatasPie,
            backgroundColor: ['#4e73df', '#FF0000', '#1cc88a', '#8E8E8E'],
            hoverBackgroundColor: ['#2e59d9', '#EA0000', '#00CACAc', '#7B7B7B'],
            hoverBorderColor: "rgba(234, 236, 244, 1)",
          }],
        },
        options: {
          maintainAspectRatio: false,
          tooltips: {
            backgroundColor: "rgb(255,255,255)",
            bodyFontColor: "#858796",
            borderColor: '#dddfeb',
            borderWidth: 5,
            xPadding: 15,
            yPadding: 15,
            displayColors: false,
            caretPadding: 10,
          },
          legend: {
            display: true
          },
          cutoutPercentage: 0,
        },
      });
  
      $("#gd-Mode-export").on("click", function(){
          // var image = myPieChart.toBase64Image();
          // console.log(image);
          downloadChart(gdPieChart, "會員性別比例圓餅圖");
      })
  
      $("#gd-Mode-export-json").on("click", function(){
          let newData = {
              男性:gdDatas[0],
              女性:gdDatas[1],
              第三性:gdDatas[2],
              不透露:gdDatas[3]
          }
          jsonDownload(newData, "會員身分組占比");
      })
      
  })

})


$(".doughnutGd").on("click", function(){
  $("#gdModeChart").remove();
  $(".gdArea").append("<canvas id='gdModeChart'></canvas>");

  var gdDatasDg = [];
  var gdAjax = $.ajax({
      method:"GET",
      url:"/MountainExploer.com/back/member/countGender",
      dataType:"json",
      success:function(gdMap){
          gdDatasDg[0] = gdMap.mlList;
          gdDatasDg[1] = gdMap.fmList;
          gdDatasDg[2] = gdMap.xList;
          gdDatasDg[3] = gdMap.maskList;
          // console.log(gdDatasPie);
      }
  }).then(()=>{
  
      var ctx = $("#gdModeChart");
      var gdDgChart = new Chart(ctx, {
        type: 'pie',
        data: {
      
          labels: ["男性", "女性", "第三性", "不透露"],
          datasets: [{
            data: gdDatasDg,
            backgroundColor: ['#4e73df', '#FF0000', '#1cc88a', '#8E8E8E'],
            hoverBackgroundColor: ['#2e59d9', '#EA0000', '#00CACAc', '#7B7B7B'],
            hoverBorderColor: "rgba(234, 236, 244, 1)",
          }],
        },
        options: {
          maintainAspectRatio: false,
          tooltips: {
            backgroundColor: "rgb(255,255,255)",
            bodyFontColor: "#858796",
            borderColor: '#dddfeb',
            borderWidth: 5,
            xPadding: 15,
            yPadding: 15,
            displayColors: false,
            caretPadding: 10,
          },
          legend: {
            display: true
          },
          cutoutPercentage: 70,
        },
      });
  
      $("#gd-Mode-export").on("click", function(){
          // var image = myPieChart.toBase64Image();
          // console.log(image);
          downloadChart(gdDgChart, "會員性別比例圓餅圖");
      })
  
      $("#gd-Mode-export-json").on("click", function(){
          let newData = {
              男性:gdDatas[0],
              女性:gdDatas[1],
              第三性:gdDatas[2],
              不透露:gdDatas[3]
          }
          jsonDownload(newData, "會員身分組占比");
      })
      
  })

})


$(".barGd").on("click", function(){
  $("#gdModeChart").remove();
  $(".gdArea").append("<canvas id='gdModeChart'></canvas>");

  var gdDatasBar = [];
  var gdAjax = $.ajax({
      method:"GET",
      url:"/MountainExploer.com/back/member/countGender",
      dataType:"json",
      success:function(gdMap){
          gdDatasBar[0] = gdMap.mlList;
          gdDatasBar[1] = gdMap.fmList;
          gdDatasBar[2] = gdMap.xList;
          gdDatasBar[3] = gdMap.maskList;
          // console.log(gdDatasPie);
      }
  }).then(()=>{
  
      var ctx = $("#gdModeChart");
      var gdBarChart = new Chart(ctx, {
        type: 'bar',
        data: {
      
          labels: ["男性", "女性", "第三性", "不透露"],
          datasets: [{
            data: gdDatasBar,
            backgroundColor: ['#4e73df', '#FF0000', '#1cc88a', '#8E8E8E'],
            hoverBackgroundColor: ['#2e59d9', '#EA0000', '#00CACAc', '#7B7B7B'],
            hoverBorderColor: "rgba(234, 236, 244, 1)",
          }],
        },
        options: {
          maintainAspectRatio: false,
          tooltips: {
            backgroundColor: "rgb(255,255,255)",
            bodyFontColor: "#858796",
            borderColor: '#dddfeb',
            borderWidth: 5,
            xPadding: 15,
            yPadding: 15,
            displayColors: false,
            caretPadding: 10,
          },
          legend: {
            display: true
          },
          cutoutPercentage: 70,
        },
      });
  
      $("#gd-Mode-export").on("click", function(){
          // var image = myPieChart.toBase64Image();
          // console.log(image);
          downloadChart(gdBarChart, "會員性別比例圓餅圖");
      })
  
      $("#gd-Mode-export-json").on("click", function(){
          let newData = {
              男性:gdDatas[0],
              女性:gdDatas[1],
              第三性:gdDatas[2],
              不透露:gdDatas[3]
          }
          jsonDownload(newData, "會員身分組占比");
      })
      
  })

})


$(".horizontalBarGd").on("click", function(){
  $("#gdModeChart").remove();
  $(".gdArea").append("<canvas id='gdModeChart'></canvas>");

  var gdDatasHor = [];
  var gdAjax = $.ajax({
      method:"GET",
      url:"/MountainExploer.com/back/member/countGender",
      dataType:"json",
      success:function(gdMap){
          gdDatasHor[0] = gdMap.mlList;
          gdDatasHor[1] = gdMap.fmList;
          gdDatasHor[2] = gdMap.xList;
          gdDatasHor[3] = gdMap.maskList;
          // console.log(gdDatasPie);
      }
  }).then(()=>{
  
      var ctx = $("#gdModeChart");
      var gdHorChart = new Chart(ctx, {
        type: 'horizontalBar',
        data: {
      
          labels: ["男性", "女性", "第三性", "不透露"],
          datasets: [{
            data: gdDatasHor,
            backgroundColor: ['#4e73df', '#FF0000', '#1cc88a', '#8E8E8E'],
            hoverBackgroundColor: ['#2e59d9', '#EA0000', '#00CACAc', '#7B7B7B'],
            hoverBorderColor: "rgba(234, 236, 244, 1)",
          }],
        },
        options: {
          maintainAspectRatio: false,
          tooltips: {
            backgroundColor: "rgb(255,255,255)",
            bodyFontColor: "#858796",
            borderColor: '#dddfeb',
            borderWidth: 5,
            xPadding: 15,
            yPadding: 15,
            displayColors: false,
            caretPadding: 10,
          },
          legend: {
            display: true
          },
          cutoutPercentage: 70,
        },
      });
  
      $("#gd-Mode-export").on("click", function(){
          // var image = myPieChart.toBase64Image();
          // console.log(image);
          downloadChart(gdHorChart, "會員性別比例圓餅圖");
      })
  
      $("#gd-Mode-export-json").on("click", function(){
          let newData = {
              男性:gdDatas[0],
              女性:gdDatas[1],
              第三性:gdDatas[2],
              不透露:gdDatas[3]
          }
          jsonDownload(newData, "會員身分組占比");
      })
      
  })

})





