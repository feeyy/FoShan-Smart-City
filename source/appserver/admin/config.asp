<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="../Connections/conn.asp" -->
<%
  if session("username")=""  or session("dj") =""  then
  response.redirect "login.asp"
  end if 
%>

<%
Set news=Server.CreateObject("Adodb.Recordset")
SqlU="Select * from config where ID=1"
news.open SqlU,MM_conn_STRING,1,1
%>
<%

if Request.Form("softname") <> "" then
softname=trim(Request.Form("softname"))
'info=trim(Request.Form("info"))
zcsn=trim(Trim(Request.Form("zcsn")))
inily=trim(Trim(Request.Form("inily")))

Set RsADD=Server.CreateObject("Adodb.Recordset")
Sql="Select * from config where ID=1"
RsADD.open Sql,MM_conn_STRING,3,2
RsADD("softname")=softname
'RsADD("info")=info
RsADD("zcsn")=zcsn
RsADD("inily")=inily
RsADD.update

RsADD.close
Set RsADD=Nothing
Response.Redirect("config.asp")
end if
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="description" content="powered by chenjinquan(QQ:820094076)  2010-10-30">
<title>��������</title>
<link href="right.css" rel="stylesheet" type="text/css">
</head>

<body>
<form name="form1"  method="POST">
  <table width="98%" border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#ecf0f1">
    <tr>
      <td height="35" colspan="3" align="center" valign="middle" bgcolor="#3498db" class="fy2"><img src="images/page_gear.gif" width="16" height="16" border="0" align="absmiddle">&nbsp;<strong>�����������</strong></td>
    </tr>
    <tr>
      <td width="15%" align="right" valign="middle" bgcolor="#FFFFFF"><img src="images/arrow_right.gif" alt="" width="16" height="16" border="0" align="absmiddle">�������</td>
      <td width="55%" align="left" valign="middle" bgcolor="#FFFFFF"><input name="softname" type="text" id="softname" value="<%=news("softname")%>" size="60" maxlength="80" style="width:80%"></td>
      <td width="30%" align="left" valign="middle" bgcolor="#FFFFFF"><img src="images/bullet_error.gif" alt="" width="16" height="16" border="0" align="absmiddle"> ����������ơ�</td>
    </tr>
    <tr>
      <td align="right" valign="middle" bgcolor="#FFFFFF"><img src="images/arrow_right.gif" alt="" width="16" height="16" border="0" align="absmiddle">Ĭ��¥��</td>
      <td align="left" valign="middle" bgcolor="#FFFFFF"><input name="inily" type="text" id="inily" value="<%=news("inily")%>" size="10"></td>
      <td align="left" valign="middle" bgcolor="#FFFFFF"><img src="images/bullet_error.gif" alt="" width="16" height="16" border="0" align="absmiddle">Ĭ�ϼ��ص�¥�����ݡ�</td>
    </tr>
    <tr>
      <td align="right" valign="middle" bgcolor="#FFFFFF"><img src="images/arrow_right.gif" alt="" width="16" height="16" border="0" align="absmiddle">������</td>
      <td align="left" valign="middle" bgcolor="#FFFFFF"><input name="zcid" type="text" id="zcid" value="<%=jjj%>" size="50" maxlength="80" readonly></td>
      <td align="left" valign="middle" bgcolor="#FFFFFF"><img src="images/bullet_error.gif" alt="" width="16" height="16" border="0" align="absmiddle">&nbsp;�����ɫ��װ�󣬻�������Զ�ʶ��</td>
    </tr>
    <tr>
      <td align="right" valign="middle" bgcolor="#FFFFFF"><img src="images/arrow_right.gif" alt="" width="16" height="16" border="0" align="absmiddle">ע����</td>
      <td align="left" valign="middle" bgcolor="#FFFFFF"><input name="zcsn" type="text" id="zcsn" value="<%=news("zcsn")%>" size="50" maxlength="80"></td>
      <td align="left" valign="middle" bgcolor="#FFFFFF"><img src="images/bullet_error.gif" alt="" width="16" height="16" border="0" align="absmiddle">&nbsp;
        <%
		if cstr(news("zcsn")) = cstr(zzz) then
		response.Write("<b>ϵͳ�Ѿ�ע��ɹ���</b>") 
		else
		response.Write("<b>ϵͳû�н���ע���ע��ʧ�ܣ�</b>") 
		end if
		%></td>
    </tr>
    <tr>
      <td height="35" colspan="3" align="center" valign="middle" bgcolor="#3498db"><input class="button" type="submit" name="button" id="button" value="���������Ϣ"></td>
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