<%
'基础数据 作者：陈劲全 QQ：820094076
'2012-08-13

Server.ScriptTimeOut = 90000
'Response.Buffer = False

Dim MM_conn_STRING,mydata
mydata=server.mappath("/appserver/Database.mdb")
Set MM_conn_STRING = Server.CreateObject("ADODB.Connection")

'sqlite 数据库
'MM_conn_STRING.open "DRIVER={SQLite3 ODBC Driver};Database="&mydata
'access 数据库
MM_conn_STRING.open "driver={microsoft access driver (*.mdb)};dbq="&mydata
'sql 数据库
'MM_conn_STRING.open "DRIVER={SQL Server};SERVER=ServerName;UID=USER;PWD=password;DATABASE=databasename"
'DSN 数据源
'MM_conn_STRING.open "DSN=MyDSN"

%>
<%
On Error Resume Next
Dim getssid,zzz,jjj
Set getssid=Server.CreateObject("gsd.ssid")
zzz=getssid.showid("s0002")
jjj=getssid.showid("s0001")
%>
