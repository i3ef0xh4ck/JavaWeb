<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>验证密码</title>

<style>
	.buttons {
		text-align: center;
	}
	.caption {
		text-align: center;
		background-color: lightgray;
	}
	.error {
		color: red;
	}
</style>

</head>
<body>
	<form action="doCheckPassword.jsp" method="post">
		<table>
			<tr>
				<td colspan="2" class="caption">验证密码</td>
			</tr>
			<%
				String msg = (String)request.getAttribute("error");
				if(msg != null) {
			%>
					<tr>
						<td colspan="2" class="error">
							<%= msg %>
						</td>
					</tr>
			<%
				}
			%>
			<tr>
				<td>原密码：</td>
				<td><input type="password" name="password" id="" /></td>
			</tr>
			<tr>
				<td colspan="2" class="buttons">
					<input type="reset" value="取消" />
					<input type="submit" value="确认" />
				</td>
			</tr>
		</table>
		<input type="hidden" name="isReady" value="true"/>
	</form>

</body>
</html>