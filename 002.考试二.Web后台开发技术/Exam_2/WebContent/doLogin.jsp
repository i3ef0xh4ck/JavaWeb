<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.jason.registration.dao.UserDao" %>
<%@ page import="com.jason.registration.dao.impl.mysql.UserDaoImpl" %>
<%@ page import="com.jason.registration.entity.User" %>
    
<%
	request.setCharacterEncoding("utf-8");

	String username = request.getParameter("username");
	String password = request.getParameter("password");
	
	if(username == null || username.trim().equals("")) {
		request.setAttribute("error", "用户名不能为空！");
		request.getRequestDispatcher("login.jsp").forward(request, response);
		return;
	}

	if(password == null || password.trim().equals("")) {
		request.setAttribute("error", "密码不能为空！");
		request.getRequestDispatcher("login.jsp").forward(request, response);
		return;
	}

	UserDao userDao = new UserDaoImpl();
	
	int count = userDao.countUserByName(username);
	
	if(count == 0) {
		request.setAttribute("error", "用户不存在！");
		request.getRequestDispatcher("login.jsp").forward(request, response);
	} else {
		User user = userDao.findUserByName(username);
		
		if(user == null) {
			request.setAttribute("error", "登录失败！");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		} else {
			if(password.equals(user.getPassword())) {
				session.setAttribute("login", user);
				response.sendRedirect("checkPassword.jsp");
			} else {
				request.setAttribute("error", "密码错误！");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
		}
	}
%>