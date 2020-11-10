$(function(){
		
		$("#testAjax").on("click",function(){
			$.ajax({
	  			url:"/MountainExploer.com/mountainBackStage/ajax",
	 			method:"GET",
	 			dataType: 'json',
	  			success:function(data){
	  				console.log("start")
	  				console.log(data)
	  				for(let i = 0 ; i< data.length ; i++ ){
		  				$(".table").find("tbody").append("<tr><tr>")
	  					$(".table").find("tbody").find("tr").eq(i)
	  					.append(
	  							"<td>" + data[i].seqno + "</td>"+
	  							"<td>" + data[i].npName + "</td>"+
	  							"<td>" + data[i].npName + "</td>"+
	  							"<td>" + data[i].description + "</td>"+
	  							"<td>" + data[i].advice + "</td>"+
	  							"<td>" + data[i].traffic + "</td>"
	  							)
	  					console.log(data[i].seqno)
	  				}
	  			},
	  			error:function(err){console.log(err)},
			})
		})
		
	})
