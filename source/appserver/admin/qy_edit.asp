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
fString = replace(fString, ";", ";") '�ֺŹ��� 
fString = replace(fString, "--", "--") '--���� 
fString = replace(fString, "%20", "") '�����ַ����� 
fString = replace(fString, "==", "") '==���� 
fString = replace(fString, ">", ">") 
fString = replace(fString, "<", "<") 
fString = Replace(fString, CHR(32), " ") 
fString = Replace(fString, CHR(9), "") 
fString = Replace(fString, CHR(34), "\""") 
fString = Replace(fString, CHR(39), "\'")
fString = Replace(fString, "\\", "\") 
fString = Replace(fString, CHR(13), "") 
fString = Replace(fString, CHR(10) & CHR(10), "") '---------���� ����
fString = Replace(fString, CHR(10), "")  '---------���� Ҳ����
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
// ����˵��
// s_Type : �ļ����ͣ�����ֵΪ"image","flash","media","file"
// s_Link : �ļ��ϴ������ڽ����ϴ��ļ�·���ļ����ı���
// s_Thumbnail : �ļ��ϴ������ڽ����ϴ�ͼƬʱ������������ͼ�ļ���·���ļ����ı�������δ��������ͼʱ�����ؿ�ֵ��ԭͼ��s_Link�������գ��˲���ר��������ͼ
function showUploadDialog(s_Type, s_Link, s_Thumbnail){
	//����style=coolblue,ֵ��������ʵ����Ҫ�޸�Ϊ������ʽ��,ͨ������ʽ�ĺ�̨�������ﵽ���������ϴ��ļ����ͼ��ļ���С
	var arr = showModalDialog("editor/dialog/i_upload.htm?style=coolblue&type="+s_Type+"&link="+s_Link+"&thumbnail="+s_Thumbnail, window, "dialogWidth:0px;dialogHeight:0px;help:no;scroll:no;status:no");
}

function checkForm(obj){
	if(obj.lcid.value == ''){
		alert("��ѡ����פ¥�㣡")
		obj.lcid.focus();
		return false
	}
	if(obj.qylc.value == ''){
		alert("��������פ��Ԫ��")
		obj.qylc.focus();
		return false
	}
		if(obj.qyname.value == ''){
		alert("��������ҵ���ƣ�")
		obj.qyname.focus();
		return false
	}
	
	if(obj.qyjs.value == ''){
		alert("��������ҵ���ܣ�")
		obj.qyjs.focus();
		return false
	}

	if(obj.qyjs.value == ''){
		alert("��������ҵ���ܣ�")
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
      <td height="35" colspan="3" align="center" valign="middle" bgcolor="#3498db" class="fy2"><strong><img src="images/editor.gif" width="14" height="14" border="0" align="absmiddle">&nbsp;�༭��Ϣ &lt;&lt;<a href="qy.asp">������Ϣ�б�</a></strong></td>
    </tr>
    <tr>
      <td align="center" valign="middle" bgcolor="#FFFFFF"><img src="images/arrow_right.gif" alt="" width="16" height="16" border="0" align="absmiddle">&nbsp;��פ¥�㣺</td>
      <td align="left" valign="middle" bgcolor="#FFFFFF"><input name="lcid" type="hidden" id="lcid" value="<%=news("lcid")%>" >
        <select name="se1" id="se1" onChange="window.location=this.value;">
        <%if request("qyly")<>"" then%>
        <option value=""><%=request("qyly")%>��</option>
        <%else%>
          <option value="">��ѡ��¥�</option>
          <%end if%>
          <% 
set ly1=server.createobject("adodb.recordset")
ly1.open"select ly from lc group by ly",MM_conn_STRING,1,1%>
          <%
if ly1.eof and ly1.bof then
%>
          <option value="">����Ϊ�գ�</option>
          <%else%>
          <%while not ly1.eof%>
          <option value="qy_edit.asp?ID=<%=request("ID")%>&qyly=<%=ly1("ly")%>">
            <%=ly1("ly")%>��
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
        <option value=""><%=request("qylc")%>¥</option>
        <%else%>
          <option value="">��ѡ��¥�㣡</option>
          <%end if%>
          <% 
set lc1=server.createobject("adodb.recordset")
lc1.open"select ID,lc from lc where ly='"&request("qyly")&"' order by lc",MM_conn_STRING,1,1%>
          <%
if lc1.eof and lc1.bof then
%>
          <option value="">����Ϊ�գ�</option>
          <%else%>
          <%while not lc1.eof%>
          <option value="qy_edit.asp?ID=<%=request("ID")%>&qylcid=<%=lc1("ID")%>&qylc=<%=lc1("lc")%>&qyly=<%=request("qyly")%>">
            <%=lc1("lc")%>¥
          </option>
          <%
lc1.movenext
wend
end if
lc1.Close()
Set lc1 = Nothing
%>
      </select><%end if%></td>
      <td align="left" valign="middle" bgcolor="#FFFFFF"><span class="main_bright"><img src="images/bullet_error.gif" alt="" width="16" height="16" border="0" align="absmiddle" /></span><span class="STYLE3"><span class="main_bright">&nbsp;</span>���ѡ����ҵ��פ��¥�¥�㡣</span></td>
    </tr>
    <tr>
      <td align="center" valign="middle" bgcolor="#FFFFFF"><img src="images/arrow_right.gif" alt="" width="16" height="16" border="0" align="absmiddle">&nbsp;��פ��Ԫ��</td>
      <td align="left" valign="middle" bgcolor="#FFFFFF"><input name="qylc1" type="text" id="qylc1" value="<%=news("qylc")%>"  size="30"></td>
      <td align="left" valign="middle" bgcolor="#FFFFFF"><span class="main_bright"><img src="images/bullet_error.gif" alt="" width="16" height="16" border="0" align="absmiddle" /></span><span class="STYLE3"><span class="main_bright">&nbsp;</span>����磺201</span></td>
    </tr>
    <tr>
      <td align="center" valign="middle" bgcolor="#FFFFFF"><img src="images/arrow_right.gif" alt="" width="16" height="16" border="0" align="absmiddle">&nbsp;��ҵlogo��</td>
      <td align="left" valign="middle" bgcolor="#FFFFFF"><input name="qylogo" type="text" id="qylogo" value="<%=news("qylogo")%>"  size="30">
      <input type=button value="�ϴ�ͼƬ..." onClick="showUploadDialog('image', 'form1.qylogo', '')" class="button"></td>
      <td align="left" valign="middle" bgcolor="#FFFFFF"><span class="main_bright"><img src="images/bullet_error.gif" alt="" width="16" height="16" border="0" align="absmiddle" />&nbsp;</span>�����С��240*130����ʽ��png</td>
    </tr>
    <tr>
      <td align="center" valign="middle" bgcolor="#FFFFFF"><img src="images/arrow_right.gif" alt="" width="16" height="16" border="0" align="absmiddle">&nbsp;��ҵ���ƣ�</td>
      <td align="left" valign="middle" bgcolor="#FFFFFF"><input name="qyname" type="text" id="qyname" style="width:98%" value="<%=news("qyname")%>"  size="60"></td>
      <td align="left" valign="middle" bgcolor="#FFFFFF"><span class="main_bright"><img src="images/bullet_error.gif" alt="" width="16" height="16" border="0" align="absmiddle" />&nbsp;</span><span class="STYLE3">����</span></td>
    </tr>
    <tr>
      <td width="13%" align="center" valign="middle" bgcolor="#FFFFFF"><img src="images/arrow_right.gif" alt="" width="16" height="16" border="0" align="absmiddle">&nbsp;��ϵ�绰��</td>
      <td width="58%" align="left" valign="middle" bgcolor="#FFFFFF"><input name="qytel" type="text" id="qytel" value="<%=news("qytel")%>"  size="30" ></td>
      <td width="29%" align="left" valign="middle" bgcolor="#FFFFFF"><span class="main_bright"><img src="images/bullet_error.gif" alt="" width="16" height="16" border="0" align="absmiddle" />&nbsp;</span>����</td>
    </tr>
    <tr>
      <td  align="center" valign="top" bgcolor="#FFFFFF"><img src="images/arrow_right.gif" alt="" width="16" height="16" border="0" align="absmiddle">&nbsp;������ĸ��</td>
      <td align="left" valign="middle" bgcolor="#FFFFFF"><input name="skey" type="text" id="skey" onKeyUp="this.value=this.value.replace(/[^a-z^A-Z]/g,'') " value="<%=news("skey")%>"  size="30" onafterpaste="this.value=this.value.replace(/[^a-z^A-Z]/g,'') "></td>
      <td align="left" valign="top" bgcolor="#FFFFFF"><span class="main_bright"><img src="images/bullet_error.gif" alt="" width="16" height="16" border="0" align="absmiddle" />&nbsp;</span>��ҵ����������Ӣ�Ĵ�д��ĸ�� �磺G</td>
    </tr>
    <tr>
      <td  align="center" valign="top" bgcolor="#FFFFFF"><img src="images/arrow_right.gif" alt="" width="16" height="16" border="0" align="absmiddle">&nbsp;���ͼƬ1��</td>
      <td align="left" valign="middle" bgcolor="#FFFFFF"><input name="ad1" type="text" id="ad1" value="<%=news("ad1")%>"  size="30">
      <input type=button value="�ϴ�ͼƬ..." onClick="showUploadDialog('image', 'form1.ad1', '')" class="button"></td>
      <td align="left" valign="top" bgcolor="#FFFFFF"><span class="main_bright"><img src="images/bullet_error.gif" alt="" width="16" height="16" border="0" align="absmiddle" />&nbsp;</span>�����ҵ���ܹ���ͼƬ</td>
    </tr>
    <tr>
      <td  align="center" valign="top" bgcolor="#FFFFFF"><img src="images/arrow_right.gif" alt="" width="16" height="16" border="0" align="absmiddle">&nbsp;���ͼƬ2��</td>
      <td align="left" valign="middle" bgcolor="#FFFFFF"><input name="ad2" type="text" id="ad2" value="<%=news("ad2")%>"  size="30">
      <input type=button value="�ϴ�ͼƬ..." onClick="showUploadDialog('image', 'form1.ad2', '')" class="button"></td>
      <td align="left" valign="top" bgcolor="#FFFFFF"><span class="main_bright"><img src="images/bullet_error.gif" alt="" width="16" height="16" border="0" align="absmiddle" />&nbsp;</span>�����ҵ���ܹ���ͼƬ</td>
    </tr>
    <tr>
      <td  align="center" valign="top" bgcolor="#FFFFFF"><img src="images/arrow_right.gif" alt="" width="16" height="16" border="0" align="absmiddle">&nbsp;���ͼƬ3��</td>
      <td align="left" valign="middle" bgcolor="#FFFFFF"><input name="ad3" type="text" id="ad3" value="<%=news("ad3")%>"  size="30">
      <input type=button value="�ϴ�ͼƬ..." onClick="showUploadDialog('image', 'form1.ad3', '')" class="button"></td>
      <td align="left" valign="top" bgcolor="#FFFFFF"><span class="main_bright"><img src="images/bullet_error.gif" alt="" width="16" height="16" border="0" align="absmiddle" />&nbsp;</span>�����ҵ���ܹ���ͼƬ</td>
    </tr>
    <tr>
      <td  align="center" valign="top" bgcolor="#FFFFFF"><img src="images/arrow_right.gif" alt="" width="16" height="16" border="0" align="absmiddle">&nbsp;���ͼƬ4��</td>
      <td align="left" valign="middle" bgcolor="#FFFFFF"><input name="ad4" type="text" id="ad4" value="<%=news("ad4")%>"  size="30">
      <input type=button value="�ϴ�ͼƬ..." onClick="showUploadDialog('image', 'form1.ad4', '')" class="button"></td>
      <td align="left" valign="top" bgcolor="#FFFFFF"><span class="main_bright"><img src="images/bullet_error.gif" alt="" width="16" height="16" border="0" align="absmiddle" />&nbsp;</span>�����ҵ���ܹ���ͼƬ</td>
    </tr>
    <tr>
      <td  align="center" valign="top" bgcolor="#FFFFFF"><p><img src="images/arrow_right.gif" width="16" height="16" border="0" align="absmiddle">&nbsp;��ҵ���ܣ�</p>
        <p>&nbsp;</p></td>
      <td align="left" valign="middle" bgcolor="#FFFFFF"><textarea  name="qyjs" cols="60" rows="10" id="qyjs" style="width:98%"><%=news("qyjs")%></textarea></td>
      <td align="left" valign="top" bgcolor="#FFFFFF"><p><span class="main_bright"><img src="images/bullet_error.gif" alt="" width="16" height="16" border="0" align="absmiddle" />&nbsp;</span><span class="main_bright"><img src="images/bullet_error.gif" alt="" width="16" height="16" border="0" align="absmiddle" />&nbsp;</span><span class="STYLE3">��ҵ�������ݣ�����֧��HTML���룬��ֶ��䣺&lt;p&gt;����...&lt;/p&gt;�����У�&lt;br&gt;���ո񣺡���Ϊ�˽��������뾡����Ҫ����HTML���롣</span></p></td>
    </tr>
    <tr>
    <tr>
      <td colspan="3" align="center" valign="middle" bgcolor="#3498db"><input type="hidden" name="ID"  value="<%=news("ID")%>"/>
        <input class="button" type="submit" name="button" id="button" value="�ύ">
        &nbsp;&nbsp;
        <input class="button" type="reset" name="button2" id="button2" value="����"></td>
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
