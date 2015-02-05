<%@LANGUAGE="VBSCRIPT"%>
<!--#include file="../Connections/conn.asp" -->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>登录后台管理系统</title>
<style type="text/css">
<!--
body, td, th {
	font-family: "微软雅黑";
	background-color: #0090ff;
}
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
#bg {
	position: absolute;
	left: 50%;
	top: 50%;
	width: 708px;
	height: 421px;
	margin: -210px 0 0 -354px;
	overflow: hidden;
	z-index: 1;
	background-image: url("images/login.jpg");
	background-repeat: no-repeat;
}
#username {
	position: absolute;
	left: 263px;
	top: 123px;
	width: 208px;
	height: 35px;
	font-size: 28px;
	overflow: hidden;
	color: #666;
	border: 0px solid #000033;
	z-index: 2;
}
#password {
	position: absolute;
	left: 263px;
	top: 185px;
	width: 205px;
	height: 35px;
	font-size: 28px;
	overflow: hidden;
	color: #666;
	border: 0px solid #000033;
	z-index: 2;
}
#reset {
	position: absolute;
	width: 114px;
	height: 119px;
	left: 493px;
	top: 117px;
	z-index: 2;
}
-->
</style>
<script type="text/JavaScript">

if (top.location != self.location)top.location=self.location; 
function checkForm(obj){
	if(obj.username.value == ''){
		alert("请输入用户名")
		obj.username.focus();
		return false
	}
	if(obj.password.value == ''){
		alert("请输入密码")
		obj.password.focus();
		return false
	}
	return true
}

</script>
</head>

<body  scroll="no">
<div id="bg">
  <form name="form1" method="POST" onsubmit="return checkForm(this)" action="cklogin.asp">
    <input name="username" type="text" id="username"/>
    <input name="password" type="password" id="password" />
    <div id="reset">
      <input name="Submit2" type="submit" style="background:url(images/dl1.gif); cursor:hand; border:none; width:114px; height:119px;" onmouseover="this.style.background='url(images/dl2.gif)'" onmouseout="this.style.background='url(images/dl1.gif)'"  value="" />
    </div>
  </form>
</div>
</body>
</html>
