$(function() {
	
	//頁面參數
	var page = 1;
	if (typeof showData === 'undefined') var showData = 20;
	var totalPage = 0;
	//統一網域名稱設置
	var homeUrl = "/MountainExploer.com/shop/search";
		
	var booleanFlag = true
	
	$("body").on("click", ".submit-buy",function(e){
		let btn = $(this)
		$.ajax({
			url : "/MountainExploer.com/memberCheck",
			type : "GET",
			success : function(){
				let form = btn.parents("form")
				console.log(form)
				form.submit()
			},
			error : function(){
				loginSwal()
			}
		})
		
	})
	
	//	預設頁面
	$(window).on("load", function() {
		//查找資料庫總筆數
		$.ajax({
			url: homeUrl + "/totalData",
			method: "GET",
			success: function(data) {
				var totalData = data;
				totalPage = Math.ceil(totalData / showData);
				$("#totalData").html(data)
				/*console.log("totalData : " + totalData)
				console.log("totalPage : " + totalPage)*/

				// 預設顯示資料
				$.ajax({
					url: homeUrl + "/all?page=" + page + "&showData=" + showData,
					method: "GET",
					dataType: 'json',
					success: function(data) {
						//	使用回覆方法
						insertTable(data);
						//	預設第一頁
						$("#pageNo").html(page + ' / ' + totalPage)
						if (page > 1) {
							$("#firstPage").attr("name", 1).attr("disabled", false)
							$("#previousPage").attr("name", Number(page) - 1).attr("disabled", false)
						}
						if (page < totalPage) {
							console.log(page)
							$("#nextPage").attr("name", (Number(page) + 1)).attr("disabled", false)
							$("#lastPage").attr("name", totalPage).attr("disabled", false)
						}
					}
				})
				//	主類別列表設置
				$.ajax({
					url: homeUrl + "/navFC",
					method: "GET",
					dataType: 'json',
					success: function(result) {
						for (let i = 0; i < result.length; i++) {

							$("#fcSelect").append('<option value="' + result[i].seqno + '">' + result[i].name + "</option>")
//							$("#second_nav").append('<li class="li1" name="firstclass" id="fcSelect">'+'<a href="#">'  + result[i].name + "</li>")

						}
						let firstFC = $("select[name='firstclass']").find("option").eq(0).val()
						console.log(firstFC)
//						 次類別列表預設為第一筆顯示主類別
						navSC(firstFC);
					}
				})
				//設置頁面控制按鈕點擊方法
				$(".pageControl").on("click", "input", function() {
					var page = Number($(this).attr("name"));
					console.log("page Before Click : " + page)
					$.ajax({
						url: homeUrl + "/all?page=" + page + "&showData=" + showData,
						method: "GET",
						dataType: 'json',
						success: function(data) {
							//變換顯示之資料
							insertTable(data);
							//設定按鈕
							setPageController(page)
						}
					})

				})

			}
		})

	})
	//	主類別列表Change觸發切換路線
	$("#fcSelect").on("change", function() {
		var firstSC = $("#fcSelect").val();
		$(".scSelect").empty();
		console.log(firstSC)
		navSC(firstSC);
	})

	function navSC(firstFC) {

		$.ajax({
			url: homeUrl + "/navSC",
			method: "GET",
			dataType: "json",
			data: {
				first: firstFC
			},
			success: function(data) {
				//console.log(data)
				for (let i in data) $(".scSelect").append("<option value='" + data[i].id + "'>" + data[i].name + "</option>")
			}
		})
	}

	// 主類別查詢
	$(".fcSubmit").on("click", function() {
		page = 1;
		//console.log("show : " + showData + "\tpage : " + page)
		let fcID = $("#fcSelect").val();
		//console.log(fcID);
		$.ajax({
			url: homeUrl + "/totalData?firstclass=" + fcID,
			method: "GET",
			success: function(data) {
				totalData = data;
				$("#totalData").html(data)
				//console.log("fc query TotalData : " + data )
				totalPage = Math.ceil(totalData / showData);
				//console.log("fc query TotalPage : " + totalPage)
				$.ajax({
					url: homeUrl + "/navFC?firstclass=" + fcID + "&showData=" + showData,
					method: "GET",
					dataType: "json",
					success: function(data) {

						insertTable(data);
						setPageController(page)
					}

				})
				$(".pageControl").off("click", "input")
				$(".pageControl").on("click", "input", function() {
					var page = Number($(this).attr("name"));
					//console.log("page Before Click : " + page)
					$.ajax({
						url: homeUrl + "/navFC?firstclass=" + fcID + "&showData=" + showData + "&page=" + page,
						method: "GET",
						dataType: "json",
						success: function(data) {

							insertTable(data);
							setPageController(page)
						}

					})
				})
			}
		})


	})

	// 次類別查詢
	$(".scSubmit").on("click", function() {
		page = 1;
		//console.log("show : " + showData + "\tpage : " + page)
		let scID = $(".scSelect").val();
		console.log(scID);
		$.ajax({
			url: homeUrl + "/totalData?secondclass=" + scID,
			method: "GET",
			success: function(data) {
				totalData = data;
				$("#totalData").html(data)
				//console.log("fc query TotalData : " + data )
				totalPage = Math.ceil(totalData / showData);
				//console.log("fc query TotalPage : " + totalPage)
				$.ajax({
					url: homeUrl + "/scSelect?secondclass=" + scID + "&showData=" + showData,
					method: "GET",
					dataType: "json",
					success: function(data) {

						insertTable(data);
						setPageController(page)
					}

				})
				$(".pageControl").off("click", "input")
				$(".pageControl").on("click", "input", function() {
					var page = Number($(this).attr("name"));
					//console.log("page Before Click : " + page)
					$.ajax({
						url: homeUrl + "/scSelect?secondclass=" + scID + "&showData=" + showData + "&page=" + page,
						method: "GET",
						dataType: "json",
						success: function(data) {

							insertTable(data);
							setPageController(page)
						}

					})
				})
			}
		})


	})

	// 價格區間查詢
	$(".priceSubmitButton").on("click", function() {

		console.log("priceSubmitButton");
		page = 1;
		//console.log("show : " + showData + "\tpage : " + page)
		let scale = $('input[name*=radioGroup]:checked').val()
		console.log(scale);
		$.ajax({
			url: homeUrl + "/searchPrice?radioGroup=" + scale,
			method: "GET",
			success: function(data) {
				totalData = data;
				$("#totalData").html(data)
				console.log(" query TotalData : " + data)
				totalPage = Math.ceil(totalData / showData);
				//console.log("fc query TotalPage : " + totalPage)
				$.ajax({
					url: homeUrl + "/priceSelect?radioGroup=" + scale + "&showData=" + showData,
					method: "GET",
					dataType: "json",
					success: function(data) {

						insertTable(data);
						setPageController(page)
					}

				})
				$(".pageControl").off("click", "input")
				$(".pageControl").on("click", "input", function() {
					var page = Number($(this).attr("name"));
					//console.log("page Before Click : " + page)
					$.ajax({
						url: homeUrl + "/priceSelect?radioGroup=" + scale + "&showData=" + showData + "&page=" + page,
						method: "GET",
						dataType: "json",
						success: function(data) {

							insertTable(data);
							setPageController(page)
						}

					})
				})
			}
		})


	})

	// 商品名稱查詢
	$(".imgSearch").on("click", function() {
		page = 1;
		//console.log("show : " + showData + "\tpage : " + page)
		let search = $(".light-table-filter").val();
		console.log(search);
		$.ajax({
			url: homeUrl + "/searchName?nameSelect=" + search,
			method: "GET",
			success: function(data) {
				totalData = data;
				$("#totalData").html(data)
				//console.log("fc query TotalData : " + data )
				totalPage = Math.ceil(totalData / showData);
				//console.log("fc query TotalPage : " + totalPage)
				$.ajax({
					url: homeUrl + "/nameSelect?nameSelect=" + search + "&showData=" + showData,
					method: "GET",
					dataType: "json",
					success: function(data) {

						insertTable(data);
						setPageController(page)
					}

				})
				$(".pageControl").off("click", "input")
				$(".pageControl").on("click", "input", function() {
					var page = Number($(this).attr("name"));
					//console.log("page Before Click : " + page)
					$.ajax({
						url: homeUrl + "/nameSelect?nameSelect=" + search + "&showData=" + showData + "&page=" + page,
						method: "GET",
						dataType: "json",
						success: function(data) {

							insertTable(data);
							setPageController(page)
						}

					})
				})
			}
		})


	})


	//	//更換顯示
	//	$("#changeShowData").on("click", function() {
	//		showData = $("#showData").val();
	//		console.log(showData);
	//	})
	$("body").on("mouseenter",".div", function(){
		console.log($(this))
		$(this).toggleClass("animate__pulse").find("table").css("border","1px solid gray")
	}).on("mouseleave",".div",function(){
		$(this).toggleClass("animate__pulse").find("table").css("border","none")
	})
	//查詢結果回覆新增表格
	function insertTable(data) {
		$(".order-table-tb").empty();
		for (let i in data) {
			$(".order-table-tb").append(
				"<div class='div shadow animate__animated '>"+
		
				"<table>"+
				
				"<tr>"+
				"<td>"+	
					"<div class='p-3 border-bottom'>"+
						'<a href= "/MountainExploer.com/shop/productInfoEntry?no='+data[i].seqno+'">' +
						'<img  style="width: 100%; height: 200px;" src="/MountainExploer.com/backstage/product/search/images?seqno=' + data[i].seqno + '" class="productImg" >' +'</a>'+
					"</div>" + 
				"</tr>"+
				"</td>"+		
				
				"<tr>"+
				'<td style= "width: 150px">'+	
					"<div class='' style='overflow:hidden;min-height:60px;max-height:60px ;font-size:20px'>" +
						'<a style="max-width : 125px;" class="name-aTag" title="' + data[i].name + '"href= "/MountainExploer.com/shop/productInfoEntry?no='+data[i].seqno+'">'+ data[i].name  + '</a>' +
					"</div>" +
				"</tr>"+
				"</td>"+		
				
				"<tr>"+
				"<td>"+	
					"<span class='ml-auto' style='font-size:22px;' >" +	
						"$ " +data[i].price  +
					"</span>" +	

				'<form class="shoppingCart input-group-prepend" action= "/MountainExploer.com/shoppingcart/addShoppingCart">' +
				'<input type="hidden" name="itemBasicSeqno" value="' + data[i].seqno + '" readonly>' +
				'<input type="hidden" name="itemBasicName" value="' + data[i].name + '" readonly>' +
				'<input type="hidden" name="unitPrice" value="' + data[i].price + '" readonly>' +
				'<div class="input-group m-3">' +
  					'<div class="input-group-prepend">' +
    					'<label class="input-group-text submit-buy " for="sp' + data[i].seqno + '">加入購物車</label>' +
 					'</div>' + 
 					' <select class="custom-select" name="amount" id="sp' + data[i].seqno + '">' + 
	    				'<option value="1" selected>1</option>' +
	    				'<option value="2">2</option>' +
	    				'<option value="3">3</option>' +
	    				'<option value="4">4</option>' +
	    				'<option value="5">5</option>' +
					'</select>' + 
				'</div>'+
				'</form>' +
				
				"</td>"+		
				"</tr>"+
				
				"</div>"
			)
		}
	}

	function setPageController(page) {

		if (page > 1) {
			$("#pageNo").html(page + ' / ' + totalPage)
		} else if (page == 1) {
			$("#pageNo").html(page + ' / ' + totalPage)
		}
		$(".pageControl").find("input").attr("disabled", true)
		if (page > 1) {
			$("#firstPage").attr("name", 1).attr("disabled", false)
			$("#previousPage").attr("name", page - 1).attr("disabled", false)
		}
		if (page < totalPage) {
			$("#nextPage").attr("name", page + 1).attr("disabled", false)
			$("#lastPage").attr("name", totalPage).attr("disabled", false)
		}
	}



	//	//招出錯誤訊息
	//	if(errors!=null){
	//		swal("Oops! 出現錯誤了", errors,"error")
	//	}
	//	
	//	$("#deleteCancel").on("click",function(){
	//		$("#deleteID").empty()
	//		$("#deleteBlock").css({
	//			"opacity" : "1",
	//			"pointer-events" : "auto",
	//		})
	//		$("#deleteConfirm").hide();
	//		
	//	})
	//	
	
	
// demo1 確認/完成按鍵
document.getElementById("demo1").addEventListener("click", function () {
  swal("確認!", "已完成!", "success")
});









})