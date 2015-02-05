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
fString = replace(fString, ";", ";") '分号过滤 
fString = replace(fString, "--", "--") '--过滤 
fString = replace(fString, "%20", "") '特殊字符过滤 
fString = replace(fString, "==", "") '==过滤 
fString = replace(fString, ">", ">") 
fString = replace(fString, "<", "<") 
fString = Replace(fString, CHR(32), " ") 
fString = Replace(fString, CHR(9), "") 
fString = Replace(fString, CHR(34), "\""") 
fString = Replace(fString, CHR(39), "\'")
fString = Replace(fString, "\\", "\") 
fString = Replace(fString, CHR(13), "") 
fString = Replace(fString, CHR(10) & CHR(10), "") '---------这行 改了
fString = Replace(fString, CHR(10), "")  '---------这行 也改了
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

// 参数说明
// s_Type : 文件类型，可用值为"image","flash","media","file"
// s_Link : 文件上传后，用于接收上传文件路径文件名的表单名
// s_Thumbnail : 文件上传后，用于接收上传图片时所产生的缩略图文件的路径文件名的表单名，当未生成缩略图时，返回空值，原图用s_Link参数接收，此参数专用于缩略图
function showUploadDialog(s_Type, s_Link, s_Thumbnail){
	//以下style=coolblue,值可以依据实际需要修改为您的样式名,通过此样式的后台设置来达到控制允许上传文件类型及文件大小
	var arr = showModalDialog("editor/dialog/i_upload.htm?style=coolblue&type="+s_Type+"&link="+s_Link+"&thumbnail="+s_Thumbnail, window, "dialogWidth:0px;dialogHeight:0px;help:no;scroll:no;status:no");
}


function checkForm(obj){
	if(obj.lcid.value == ''){
		alert("请选择入驻楼层！")
		obj.lcid.focus();
		return false
	}
	if(obj.qylc.value == ''){
		alert("请输入入驻单元！")
		obj.qylc.focus();
		return false
	}
		if(obj.qyname.value == ''){
		alert("请输入企业名称！")
		obj.qyname.focus();
		return false
	}
	
	if(obj.qyjs.value == ''){
		alert("请输入企业介绍！")
		obj.qyjs.focus();
		return false
	}

	if(obj.qyjs.value == ''){
		alert("请输入企业介绍！")
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
      <td height="35" colspan="6" align="left" valign="middle"  bgcolor="#3498db" class="fy2" ><input class="button" onClick="location.href='qy.asp'" type="button" value="入驻企业列表"></td>
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
          <input type="submit" class="button" value="搜索" title="内容过多时，可通过输入搜索相关标题信息快速检索。">
        </form></td>
    </tr>
  <form action="qy_del.asp" method="get" name="form2" onSubmit="return confirm('删除后将不能恢复，你确定删除么？')" style="margin-top:2px;"/>
  
  <tr>
    <td width="4%" height="35" align="center" valign="middle" bgcolor="#f39c12">&nbsp;</td>
    <td width="11%" align="center" valign="middle" bgcolor="#f39c12" class="fy2"><img src="images/arrow_down.gif" alt="" width="16" height="16" border="0" align="absmiddle">logo</td>
    <td width="33%" align="center" valign="middle" bgcolor="#f39c12" class="fy2"><img src="images/arrow_down.gif" alt="" width="16" height="16" border="0" align="absmiddle">&nbsp;入驻企业名称</td>
    <td width="10%" align="center" valign="middle" bgcolor="#f39c12" class="fy2"><img src="images/arrow_down.gif" alt="" width="16" height="16" border="0" align="absmiddle">入驻楼层</td>
    <td width="14%" align="center" valign="middle" bgcolor="#f39c12" class="fy2"><img src="images/arrow_down.gif" width="16" height="16" border="0" align="absmiddle">编辑时间</td>
    <td width="28%" align="center" valign="middle" bgcolor="#f39c12" class="fy2"><img src="images/arrow_down.gif" width="16" height="16" border="0" align="absmiddle">&nbsp;管理</td>
  </tr>
    </thead>
  
  <tbody>
    <%
if rs.eof and rs.bof then
%>
    <tr>
      <td height="35" colspan="6" align="center" valign="middle" bgcolor="#FFFFFF"> 没有找到相关信息！ </td>
    </tr>
    <%else%>
    <%  
while not rs.eof
%>
    <tr bgcolor="#FFFFFF" onMouseOver="this.bgColor='#ecf0f1'" onMouseOut="this.bgColor='#FFFFFF'">
      <td align="center" valign="middle"  ><input name="ID" type="checkbox" value="<%=rs("ID")%>" /></td>
      <td height="50" align="center" valign="middle"  ><%if rs("qylogo")<>"" then%><img src="../../<%=rs("qylogo")%>" width="100" height="50" /><%else%>无LOGO<%end if%></td>
      <td align="left" valign="middle"  ><%=rs("qyname")%></td>
      <td align="center" valign="middle" ><% 
set cc=server.createobject("adodb.recordset")
cc.open"select lc,ly from lc where ID="&cint(rs("lcid"))&"",MM_conn_STRING,1,1
if cc.eof and cc.bof then
else
response.write(cc("ly")&"栋,"&cc("lc")&"楼")
end if
cc.Close()
Set cc = Nothing
%></td>
      <td align="center" valign="middle" ><%=rs("times")%></td>
      <td align="center" valign="middle"><input class="button" onClick="location.href='#add'" type="button" value="添加">
        &nbsp;
        <input class="button" onClick="location.href='qy_edit.asp?ID=<%=rs("ID")%>'" type="button" value="编辑">
        &nbsp;
        <input class="button" onClick="javascript:if(confirm('确实要删除吗?'))location='qy_del.asp?ID=<%=rs("ID")%>'" type="button" value="删除"></td>
    </tr>
    <%
rs.movenext '显示页面的数据 
wend
%>
    <%end if%>
  </tbody>
  <tr>
    <td colspan="6" align="left" valign="middle" bgcolor="#3498db"><div id="pager" style="float:right;  height:25px; overflow:hidden;"> <img src="images/first.png" border="0" align="absmiddle" title="第一页" class="first" style="cursor:pointer;"/> <img src="images/prev.png"  border="0" align="absmiddle" title="上一页" class="prev" style="cursor:pointer;"/>
        <input type="text" class="pagedisplay"/>
        <img src="images/next.png" border="0" align="absmiddle" title="下一页"  class="next" style="cursor:pointer;"/> <img src="images/last.png" border="0" align="absmiddle" title="最后页"  class="last" style="cursor:pointer;"/>
        <select class="pagesize">
          <option value="5">5</option>
          <option selected="selected"  value="10">10</option>
          <option value="20">20</option>
          <option value="30">30</option>
          <option  value="40">40</option>
          <option  value="50">50</option>
        </select>
      </div>
      <input class="button" onClick="selectAll()" type="button" value="全选">
      &nbsp;&nbsp;
      <input class="button" onClick="cancelSelect()" type="button" value="取消">
      &nbsp;&nbsp;
     
      <input  class="button" type="submit" name="Submit" value="批量删除" />
     </td>
  </tr>
    </form>
  
</table>
<br>
<form action="" method="POST" id="form1" name="form1" onSubmit="return checkForm(this)" >
  <table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#ecf0f1">
    <tr>
      <td height="35" colspan="3" align="center" valign="middle"  bgcolor="#3498db"><strong class="fy2"><a name="add"></a><img src="images/application_form_add.gif" width="16" height="16" border="0" align="absmiddle">&nbsp;添加新信息</strong></td>
    </tr>
    <tr>
      <td align="center" valign="middle" bgcolor="#FFFFFF"><img src="images/arrow_right.gif" alt="" width="16" height="16" border="0" align="absmiddle">&nbsp;入驻楼层：</td>
      <td align="left" valign="middle" bgcolor="#FFFFFF"><input name="lcid" type="hidden" id="lcid" value="<%=request("qylcid")%>" >
        <select name="se1" id="se1" onChange="window.location=this.value;">
        <%if request("qyly")<>"" then%>
        <option value=""><%=request("qyly")%>栋</option>
        <%else%>
          <option value="">选择楼宇</option>
          <%end if%>
          <% 
set ly1=server.createobject("adodb.recordset")
ly1.open"select ly from lc group by ly",MM_conn_STRING,1,1%>
          <%
if ly1.eof and ly1.bof then
%>
          <option value="">数据为空！</option>
          <%else%>
          <%while not ly1.eof%>
          <option value="qy.asp?qyly=<%=ly1("ly")%>">
            <%=ly1("ly")%>栋
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
        <option value=""><%=request("qylc")%>楼</option>
        <%else%>
          <option value="">选择楼层</option>
          <%end if%>
          <% 
set lc1=server.createobject("adodb.recordset")
lc1.open"select ID,lc from lc where ly='"&request("qyly")&"' order by lc",MM_conn_STRING,1,1%>
          <%
if lc1.eof and lc1.bof then
%>
          <option value="">数据为空！</option>
          <%else%>
          <%while not lc1.eof%>
          <option value="qy.asp?qylcid=<%=lc1("ID")%>&qylc=<%=lc1("lc")%>&qyly=<%=request("qyly")%>">
            <%=lc1("lc")%>楼
          </option>
          <%
lc1.movenext
wend
end if
lc1.Close()
Set lc1 = Nothing
%>
      </select><%end if%></td>
      <td align="left" valign="middle" bgcolor="#FFFFFF"><span class="main_bright"><img src="images/bullet_error.gif" alt="" width="16" height="16" border="0" align="absmiddle" /></span><span class="STYLE3"><span class="main_bright">&nbsp;</span>必填，选择企业入驻的楼宇及楼层。</span></td>
    </tr>
    <tr>
      <td align="center" valign="middle" bgcolor="#FFFFFF"><img src="images/arrow_right.gif" alt="" width="16" height="16" border="0" align="absmiddle">&nbsp;入驻单元：</td>
      <td align="left" valign="middle" bgcolor="#FFFFFF"><input name="qylc1" type="text" id="qylc1"  size="30"></td>
      <td align="left" valign="middle" bgcolor="#FFFFFF"><span class="main_bright"><img src="images/bullet_error.gif" alt="" width="16" height="16" border="0" align="absmiddle" /></span><span class="STYLE3"><span class="main_bright">&nbsp;</span>必填，如：201</span></td>
    </tr>
    <tr>
      <td align="center" valign="middle" bgcolor="#FFFFFF"><img src="images/arrow_right.gif" alt="" width="16" height="16" border="0" align="absmiddle">&nbsp;企业logo：</td>
      <td align="left" valign="middle" bgcolor="#FFFFFF"><input name="qylogo" type="text" id="qylogo"  size="30">
      <input type=button value="上传图片..." onClick="showUploadDialog('image', 'form1.qylogo', '')" class="button"></td>
      <td align="left" valign="middle" bgcolor="#FFFFFF"><span class="main_bright"><img src="images/bullet_error.gif" alt="" width="16" height="16" border="0" align="absmiddle" />&nbsp;</span>可填，大小：240*130，格式：png</td>
    </tr>
    <tr>
      <td align="center" valign="middle" bgcolor="#FFFFFF"><img src="images/arrow_right.gif" alt="" width="16" height="16" border="0" align="absmiddle">&nbsp;企业名称：</td>
      <td align="left" valign="middle" bgcolor="#FFFFFF"><input name="qyname" type="text" id="qyname"  size="60" style="width:98%"></td>
      <td align="left" valign="middle" bgcolor="#FFFFFF"><span class="main_bright"><img src="images/bullet_error.gif" alt="" width="16" height="16" border="0" align="absmiddle" />&nbsp;</span><span class="STYLE3">必填</span></td>
    </tr>
    <tr>
      <td width="13%" align="center" valign="middle" bgcolor="#FFFFFF"><img src="images/arrow_right.gif" alt="" width="16" height="16" border="0" align="absmiddle">&nbsp;联系电话：</td>
      <td width="58%" align="left" valign="middle" bgcolor="#FFFFFF"><input name="qytel" type="text" id="qytel"  size="30" ></td>
      <td width="29%" align="left" valign="middle" bgcolor="#FFFFFF"><span class="main_bright"><img src="images/bullet_error.gif" alt="" width="16" height="16" border="0" align="absmiddle" />&nbsp;</span>可填</td>
    </tr>
    <tr>
      <td  align="center" valign="top" bgcolor="#FFFFFF"><img src="images/arrow_right.gif" alt="" width="16" height="16" border="0" align="absmiddle">&nbsp;搜索字母：</td>
      <td align="left" valign="middle" bgcolor="#FFFFFF"><input onKeyUp="this.value=this.value.replace(/[^a-z^A-Z]/g,'') " onafterpaste="this.value=this.value.replace(/[^a-z^A-Z]/g,'') " name="skey" type="text" id="skey"  size="30"></td>
      <td align="left" valign="top" bgcolor="#FFFFFF"><span class="main_bright"><img src="images/bullet_error.gif" alt="" width="16" height="16" border="0" align="absmiddle" />&nbsp;</span>企业搜索关联的英文大写字母， 如：G</td>
    </tr>
    <tr>
      <td  align="center" valign="top" bgcolor="#FFFFFF"><img src="images/arrow_right.gif" alt="" width="16" height="16" border="0" align="absmiddle">&nbsp;广告图片1：</td>
      <td align="left" valign="middle" bgcolor="#FFFFFF"><input name="ad1" type="text" id="ad1"  size="30">
      <input type=button value="上传图片..." onClick="showUploadDialog('image', 'form1.ad1', '')" class="button"></td>
      <td align="left" valign="top" bgcolor="#FFFFFF"><span class="main_bright"><img src="images/bullet_error.gif" alt="" width="16" height="16" border="0" align="absmiddle" />&nbsp;</span>可填，企业介绍滚动图片</td>
    </tr>
    <tr>
      <td  align="center" valign="top" bgcolor="#FFFFFF"><img src="images/arrow_right.gif" alt="" width="16" height="16" border="0" align="absmiddle">&nbsp;广告图片2：</td>
      <td align="left" valign="middle" bgcolor="#FFFFFF"><input name="ad2" type="text" id="ad2"  size="30">
      <input type=button value="上传图片..." onClick="showUploadDialog('image', 'form1.ad2', '')" class="button"></td>
      <td align="left" valign="top" bgcolor="#FFFFFF"><span class="main_bright"><img src="images/bullet_error.gif" alt="" width="16" height="16" border="0" align="absmiddle" />&nbsp;</span>可填，企业介绍滚动图片</td>
    </tr>
    <tr>
      <td  align="center" valign="top" bgcolor="#FFFFFF"><img src="images/arrow_right.gif" alt="" width="16" height="16" border="0" align="absmiddle">&nbsp;广告图片3：</td>
      <td align="left" valign="middle" bgcolor="#FFFFFF"><input name="ad3" type="text" id="ad3"  size="30">
      <input type=button value="上传图片..." onClick="showUploadDialog('image', 'form1.ad3', '')" class="button"></td>
      <td align="left" valign="top" bgcolor="#FFFFFF"><span class="main_bright"><img src="images/bullet_error.gif" alt="" width="16" height="16" border="0" align="absmiddle" />&nbsp;</span>可填，企业介绍滚动图片</td>
    </tr>
    <tr>
      <td  align="center" valign="top" bgcolor="#FFFFFF"><img src="images/arrow_right.gif" alt="" width="16" height="16" border="0" align="absmiddle">&nbsp;广告图片4：</td>
      <td align="left" valign="middle" bgcolor="#FFFFFF"><input name="ad4" type="text" id="ad4"  size="30">
      <input type=button value="上传图片..." onClick="showUploadDialog('image', 'form1.ad4', '')" class="button"></td>
      <td align="left" valign="top" bgcolor="#FFFFFF"><span class="main_bright"><img src="images/bullet_error.gif" alt="" width="16" height="16" border="0" align="absmiddle" />&nbsp;</span>可填，企业介绍滚动图片</td>
    </tr>
    <tr>
      <td  align="center" valign="top" bgcolor="#FFFFFF"><p><img src="images/arrow_right.gif" width="16" height="16" border="0" align="absmiddle">&nbsp;企业介绍：</p>
        <p>&nbsp;</p></td>
      <td align="left" valign="middle" bgcolor="#FFFFFF"><textarea  name="qyjs" cols="60" rows="10" id="qyjs" style="width:98%"></textarea></td>
      <td align="left" valign="top" bgcolor="#FFFFFF"><p><span class="main_bright"><img src="images/bullet_error.gif" alt="" width="16" height="16" border="0" align="absmiddle" />&nbsp;</span><span class="STYLE3">企业介绍内容，可以支持HTML代码，如分段落：&lt;p&gt;内容...&lt;/p&gt;，换行：&lt;br&gt;，空格：　。为了界面美观请尽量不要采用HTML代码。</span></p></td>
    </tr>
    <tr>
      <td height="35" colspan="3" align="center" valign="middle" bgcolor="#3498db">
        <input class="button" type="submit" name="button" id="button" value="提交">
        &nbsp;&nbsp;
        <input class="button" type="reset" name="button2" id="button2" value="重置"></td>
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
