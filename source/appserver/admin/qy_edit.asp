<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<%
  if session("username")=""  or session("dj") =""  then
  response.redirect "login.asp"
  end if 
%>
<!--#include file="../Connections/conn.asp" -->
<!--#include file="py.asp" -->
<%
dim ID
ID=cint(Request.QueryString("ID"))
Set news=Server.CreateObject("Adodb.Recordset")
SqlU="Select * from qy where ID=" & ID
news.open SqlU,MM_conn_STRING,1,1
%>

<%
Function FormatHTML(fString) 
If fString<>"" Then 
fString = trim(fString) 
fString = replace(fString, ";", ";") '分号过滤 
fString = replace(fString, "--", "--") '--过滤 
fString = replace(fString, "%20", "") '特殊字符过滤 
fString = replace(fString, "==", "") '==过滤 
fString = replace(fString, ">", ">") 
fString = replace(fString, "<", "<") 
fString = Replace(fString, CHR(32), " ") 
fString = Replace(fString, CHR(9), "") 
fString = Replace(fString, CHR(34), "\""") 
fString = Replace(fString, CHR(39), "\'")
fString = Replace(fString, "\\", "\") 
fString = Replace(fString, CHR(13), "") 
fString = Replace(fString, CHR(10) & CHR(10), "") '---------这行 改了
fString = Replace(fString, CHR(10), "")  '---------这行 也改了
FormatHTML = fString 
End If 
End Function 
%>

<%
if Request.Form("qyname") <> "" and Request.Form("lcid") <> "" then

if request("qylcid")<> "" then
qylcid=trim(request("qylcid"))
else
qylcid=trim(Request.Form("lcid"))
end if

qylc=trim(Request.Form("qylc1"))
qylogo=trim(Request.Form("qylogo"))
qyname=trim(Request.Form("qyname"))
qyjs=FormatHTML(trim(Request.Form("qyjs")))
skey=trim(Request.Form("skey"))
qytel=trim(Request.Form("qytel"))
ad1=trim(Request.Form("ad1"))
ad2=trim(Request.Form("ad2"))
ad3=trim(Request.Form("ad3"))
ad4=trim(Request.Form("ad4"))
ly=trim(Request("qyly"))
lc=trim(Request("qylc"))

Set RsADD=Server.CreateObject("Adodb.Recordset")
Sql="Select * from qy where ID=" & ID
RsADD.open Sql,MM_conn_STRING,3,2
RsADD("qyname")=qyname
if qylogo <> "" then
RsADD("qylogo")=qylogo
end if
if ad1 <> "" then
RsADD("ad1")=ad1
end if
if ad2 <> "" then
RsADD("ad2")=ad2
end if
if ad3 <> "" then
RsADD("ad3")=ad3
end if
if ad4 <> "" then
RsADD("ad4")=ad4
end if
RsADD("qytel")=qytel
RsADD("qyjs")=qyjs
RsADD("qylc")=qylc
RsADD("lcid")=qylcid
if skey <> "" then
RsADD("skey")=left(UCase(skey),1)
else
RsADD("skey")=UCase(getpy(qyname))
end if
RsADD("times")=now()
if ly <> "" then
RsADD("ly")=ly
end if
if lc <> "" then
RsADD("lc")=lc
end if
RsADD.update

RsADD.close
Set RsADD=Nothing
Response.Redirect("qy_edit.asp?ID="&ID)
end if
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title></title>
<link href="right.css" rel="stylesheet" type="text/css">
<script type="text/JavaScript">
// 参数说明
// s_Type : 文件类型，可用值为"image","flash","media","file"
// s_Link : 文件上传后，用于接收上传文件路径文件名的表单名
// s_Thumbnail : 文件上传后，用于接收上传图片时所产生的缩略图文件的路径文件名的表单名，当未生成缩略图时，返回空值，原图用s_Link参数接收，此参数专用于缩略图
function showUploadDialog(s_Type, s_Link, s_Thumbnail){
	//以下style=coolblue,值可以依据实际需要修改为您的样式名,通过此样式的后台设置来达到控制允许上传文件类型及文件大小
	var arr = showModalDialog("editor/dialog/i_upload.htm?style=coolblue&type="+s_Type+"&link="+s_Link+"&thumbnail="+s_Thumbnail, window, "dialogWidth:0px;dialogHeight:0px;help:no;scroll:no;status:no");
}

function checkForm(obj){
	if(obj.lcid.value == ''){
		alert("请选择入驻楼层！")
		obj.lcid.focus();
		return false
	}
	if(obj.qylc.value == ''){
		alert("请输入入驻单元！")
		obj.qylc.focus();
		return false
	}
		if(obj.qyname.value == ''){
		alert("请输入企业名称！")
		obj.qyname.focus();
		return false
	}
	
	if(obj.qyjs.value == ''){
		alert("请输入企业介绍！")
		obj.qyjs.focus();
		return false
	}

	if(obj.qyjs.value == ''){
		alert("请输入企业介绍！")
		obj.qyjs.focus();
		return false
	}
		
	return true
}

</script>
</head>

<body>
<form name="form1" method="post" onSubmit="return checkForm(this)">
  <table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#ecf0f1">
    <tr>
      <td height="35" colspan="3" align="center" valign="middle" bgcolor="#3498db" class="fy2"><strong><img src="images/editor.gif" width="14" height="14" border="0" align="absmiddle">&nbsp;编辑信息 &lt;&lt;<a href="qy.asp">返回信息列表</a></strong></td>
    </tr>
    <tr>
      <td align="center" valign="middle" bgcolor="#FFFFFF"><img src="images/arrow_right.gif" alt="" width="16" height="16" border="0" align="absmiddle">&nbsp;入驻楼层：</td>
      <td align="left" valign="middle" bgcolor="#FFFFFF"><input name="lcid" type="hidden" id="lcid" value="<%=news("lcid")%>" >
        <select name="se1" id="se1" onChange="window.location=this.value;">
        <%if request("qyly")<>"" then%>
        <option value=""><%=request("qyly")%>栋</option>
        <%else%>
          <option value="">请选择楼宇！</option>
          <%end if%>
          <% 
set ly1=server.createobject("adodb.recordset")
ly1.open"select ly from lc group by ly",MM_conn_STRING,1,1%>
          <%
if ly1.eof and ly1.bof then
%>
          <option value="">数据为空！</option>
          <%else%>
          <%while not ly1.eof%>
          <option value="qy_edit.asp?ID=<%=request("ID")%>&qyly=<%=ly1("ly")%>">
            <%=ly1("ly")%>栋
          </option>
          <%
ly1.movenext
wend
end if
ly1.Close()
Set ly1 = Nothing
%>
      </select>
       <%if request("qyly")<>"" then%>
        <select name="se2" id="se2" onChange="window.location=this.value;">
         <%if request("qylc")<>"" then%>
        <option value=""><%=request("qylc")%>楼</option>
        <%else%>
          <option value="">请选择楼层！</option>
          <%end if%>
          <% 
set lc1=server.createobject("adodb.recordset")
lc1.open"select ID,lc from lc where ly='"&request("qyly")&"' order by lc",MM_conn_STRING,1,1%>
          <%
if lc1.eof and lc1.bof then
%>
          <option value="">数据为空！</option>
          <%else%>
          <%while not lc1.eof%>
          <option value="qy_edit.asp?ID=<%=request("ID")%>&qylcid=<%=lc1("ID")%>&qylc=<%=lc1("lc")%>&qyly=<%=request("qyly")%>">
            <%=lc1("lc")%>楼
          </option>
          <%
lc1.movenext
wend
end if
lc1.Close()
Set lc1 = Nothing
%>
      </select><%end if%></td>
      <td align="left" valign="middle" bgcolor="#FFFFFF"><span class="main_bright"><img src="images/bullet_error.gif" alt="" width="16" height="16" border="0" align="absmiddle" /></span><span class="STYLE3"><span class="main_bright">&nbsp;</span>必填，选择企业入驻的楼宇及楼层。</span></td>
    </tr>
    <tr>
      <td align="center" valign="middle" bgcolor="#FFFFFF"><img src="images/arrow_right.gif" alt="" width="16" height="16" border="0" align="absmiddle">&nbsp;入驻单元：</td>
      <td align="left" valign="middle" bgcolor="#FFFFFF"><input name="qylc1" type="text" id="qylc1" value="<%=news("qylc")%>"  size="30"></td>
      <td align="left" valign="middle" bgcolor="#FFFFFF"><span class="main_bright"><img src="images/bullet_error.gif" alt="" width="16" height="16" border="0" align="absmiddle" /></span><span class="STYLE3"><span class="main_bright">&nbsp;</span>必填，如：201</span></td>
    </tr>
    <tr>
      <td align="center" valign="middle" bgcolor="#FFFFFF"><img src="images/arrow_right.gif" alt="" width="16" height="16" border="0" align="absmiddle">&nbsp;企业logo：</td>
      <td align="left" valign="middle" bgcolor="#FFFFFF"><input name="qylogo" type="text" id="qylogo" value="<%=news("qylogo")%>"  size="30">
      <input type=button value="上传图片..." onClick="showUploadDialog('image', 'form1.qylogo', '')" class="button"></td>
      <td align="left" valign="middle" bgcolor="#FFFFFF"><span class="main_bright"><img src="images/bullet_error.gif" alt="" width="16" height="16" border="0" align="absmiddle" />&nbsp;</span>可填，大小：240*130，格式：png</td>
    </tr>
    <tr>
      <td align="center" valign="middle" bgcolor="#FFFFFF"><img src="images/arrow_right.gif" alt="" width="16" height="16" border="0" align="absmiddle">&nbsp;企业名称：</td>
      <td align="left" valign="middle" bgcolor="#FFFFFF"><input name="qyname" type="text" id="qyname" style="width:98%" value="<%=news("qyname")%>"  size="60"></td>
      <td align="left" valign="middle" bgcolor="#FFFFFF"><span class="main_bright"><img src="images/bullet_error.gif" alt="" width="16" height="16" border="0" align="absmiddle" />&nbsp;</span><span class="STYLE3">必填</span></td>
    </tr>
    <tr>
      <td width="13%" align="center" valign="middle" bgcolor="#FFFFFF"><img src="images/arrow_right.gif" alt="" width="16" height="16" border="0" align="absmiddle">&nbsp;联系电话：</td>
      <td width="58%" align="left" valign="middle" bgcolor="#FFFFFF"><input name="qytel" type="text" id="qytel" value="<%=news("qytel")%>"  size="30" ></td>
      <td width="29%" align="left" valign="middle" bgcolor="#FFFFFF"><span class="main_bright"><img src="images/bullet_error.gif" alt="" width="16" height="16" border="0" align="absmiddle" />&nbsp;</span>可填</td>
    </tr>
    <tr>
      <td  align="center" valign="top" bgcolor="#FFFFFF"><img src="images/arrow_right.gif" alt="" width="16" height="16" border="0" align="absmiddle">&nbsp;搜索字母：</td>
      <td align="left" valign="middle" bgcolor="#FFFFFF"><input name="skey" type="text" id="skey" onKeyUp="this.value=this.value.replace(/[^a-z^A-Z]/g,'') " value="<%=news("skey")%>"  size="30" onafterpaste="this.value=this.value.replace(/[^a-z^A-Z]/g,'') "></td>
      <td align="left" valign="top" bgcolor="#FFFFFF"><span class="main_bright"><img src="images/bullet_error.gif" alt="" width="16" height="16" border="0" align="absmiddle" />&nbsp;</span>企业搜索关联的英文大写字母， 如：G</td>
    </tr>
    <tr>
      <td  align="center" valign="top" bgcolor="#FFFFFF"><img src="images/arrow_right.gif" alt="" width="16" height="16" border="0" align="absmiddle">&nbsp;广告图片1：</td>
      <td align="left" valign="middle" bgcolor="#FFFFFF"><input name="ad1" type="text" id="ad1" value="<%=news("ad1")%>"  size="30">
      <input type=button value="上传图片..." onClick="showUploadDialog('image', 'form1.ad1', '')" class="button"></td>
      <td align="left" valign="top" bgcolor="#FFFFFF"><span class="main_bright"><img src="images/bullet_error.gif" alt="" width="16" height="16" border="0" align="absmiddle" />&nbsp;</span>可填，企业介绍滚动图片</td>
    </tr>
    <tr>
      <td  align="center" valign="top" bgcolor="#FFFFFF"><img src="images/arrow_right.gif" alt="" width="16" height="16" border="0" align="absmiddle">&nbsp;广告图片2：</td>
      <td align="left" valign="middle" bgcolor="#FFFFFF"><input name="ad2" type="text" id="ad2" value="<%=news("ad2")%>"  size="30">
      <input type=button value="上传图片..." onClick="showUploadDialog('image', 'form1.ad2', '')" class="button"></td>
      <td align="left" valign="top" bgcolor="#FFFFFF"><span class="main_bright"><img src="images/bullet_error.gif" alt="" width="16" height="16" border="0" align="absmiddle" />&nbsp;</span>可填，企业介绍滚动图片</td>
    </tr>
    <tr>
      <td  align="center" valign="top" bgcolor="#FFFFFF"><img src="images/arrow_right.gif" alt="" width="16" height="16" border="0" align="absmiddle">&nbsp;广告图片3：</td>
      <td align="left" valign="middle" bgcolor="#FFFFFF"><input name="ad3" type="text" id="ad3" value="<%=news("ad3")%>"  size="30">
      <input type=button value="上传图片..." onClick="showUploadDialog('image', 'form1.ad3', '')" class="button"></td>
      <td align="left" valign="top" bgcolor="#FFFFFF"><span class="main_bright"><img src="images/bullet_error.gif" alt="" width="16" height="16" border="0" align="absmiddle" />&nbsp;</span>可填，企业介绍滚动图片</td>
    </tr>
    <tr>
      <td  align="center" valign="top" bgcolor="#FFFFFF"><img src="images/arrow_right.gif" alt="" width="16" height="16" border="0" align="absmiddle">&nbsp;广告图片4：</td>
      <td align="left" valign="middle" bgcolor="#FFFFFF"><input name="ad4" type="text" id="ad4" value="<%=news("ad4")%>"  size="30">
      <input type=button value="上传图片..." onClick="showUploadDialog('image', 'form1.ad4', '')" class="button"></td>
      <td align="left" valign="top" bgcolor="#FFFFFF"><span class="main_bright"><img src="images/bullet_error.gif" alt="" width="16" height="16" border="0" align="absmiddle" />&nbsp;</span>可填，企业介绍滚动图片</td>
    </tr>
    <tr>
      <td  align="center" valign="top" bgcolor="#FFFFFF"><p><img src="images/arrow_right.gif" width="16" height="16" border="0" align="absmiddle">&nbsp;企业介绍：</p>
        <p>&nbsp;</p></td>
      <td align="left" valign="middle" bgcolor="#FFFFFF"><textarea  name="qyjs" cols="60" rows="10" id="qyjs" style="width:98%"><%=news("qyjs")%></textarea></td>
      <td align="left" valign="top" bgcolor="#FFFFFF"><p><span class="main_bright"><img src="images/bullet_error.gif" alt="" width="16" height="16" border="0" align="absmiddle" />&nbsp;</span><span class="main_bright"><img src="images/bullet_error.gif" alt="" width="16" height="16" border="0" align="absmiddle" />&nbsp;</span><span class="STYLE3">企业介绍内容，可以支持HTML代码，如分段落：&lt;p&gt;内容...&lt;/p&gt;，换行：&lt;br&gt;，空格：　。为了界面美观请尽量不要采用HTML代码。</span></p></td>
    </tr>
    <tr>
    <tr>
      <td colspan="3" align="center" valign="middle" bgcolor="#3498db"><input type="hidden" name="ID"  value="<%=news("ID")%>"/>
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
