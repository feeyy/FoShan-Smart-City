<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="../Connections/conn.asp" -->
<!--#include file="md5.asp" -->
<%
  if session("username")=""  or session("dj") =""  then
  response.redirect "login.asp"
  end if 
%>
<%
Dim MM_editAction
MM_editAction = CStr(Request.ServerVariables("SCRIPT_NAME"))
If (Request.QueryString <> "") Then
  MM_editAction = MM_editAction & "?" & Server.HTMLEncode(Request.QueryString)
End If

' boolean to abort record edit
Dim MM_abortEdit
MM_abortEdit = false
%>
<%
' IIf implementation
Function MM_IIf(condition, ifTrue, ifFalse)
  If condition = "" Then
    MM_IIf = ifFalse
  Else
    MM_IIf = ifTrue
  End If
End Function
%>
<%
If (CStr(Request("MM_insert")) = "form1") Then
  If (Not MM_abortEdit) Then
    ' execute the insert
    Dim MM_editCmd

    Set MM_editCmd = Server.CreateObject ("ADODB.Command")
    MM_editCmd.ActiveConnection = MM_conn_STRING
    MM_editCmd.CommandText = "INSERT INTO [admin] (dj, username, password) VALUES (?, ?, ?)" 
    MM_editCmd.Prepared = true
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param1", 5, 1, -1, MM_IIF(Request.Form("dj"), Request.Form("dj"), null)) ' adDouble
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param2", 201, 1, -1, Request.Form("username")) ' adLongVarChar
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param3", 201, 1, -1, md5(Request.Form("password"))) ' adLongVarChar
    MM_editCmd.Execute
    MM_editCmd.ActiveConnection.Close

    ' append the query string to the redirect URL
    Dim MM_editRedirectUrl
    MM_editRedirectUrl = "superman.asp"
    If (Request.QueryString <> "") Then
      If (InStr(1, MM_editRedirectUrl, "?", vbTextCompare) = 0) Then
        MM_editRedirectUrl = MM_editRedirectUrl & "?" & Request.QueryString
      Else
        MM_editRedirectUrl = MM_editRedirectUrl & "&" & Request.QueryString
      End If
    End If
    Response.Redirect(MM_editRedirectUrl)
  End If
End If
%>
<%
Dim user
Dim user_cmd
Dim user_numRows

Set user_cmd = Server.CreateObject ("ADODB.Command")
user_cmd.ActiveConnection = MM_conn_STRING
user_cmd.CommandText = "SELECT * FROM admin ORDER BY ID ASC" 
user_cmd.Prepared = true

Set user = user_cmd.Execute
user_numRows = 0
%>
<%
Dim Repeat1__numRows
Dim Repeat1__index

Repeat1__numRows = -1
Repeat1__index = 0
user_numRows = user_numRows + Repeat1__numRows
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title></title>
<link href="right.css" rel="stylesheet" type="text/css">
<script type="text/JavaScript">

function checkForm(obj){
	if(obj.username.value == ''){
		alert("�������û�����")
		obj.username.focus();
		return false
	}
	if(obj.password.value == ''){
		alert("���������룡")
		obj.password.focus();
		return false
	}
		if(obj.password1.value == ''){
		alert("������ȷ�����룡")
		obj.password1.focus();
		return false
	}
	if(obj.password1.value !== obj.password.value ){
		alert("ȷ�����벻��ȷ��")
		obj.password1.focus();
		return false
	}
	return true
}

</script>
</head>

<body>
<table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#ecf0f1">
  <tr>
    <td height="35" colspan="4" align="center" valign="middle" bgcolor="#3498db" class="fy2"><img src="images/key.gif" width="16" height="16" border="0" align="absmiddle">&nbsp;<strong>����Ա�б�</strong></td>
  </tr>
  <tr class="fy2">
    <td width="25%" align="center" valign="middle" bgcolor="#f39c12" class="fy2"><img src="images/arrow_down.gif" width="16" height="16" border="0" align="absmiddle">&nbsp;�û���½��</td>
    <td width="25%" height="35" align="center" valign="middle" bgcolor="#f39c12" class="fy2"><img src="images/arrow_down.gif" width="16" height="16" border="0" align="absmiddle">&nbsp;�û�����</td>
    <td width="25%" align="center" valign="middle" bgcolor="#f39c12" class="fy2"><img src="images/arrow_down.gif" width="16" height="16" border="0" align="absmiddle">&nbsp;�û�Ȩ��</td>
    <td width="25%" align="center" valign="middle" bgcolor="#f39c12" class="fy2"><img src="images/arrow_down.gif" width="16" height="16" border="0" align="absmiddle">&nbsp;����</td>
  </tr>
  <% 
While ((Repeat1__numRows <> 0) AND (NOT user.EOF)) 
%>
    <form   method="POST" action="superman_edit.asp" >
      <tr bgcolor="#FFFFFF" onMouseOver="this.bgColor='#ecf0f1'" onMouseOut="this.bgColor='#FFFFFF'">
        <td height="40" align="center" valign="middle"  ><span class="td2">
          <input style="width:90%" name="nusername" type="text" id="nusername" value="<%=(user.Fields.Item("username").Value)%>"  size="30" maxlength="30" />
          </span></td>
        <td align="center" valign="middle"  ><span class="td2">
          <input style="width:90%" name="npassword" type="password" id="npassword" value="<%=(user.Fields.Item("password").Value)%>"  size="30" />
          </span></td>
        <td align="center" valign="middle" ><%if (user.Fields.Item("dj").Value)=0 then%>
          <div align="center"><img src="images/2.gif" width="14" height="15" border="0" align="absmiddle">&nbsp;һ�����Ա</div>
          <%end if%>
          <%if (user.Fields.Item("dj").Value)=1 then%>
          <div align="center"><img src="images/1.gif" width="14" height="15" border="0" align="absmiddle">&nbsp;��������Ա</div>
          <%end if%></td>
        <td align="center" valign="middle"><input name="ousername" type="hidden" value="<%=(user.Fields.Item("username").Value)%>">
          <%if session("dj") = 0 then %>
          <input  disabled  class="button" type="submit" name="Submit" value="ȷ���޸�����">
          &nbsp;
          <input disabled  class="button" type="submit" name="Submit" value="ɾ��">
          <%end if%>
          <%if session("dj") = 1 then %>
          <input  class="button"  type="submit" name="Submit" value="ȷ���޸�����">
          &nbsp;
          <input  class="button" type="submit" name="Submit" value="ɾ��">
          <%end if%></td>
      </tr>
    </form>
    <% 
  Repeat1__index=Repeat1__index+1
  Repeat1__numRows=Repeat1__numRows-1
  user.MoveNext()
Wend
%>
  <tr>
    <td height="35" colspan="4" align="center" valign="middle" bgcolor="#3498db" class="fy2"><img src="images/bullet_error.gif" width="16" height="16" border="0" align="absmiddle">��ϵͳ֧�ֶ��û�Զ�̵�½����ֻ�г�������Ա�����޸ĺ�����û���</td>
  </tr>
</table>
<br>
<form ACTION="<%=MM_editAction%>" name="form1" method="POST" onSubmit="return checkForm(this)" >
  <table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#ecf0f1">
    <tr>
      <td height="35" colspan="2" align="center" valign="middle" bgcolor="#3498db" class="fy2"><strong><img src="images/key_add.gif" width="16" height="16" border="0" align="absmiddle">&nbsp;��ӹ���Ա</strong></td>
    </tr>
    <tr>
      <td width="16%" align="center" valign="middle" bgcolor="#FFFFFF"><img src="images/arrow_right.gif" width="16" height="16" border="0" align="absmiddle">&nbsp;����Ȩ�ޣ�</td>
      <td width="84%" align="left" valign="middle" bgcolor="#FFFFFF"><select name="dj" id="dj">
          <option value="0">һ�����Ա</option>
          <option value="1">��������Ա</option>
        </select>
        &nbsp;&nbsp;</td>
    </tr>
    <tr>
      <td align="center" valign="middle" bgcolor="#FFFFFF"><img src="images/arrow_right.gif" width="16" height="16" border="0" align="absmiddle">&nbsp;��½���֣�</td>
      <td align="left" valign="middle" bgcolor="#FFFFFF"><input name="username" type="text" id="username" size="30" maxlength="30">
        &nbsp;<img src="images/bullet_error.gif" width="16" height="16" border="0" align="absmiddle">&nbsp;�������̨��½�����ƣ���chen��</td>
    </tr>
    <tr>
      <td align="center" valign="middle" bgcolor="#FFFFFF"><img src="images/arrow_right.gif" width="16" height="16" border="0" align="absmiddle">&nbsp;��½���룺</td>
      <td align="left" valign="middle" bgcolor="#FFFFFF"><input name="password" type="password" id="password" size="30" maxlength="30">
        &nbsp;</td>
    </tr>
    <tr>
      <td align="center" valign="middle" bgcolor="#FFFFFF"><img src="images/arrow_right.gif" width="16" height="16" border="0" align="absmiddle">&nbsp;����ȷ�ϣ�</td>
      <td align="left" valign="middle" bgcolor="#FFFFFF"><input name="password1" type="password" id="password1" size="30" maxlength="30">
        &nbsp;<img src="images/bullet_error.gif" width="16" height="16" border="0" align="absmiddle">&nbsp;���ٴ�������������룡</td>
    </tr>
    <tr>
      <td colspan="2" align="center" valign="middle" bgcolor="#3498db"><%if session("dj") = 0 then %>
        <input disabled class="button" type="submit" name="button" id="button" value="�ύ���û�">
        <%end if%>
        <%if session("dj") = 1 then %>
        <input class="button" type="submit" name="button" id="button" value="�ύ���û�">
        <%end if%>
        &nbsp;&nbsp;
        <input class="button" type="reset" name="button2" id="button2" value="����"></td>
    </tr>
  </table>
  <input type="hidden" name="MM_insert" value="form1">
</form>
</body>
</html>
<%
user.Close()
Set user = Nothing
%>
