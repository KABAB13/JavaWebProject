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
	MyDataBase.delete(User.TABLE_NAME, user.getId());
	MyDataBase.save(User.TABLE_NAME,user);
	if(MyDataBase.delete(User.TABLE_NAME, user.getId())){
	
		response.sendRedirect(request.getContextPath()+"/article/delete_success.jsp");
		System.out.println("删除"+user.getUserName()+"成功！");
	}
	else
	{
		System.out.println("删除"+user.getUserName()+"失败！");
	}
	
%>
</body>
</html>