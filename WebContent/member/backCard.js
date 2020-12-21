// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

// Pie Chart Example
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
    var myPieChart = new Chart(ctx, {
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
})

