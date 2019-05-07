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
<b>		密码或账号错误，登录失败。</b>
</br>
		<button type="button" onclick="returnto()">返回</button>
</div>
	<%@ include file="/include/footer.jsp"%>		
<script>

function returnto(){
	
	
	var url = "UserLogon.jsp";
	 window.location.href= url;
}

</script>	
</body>
</html>