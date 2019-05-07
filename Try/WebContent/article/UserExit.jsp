<%@page import="java.util.List"%>
<%@page import="javax.naming.*"%>
<%@page import="cn.maiba.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>用户退出</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	User user = (User) session.getAttribute("user");
	session.removeAttribute("user");
	response.sendRedirect(request.getContextPath()+"/article/UserLogon.jsp");
	%>
</body>
</html>