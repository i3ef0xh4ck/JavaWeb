<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.jason.registration.entity.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Web聊天工具</title>
<script src="js/jquery-1.12.4.js" type="text/javascript" charset="utf-8"></script>
<script src="js/SendAndReciveMes.js" type="text/javascript" charset="utf-8"></script>
<style>
	textarea {
		width: 500px;
		display: block;
		height: 300px;
		resize: none;
	}
	input {
		width: 400px;
	}
</style>
</head>
<body>
	<%
		User user = (User)session.getAttribute("login");
	%>
	<div id="user1"><%=user.getUsername() %></div>
	<textarea id="mes"></textarea>
	<input type="text" id="input_mes" name="input_mes" value="" />
	<button id="send_mes">发送</button>
</body>
</html>