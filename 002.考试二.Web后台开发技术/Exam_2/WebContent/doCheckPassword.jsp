<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.jason.registration.entity.User" %>
<%
	User user = (User)session.getAttribute("login");
	String relPassword = user.getPassword();
	
	String password = request.getParameter("password");
	
	if(password.equals(relPassword)){
		String isReady = request.getParameter("isReady");
		if("true".equals(isReady)){
			request.setAttribute("isReady", "true");
			request.getRequestDispatcher("resetPassword.jsp").forward(request, response);
		}
	}else {
		request.setAttribute("error", "密码输入错误！");
		request.getRequestDispatcher("checkPassword.jsp").forward(request, response);
		return;
	}
%>
