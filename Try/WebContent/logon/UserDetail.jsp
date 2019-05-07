<%@page import="java.util.List"%>
<%@page import="javax.naming.*"%>
<%@page import="cn.maiba.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
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

	<form name="form1">
		<b>用户具体信息</b>
		<table>
			<tr>
				<td>ID：</td>
				<td><%=user.getId()%></td>
			</tr>
			<tr>
				<td>账号：</td>
				<td><%=user.getAccount()%>
				</td>
			</tr>
			<tr>
				<td>密码：</td>
				<td><%=user.getPassword()%>
				</td>
			</tr>
			<tr>
				<td>昵称：</td>
				<td><%=user.getUserName()%>
				</td>
			</tr>
			<tr>
				<td>年龄：</td>
				<td><%=user.getAge()%>
				</td>
			</tr>
			<tr>
				<td>电子邮件：</td>
				<td><%=user.getEmail()%>
				</td>
			</tr>
		</table>
		<input type="button" value="修改" onclick="handle_modify()"> <input
			type="button" value="删除" onclick="handle_delete()"> <input
			type="button" value="返回" onclick="handle_list_user()">
	</form>

	<%@ include file="/include/footer.jsp"%>
	<script type="text/javascript">
	function handle_modify(){		window.location.href="<%=request.getContextPath()%>/logon/UserModify.jsp?userId=<%=user.getId()%>";
	}

	function handle_delete(){		window.location.href="<%=request.getContextPath()%>/logon/Handle-UserDelete.jsp?userId=<%=user.getId()%>";
	}

	function handle_list_user(){		window.location.href="<%=request.getContextPath()%>/logon/UserList.jsp";
		}
	</script>

</body>
</html>