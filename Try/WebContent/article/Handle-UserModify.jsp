<%@page import="java.util.List"%>
<%@page import="javax.naming.*"%>
<%@page import="cn.maiba.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<body>
<%
		request.setCharacterEncoding("utf-8");
		User user = (User) session.getAttribute("user");
		if(MyDataBase.update(User.TABLE_NAME, user)){
			user.setUserName(request.getParameter("name"));
			user.setAccount(request.getParameter("number"));
			user.setPassword(request.getParameter("password"));
			user.setEmail(request.getParameter("email"));
			if(request.getParameter("age").length()==0){
				user.setAge(0);
			}
			else{
				user.setAge(Integer.parseInt(request.getParameter("age")));
			}
			MyDataBase.save(user.TABLE_NAME, user);
			MyDataBase.save(User.TABLE_NAME,user);
			response.sendRedirect(request.getContextPath() +"/logon/UserList.jsp");
		}
		else{
			response.sendRedirect("account_null.jsp");
		}
	%>

</body>
</html>