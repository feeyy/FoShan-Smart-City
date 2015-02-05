<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<%
  if session("username")=""  or session("dj") =""  then
  response.redirect "login.asp"
  end if 
%>
<!--#include file="../Connections/conn.asp" -->

<%
ID=Request.QueryString("ID")
Set news=Server.CreateObject("Adodb.Recordset")
SqlU="Select * from lc where ID=" & ID
news.open SqlU,MM_conn_STRING,1,1
%>
<%

if Request.Form("lc") <> "" then
ID=Request.Form("ID")
lc=trim(Request.Form("lc"))
pic=trim(Request.Form("pic"))
spic=trim(Request.Form("spic"))
ly=trim(Request.Form("ly"))

Set RsADD=Server.CreateObject("Adodb.Recordset")
Sql="Select * from lc where ID=" & ID
RsADD.open Sql,MM_conn_STRING,3,2

RsADD("ly")=ly
RsADD("lc")=lc
if pic <> "" then
RsADD("lcmap")=pic
end if
if spic <> "" then
RsADD("spic")=pic
end if
RsADD.update

RsADD.close
Set RsADD=Nothing
Response.Redirect("lc_edit.asp?ID="&ID)
end if
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title></title>
<link href="right.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="tablejs/jquery-latest.js"></script>
<script language="javascript">
// 参数说明
// s_Type : 文件类型，可用值为"image","flash","media","file"
// s_Link : 文件上传后，用于接收上传文件路径文件名的表单名
// s_Thumbnail : 文件上传后，用于接收上传图片时所产生的缩略图文件的路径文件名的表单名，当未生成缩略图时，返回空值，原图用s_Link参数接收，此参数专用于缩略图
function showUploadDialog(s_Type, s_Link, s_Thumbnail){
	//以下style=coolblue,值可以依据实际需要修改为您的样式名,通过此样式的后台设置来达到控制允许上传文件类型及文件大小
	var arr = showModalDialog("editor/dialog/i_upload.htm?style=coolblue&type="+s_Type+"&link="+s_Link+"&thumbnail="+s_Thumbnail, window, "dialogWidth:0px;dialogHeight:0px;help:no;scroll:no;status:no");
}
</script>
<script type="text/JavaScript">

function checkForm(obj){
	if(obj.ly.value == ''){
		alert("请输入楼宇！")
		obj.ly.focus();
		return false
	}

	if(obj.lc.value == ''){
		alert("请输入楼层！")
		obj.lc.focus();
		return false
	}
		
	return true
}

$(document).ready(function () {
		
		// Get all the thumbnail
		$('div.thumbnail-item').mouseenter(function(e) {

			// Calculate the position of the image tooltip
			x = e.pageX - $(this).offset().left;
			y = e.pageY - $(this).offset().top;

			// Set the z-index of the current item, 
			// make sure it's greater than the rest of thumbnail items
			// Set the position and display the image tooltip
			$(this).css('z-index','15')
			.children("div.tooltip")
			.css({'top': y + 10,'left': x + 20,'display':'block'});
			
		}).mousemove(function(e) {
			
			// Calculate the position of the image tooltip			
			x = e.pageX - $(this).offset().left;
			y = e.pageY - $(this).offset().top;
			
			// This line causes the tooltip will follow the mouse pointer
			$(this).children("div.tooltip").css({'top': y + 10,'left': x + 20});
			
		}).mouseleave(function() {
			
			// Reset the z-index and hide the image tooltip 
			$(this).css('z-index','1')
			.children("div.tooltip")
			.animate({"opacity": "hide"}, "fast");
		});

	});
	
</script>
</head>

<body>
<form name="form1" method="post" onSubmit="return checkForm(this)">
  <table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#ecf0f1">
    <tr>
      <td height="35" colspan="4" align="center" valign="middle" bgcolor="#3498db" class="fy2"><strong><img src="images/editor.gif" width="14" height="14" border="0" align="absmiddle">&nbsp;编辑信息 &lt;&lt;<a href="lc.asp?ly=<%=request("ly")%>">返回信息列表</a></strong></td>
    </tr>
    <tr>
      <td align="center" valign="middle" bgcolor="#FFFFFF"><img src="images/arrow_right.gif" alt="" width="16" height="16" border="0" align="absmiddle">&nbsp;楼宇：</td>
      <td width="13%" rowspan="3" align="center" valign="middle" bgcolor="#FFFFFF"><div class="thumbnail-item"><div class="tooltip"><img src="../../<%=news("lcmap")%>" alt="楼层地图" width="400" height="400" /></div><%if news("spic")<>"" then%><img src="../../<%=news("spic")%>" width="100" height="100" border="0"><%else%><img src="../../<%=news("lcmap")%>" width="100" height="100" border="0"><%end if%></div></td>
      <td align="left" valign="middle" bgcolor="#FFFFFF"><input name="ly" type="text" id="ly" onKeyUp="this.value=this.value.replace(/[^a-z^A-Z^0-9]/g,'') " value="<%=news("ly")%>" size=30 onafterpaste="this.value=this.value.replace(/[^a-z^A-Z^0-9]/g,'') ">
        <select name="se2" id="se2" onChange="ly.value=this.value;">
          <option value="">请选择一个楼宇</option>
          <% 
set sclass=server.createobject("adodb.recordset")
sclass.open"select ly from lc group by ly",MM_conn_STRING,1,1%>
          <%
if sclass.eof and sclass.bof then
%>
          <option value="">数据为空，请先手工输入！</option>
          <%else%>
          <%while not sclass.eof%>
          <option value="<%=sclass("ly")%>"> <%=sclass("ly")%></option>
          <%
sclass.movenext
wend
end if
sclass.Close()
Set sclass = Nothing
%>
      </select></td>
      <td align="left" valign="middle" bgcolor="#FFFFFF"><span class="main_bright"><img src="images/bullet_error.gif" alt="" width="16" height="16" border="0" align="absmiddle" /></span>只能输入英文和数字，如：T10</td>
    </tr>
    <tr>
      <td align="center" valign="middle" bgcolor="#FFFFFF"><img src="images/arrow_right.gif" alt="" width="16" height="16" border="0" align="absmiddle">&nbsp;楼层：</td>
      <td align="left" valign="middle" bgcolor="#FFFFFF"><input name="lc" type="text" id="lc" onKeyUp="this.value=this.value.replace(/[^\d]/g,'') " value="<%=news("lc")%>" size=30 onafterpaste="this.value=this.value.replace(/[^\d]/g,'') "></td>
      <td align="left" valign="middle" bgcolor="#FFFFFF"><span class="main_bright"><img src="images/bullet_error.gif" alt="" width="16" height="16" border="0" align="absmiddle" /></span>只能输入数字，如：10</td>
    </tr>
    <tr>
      <td width="10%" align="center" valign="middle" bgcolor="#FFFFFF"><img src="images/arrow_right.gif" alt="" width="16" height="16" border="0" align="absmiddle">&nbsp;地图：</td>
      <td width="53%" align="left" valign="middle" bgcolor="#FFFFFF"><input name="pic" type="text" id="pic" value="<%=news("lcmap")%>" size=30><input type="hidden" name="spic" id="spic"  value="<%=news("spic")%>" >
      <input type=button value="上传图片..." onClick="showUploadDialog('image', 'form1.pic', 'form1.spic')" class="button"></td>
      <td width="24%" align="left" valign="middle" bgcolor="#FFFFFF"><span class="main_bright"><img src="images/bullet_error.gif" alt="" width="16" height="16" border="0" align="absmiddle" />&nbsp;</span>上传楼层地图图片，建议小于1080*1920Px大小的。</td>
    </tr>
    <tr>
      <td colspan="4" align="center" valign="middle" bgcolor="#3498db">
        <input type="hidden" name="ID"  value="<%=news("ID")%>"/>
        <input class="button" type="submit" name="button" id="button" value="提交">
        &nbsp;&nbsp;
        <input class="button" type="reset" name="button2" id="button2" value="重置"></td>
    </tr>
  </table>
</form>
</body>
</html>
<%
news.Close()
Set news = Nothing
MM_conn_STRING.close 
Set MM_conn_STRING = Nothing
%>
