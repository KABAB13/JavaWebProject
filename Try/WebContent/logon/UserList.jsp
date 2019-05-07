<%@page import="java.util.List"%>
<%@page import="javax.naming.*"%>
<%@page import="cn.maiba.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<style>
form[name='form1'] {
	width: auto;
	margin: 100px;
	background-color: #93D1FF;
	text-align: center;
	margin: 20px;
}

table {
	width: 40%;
	text-align: center;
}

tr,td:last-child {
	background-color: white;
	padding-left: 5%;
	text-align: left;
}

td,tr:first-child {
	background-color: #EEEEEE;
	width:auto;
}
</style>
<body>
	<%@ include file="/include/header.jsp"%>



	<form name="form1">
		<b>用户列表</b>
		<table>
			<tr>
				<td>ID</td>
				<td>账号</td>
				<td>密码</td>
				<td>昵称</td>
			<tr>
		<% 
					List userList = MyDataBase.list(User.TABLE_NAME);
					User user = null;
					int i = 0;
					
					for (i = 0; i < userList.size(); i++) {
						user = (User) userList.get(i);
						System.out.println(user.getUserName());
						
						out.println("<tr>");
						out.println("<td>");
						out.println(user.getId());
						out.println("</td>");
						out.println("<td>");
						out.println("<a href ='"+ request.getContextPath() + "/logon/UserDetail.jsp?userId=" +user.getId()+"'>"+user.getAccount());
						out.println("</td>");
						out.println("<td>");
						out.println(user.getPassword());
						out.println("</td>");
						out.println("<td>");
						out.println(user.getUserName());
						out.println("</td>");
						out.println("</tr>");
							
						
					}
					
				%>
		
			
		</table>
	</form>

	<%@ include file="/include/footer.jsp"%>












</body>
</html>