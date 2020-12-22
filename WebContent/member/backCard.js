// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

var mbModeChart;
var datas = [];
var gdModeChart;

//身分組分布
var setMbModeChart = function setMbModeChart(chartType){
  var ctx = $("#mbModeChart");
  if(mbModeChart != null){
    mbModeChart.destroy();
  }

  let setType = "pie";

  if(typeof chartType != "undefined"){
    setType = chartType;
  }

  $.ajax({
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
  }).then(function(){
    var chartSet = {
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
    }
    if(setType == "bar"){
      // chartSet.options.legend.display = false;
      chartSet = {
        type: 'bar',
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
          // legend: {
          //   display: true
          // },
        }, 
      }
    }else if(setType == "horizontalBar"){
      chartSet = {
        type: 'horizontalBar',
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
          // legend: {
          //   display: true
          // },
        }, 
      }
    }
    mbModeChart = new Chart(ctx, chartSet);

  })
}


var setMbDgChart = function setMbDgChart(chartType){
  var ctx = $("#mbModeChart");
  if(mbModeChart != null){
    mbModeChart.destroy();
  }

  let setType = "pie";

  if(typeof chartType != "undefined"){
    setType = chartType;
  }

  
  $.ajax({
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
  }).then(function(){
    var chartSet = {
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
          cutoutPercentage: 70,
        }
    }
    mbModeChart = new Chart(ctx, chartSet);

  })
}




$(function(){
  let pie = $(".pieMode").val();
  setMbModeChart(pie);
})


$(".pieMode").on("click", function(){
  setMbModeChart($(this).val());
})

$(".doughnut").on("click", function(){
  setMbDgChart($(this).val());
})

$(".bar").on("click", function(){
  setMbModeChart($(this).val());
})

$(".horizontalBar").on("click", function(){
  setMbModeChart($(this).val());
})

$("#mb-mode-export").on("click", function(){
  downloadChart(mbModeChart, "會員身分組分布圖");
})

$("#mb-mode-export-json").on("click", function(){
  let newData = {
    一般登山者:datas[0],
    登山嚮導:datas[1],
    未認證會員:datas[2],
    停權會員:datas[3],
    管理員:[4]
}
  jsonDownload(newData, "會員身分組統計");
})

function downloadChart(chartElm, fileName){
    console.log(chartElm);
    const openURL = chartElm.toBase64Image();
    const chartType = chartElm.config.type;
    let exportName = fileName + "_" + chartType;
    // console.log(openURL);
    const a = $("a.export")[0];
    // console.log(a);
    console.log("B")

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

var setGdChart = function setGdChart(chartType){
  var ctx = $("#gdModeChart");
  if(gdModeChart != null){
    gdModeChart.destroy();
  }

  let setType = "pie";

  if(typeof chartType != "undefined"){
    setType = chartType;
  }

  var gdAjax = $.ajax({
      method:"GET",
      url:"/MountainExploer.com/back/member/countGender",
      dataType:"json",
      success:function(gdMap){
          datas[0] = gdMap.mlList;
          datas[1] = gdMap.fmList;
          datas[2] = gdMap.xList;
          datas[3] = gdMap.maskList;
          // console.log(datas);
      }
  }).then(()=>{

      var chartGdSet = {
          type: 'pie',
          data: {
        
            labels: ["男性", "女性", "第三性", "不透露"],
            datasets: [{
              data: datas,
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
        }
        if(setType == "doughnut"){
          chartGdSet = {
            type: 'doughnut',
            data: {
          
              labels: ["男性", "女性", "第三性", "不透露"],
              datasets: [{
                data: datas,
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
          }
        }else if(setType == "bar"){
          chartGdSet = {
            type: 'bar',
            data: {
          
              labels: ["男性", "女性", "第三性", "不透露"],
              datasets: [{
                data: datas,
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
                display: false
              },
            },
          }
        }else if(setType == "horizontalBar"){
          chartGdSet = {
            type: 'horizontalBar',
            data: {
          
              labels: ["男性", "女性", "第三性", "不透露"],
              datasets: [{
                data: datas,
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
                display: false
              },
            },
          }
        }
        gdModeChart = new Chart(ctx, chartGdSet);
      })
}

$(function(){
  let pie = "pie";
  setGdChart(pie);
})

$(".pieGd").on("click", function(){
  setGdChart($(this).val());
})

$(".doughnutGd").on("click", function(){
  setGdChart($(this).val());
})

$(".barGd").on("click", function(){
  setGdChart($(this).val());
})

$(".horizontalBarGd").on("click", function(){
  setGdChart($(this).val());
})

$("#gd-Mode-export").on("click", function(){
  downloadChart(gdModeChart, "會員性別比例圖");
})

$("#gd-Mode-export-json").on("click", function(){
  let newData = {
    男性:datas[0],
    女性:datas[1],
    第三性:datas[2],
    不透露:datas[3]
  }
  jsonDownload(newData, "會員性別比例")
})






