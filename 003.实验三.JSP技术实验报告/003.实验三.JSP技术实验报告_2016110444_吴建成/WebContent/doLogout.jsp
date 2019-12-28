<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String state = (String)request.getParameter("isReady");
	if("true".equals(state)){
		session.removeAttribute("login");
		session.invalidate();
		response.sendRedirect("index.jsp");
	}else {
		response.sendRedirect("backToIndex.jsp");
	}
%>