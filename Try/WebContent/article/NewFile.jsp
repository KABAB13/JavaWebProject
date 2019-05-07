<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<title>用户注册</title>
<html>
<meta charset="UTF-8">
<title></title>
<style>
span {
	color: red;
}

#top, #footer {
	background-color: #EEEEEE;
	padding: 8px;
	font-size: 15px;
}

#footer {
	text-align: right;
	background-color: #EEEEEE;
}

form[name='form1'] {
	width: 500px;
	margin: auto;
	background-color: #93D1FF;
	text-align: center;
	margin: 20px auto;
}

form[name="search"] {
	text-align: right;
}

b {
	line-height: 28px;
}

table {
	width: 100%;
}

td:first-child {
	background-color: #EEEEEE;
	width: 100px;
}

td:last-child {
	background-color: white;
	padding-left: 5%;
	text-align: left;
}

table input {
	width: 95%;
}

#hello {
	color: #2D93CA;
}
</style>
</head>
<body>
	<%@ include file="/include/header.jsp"%>

	<form action="Handle-UserRegister.jsp" method="post" name="form1">
		<b>用户注册</b>
		<table>
			<tr>
				<td>账号：</td>
				<td><input type="text" name="number" placeholder="请输入账号 "
					onblur="isNumber()" /> <span>*</span></td>
			</tr>
			<tr>
				<td>密码：</td>
				<td><input type="password" name="password"
					placeholder="请输入6位或以上的数字或字符 " onblur="isPassword()" /> <span>*</span>
				</td>
			</tr>
			<tr>
				<td>昵称：</td>
				<td><input type="text" name="name" placeholder="请输入昵称 "
					onblur="isName()" /></td>
			</tr>
			<tr>
				<td>年龄：</td>
				<td><input type="number" name="age" placeholder="请输入数字 "
					onblur="isAge()" /></td>
			</tr>
			<tr>
				<td>电子邮件：</td>
				<td><input type="text" name="email"
					placeholder="xxxxx@yyyy.com " onblur="isEmail(this.value)" /></td>
			</tr>
		</table>
		<button type="submit">注册</button>
	</form>
	<%@ include file="/include/footer.jsp"%>
	<script language="javascript">
		document.forms[1].onsubmit = function() {
			if (form1.number.value == "" || form1.password.value == "") {
				alert("您的账号或密码不能为空！");
				return false
			} else /*document.表单名.文本域名.value==''"|| form1.password.value.length<6*/
			{
				alert("注册中....");
				return true;
			}
		}

		function isEmail(strEmail) {
			var flag = strEmail
					.search(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/);
			if (flag == -1) {
				alert("邮箱不正确");
			}
		}

		function isName() {
			if (form1.name.value == "") {
				alert("姓名不能为空");

			}
		}

		function isPassword() {
			if (form1.password.value == "" || form1.password.value.length < 6) {
				alert("密码不能小与6位！！");
			}

		}

		function isAge() {
			if (form1.age.value == "" || form1.age.value >= 150
					|| form1.age.value <= 0) {
				alert("请正确填写年龄！！");
				return false;
			}
			if (form1.age.value >= "a" && form1.age.value <= "z") {
				alert("只能输入数字！！");
				return false;
			}
		}

		function isNumber() {
			if (form1.number.value == "") {
				alert("账号不能为空！！");
				return false;
			}
		}
	</script>

</body>
</html>