<%@page import="java.util.List"%>
<%@page import="javax.naming.*"%>
<%@page import="cn.maiba.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

<body>
	<script>
		
<%
request.setCharacterEncoding("utf-8");
User u1 = new User();
u1.setUserName(request.getParameter("name"));
u1.setAccount(request.getParameter("number"));
u1.setPassword(request.getParameter("password"));
u1.setEmail(request.getParameter("email"));
if(request.getParameter("age").length()==0){
	u1.setAge(0);
}
else{
	u1.setAge(Integer.parseInt(request.getParameter("age")));
}
List<MyTableItem> userList = MyDataBase.select(User.TABLE_NAME, "account", u1.getAccount(), DBOperator.OP_EQUAL);
if(userList == null || userList.size()==0 && u1.getUserName().length() !=0 && 
u1.getPassword().length() >= 6 && u1.getAge() > 0 && u1.getAge() < 150)
{
	MyDataBase.save(u1.TABLE_NAME, u1);
	System.out.print(userList);
	MyDataBase.save(User.TABLE_NAME,u1);
	System.out.println(request.getParameter("number"));
	System.out.println(request.getParameter("password"));
	System.out.println(request.getParameter("name"));
	System.out.println(u1.getAge());
	System.out.println(request.getParameter("email"));
	response.sendRedirect("success.jsp");
	
}
else {
	System.out.println("重复");
	response.sendRedirect("failure.jsp");
}
%>
		

	
	
	
	
	
	
	
	
	
	

//	request.setCharacterEncoding("utf-8");

//			String UserNumber = "";
//			String UserPassword = "";
//			String UserName = "";
//			String UserAge = "";
//			String UserEmail = "";
//			UserNumber = request.getParameter("number");
//			UserPassword = request.getParameter("password");
//			UserName = request.getParameter("name");
//			UserAge = request.getParameter("age");
//			UserEmail = request.getParameter("email");
//			out.println("UserName");
	//
	</script>
</body>
</html>