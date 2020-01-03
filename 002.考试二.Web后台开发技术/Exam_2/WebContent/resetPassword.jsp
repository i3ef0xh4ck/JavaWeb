<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String isReady = (String)request.getAttribute("isReady");
	String msg = (String)request.getAttribute("error");
	if(!"true".equals(isReady)&& msg==null){
		response.sendRedirect("checkPassword.jsp");
		return;
	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>重置密码</title>

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

	<form action="doResetPassword.jsp" method="post">
		<table>
			<tr>
				<td colspan="2" class="caption">重置密码</td>
			</tr>
			<%
				
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
				<td>密码：</td>
				<td><input type="password" name="password1" id="" /></td>
			</tr>
			<tr>
				<td>重复密码：</td>
				<td><input type="password" name="password2" id="" /></td>
			</tr>
			<tr>
				<td colspan="2" class="buttons">
					<input type="reset" value="取消" />
					<input type="submit" value="确定修改" />
				</td>
			</tr>
		</table>
	</form>

</body>
</html>