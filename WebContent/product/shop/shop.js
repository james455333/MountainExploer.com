
$(function() {
	//頁面參數
	var page = 1;
	if (typeof showData === 'undefined') var showData = 10;
	var totalPage = 0;
	//統一網域名稱設置
	var homeUrl = "/MountainExploer.com/shop/search";

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

	//查詢結果回覆新增表格
	function insertTable(data) {
		$(".order-table-tb").empty();
		for (let i in data) {
			$(".order-table-tb").append(
				"<tr>" +
				//				"<th>" + data[i].seqno + "</th>" +
				//			  		"<td><div >" + data[i].name + "</div></td>"+
				"<td>" + '<a href="#">' + data[i].name + '</a>' + "</td>" +
				//				"<td><div >" + data[i].type + "</div></td>" +
				//				"<td><div >" + data[i].firstClass + "</div></td>" +
				//				"<td><div >" + data[i].secondClass + "</div></td>" +
				"<td>" +
				'<img style="width: 100px; height: 100px;" src="/MountainExploer.com/backstage/product/search/images?seqno=' + data[i].seqno + '" class="productImg" >' +
				"</td>" +
				"<td><div >" + data[i].price + "</div></td>" +
				//				"<td><div >" + data[i].stock + "</div></td>" +
				"<td>" +
				"<div>" +
				"<form  action='" + homeUrl + "/updateDataPage'>" +
				'<input type="hidden" name="seqno" value="' + data[i].seqno + '" readonly>' +
				//				'<input type="select" name="amount" value={0,1,2,3,4,5}>' +
				'<select name="amount">' +
				'<option value="1">1</option>' +
				'<option value="2">2</option>' +
				'<option value="3">3</option>' +
				'<option value="4">4</option>' +
				'<option value="5">5</option>' +
				"</select>" +
				'<input type="submit" value="加入購物車">' +
				'</form>' +
				"</div>" +
				"</td>" +
				"</tr>"
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










})