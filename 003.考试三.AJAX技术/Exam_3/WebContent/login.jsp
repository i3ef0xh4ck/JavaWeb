<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登陆界面</title>
<script src="js/jquery-1.12.4.js" type="text/javascript" charset="utf-8"></script>
<style>
	.login_form {
		margin: 20px auto 0 auto;
	}
	.login_form .control-group {
		margin-top: 10px;
	}
	.login_form .control-group label {
		display: inline-block;
		text-align: right;
		width: 70px;
		margin-right: 10px;
	}
	.login_form .control-group input {
		text-align: left;
		padding: 0.1em 0.6em;
		outline: none;
		border: 1px solid rgb(182,182,182);
		height: 30px;
		width: 14em;
		font-size: 16px;
	}
	.prompt {
	    text-align: left;
		color: #ff5b5b;
		height: 20px;
	}
</style>
</head>
<body>

	<form method="post" id="login" class="login_form">
		<div class="control-group">
			<label>用户名:</label>
			<input type="text" id="username" name="username" title="请填写用户名" >
			<div id="username_prompt" class="prompt"></div>
		</div>
		<div class="control-group">
			<label>密码:</label>
			<input type="password" id="password" name="password" title="请填写密码" >
			<div id="password_prompt" class="prompt"></div>
		</div>
	</form>
	<button id="sure">登录</button>
	<script type="text/javascript" src="js/loginCheck.js" ></script>
</body>
</html>