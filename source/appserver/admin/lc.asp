<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="../Connections/conn.asp" -->
<%
  if session("username")=""  or session("dj") =""  then
  response.redirect "login.asp"
  end if 
%>
<%
if Request.Form("lc") <> "" then

lc=trim(Request.Form("lc"))
pic=trim(Request.Form("pic"))
spic=trim(Request.Form("spic"))
ly=trim(Request.Form("ly"))

Set RsADD=Server.CreateObject("Adodb.Recordset")
Sql="Select * from lc"
RsADD.open Sql,MM_conn_STRING,3,2

RsADD.addnew
RsADD("ly")=ly
RsADD("lc")=lc
if pic <> "" then
RsADD("lcmap")=pic
end if
if spic <> "" then
RsADD("spic")=spic
end if
RsADD.update

RsADD.close
Set RsADD=Nothing

Response.Redirect("lc.asp?ly="&request("ly"))
end if
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title></title>
<link href="right.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="tablejs/jquery-latest.js"></script>
<script type="text/javascript" src="tablejs/jquery.tablesorter.js"></script>
<script type="text/javascript" src="tablejs/jquery.tablesorter.pager.js"></script>
<script type="text/javascript">
	$(function() {
		$("#large")
			.tablesorter({widthFixed: true})
			.tablesorterPager({container: $("#pager")});
	});
</script>
<script type="text/JavaScript">

function checkForm(obj){
	if(obj.ly.value == ''){
		alert("������¥�")
		obj.ly.focus();
		return false
	}

	if(obj.lc.value == ''){
		alert("������¥�㣡")
		obj.lc.focus();
		return false
	}
		
	return true
}
function   selectAll(){   
	    var   len=document.getElementsByName("ID").length;   
		
	  if(len>1){   
		  for(var   i=0;i<len;i++){   
		  document.getElementsByName("ID").item(i).checked=true;   
		  }   
	  }   
	  else   
	  document.getElementsByName("ID").checked=true;   
  }   
    
  function   cancelSelect(){   
	  var   len=document.getElementsByName("ID").length;   
		
	  if(len>1){   
	  for(var   i=0;i<len;i++){   
	  document.getElementsByName("ID").item(i).checked=false;   
	  }   
	  }   
	  else   
	  document.getElementsByName("ID").checked=false;   

  } 

</script>
<script language="javascript">
// ����˵��
// s_Type : �ļ����ͣ�����ֵΪ"image","flash","media","file"
// s_Link : �ļ��ϴ������ڽ����ϴ��ļ�·���ļ����ı���
// s_Thumbnail : �ļ��ϴ������ڽ����ϴ�ͼƬʱ������������ͼ�ļ���·���ļ����ı�������δ��������ͼʱ�����ؿ�ֵ��ԭͼ��s_Link�������գ��˲���ר��������ͼ
function showUploadDialog(s_Type, s_Link, s_Thumbnail){
	//����style=coolblue,ֵ��������ʵ����Ҫ�޸�Ϊ������ʽ��,ͨ������ʽ�ĺ�̨�������ﵽ���������ϴ��ļ����ͼ��ļ���С
	var arr = showModalDialog("editor/dialog/i_upload.htm?style=coolblue&type="+s_Type+"&link="+s_Link+"&thumbnail="+s_Thumbnail, window, "dialogWidth:0px;dialogHeight:0px;help:no;scroll:no;status:no");
}

</script>
</head>

<body>
<form action="lc_del.asp?ly=<%=request("ly")%>" method="get" name="form2" onSubmit="return confirm('ɾ���󽫲��ָܻ�����ȷ��ɾ��ô��')" style="margin-top:2px;"/>

<table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#ecf0f1"  id="large">
  <thead>
    <tr>
      <td height="35" colspan="5" align="left" valign="middle" bgcolor="#3498db" class="fy2"><input class="button" onClick="location.href='lc.asp'" type="button" value="¥��¥���б�">
        &nbsp;
        <% 
set bclass=server.createobject("adodb.recordset")
bclass.open"select ly from lc group by ly",MM_conn_STRING,1,1%>
        <%
if bclass.eof and bclass.bof then
%>
        <input class="button" onClick="location.href='#add'" type="button" value="��û������ݣ�">
        <%else%>
        <%while not bclass.eof%>
        &nbsp;
        <input class="button" onClick="location.href='?ly=<%=bclass("ly")%>'" type="button" value="<%=bclass("ly")%>��">
        <%
bclass.movenext
wend
end if
bclass.Close()
Set bclass = Nothing
%></td>
    </tr>
    <%
set rs=server.CreateObject("adodb.recordset")
if request("ly") <> "" then
rs.open"SELECT * FROM lc WHERE ly='"&request("ly")&"' ORDER BY lc",MM_conn_STRING,1,1
else
rs.open"SELECT * FROM lc ORDER BY lc",MM_conn_STRING,1,1
end if
%>
    <tr>
      <td width="7%" align="center" valign="middle" bgcolor="#f39c12">&nbsp;</td>
      <td width="16%" align="center" valign="middle" bgcolor="#f39c12" class="fy2"><img src="images/arrow_down.gif" width="16" height="16" border="0" align="absmiddle">&nbsp;����ͼ</td>
      <td width="17%" align="center" valign="middle" bgcolor="#f39c12" class="fy2"><img src="images/arrow_down.gif" alt="" width="16" height="16" border="0" align="absmiddle">¥��</td>
      <td width="20%" height="35" align="center" valign="middle" bgcolor="#f39c12" class="fy2"><img src="images/arrow_down.gif" width="16" height="16" border="0" align="absmiddle">����&nbsp;¥��</td>
      <td width="40%" align="center" valign="middle" bgcolor="#f39c12" class="fy2"><img src="images/arrow_down.gif" width="16" height="16" border="0" align="absmiddle">&nbsp;����</td>
    </tr>
  </thead>
  <tbody>
    <%
if rs.eof and rs.bof then
%>
    <tr>
      <td height="35" colspan="5" align="center" valign="middle" bgcolor="#FFFFFF"> û������κ���Ϣ�� </td>
    </tr>
    <%else%>
    <% 
while not rs.eof
%>
    <tr bgcolor="#FFFFFF" onMouseOver="this.bgColor='#ecf0f1'" onMouseOut="this.bgColor='#FFFFFF'">
      <td align="center" valign="middle"  ><input name="ID" type="checkbox" value="<%=rs("ID")%>" /></td>
      <td align="center" valign="middle"  ><a href="../../<%=rs("lcmap")%>" target="_blank"><%if rs("spic")<>"" then%><img src="../../<%=rs("spic")%>" width="64" height="64" alt="����鿴��ͼ" border="0"><%else%><img src="../../<%=rs("lcmap")%>" width="64" height="64" alt="����鿴��ͼ" border="0"><%end if%></a></td>
      <td align="center" valign="middle"  ><%=rs("lc")%>��</td>
      <td align="center" valign="middle"  ><%=rs("ly")%>��</td>
      <td align="center" valign="middle"><input class="button" onClick="location.href='#add'" type="button" value="���">
        &nbsp;
        <input class="button" onClick="location.href='lc_edit.asp?ID=<%=rs("ID")%>&ly=<%=request("ly")%>'" type="button" value="�༭">
         &nbsp;
        <input class="button" onClick="javascript:if(confirm('ȷʵҪɾ����?'))location='lc_del.asp?ID=<%=rs("ID")%>&ly=<%=request("ly")%>'" type="button" value="ɾ��"></td>
    </tr>
    <%
rs.movenext '��ʾҳ������� 
wend
%>
    <%end if%>
  </tbody>
  <tr>
    <td colspan="5" align="left" valign="middle" bgcolor="#3498db"><div id="pager" style="float:right;  height:25px; overflow:hidden;"> <img src="images/first.png" border="0" align="absmiddle" title="��һҳ" class="first" style="cursor:pointer;"/> <img src="images/prev.png"  border="0" align="absmiddle" title="��һҳ" class="prev" style="cursor:pointer;"/>
        <input type="text" class="pagedisplay"/>
        <img src="images/next.png" border="0" align="absmiddle" title="��һҳ"  class="next" style="cursor:pointer;"/> <img src="images/last.png" border="0" align="absmiddle" title="���ҳ"  class="last" style="cursor:pointer;"/>
        <select class="pagesize">
          <option value="5">5</option>
          <option selected="selected" value="10">10</option>
          <option  value="20">20</option>
          <option value="30">30</option>
          <option  value="40">40</option>
          <option  value="50">50</option>
        </select>
      </div>
      <input class="button" onClick="selectAll()" type="button" value="ȫѡ">
      &nbsp;&nbsp;
      <input class="button" onClick="cancelSelect()" type="button" value="ȡ��">
      &nbsp;&nbsp;
   
      <input  class="button" type="submit" name="Submit" value="����ɾ��" />
     </td>
  </tr>
</table>
</form>
<br>
<form name="form1" onSubmit="return checkForm(this)" method="post" action="">
  <table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#ecf0f1">
    <tr>
      <td height="35" colspan="3" align="center" valign="middle" bgcolor="#3498db" ><strong class="fy2"><a name="add"></a><img src="images/application_form_add.gif" width="16" height="16" border="0" align="absmiddle">&nbsp;�������Ϣ</strong></td>
    </tr>
    <tr>
      <td align="center" valign="middle" bgcolor="#FFFFFF"><img src="images/arrow_right.gif" width="16" height="16" border="0" align="absmiddle">&nbsp;¥�</td>
      <td align="left" valign="middle" bgcolor="#FFFFFF"><input onKeyUp="this.value=this.value.replace(/[^a-z^A-Z^0-9]/g,'') " onafterpaste="this.value=this.value.replace(/[^a-z^A-Z^0-9]/g,'') " name="ly" type="text" id="ly" size=30>
        <select name="se2" id="se2" onChange="ly.value=this.value;">
          <option value="">��ѡ��һ��¥��</option>
          <% 
set sclass=server.createobject("adodb.recordset")
sclass.open"select ly from lc group by ly",MM_conn_STRING,1,1%>
          <%
if sclass.eof and sclass.bof then
%>
          <option value="">����Ϊ�գ������ֹ����룡</option>
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
        </select>
       </td>
      <td align="left" valign="middle" bgcolor="#FFFFFF"><span class="main_bright"><img src="images/bullet_error.gif" alt="" width="16" height="16" border="0" align="absmiddle" /></span>ֻ������Ӣ�ĺ����֣��磺T10</td>
    </tr>
    <tr>
      <td align="center" valign="middle" bgcolor="#FFFFFF"><img src="images/arrow_right.gif" alt="" width="16" height="16" border="0" align="absmiddle">&nbsp;¥�㣺</td>
      <td align="left" valign="middle" bgcolor="#FFFFFF"><input onKeyUp="this.value=this.value.replace(/[^\d]/g,'') " onafterpaste="this.value=this.value.replace(/[^\d]/g,'') " name="lc" type="text" id="lc" size=30></td>
      <td align="left" valign="middle" bgcolor="#FFFFFF"><span class="main_bright"><img src="images/bullet_error.gif" alt="" width="16" height="16" border="0" align="absmiddle" /></span>ֻ���������֣��磺10</td>
    </tr>
    <tr>
      <td width="16%" align="center" valign="middle" bgcolor="#FFFFFF"><img src="images/arrow_right.gif" width="16" height="16" border="0" align="absmiddle">&nbsp;��ͼ��</td>
      <td width="55%" align="left" valign="middle" bgcolor="#FFFFFF"><input name="pic" type="text" id="pic" size=30>
        <input type="hidden" name="spic" id="spic">
<input type=button value="�ϴ�ͼƬ..." onClick="showUploadDialog('image', 'form1.pic', 'form1.spic')" class="button"></td>
      <td width="29%" align="left" valign="middle" bgcolor="#FFFFFF"><span class="main_bright"><img src="images/bullet_error.gif" alt="" width="16" height="16" border="0" align="absmiddle" />&nbsp;</span>�ϴ�¥���ͼͼƬ������С��1080*1920Px��С�ġ�</td>
    </tr>
    <tr>
      <td height="35" colspan="3" align="center" valign="middle" bgcolor="#3498db"><input class="button" type="submit" name="button" id="button" value="�ύ">
        &nbsp;&nbsp;
        <input class="button" type="reset" name="button2" id="button2" value="����"></td>
    </tr>
  </table>
</form>
</body>
</html>
<%
rs.Close()
Set rs = Nothing
MM_conn_STRING.close 
Set MM_conn_STRING = Nothing
%>

