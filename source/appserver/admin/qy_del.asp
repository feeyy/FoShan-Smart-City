<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="../Connections/conn.asp" -->
<%
  if session("username")=""  or session("dj") =""  then
  response.redirect "login.asp"
  end if 
%>
<%

if Request("ID") <> "" then

	ID=Request("ID")
	arrayID=split(ID,",")

	for array_id = 0 to Ubound(arrayID)
	Set RsDEL=Server.CreateObject("Adodb.Recordset")
	
	SqlDEL="Select * from qy where ID=" & arrayID(array_id)
	RsDEL.open SqlDEL,MM_conn_STRING,3,2

	if RsDEL("qylogo")<>"" then
        If not IsObjInstalled("Scripting.FileSystemObject") Then
			Response.Write "<b><font color=red>你的服务器不支持 FSO(Scripting.FileSystemObject)! 不能使用本功能删除关联图片</font></b>"
		else
        Call DoDelFile(RsDEL("qylogo"))
		Call DoDelFile(RsDEL("ad1"))
		Call DoDelFile(RsDEL("ad2"))
		Call DoDelFile(RsDEL("ad3"))
		Call DoDelFile(RsDEL("ad4"))
        end if
        end if
	
	RsDEL.delete
	RsDEL.update
	
	RsDEL.close
	
	Set RsDEL=Nothing
	
	next
	

	Response.Redirect("qy.asp")
	
else
Response.Write ("<script>alert('请至少选择一个删除的对象！');history.back();</script>")
Response.end 
end if

' 删除指定的文件
Sub DoDelFile(sPathFile)
	On Error Resume Next
	'Dim oFSO
	Set oFSO = Server.CreateObject("Scripting.FileSystemObject")
	oFSO.DeleteFile(Server.MapPath(sPathFile))
	Set oFSO = Nothing
End Sub

'**************************************************
'函数名：IsObjInstalled
'作  用：检查组件是否已经安装
'参  数：strClassString ----组件名
'返回值：True  ----已经安装
'       False ----没有安装
'**************************************************
Function IsObjInstalled(strClassString)
	On Error Resume Next
	IsObjInstalled = False
	Err = 0
	'Dim xTestObj
	Set xTestObj = Server.CreateObject(strClassString)
	If 0 = Err Then IsObjInstalled = True
	Set xTestObj = Nothing
	Err = 0
End Function

%>
