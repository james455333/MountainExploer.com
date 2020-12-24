<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>岳進者404</title>
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<style>
		html {
		  height: 100%;
		}
		
		body {  
		  height: 100%;
		  background: url("../images/exception404.jpg");
		  background-size: cover;  
		  overflow: hidden;
			
		  display: flex;
		  flex-flow: column wrap;
		  justify-content: center;
		  align-items: center;
		}
		
		.text h1{
		  color: #011718;
			margin-top: -200px;
		  font-size: 15em;
			text-align: center;
			text-shadow: -5px 5px 0px rgba(0,0,0,0.7), -10px 10px 0px rgba(0,0,0,0.4), -15px 15px 0px rgba(0,0,0,0.2);
			font-family: monospace;
		  font-weight: bold;
		}
		
		.text h2{
		  color: black;
		  font-size: 5em;
			text-shadow: -5px 5px 0px rgba(0,0,0,0.7);
			text-align: center;
			margin-top: -150px;
			font-family: monospace;
		  font-weight: bold;
		}
		.text #mainMsg{
		  color: white;
			margin-left: 30px;
		  font-size: 2em;
			text-shadow: -5px 5px 0px rgba(0,0,0,0.7);
			margin-top: -40px;
			font-family: monospace;
		  font-weight: bold;
		}
		.torch {
		  margin: -150px 0 0 -150px;
		  width: 200px;
		  height: 200px;
		  box-shadow: 0 0 0 9999em #000000f7;
		  opacity: 1;
		  border-radius: 50%;
		  position: fixed;
		  background: rgba(0,0,0,0.3);
		  z-index : 5;
		  pointer-events: none;
		 }
		 .torch:after{
		    content: '';
		    display: block;
		    border-radius: 50%;
		    width: 100%;
		    height: 100%;
		    top: 0px;
		    left: 0px;
		    box-shadow: inset 0 0 40px 2px #000,
					0 0 20px 4px rgba(13,13,10,0.2)
			  
		  }
		  #back{
		  	color : red;
		  	z-index : 10;
		  }
		
	
	</style>
</head>
<body>

	<div class="text">
	  <h1>404</h1>
		<h2>抱歉，這裡太黑了</h2>
	  <div id="mainMsg"><a id="back" href="#">點我</a>回到明亮的地方吧</div>
	</div>
	<div class="torch"></div>
	<script>
		$(document).mousemove(function (event) {
			  $('.torch').css({
			    'top': event.pageY,
			    'left': event.pageX
			  });
			});
		$("#back").click(function(){
			console.log("AAA")
				location.assign("/MountainExploer.com")
			})
	</script>


</body>
</html>
