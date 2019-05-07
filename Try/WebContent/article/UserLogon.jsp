<%@page import="java.util.List"%>
<%@page import="javax.naming.*"%>
<%@page import="cn.maiba.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<title>用户登录</title>
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
<body>

	<%@ include file="/include/header.jsp"%>

	<form action="Handle-UserLogon.jsp" method="post" name="form1">
		<b>用户登录</b>
		<table>
			<tr>
				<td>昵称：</td>
				<td><input type="text" name="name" placeholder="请输入昵称 "
					onblur="isName()" /></td>
			</tr>
			<tr>
				<td>密码：</td>
				<td><input type="password" name="password"
					placeholder="请输入6位或以上的数字或字符 " onblur="isPassword()" /> <span>*</span>
				</td>
			</tr>
		</table>
		<button type="button" onclick = "returnto()">注册</button>
		<button type="submit" >登录</button>
	</form>

	<%@ include file="/include/footer.jsp"%>
</body>
<script>
function returnto(){
	
	
	var url = "NewFile.jsp";
	 window.location.href= url;
}


</script>
</html>