<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="../Connections/conn.asp" -->
<%
  if session("username")="" or session("dj") ="" then
  response.redirect "login.asp"
  end if 
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta name="description" content="powered by chenjinquan(QQ:820094076)">
<title>��ý�崥����ѯ��̨����ϵͳ</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script>
var status = 1;
function switchSysBar(){
     if (1 == window.status){
		  window.status = 0;
          switchPoint.innerHTML = '<img src="images/left.gif">';
          document.all("frmTitle").style.display="none"
     }
     else{
		  window.status = 1;
          switchPoint.innerHTML = '<img src="images/right.gif">';
          document.all("frmTitle").style.display=""
     }
}
</script>
<script language="javascript">
function tick() {
var hours, minutes, seconds, xfile;
var intHours, intMinutes, intSeconds;
var today, theday;
today = new Date();
function initArray(){
this.length=initArray.arguments.length
for(var i=0;i<this.length;i++)
this[i+1]=initArray.arguments[i] }
var d=new initArray(
"������",
"����һ",
"���ڶ�",
"������",
"������",
"������",
"������");
theday = today.getYear()+"��" + [today.getMonth()+1]+"��" +today.getDate() +" "+ d[today.getDay()+1];
intHours = today.getHours();
intMinutes = today.getMinutes();
intSeconds = today.getSeconds();
if (intHours == 0) {
hours = "12:";
xfile = "��ҹ";
} else if (intHours < 12) {
hours = intHours+":";
xfile = "����";
} else if (intHours == 12) {
hours = "12:";
xfile = "����";
} else {
intHours = intHours - 12
hours = intHours + ":";
xfile = "����";
}
if (intMinutes < 10) {
minutes = "0"+intMinutes+":";
} else {
minutes = intMinutes+":";
}
if (intSeconds < 10) {
seconds = "0"+intSeconds+" ";
} else {
seconds = intSeconds+" ";
}
timeString = theday+" "+xfile+" "+hours+minutes+seconds;
Clock.innerHTML = timeString;
window.setTimeout("tick();", 100);
}
window.onload = tick;
</script>
</head>

<body  scroll="no">
<table style="width:100%; height:100%;" border="0" align="left" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="3" align="left" valign="middle" style="width:100%; height:50px; background:url(images/bg2.gif); overflow:hidden;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="23%" align="center" valign="middle" ><img onClick="switchSysBar()" src="images/logo.gif" align="absmiddle" title="�ر�/������"></td>
          <td width="53%" align="left" valign="middle"><span style="color:#FFFFFF; font-size:12px;">���ã�<b> <%=session("username")%> </b>��
            <%if session("dj")=0 then%>
            <img src="images/2.gif" width="14" height="15" border="0" align="absmiddle">&nbsp;һ�����Ա
            <%end if%>
            <%if session("dj")=1 then%>
            <img src="images/1.gif" width="14" height="15" border="0" align="absmiddle">&nbsp;��������Ա
            <%end if%>
            ������ӭ�����̨����ϵͳ!</span></td>
          <td width="24%" align="center" valign="middle"><div id="Clock"></div></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td style="width:180px; height:100%; background:url(images/left_bg.gif); overflow:hidden;" align="left" valign="top" id="frmTitle"  name="fmTitle"><table  border="0" cellpadding="0" cellspacing="0" style="width:180px; height:100%;">
        <tr>
          <td height="90%"  valign="top" style="text-align:left; padding:2px;"><div id="mu">
              <div class="m2" onMouseOver="this.className='m22'" onMouseOut="this.className='m2'"><a href="shouye.asp" target="frmright">&raquo;��̨������ҳ</a></div>
               <div class="m3" onMouseOver="this.className='m33'" onMouseOut="this.className='m3'"><a href="config.asp" target="frmright">&raquo;ϵͳ��������</a></div>
              <div class="m3" onMouseOver="this.className='m33'" onMouseOut="this.className='m3'"><a href="lc.asp" target="frmright">&raquo;¥��¥�����</a></div>
              <div class="m4" onMouseOver="this.className='m44'" onMouseOut="this.className='m4'"><a href="qy.asp" target="frmright">&raquo;��פ��ҵ����</a></div>
              <div class="m3" onMouseOver="this.className='m33'" onMouseOut="this.className='m3'"><a href="superman.asp" target="frmright">&raquo;��̨Ȩ���޸�</a></div>
              <div class="m5" onMouseOver="this.className='m55'" onMouseOut="this.className='m5'">&raquo;<a href="logout.asp">�˳���̨����</a></div>
            </div></td>
        </tr>
        <tr>
          <td height="10%" align="left" valign="middle">��&raquo;����֧�֣�Feeyy<br>
            ��&raquo;��ƿ�����Feeyy<br>
            ��&raquo;�ں˰汾��V2011</td>
        </tr>
      </table></td>
    <td style="width:10px; height:100%; background:#337ABB; cursor:pointer;"><table border=0 cellpadding=0 cellspacing=0 height="100%">
        <tr>
          <td onClick="switchSysBar()" style="HEIGHT: 100%;"><span  id="switchPoint" title="�ر�/������"><img src="images/right.gif"></span></td>
        </tr>
      </table></td>
    <td align="left" valign="top"  style="width:100%; height:100%;" ><iframe  width="100%" height="100%" frameborder="0" id="frmright" name="frmright" scrolling="yes"  src="shouye.asp" ></iframe></td>
  </tr>
  <tr>
    <td colspan="3" align="left" valign="middle" style="width:100%; height:30px; background:url(images/bg2.gif) left bottom; border-top:#3366CC solid 1px; ">Copyright &copy; 2011-2015 ��ý�崥����ѯ��̨����ϵͳ Powered By Feeyy</td>
  </tr>
</table>
</body>
</html>
