<%@page import="java.util.List"%>
<%@page import="javax.naming.*"%>
<%@page import="cn.maiba.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<title>修改用户信息</title>
<body>
<style>
form[name='form1'] {
	width: 50px;
	margin: 200px;
	background-color: #93D1FF;
	text-align: center;
	margin: 20px;
}

table {
	width: 40%;
}

td:first-child {
	background-color: #EEEEEE;
	width: 80px;
}

td:last-child {
	background-color: white;
	padding-left: 5%;
	text-align: left;
}
</style>
	<%
		request.setCharacterEncoding("utf-8");
		User user = (User) session.getAttribute("user");
		user = (User) MyDataBase.load(User.TABLE_NAME, user.getId());
	%>




<body>
	<%@ include file="/include/header.jsp"%>
		<form name="form1" action ="<%=request.getContextPath() %>/article/Handle-UserModify.jsp">
		<b>用户具体信息</b>
		<table>
			<tr>
				<td>ID：</td>
				<td> <%=user.getId()%>
				</td>
			</tr>
			<tr>
				<td>账号：</td>
				<td><input name = "number" type='text' value= <%=user.getAccount() %>>
				</td>
			</tr>
			<tr>
				<td>密码：</td>
				<td><input name= "password" type='text' value=<%=user.getPassword()%>>
				</td>
			</tr>
			<tr>
				<td>昵称：</td>
				<td><input name="name" type='text' value=<%=user.getAccount()%> >
				</td>
			</tr>
			<tr>
				<td>年龄：</td>
				<td><input name="age" type='text' value=<%=user.getAge()%> >
				</td>
			</tr>
			<tr>
				<td>电子邮件：</td>
				<td><input name="email" type='text' value=<%=user.getEmail()%> >
				</td>
			</tr>
		</table>
			<button type="submit">
				修改
			</button>	
	</form>
		
			
			

		</table>
	</form>

	<%@ include file="/include/footer.jsp"%>
</body>


</html>