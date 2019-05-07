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
	<%@ include file="/include/header.jsp"%>
<div id = "container">
<b>		删除用户成功！</b>
</br>
		<button type="button" onclick="returnto()">返回</button>
</div>
	<%@ include file="/include/footer.jsp"%>		
<script>

function returnto(){
	
	
	var url = request.getContextPath() +"/logon/UserList.jsp";
	 window.location.href= url;
}

</script>	
</body>
</html>