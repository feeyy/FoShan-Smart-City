<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<%
  if session("username")=""  or session("dj") =""  then
  response.redirect "login.asp"
  end if 
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title></title>
<link href="right.css" rel="stylesheet" type="text/css" />
</head>

<body>
<table width="98%" border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#ecf0f1" style="line-height:25px;">
  <tr>
    <td height="35" align="center" valign="middle" bgcolor="#3498db" class="fy2"><strong><img src="images/page.gif" width="16" height="16" border="0" align="absmiddle" />&nbsp;���ʹ��˵����</strong></td>
  </tr>
  <tr>
    <td bgcolor="#FFFFFF"><p><span class="STYLE3"><strong><u>������ܣ�</u></strong><br>
        &nbsp; &nbsp; &nbsp; </span>Ϊ��������Ⱥ�ڷ����ݵĲ�ѯ��صİ���˵�������ɷ��桢�������̡�������Ѷ���Լ�����ҵ���Լ�ʱ��������ָ�����������ݣ��������������з���һ�׾��ڹ�������ˮƽ��ͨ���Դ�����ѯϵͳ�� <span class="STYLE3"> </span>�����Ϊ ����ˣ�����+��̨�����Ϳͻ��ˣ�ǰ̨������ѯ�������Ը�����Ҫ���е���/����ģʽ���С�Ĭ�������ǵ�����ģʽ������������̨����</p>
      <p class="STYLE6"><span class="STYLE3"><strong><u>������ܣ�</u></strong></span><strong><u><br>
        Aǰ̨���������У�<br>
        </u></strong><span class="STYLE5"><u>1 ������Ϣ��ѯ��2 ͼƬ�����ѯ��3 ý�岥�Ų�ѯ��4 ��Ա���ܲ�ѯ��5 ��վ���ز�ѯ��</u></span><u><br>
        </u><strong><u>Bǰ̨���ù����У�<br>
        </u></strong><span class="STYLE5"><u>1 ����ҳ�����ã�2 ��ʱ�������ã� 3 �˳��������ã�4 ��ʱ����ʱ�����ã� 5 �������֣�6 �����Զ����У� 7 ����������̣� 8 ҳ�����ݴ�ӡ�� 9 �Զ��ػ����ã�10 ��ַ���ʺڰ��������ԣ�11 ���Ƥ�����ã��ȵȡ�</u></span><u><br>
        </u><strong><u>C��̨���������£�<br>
        </u></strong><u class="STYLE5">1 ϵͳ�������ã�2 ϵͳģ�����ã�3 ��̨Ȩ�޹���4 �ͻ���ѯͳ�ƣ�5 ������Ϣ����6 ͼƬ�������7 ý�岥�Ź���8 ��Ա���ܹ���9 ��վ���ع���10 ��ѯϵͳԤ����</u></p>
      <p><span class="STYLE3"><strong><u>����������</u></strong><br />
        </span>���л�����1 ����ϵͳ��Win98 ��Win2000��WinXP��Win2003 ��Win7���Ƽ�����Win8 <br>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp;  2 �������IE6.0 ��IE8.0 ��IE10���Ƽ�����IE11<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3 �ֱ��ʣ�1024*768���Ƽ��� ��1366*768��1680*1050��1920*1080��1080*1920(����)<br />
        ����������Win7+JQUERY+VB+JS+ASP+ACCESS+SQL+IE8.0+IE10<br />
        ϵͳ�ܹ���B/S  �������/������+C/S ���ͻ���/������</p>
      <p><span class="STYLE3"><strong><u>�����װ��</u></strong><br>
        </span>1�������� mtoucher.exe������״ΰ�װ������ ��ɫ��װ.bat��<br>
        2���ɹ�������ѯ���������Ļ���ϽǼ����ϽǸ����һ�Σ����������˳�������Ĭ�����룺123456��<br>
        3������ mconfig.exe �������ע�ἰ�����˳�����ͳ�ʱʱ��ȣ��ٵ�¼��̨�����ڲ�����������ע���¼��ɡ�ע�������������һ̨�������һ�£�����Ҫ��װ��ʹ�û�����������ע�ᡣ<br>
        4������ mconfig.exe ���ó������������˲���ʱ�䡢�˳����룬���¿��������Ϳ����ˡ�����������Ҫ���á�</p>
      <p><strong><span class="STYLE3"><u>���ע�᣺</u></span></strong>���ʵ�������������ģʽ�����㲻ע��Ҳ�������������ƹ��ܵ�ʹ�ã�����Ϊ�˱�������Ĳ�Ȩ�Ϳ����ߵ�Ȩ��û��ע����û����ڿͻ��˲�ѯ�������δע����ʾ������ֿ�����˺Ϳͻ��˽���ע�ᣬ��Ϊ����Ϊ��ͬ�ĳ��򣬷����Ϊ��ϵͳ���ͻ���Ϊӵ�д�����ѯ����վ�������˫��������� </p>
      <p>&nbsp;</p></td>
  </tr>
  <tr>
    <td height="30" bgcolor="#3498db">&nbsp;</td>
  </tr>
</table>
</body>
</html>
