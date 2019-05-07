<%@page import="java.util.List"%>
<%@page import="javax.naming.*"%>
<%@page import="cn.maiba.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<style>
		#container{
		margin-left:auto;
		margin-right:auto ;
		width:500px;
		 text-align: center;
		}
		</style>
<body>
	<%
	request.setCharacterEncoding("utf-8");

	String account = request.getParameter("name");
	String password = request.getParameter("password");
	List<MyTableItem> userList = MyDataBase.select(User.TABLE_NAME, "account", account, DBOperator.OP_EQUAL);
	if (userList == null ||  userList.size()==0)
	{
		response.sendRedirect("account_null.jsp");//跳转到失败页面。页面显示：帐号不存在，登录失败。
	}else{//帐号存在
	User user1 = (User)userList.get(0);//因为帐号不能重复，故读出来的数据一定只有一个
	if(user1.getPassword().equals(password ))//密码正确
	{
		session.setAttribute("user", user1);
		request.getSession().getAttribute("user1");
		String forwordURL = (String) session.getAttribute("forwordURL");
		System.out.println("after logon:"+forwordURL);
		if(forwordURL != null){
			session.removeAttribute("forwordURL");
			response.sendRedirect(forwordURL);			
		}else{
			System.out.println("登录失败");
			
		}
		
	}else{//密码错误
		response.sendRedirect("password_wrong.jsp");//跳转到失败页面。页面显示：密码错误，登录失败。
	}
	}

	%>
</body>
</html>