<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="../Connections/conn.asp" -->
<!--#include file="md5.asp" -->
<%
  if session("username")=""  or session("dj") =""  then
  response.redirect "login.asp"
  end if 
%>
<% dim npassword
   dim nusername
   dim ousername
   dim submit
   
   dim superman
   dim superman_cmd
   dim superman_numRows
   
   npassword=LCase(md5(Request("npassword")))
   nusername=LCase(Request("nusername"))
   ousername=Request("ousername")
   submit=Trim(Request("submit"))
   
'//�����޸Ĳ���
   set superman_cmd = Server.CreateObject("ADODB.Command")
   superman_cmd.ActiveConnection = MM_conn_STRING
   
   if submit="�޸�" then

'//�޸��û�����      
	 superman_cmd.CommandText="UPDATE  admin SET username='"&nusername&"', password='"&npassword&"' where username='"&ousername&"'"
	 superman_cmd.Prepared = true
     Set superman = superman_cmd.Execute

         response.redirect "superman.asp"
		 
	 superman.close
     Set superman = Nothing   
   
    end if
    
'//����ɾ������

   if submit="ɾ��" then
      
     superman_cmd.CommandText = "delete from admin where username='"&ousername&"'"
     superman_cmd.Prepared = true
     Set superman = superman_cmd.Execute 
     
   response.redirect "superman.asp"
    superman.close
    Set superman = Nothing  
   
   end if
%>
