<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<% 
	String isReady = request.getParameter("isReady");
	if(isReady == null) {
		response.sendRedirect("backToIndex.jsp");
		return;
	}
%>