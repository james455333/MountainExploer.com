var LoadingCount = {
		nowCount : 0,
		countTimes : 0,
		min : 0,
		max : 100,
		start : 0,
};
function openBlock(target){
	$(target).loading({
//		 	onStart: function(loading) {
//			    loading.overlay.slideDown(500);
//			  },
			  onStop: function(loading) {
			    loading.overlay.slideUp(500);
			  }
			});
	$(target).loading({
		message : "<h2 class='text-dark'>讀取中</h2>" 
				+ "<h2  data-cb='countNum' class='text-info'>0%</h2>" 
				+ '<div data-cb="barContainer" class="progress mx-5 mt-3">'
					+ '<div data-cb="countBar" class="progress-bar progress-bar-striped progress-bar-animated bg-info" role="progressbar" aria-valuenow="' + LoadingCount.start 
					+ '" aria-valuemin="' + LoadingCount.min
					+ '" aria-valuemax="' + LoadingCount.max
					+ '"></div>'
				+ '</div>'
	})
}
function PBBlock(obj){
	if(obj != null){
		let countTimes = obj.countTimes
		LoadingCount.countTimes = obj.hasOwnProperty("countTimes") && obj.countTimes.toString().match(/^[0-9]+$/) ?  obj.countTimes : LoadingCount.countTimes
		LoadingCount.min = obj.hasOwnProperty("min")  && obj.min.match(/^[0-9]+$/) ?  obj.min : LoadingCount.min
		LoadingCount.max = obj.hasOwnProperty("max") && obj.max.match(/^[0-9]+$/) ?  obj.max : LoadingCount.max
		LoadingCount.start = obj.hasOwnProperty("start")  && obj.start.match(/^[0-9]+$/) ?  obj.start : LoadingCount.start
	}
	if(LoadingCount.countTimes == 0){
		var count = 0;
		var innterval = setInterval(function() {
		if (count == 99){
			clearInterval(innterval);
			setTimeout(()=>{
				$("body").loading("stop")
				return
			},750)
		}
		count++;
		$('[data-cb="countNum"]').html(count + "%");
		$('[data-cb="countBar"]').width(count+"%");
		}, 0);
	}else{
		LoadingCount.eachCoount = Math.round(100/LoadingCount.countTimes)
	}
}
function progressCount(){
	setTimeout(() => { 
		console.log("before : " + $('[data-cb="countBar"]').width())
		if(LoadingCount.countTimes <= 1){
			setTimeout(()=>{
//				$("body").loading("stop")
				return
			},550)		
		}
//		console.log(LoadingCount.eachCoount)
		let numPercentage = Number($('[data-cb="countNum"]').text().replace("%",""))
		let barContainerW = Number($('[data-cb="barContainer"]').width())
		console.log(barContainerW)
		let barPercentage = Number($('[data-cb="countBar"]').width())
		$('[data-cb="countNum"]').html(numPercentage + LoadingCount.eachCoount + "%");
		$('[data-cb="countBar"]').width(barPercentage + LoadingCount.eachCoount*barContainerW/LoadingCount.countTimes);
	//	console.log(LoadingCount.countTimes--)
		LoadingCount.countTimes--;
		LoadingCount.nowCount++;
	},0)	
	
}