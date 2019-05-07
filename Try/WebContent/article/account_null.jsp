<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<body>
<style>
#container{
margin-left:auto;
margin-right:auto ;
width:500px;
 text-align: center;
}
</style>
</head>
</style>
<%@ include file="/include/header.jsp"%>
<body>
	
<div id = "container">
<b>		帐号或密码错误，登录失败。</b>
</br>
		<button type="button" onclick="returnto()">返回</button>
</div>
<script>

function returnto(){
	
	
	var url = "UserLogon.jsp";
	 window.location.href= url;
}

</script>
	
</body>
<%@ include file="/include/footer.jsp"%>		
</body>
</html>