<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="../Connections/conn.asp" -->
<%
  if session("username")=""  or session("dj") =""  then
  response.redirect "login.asp"
  end if 
%>
<%
if Request("ID") <> "" then
dim uphits,ID1,table1,url1,ud1
ID1 = Request("ID")
table1 = Request("table")
url1 = Request("url")
ud1= Request("ud")
Set uphits = Server.CreateObject ("ADODB.Command")
uphits.ActiveConnection = MM_conn_STRING
if ud1 = "up" then
uphits.CommandText = "UPDATE "&table1&" SET nu = nu + 1 WHERE ID ="&Request("ID")
end if
if ud1 = "down" then
uphits.CommandText = "UPDATE "&table1&" SET nu = nu - 1 WHERE ID ="&Request("ID")
end if
uphits.CommandType = 1
uphits.CommandTimeout = 0
uphits.Prepared = true
uphits.Execute()
response.redirect (url1)
end if
%>
