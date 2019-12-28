<%@page import="com.jiancheng.wu.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="filter.jsp" %>
<%
	String username = request.getParameter("username");
	String nickname = request.getParameter("nickname");
	String password = request.getParameter("password");
	String email = request.getParameter("email");
	StringBuffer other = new StringBuffer(request.getParameter("other"));
	User user = new User(username,nickname,password,email,other);
	Vector<User> users = (Vector<User>)application.getAttribute("users");
	if(users ==  null){
		users = new Vector<User>();
	}
	users.add(user);
	application.setAttribute("users",users);
%>
<!DOCTYPE html>
<html>
	<head>
		<title>注册成功</title>
		<meta charset="UTF-8">
		<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
		<link rel="stylesheet" type="text/css" href="css/normal.css" />
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
				<h3>注册成功</h3>
			</div>
		</div>
		<div class="main">
			<div class="main-content">
				<div>
					<p>亲爱的 <%=user.getUsername() %> ，你已经注册成功了哦！</p>
					<div id="showtime"></div>
				</div>
			</div>
		</div>
		<div class="footer">
			<div class="footer-content">
			</div>
		</div>
	</body>
	<script>
		$(function() {
			var countdown = 5;
			var obj = $("#showtime");
			showTime(obj);

			function showTime(obj) { //倒计时
				if(countdown == 0) {
					countdown = 5;
					window.location = "index.jsp";
					return;
				} else {
					obj.html("" + countdown + "秒后跳转首页");
					countdown--;
				}
				setTimeout(function() {
					showTime(obj)
				}, 1000);
			}
		});
	</script>

</html>