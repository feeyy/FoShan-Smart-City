<%@LANGUAGE="VBSCRIPT" %>
<!--#include file="../Connections/conn.asp" -->
<!--#include file="md5.asp" -->
<%
if  request("username") ="" or Request("password") ="" then
response.write("<Script language=JavaScript>if(confirm('�Բ����������û��������룬��ȷ�����ص�½ҳ�棡'))location='login.asp'</Script>")
end if
  %>

<%
	dim login
	dim login_cmd
	dim login_numRows
	dim username
	dim password
	
	username=replace(trim(request("username")),"'","")
	password=replace(trim(md5(Request("password"))),"'","")
	
	
	
	set login_cmd= Server.CreateObject("ADODB.Command")
	login_cmd.ActiveConnection = MM_conn_STRING
	login_cmd.CommandText="select * from admin where username='"&username&"' and password='"&password&"'"
	login_cmd.Prepared = true
    Set login = login_cmd.Execute
    login_numRows = 0
	
 	if not(login.bof and login.eof) then
	 
 		if password=login("password") and username=login("username") then
			session("username")=login("username")
			session("dj")=login("dj")
			Response.Redirect "index.asp"
 		
		else
			response.write("<Script language=JavaScript>if(confirm('�Բ�����������û�������������ȷ�����ص�½ҳ�棡'))location='login.asp'</Script>")
 		end if
	
	else 
			response.write("<Script language=JavaScript>if(confirm('�Բ�����������û�������������ȷ�����ص�½ҳ�棡'))location='login.asp'</Script>")
		end if


login.Close()
Set login = Nothing
%>
