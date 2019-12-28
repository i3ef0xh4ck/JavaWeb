<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>粗错啦~</title>
        <meta charset="UTF-8">
        <link rel="stylesheet" type="text/css" href="css/normal.css" />
        <script type="text/javascript" src="js/jquery-1.12.4.js" ></script>
        <style>
        	div.main-content>div {
        		font-size: 16px;
        		margin-top: 200px;
        	}
        </style>
    </head>
    <body>
		<div class="header">
			<div class="header-content">
				<img src="img/dell-logo-white.png" width="40px" style="display: inline-block;" />
				<h3>粗错啦~</h3>
			</div>
		</div>
		<div class="main">
			<div class="main-content">
				<div>
					<p>有些页面可不是想进就能进的，么么哒~</p>
					<div id="showtime"></div>
				</div>
			</div>
		</div>
		<div class="footer">
			<div class="footer-content">
			</div>
		</div>	
 	</body>
 	<script type="text/javascript" src="js/userCheck.js" ></script>
 	<script> 
 		$(function(){
			var countdown = 5; 
			var obj = $("#showtime");
			showTime(obj);

			function showTime(obj) { //倒计时
				if(countdown == 0) {
					countdown = 5;
					window.location = "index.jsp";
					return;
				} else {				
					obj.html("" + countdown + "秒后跳转");
					countdown--;
				}
				setTimeout(function() {
					showTime(obj)
				}, 1000);
			}
 		});
	</script>
</html>