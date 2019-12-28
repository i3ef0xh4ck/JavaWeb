<%@page import="com.jiancheng.wu.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="filter.jsp" %>
<%
	Vector<User> users = (Vector<User>)application.getAttribute("users");
	if(users == null){
		System.out.println("no such user!");
		response.sendRedirect("backToIndex2.jsp");	
		return;
	}
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	for(User user : users){
		if(username.equals(user.getUsername())){
			if(password.equals(user.getPassword())){
				//System.out.println("success!");
				session.setAttribute("login", user);
				response.sendRedirect("index.jsp");
			}else {
				//System.out.println("wrong password!");
				response.sendRedirect("backToIndex2.jsp");		
			}
			break;
		}else {
			//System.out.println("no such user!");
			response.sendRedirect("backToIndex2.jsp");	
		}
	}
%>