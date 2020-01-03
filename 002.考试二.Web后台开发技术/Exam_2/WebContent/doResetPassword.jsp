<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.jason.registration.dao.UserDao" %>
<%@ page import="com.jason.registration.dao.impl.mysql.UserDaoImpl" %>
<%@ page import="com.jason.registration.entity.User" %>

<%
	User user = (User)session.getAttribute("login");
	String password1 = request.getParameter("password1");
	String password2 = request.getParameter("password2");
	
	if(password1 == null || password1.trim().equals("")) {
		request.setAttribute("error", "密码不能为空！");
		request.getRequestDispatcher("resetPassword.jsp").forward(request, response);
		return;
	}
	
	if(password2 == null || password2.trim().equals("")) {
		request.setAttribute("error", "重复密码不能为空！");
		request.getRequestDispatcher("resetPassword.jsp").forward(request, response);
		return;
	}
	
	if(!password1.equals(password2)){
		request.setAttribute("error", "两次输入不一致！");
		request.getRequestDispatcher("resetPassword.jsp").forward(request, response);
		return;
	}else {
		UserDao userDao = new UserDaoImpl();		
		int ret = userDao.resetPassword(user, password2);
		if(ret==1){
			response.sendRedirect("resetSuccess.jsp");
		}else {
			request.setAttribute("error", "修改失败");
			request.getRequestDispatcher("resetPassword.jsp").forward(request, response);
		}
	}
%>