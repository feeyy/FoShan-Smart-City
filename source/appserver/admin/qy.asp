<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<%
  if session("username")=""  or session("dj") =""  then
  response.redirect "login.asp"
  end if 
%>
<!--#include file="../Connections/conn.asp" -->
<!--#include file="py.asp" -->

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
qylcid=trim(Request.Form("lcid"))
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
Sql="Select * from qy"
RsADD.open Sql,MM_conn_STRING,3,2

RsADD.addnew
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
if ly <> "" then
RsADD("ly")=ly
end if
if lc <> "" then
RsADD("lc")=lc
end if

RsADD.update

RsADD.close
Set RsADD=Nothing

Response.Redirect("qy.asp")
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
</head>

<body>
<table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#ecf0f1" id="large">
  <thead>
    <tr>
      <td height="35" colspan="6" align="left" valign="middle"  bgcolor="#3498db" class="fy2" ><input class="button" onClick="location.href='qy.asp'" type="button" value="��פ��ҵ�б�"></td>
    </tr>
    <%
set rs=server.CreateObject("adodb.recordset")
if request("search")<>"" then
search=trim(request("search"))
rs.open"SELECT * FROM qy WHERE qyname like '%" & search & "%' ORDER BY times DESC",MM_conn_STRING,1,1
else
rs.open"SELECT * FROM qy ORDER BY times DESC",MM_conn_STRING,1,1
end if 
%>
    <tr>
      <td height="35" colspan="6" align="left" valign="middle" bgcolor="#FFFFFF" ><form name="form3" style="margin:0px; padding:0px;" action="" method="post">
          <img src="images/search.png" width="16" height="16" border="0" align="absmiddle">&nbsp;
          <input name="search" class="text" type="text" id="search" value="" size=50 style="width:80%">
          &nbsp;
          <input type="submit" class="button" value="����" title="���ݹ���ʱ����ͨ������������ر�����Ϣ���ټ�����">
        </form></td>
    </tr>
  <form action="qy_del.asp" method="get" name="form2" onSubmit="return confirm('ɾ���󽫲��ָܻ�����ȷ��ɾ��ô��')" style="margin-top:2px;"/>
  
  <tr>
    <td width="4%" height="35" align="center" valign="middle" bgcolor="#f39c12">&nbsp;</td>
    <td width="11%" align="center" valign="middle" bgcolor="#f39c12" class="fy2"><img src="images/arrow_down.gif" alt="" width="16" height="16" border="0" align="absmiddle">logo</td>
    <td width="33%" align="center" valign="middle" bgcolor="#f39c12" class="fy2"><img src="images/arrow_down.gif" alt="" width="16" height="16" border="0" align="absmiddle">&nbsp;��פ��ҵ����</td>
    <td width="10%" align="center" valign="middle" bgcolor="#f39c12" class="fy2"><img src="images/arrow_down.gif" alt="" width="16" height="16" border="0" align="absmiddle">��פ¥��</td>
    <td width="14%" align="center" valign="middle" bgcolor="#f39c12" class="fy2"><img src="images/arrow_down.gif" width="16" height="16" border="0" align="absmiddle">�༭ʱ��</td>
    <td width="28%" align="center" valign="middle" bgcolor="#f39c12" class="fy2"><img src="images/arrow_down.gif" width="16" height="16" border="0" align="absmiddle">&nbsp;����</td>
  </tr>
    </thead>
  
  <tbody>
    <%
if rs.eof and rs.bof then
%>
    <tr>
      <td height="35" colspan="6" align="center" valign="middle" bgcolor="#FFFFFF"> û���ҵ������Ϣ�� </td>
    </tr>
    <%else%>
    <%  
while not rs.eof
%>
    <tr bgcolor="#FFFFFF" onMouseOver="this.bgColor='#ecf0f1'" onMouseOut="this.bgColor='#FFFFFF'">
      <td align="center" valign="middle"  ><input name="ID" type="checkbox" value="<%=rs("ID")%>" /></td>
      <td height="50" align="center" valign="middle"  ><%if rs("qylogo")<>"" then%><img src="../../<%=rs("qylogo")%>" width="100" height="50" /><%else%>��LOGO<%end if%></td>
      <td align="left" valign="middle"  ><%=rs("qyname")%></td>
      <td align="center" valign="middle" ><% 
set cc=server.createobject("adodb.recordset")
cc.open"select lc,ly from lc where ID="&cint(rs("lcid"))&"",MM_conn_STRING,1,1
if cc.eof and cc.bof then
else
response.write(cc("ly")&"��,"&cc("lc")&"¥")
end if
cc.Close()
Set cc = Nothing
%></td>
      <td align="center" valign="middle" ><%=rs("times")%></td>
      <td align="center" valign="middle"><input class="button" onClick="location.href='#add'" type="button" value="���">
        &nbsp;
        <input class="button" onClick="location.href='qy_edit.asp?ID=<%=rs("ID")%>'" type="button" value="�༭">
        &nbsp;
        <input class="button" onClick="javascript:if(confirm('ȷʵҪɾ����?'))location='qy_del.asp?ID=<%=rs("ID")%>'" type="button" value="ɾ��"></td>
    </tr>
    <%
rs.movenext '��ʾҳ������� 
wend
%>
    <%end if%>
  </tbody>
  <tr>
    <td colspan="6" align="left" valign="middle" bgcolor="#3498db"><div id="pager" style="float:right;  height:25px; overflow:hidden;"> <img src="images/first.png" border="0" align="absmiddle" title="��һҳ" class="first" style="cursor:pointer;"/> <img src="images/prev.png"  border="0" align="absmiddle" title="��һҳ" class="prev" style="cursor:pointer;"/>
        <input type="text" class="pagedisplay"/>
        <img src="images/next.png" border="0" align="absmiddle" title="��һҳ"  class="next" style="cursor:pointer;"/> <img src="images/last.png" border="0" align="absmiddle" title="���ҳ"  class="last" style="cursor:pointer;"/>
        <select class="pagesize">
          <option value="5">5</option>
          <option selected="selected"  value="10">10</option>
          <option value="20">20</option>
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
    </form>
  
</table>
<br>
<form action="" method="POST" id="form1" name="form1" onSubmit="return checkForm(this)" >
  <table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#ecf0f1">
    <tr>
      <td height="35" colspan="3" align="center" valign="middle"  bgcolor="#3498db"><strong class="fy2"><a name="add"></a><img src="images/application_form_add.gif" width="16" height="16" border="0" align="absmiddle">&nbsp;�������Ϣ</strong></td>
    </tr>
    <tr>
      <td align="center" valign="middle" bgcolor="#FFFFFF"><img src="images/arrow_right.gif" alt="" width="16" height="16" border="0" align="absmiddle">&nbsp;��פ¥�㣺</td>
      <td align="left" valign="middle" bgcolor="#FFFFFF"><input name="lcid" type="hidden" id="lcid" value="<%=request("qylcid")%>" >
        <select name="se1" id="se1" onChange="window.location=this.value;">
        <%if request("qyly")<>"" then%>
        <option value=""><%=request("qyly")%>��</option>
        <%else%>
          <option value="">ѡ��¥��</option>
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
          <option value="qy.asp?qyly=<%=ly1("ly")%>">
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
          <option value="">ѡ��¥��</option>
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
          <option value="qy.asp?qylcid=<%=lc1("ID")%>&qylc=<%=lc1("lc")%>&qyly=<%=request("qyly")%>">
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
      <td align="left" valign="middle" bgcolor="#FFFFFF"><input name="qylc1" type="text" id="qylc1"  size="30"></td>
      <td align="left" valign="middle" bgcolor="#FFFFFF"><span class="main_bright"><img src="images/bullet_error.gif" alt="" width="16" height="16" border="0" align="absmiddle" /></span><span class="STYLE3"><span class="main_bright">&nbsp;</span>����磺201</span></td>
    </tr>
    <tr>
      <td align="center" valign="middle" bgcolor="#FFFFFF"><img src="images/arrow_right.gif" alt="" width="16" height="16" border="0" align="absmiddle">&nbsp;��ҵlogo��</td>
      <td align="left" valign="middle" bgcolor="#FFFFFF"><input name="qylogo" type="text" id="qylogo"  size="30">
      <input type=button value="�ϴ�ͼƬ..." onClick="showUploadDialog('image', 'form1.qylogo', '')" class="button"></td>
      <td align="left" valign="middle" bgcolor="#FFFFFF"><span class="main_bright"><img src="images/bullet_error.gif" alt="" width="16" height="16" border="0" align="absmiddle" />&nbsp;</span>�����С��240*130����ʽ��png</td>
    </tr>
    <tr>
      <td align="center" valign="middle" bgcolor="#FFFFFF"><img src="images/arrow_right.gif" alt="" width="16" height="16" border="0" align="absmiddle">&nbsp;��ҵ���ƣ�</td>
      <td align="left" valign="middle" bgcolor="#FFFFFF"><input name="qyname" type="text" id="qyname"  size="60" style="width:98%"></td>
      <td align="left" valign="middle" bgcolor="#FFFFFF"><span class="main_bright"><img src="images/bullet_error.gif" alt="" width="16" height="16" border="0" align="absmiddle" />&nbsp;</span><span class="STYLE3">����</span></td>
    </tr>
    <tr>
      <td width="13%" align="center" valign="middle" bgcolor="#FFFFFF"><img src="images/arrow_right.gif" alt="" width="16" height="16" border="0" align="absmiddle">&nbsp;��ϵ�绰��</td>
      <td width="58%" align="left" valign="middle" bgcolor="#FFFFFF"><input name="qytel" type="text" id="qytel"  size="30" ></td>
      <td width="29%" align="left" valign="middle" bgcolor="#FFFFFF"><span class="main_bright"><img src="images/bullet_error.gif" alt="" width="16" height="16" border="0" align="absmiddle" />&nbsp;</span>����</td>
    </tr>
    <tr>
      <td  align="center" valign="top" bgcolor="#FFFFFF"><img src="images/arrow_right.gif" alt="" width="16" height="16" border="0" align="absmiddle">&nbsp;������ĸ��</td>
      <td align="left" valign="middle" bgcolor="#FFFFFF"><input onKeyUp="this.value=this.value.replace(/[^a-z^A-Z]/g,'') " onafterpaste="this.value=this.value.replace(/[^a-z^A-Z]/g,'') " name="skey" type="text" id="skey"  size="30"></td>
      <td align="left" valign="top" bgcolor="#FFFFFF"><span class="main_bright"><img src="images/bullet_error.gif" alt="" width="16" height="16" border="0" align="absmiddle" />&nbsp;</span>��ҵ����������Ӣ�Ĵ�д��ĸ�� �磺G</td>
    </tr>
    <tr>
      <td  align="center" valign="top" bgcolor="#FFFFFF"><img src="images/arrow_right.gif" alt="" width="16" height="16" border="0" align="absmiddle">&nbsp;���ͼƬ1��</td>
      <td align="left" valign="middle" bgcolor="#FFFFFF"><input name="ad1" type="text" id="ad1"  size="30">
      <input type=button value="�ϴ�ͼƬ..." onClick="showUploadDialog('image', 'form1.ad1', '')" class="button"></td>
      <td align="left" valign="top" bgcolor="#FFFFFF"><span class="main_bright"><img src="images/bullet_error.gif" alt="" width="16" height="16" border="0" align="absmiddle" />&nbsp;</span>�����ҵ���ܹ���ͼƬ</td>
    </tr>
    <tr>
      <td  align="center" valign="top" bgcolor="#FFFFFF"><img src="images/arrow_right.gif" alt="" width="16" height="16" border="0" align="absmiddle">&nbsp;���ͼƬ2��</td>
      <td align="left" valign="middle" bgcolor="#FFFFFF"><input name="ad2" type="text" id="ad2"  size="30">
      <input type=button value="�ϴ�ͼƬ..." onClick="showUploadDialog('image', 'form1.ad2', '')" class="button"></td>
      <td align="left" valign="top" bgcolor="#FFFFFF"><span class="main_bright"><img src="images/bullet_error.gif" alt="" width="16" height="16" border="0" align="absmiddle" />&nbsp;</span>�����ҵ���ܹ���ͼƬ</td>
    </tr>
    <tr>
      <td  align="center" valign="top" bgcolor="#FFFFFF"><img src="images/arrow_right.gif" alt="" width="16" height="16" border="0" align="absmiddle">&nbsp;���ͼƬ3��</td>
      <td align="left" valign="middle" bgcolor="#FFFFFF"><input name="ad3" type="text" id="ad3"  size="30">
      <input type=button value="�ϴ�ͼƬ..." onClick="showUploadDialog('image', 'form1.ad3', '')" class="button"></td>
      <td align="left" valign="top" bgcolor="#FFFFFF"><span class="main_bright"><img src="images/bullet_error.gif" alt="" width="16" height="16" border="0" align="absmiddle" />&nbsp;</span>�����ҵ���ܹ���ͼƬ</td>
    </tr>
    <tr>
      <td  align="center" valign="top" bgcolor="#FFFFFF"><img src="images/arrow_right.gif" alt="" width="16" height="16" border="0" align="absmiddle">&nbsp;���ͼƬ4��</td>
      <td align="left" valign="middle" bgcolor="#FFFFFF"><input name="ad4" type="text" id="ad4"  size="30">
      <input type=button value="�ϴ�ͼƬ..." onClick="showUploadDialog('image', 'form1.ad4', '')" class="button"></td>
      <td align="left" valign="top" bgcolor="#FFFFFF"><span class="main_bright"><img src="images/bullet_error.gif" alt="" width="16" height="16" border="0" align="absmiddle" />&nbsp;</span>�����ҵ���ܹ���ͼƬ</td>
    </tr>
    <tr>
      <td  align="center" valign="top" bgcolor="#FFFFFF"><p><img src="images/arrow_right.gif" width="16" height="16" border="0" align="absmiddle">&nbsp;��ҵ���ܣ�</p>
        <p>&nbsp;</p></td>
      <td align="left" valign="middle" bgcolor="#FFFFFF"><textarea  name="qyjs" cols="60" rows="10" id="qyjs" style="width:98%"></textarea></td>
      <td align="left" valign="top" bgcolor="#FFFFFF"><p><span class="main_bright"><img src="images/bullet_error.gif" alt="" width="16" height="16" border="0" align="absmiddle" />&nbsp;</span><span class="STYLE3">��ҵ�������ݣ�����֧��HTML���룬��ֶ��䣺&lt;p&gt;����...&lt;/p&gt;�����У�&lt;br&gt;���ո񣺡���Ϊ�˽��������뾡����Ҫ����HTML���롣</span></p></td>
    </tr>
    <tr>
      <td height="35" colspan="3" align="center" valign="middle" bgcolor="#3498db">
        <input class="button" type="submit" name="button" id="button" value="�ύ">
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
