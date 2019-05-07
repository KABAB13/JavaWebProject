<%@page import="java.util.List"%>
<%@page import="javax.naming.*"%>
<%@page import="cn.maiba.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<head>
<style>
span {
	color: red;
}

#top, #footer {
	background-color: #EEEEEE;
	padding: 8px;
	font-size: 15px;
}

#footer {
	text-align: right;
	background-color: #EEEEEE;
}

form[name='form1'] {
	width: 500px;
	margin: auto;
	background-color: #93D1FF;
	text-align: center;
	margin: 20px auto;
}

form[name="search"] {
	text-align: right;
}

b {
	line-height: 28px;
}

table {
	width: 100%;
}

tr td:first-child {
	background-color: #EEEEEE;
	width: 100px;
}

tr td:last-child {
	background-color: white;
	padding-left: 10px;
	text-align: left;
}

table input {
	width: 95%;
}

#menu {
	float: right;
}

#menu a {
	font-size: 15px;
	margin-left: 15px;
}

#hello {
	color: #2D93CA;
}
</style>

</head>
<body>
	<form name="search">
		<input type="text" /> <select>
			<option></option>
			<option></option>
		</select>
		<button>搜索</button>
	</form>
	<%
		request.setCharacterEncoding("utf-8");
		User u1 = (User) session.getAttribute("user");
		String s = "游客";
		if (u1 != null) { //登录成功
			s = u1.getAccount();
			System.out.println(s + "已成功登录");

		}
	%>

	<div id="top">
		<span id="hello"> <span id="hello"><%=s%>，你好</span>
			<div id="menu">
				<%
					if (u1 != null) { //登录成功
						out.println("<a href='#'>"+"麦吧"+"</a>");
						out.println("<a href='#'>"+"后台管理"+"</a>");
						out.println("<a href='"+ request.getContextPath() + "/logon/UserModify.jsp"+"'>"+"修改基本信息"+"</a>");
						out.println("<a href='"+ request.getContextPath() + "/article/UserExit.jsp"+"'>"+"退出麦吧"+"</a>");

					}else{
						out.println("<a href='#'>"+"麦吧"+"</a>");
						out.println("<a href='"+ request.getContextPath() + "/article/UserLogon.jsp"+"'>"+"登录"+"</a>");
						out.println("<a href='"+ request.getContextPath() + "/article/NewFile.jsp"+"'>"+"注册"+"</a>");
					}
				%>
				
			</div>
	</div>
</body>
</html>