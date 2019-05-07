<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<style>
#container{
margin-left:auto;
margin-right:auto ;
margin-top:50px;
marigin-bottom:100px;
width:500px;
text-align: center;
}
</style>

<body>
	<%@ include file="/include/header.jsp"%>
<div id = "container">

	用户尚未登录，所以无法执行您所做的操作。请先 <a href =" <%=request.getContextPath() %>/article/UserLogon.jsp"> 登录</a> ! 
	

		
</div>
	<%@ include file="/include/footer.jsp"%>		


	
</body>
</html>