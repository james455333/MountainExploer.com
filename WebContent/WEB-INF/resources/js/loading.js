var LoadingCount = {
		countTimes : 1,
		min : 0,
		max : 100,
		startCount : 0,
		endCount : 100,
		target : "body",
		title : "讀取中",
		countLoad : 250
};
function openBlock(target){
	LoadingCount.target = target != null ? target : LoadingCount.target
//	if (LoadingCount.target instanceof jQuery){
//		LoadingCount.target.css("overflow", "hidden")
//	}else{
//		$(LoadingCount.target).css("overflow", "hidden")
//	}
	$(LoadingCount.target).loading({
		message : "<h2 data-cb='countMessage' class='text-dark'>" + LoadingCount.title + "</h2>" 
				+ "<h2  data-cb='countNum' class='text-info'>" + LoadingCount.startCount  + "%</h2>" 
				+ '<div data-cb="barContainer" class="progress mx-5 mt-3">'
					+ '<div data-cb="countBar"' + 'style="width :' + LoadingCount.startCount + '%"'
					+ 'class="progress-bar progress-bar-striped progress-bar-animated bg-info" role="progressbar" aria-valuenow="' + LoadingCount.startCount 
					+ '" aria-valuemin="' + LoadingCount.min
					+ '" aria-valuemax="' + LoadingCount.max
					+ '"></div>'
				+ '</div>',
		onStop: function(loading) {
				if (LoadingCount.target instanceof jQuery){
					LoadingCount.target.css("overflow", "auto")
				}else{
					$(LoadingCount.target).css("overflow", "auto")
				}
			    loading.overlay.slideUp(500);
		}
	})
	$(LoadingCount.target).loading("resize")
	if(LoadingCount.countTimes <= 0){
		var count = 0;
		var innterval = setInterval(function() {
			if (count >=99){
				clearInterval(innterval);
				setTimeout(()=>{
					setTimeout(()=>{
						IntiLoadingCount()
						$(LoadingCount.target).loading("destroy")
					},850)
					$(LoadingCount.target).loading("stop")
					return
				},750)
			}
			count++;
			$('[data-cb="countNum"]').html(count + "%");
			$('[data-cb="countBar"]').width(count+"%");
		}, 0);
	}
}
/* 初始化讀取進度條物件 */
function PBBlock(obj){
	if(obj != null){
		LoadingCount.countTimes = obj.hasOwnProperty("countTimes") && obj.countTimes.toString().match(/^[0-9]+$/) ?  obj.countTimes : LoadingCount.countTimes
		LoadingCount.min = obj.hasOwnProperty("min") && obj.min>=0  && obj.min.toString().match(/^[0-9]+$/) ?  obj.min : LoadingCount.min
		LoadingCount.max = obj.hasOwnProperty("max") && obj.max>=0 && obj.max.toString().match(/^[0-9]+$/) ?  obj.max : LoadingCount.max
		LoadingCount.startCount = obj.hasOwnProperty("startCount") && obj.startCount >=0 && obj.startCount.toString().match(/^[0-9]+$/) ?  obj.startCount : LoadingCount.startCount
		LoadingCount.endCount = obj.hasOwnProperty("endCount") && obj.endCount >=0  && obj.endCount.toString().match(/^[0-9]+$/) ?  obj.endCount : LoadingCount.endCount
	}
	if(LoadingCount.startCount > 0 ){
		let restCount = LoadingCount.max - LoadingCount.startCount
		LoadingCount.eachCoount = Number((restCount/LoadingCount.countTimes).toFixed(1))
		LoadingCount.endCount
	}else{
		LoadingCount.eachCoount = Math.round(LoadingCount.max/LoadingCount.countTimes)
	}
}
/* 觸發進度條前進 */
function progressCount(message,countLoad){
	if(LoadingCount.countTimes==0) return
	LoadingCount.countLoad = countLoad != null ? countLoad : LoadingCount.countLoad
	/* 設置callback */
	setTimeout(() => { 
		if(message != null) $('[data-cb="countMessage"]').html(message)
		LoadingCount.startCount = Number((LoadingCount.eachCoount + LoadingCount.startCount).toFixed(1))
		
		$('[data-cb="countNum"]').html(LoadingCount.startCount + "%");
		$('[data-cb="countBar"]').width(LoadingCount.startCount + "%");
		$('[data-cb="countBar"]').attr("aria-valuenow", LoadingCount.startCount);
		
//		if(LoadingCount.countTimes <= LoadingCount.eachCoount){
//			var count = Number($('[data-cb="countNum"]').html().replace("%",""));
//			var innterval = setInterval(function() {
//				if (count >=99){
//					clearInterval(innterval);
//					setTimeout(()=>{
//						return
//					},750)
//			}
//			count++;
//			$('[data-cb="countNum"]').html(count + "%");
//			$('[data-cb="countBar"]').width(count + "%");
//			}, 0);
//		}
		
		if(LoadingCount.startCount >= LoadingCount.endCount){
			if(LoadingCount.startCount != 100){
				$('[data-cb="countNum"]').html("100%");
				$('[data-cb="countBar"]').width("100%");
				$('[data-cb="countBar"]').attr("aria-valuenow", 100);
			} 
			setTimeout(()=>{
				$(LoadingCount.target).loading("stop")
				console.log("loading complete")
				setTimeout(()=>{
					$(LoadingCount.target).loading("destroy")
				},500)
				IntiLoadingCount()
				return
			},550)		
		}
	},LoadingCount.countLoad)	
}
/* 初始化LoadingCount */
function IntiLoadingCount(){
	LoadingCount = {
		countTimes : 1,
		min : 0,
		max : 100,
		startCount : 0,
		endCount : 100,
		target : "body",
		title : "讀取中",
		countLoad : 250
	};
}