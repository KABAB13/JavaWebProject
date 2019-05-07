<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
#container{
margin-left:auto;
margin-right:auto ;
width:500px;
 text-align: center;
}
</head>
</style>
<%@ include file="/include/header.jsp"%>
<body>
	
<div id = "container">
<b>		该账号已被使用，请重新选择一个账号</b>
</br>
		<button type="button" onclick="returnto()">返回</button>
</div>
		
<script>

function returnto(){
	
	
	var url = "NewFile.jsp";
	 window.location.href= url;
}

</script>
	
</body>
<%@ include file="/include/footer.jsp"%>
</html>