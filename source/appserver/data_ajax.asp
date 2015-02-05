<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<%Response.Addheader "Content-Type","text/html; charset=gb2312" %>
<!--#include file="Connections/conn.asp" -->

<%

Dim html

If Request("ac") = "getly" Then
	'楼宇数据
	dim ly_num
	Set ly = Server.CreateObject("adodb.recordset")
	ly.open"select ly from lc group by ly",MM_conn_STRING,1,1

	If ly.eof And ly.bof Then

		html = "{""result"":""0""}"   '数据为空
		Response.Write(html)
		'On Error Resume Next
		'filename=server.mapPath("/appserver/ly.json")
		'call WriteToFile(filename,html,"utf-8")

	Else
	
		html      = "{""ly"":["
		
		While Not ly.eof

		ly_num     = Chr(34) & ly("ly") & Chr(34)

		html      = html & ly_num &","
		ly.movenext
		Wend
		
		html=left(html,len(html)-1)

		html = html & "]}"

		Response.Write(html)
		'On Error Resume Next
		'filename=server.mapPath("/appserver/ly.json")
		'call WriteToFile(filename,html,"utf-8")

	End If

	ly.Close()
	Set ly = Nothing
	MM_conn_STRING.Close
	Set MM_conn_STRING = Nothing

End If

If Request("ac") = "getlc" and Request("ly") <> "" Then
	'楼层数据
	dim lc_id
	dim lc_num
	Set lc = Server.CreateObject("adodb.recordset")
	lc.open"select * from lc where ly ='"&Request("ly")&"' order by lc",MM_conn_STRING,1,1

	If lc.eof And lc.bof Then

		html = "{""result"":""0""}"   '数据为空
		Response.Write(html)
		'On Error Resume Next
		'filename=server.mapPath("/appserver/ly.json")
		'call WriteToFile(filename,html,"utf-8")

	Else
	
		html      = "{""lc"":["
		
		While Not lc.eof
        
		lc_id     = Chr(34) & lc("ID") & Chr(34)
		lc_num     = Chr(34) & lc("lc") & Chr(34)

		html      = html & "{""id"":"&lc_id&",""lc"":"&lc_num&"},"
		lc.movenext
		Wend
		
		html=left(html,len(html)-1)

		html = html & "]}"

		Response.Write(html)
		'On Error Resume Next
		'filename=server.mapPath("/appserver/ly.json")
		'call WriteToFile(filename,html,"utf-8")

	End If

	lc.Close()
	Set lc = Nothing
	MM_conn_STRING.Close
	Set MM_conn_STRING = Nothing

End If

If Request("ac") = "getqy" and Request("lc") <> "" Then
	'按条件获取企业数据
	dim qy_id
	dim qy_name
	dim qy_logo
	dim qy_ly
	dim qy_lc

	Set qy = Server.CreateObject("adodb.recordset")
	qy.open"select ID,qyname,qylogo,ly,lc from qy where lcid ='"&Request("lc")&"' order by qyname",MM_conn_STRING,1,1

	If qy.eof And qy.bof Then

		html = "{""result"":""0""}"   '数据为空
		'Response.Write(html)
		On Error Resume Next
		filename=server.mapPath("/appserver/qy.json")
		call WriteToFile(filename,html,"utf-8")

	Else
	
		html      = "{""qy"":["
		
		While Not qy.eof
        
		qy_id     = Chr(34) & qy("ID") & Chr(34)
		qy_name     = Chr(34) & qy("qyname") & Chr(34)
		qy_logo     = Chr(34) & qy("qylogo") & Chr(34)
		qy_ly     = Chr(34) & qy("ly") & Chr(34)
		qy_lc     = Chr(34) & qy("lc") & Chr(34)

		html      = html & "{""qyname"":"&qy_name&", ""id"":"&qy_id&", ""qylogo"":"&qy_logo&", ""qyly"":"&qy_ly&", ""qylc"":"&qy_lc&"},"
		qy.movenext
		Wend
		
		html=left(html,len(html)-1)

		html = html & "]}"
		'Response.Write(html)
		On Error Resume Next
		filename=server.mapPath("/appserver/qy.json")
		call WriteToFile(filename,html,"utf-8")

	End If

	qy.Close()
	Set qy = Nothing
	MM_conn_STRING.Close
	Set MM_conn_STRING = Nothing

End If

If Request("ac") = "getqyall" and Request("ly") <> "" Then
	'按楼宇获取企业数据
	dim qy_id2
	dim qy_name2
	dim qy_logo2
	dim qy_ly2
	dim qy_lc2

	Set qyall = Server.CreateObject("adodb.recordset")
	qyall.open"select ID,qyname,qylogo,ly,lc from qy where ly ='"&Request("ly")&"' order by CInt(lc)",MM_conn_STRING,1,1

	If qyall.eof And qyall.bof Then

		html = "{""result"":""0""}"   '数据为空
		'Response.Write(html)
		On Error Resume Next
		filename=server.mapPath("/appserver/qy.json")
		call WriteToFile(filename,html,"utf-8")

	Else
	
		html      = "{""qy"":["
		
		While Not qyall.eof
        
		qy_id2     = Chr(34) & qyall("ID") & Chr(34)
		qy_name2     = Chr(34) & qyall("qyname") & Chr(34)
		qy_logo2     = Chr(34) & qyall("qylogo") & Chr(34)
		qy_ly2     = Chr(34) & qyall("ly") & Chr(34)
		qy_lc2     = Chr(34) & qyall("lc") & Chr(34)

		html      = html & "{""qyname"":"&qy_name2&", ""id"":"&qy_id2&", ""qylogo"":"&qy_logo2&", ""qyly"":"&qy_ly2&", ""qylc"":"&qy_lc2&"},"
		qyall.movenext
		Wend
		
		html=left(html,len(html)-1)

		html = html & "]}"
		'Response.Write(html)
		On Error Resume Next
		filename=server.mapPath("/appserver/qy.json")
		call WriteToFile(filename,html,"utf-8")

	End If

	qyall.Close()
	Set qyall = Nothing
	MM_conn_STRING.Close
	Set MM_conn_STRING = Nothing

End If


If Request("ac") = "getmap" and Request("lc") <> "" Then
	'楼层地图数据
	dim lc_name
	dim lc_map
	dim id
	
	id = cint(Request("lc"))

	Set map = Server.CreateObject("adodb.recordset")
	map.open"select * from lc where ID ="&id&"",MM_conn_STRING,1,1

	If map.eof And map.bof Then

		html = "{""result"":""0""}"   '数据为空
		Response.Write(html)
		'On Error Resume Next
		'filename=server.mapPath("/appserver/map.json")
		'call WriteToFile(filename,html,"utf-8")

	Else
        
		lc_name     = Chr(34) & map("lc") & Chr(34)
		lc_map     = Chr(34) & map("lcmap") & Chr(34)

		html      = "{""lc"":"&lc_name&", ""mappic"":"&lc_map&"}"
		
		Response.Write(html)
		'On Error Resume Next
		'filename=server.mapPath("/appserver/map.json")
		'call WriteToFile(filename,html,"utf-8")

	End If

	map.Close()
	Set map = Nothing
	MM_conn_STRING.Close
	Set MM_conn_STRING = Nothing

End If

If Request("ac") = "serchqy" and Request("skey") <> "" Then
	'企业搜索数据
	dim qy_id1
	dim qy_name1
	dim qy_logo1
	dim qy_ly1
	dim qy_lc1

	Set qy1 = Server.CreateObject("adodb.recordset")
	qy1.open"select ID,qyname,qylogo,ly,lc from qy where skey ='"&Request("skey")&"' order by ly",MM_conn_STRING,1,1

	If qy1.eof And qy1.bof Then

		html = "{""result"":""0""}"   '数据为空
		'Response.Write(html)
		On Error Resume Next
		filename=server.mapPath("/appserver/qy-serch.json")
		call WriteToFile(filename,html,"utf-8")

	Else
	
		html      = "{""qy"":["
		
		While Not qy1.eof
        
		qy_id1     = Chr(34) & qy1("ID") & Chr(34)
		qy_name1     = Chr(34) & qy1("qyname") & Chr(34)
		qy_logo1     = Chr(34) & qy1("qylogo") & Chr(34)
		qy_ly1     = Chr(34) & qy1("ly") & Chr(34)
		qy_lc1     = Chr(34) & qy1("lc") & Chr(34)

		html      = html & "{""qyname"":"&qy_name1&", ""id"":"&qy_id1&", ""qylogo"":"&qy_logo1&", ""qyly"":"&qy_ly1&", ""qylc"":"&qy_lc1&"},"
		qy1.movenext
		Wend
		
		html=left(html,len(html)-1)

		html = html & "]}"
		'Response.Write(html)
		On Error Resume Next
		filename=server.mapPath("/appserver/qy-serch.json")
		call WriteToFile(filename,html,"utf-8")

	End If

	qy1.Close()
	Set qy1 = Nothing
	MM_conn_STRING.Close
	Set MM_conn_STRING = Nothing

End If

If Request("ac") = "getqyxx" and Request("id") <> "" Then
	'企业详细数据
	dim xx_id
	dim xx_qyid
	dim xx_name
	dim xx_logo
	dim xx_tel
	dim xx_js
	dim xx_lc
	dim xx_ad1
	dim xx_ad2
	dim xx_ad3
	dim xx_ad4
	
	xx_id = cint(Request("id"))

	Set qyxx = Server.CreateObject("adodb.recordset")
	qyxx.open"select * from qy where ID ="&xx_id&"",MM_conn_STRING,1,1

	If qyxx.eof And qyxx.bof Then

		html = "{""result"":""0""}"   '数据为空
		'Response.Write(html)
		On Error Resume Next
		filename=server.mapPath("/appserver/qyxx.json")
		call WriteToFile(filename,html,"utf-8")

	Else
        
		xx_name     = Chr(34) & qyxx("qyname") & Chr(34)
		xx_logo     = Chr(34) & qyxx("qylogo") & Chr(34)
		xx_tel     = Chr(34) & qyxx("qytel") & Chr(34)
		xx_js     = Chr(34) & qyxx("qyjs") & Chr(34)
		xx_lc     = Chr(34) & qyxx("qylc") & Chr(34)
		xx_qyid     = Chr(34) & qyxx("ID") & Chr(34)
		xx_ad1     = Chr(34) & qyxx("ad1") & Chr(34)
		xx_ad2     = Chr(34) & qyxx("ad2") & Chr(34)
		xx_ad3     = Chr(34) & qyxx("ad3") & Chr(34)
		xx_ad4     = Chr(34) & qyxx("ad4") & Chr(34)

		html      = "{""id"":"&xx_qyid&",""qyname"":"&xx_name&",""qylogo"":"&xx_logo&",""qytel"":"&xx_tel&",""qyjs"":"&xx_js&",""qylc"":"&xx_lc&",""ad1"":"&xx_ad1&",""ad2"":"&xx_ad2&",""ad3"":"&xx_ad3&",""ad4"":"&xx_ad4&"}"
		
		'Response.Write(html)
		On Error Resume Next
		filename=server.mapPath("/appserver/qyxx.json")
		call WriteToFile(filename,html,"utf-8")
		

	End If

	qyxx.Close()
	Set qyxx = Nothing
	MM_conn_STRING.Close
	Set MM_conn_STRING = Nothing

End If

%>

<%
If Request("ac") = "getconfig" Then
	'获取注册信息
	dim softname
	dim gdinfo
	dim zcsn
	dim inily
	dim zc

	Set rsconfig = Server.CreateObject("adodb.recordset")
	rsconfig.open"select * from config where ID=1",MM_conn_STRING,1,1

	If rsconfig.eof And rsconfig.bof Then

		html = "{""result"":""0""}"   '数据为空
		Response.Write(html)

	Else
        
		'softname     = Chr(34) & rsconfig("softname") & Chr(34)
		'gdinfo     = Chr(34) & rsconfig("info") & Chr(34)
		inily     = Chr(34) & rsconfig("inily") & Chr(34)
		zcsn     =rsconfig("zcsn")
		
		if cstr(zzz) <> cstr(zcsn) then
		zc="0"
		else
		zc="1"
		end if

		html  = "{""zc"":"&zc&",""inily"":"&inily&"}"
		
		Response.Write(html)

	End If

	rsconfig.Close()
	Set rsconfig = Nothing
	MM_conn_STRING.Close
	Set MM_conn_STRING = Nothing

End If
%>

<%
'生成文件
Function WriteToFile (FileUrl, Str, CharSet) 
	On Error Resume Next
	Set stm = CreateObject("Adodb.Stream") 
	stm.Type = 2 
	stm.mode = 3 
	stm.charset = CharSet 
	stm.Open 
	stm.WriteText Str 
	stm.SaveToFile FileUrl, 2 
	stm.flush 
	stm.Close 
Set stm = Nothing 
End Function

%>