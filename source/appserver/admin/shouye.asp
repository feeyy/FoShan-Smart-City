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
    <td height="35" align="center" valign="middle" bgcolor="#3498db" class="fy2"><strong><img src="images/page.gif" width="16" height="16" border="0" align="absmiddle" />&nbsp;软件使用说明书</strong></td>
  </tr>
  <tr>
    <td bgcolor="#FFFFFF"><p><span class="STYLE3"><strong><u>软件介绍：</u></strong><br>
        &nbsp; &nbsp; &nbsp; </span>为了满足广大群众方便快捷的查询相关的办事说明、法律法规、办事流程、新闻资讯，以及企事业可以及时发布工作指引及宣传内容，于是我们自主研发了一套居于国内领先水平的通用性触摸查询系统。 <span class="STYLE3"> </span>软件分为 服务端（服务+后台管理）和客户端（前台触摸查询），可以根据需要进行单机/联网模式运行。默认配置是单机版模式，可以联网后台管理。</p>
      <p class="STYLE6"><span class="STYLE3"><strong><u>软件功能：</u></strong></span><strong><u><br>
        A前台触摸功能有：<br>
        </u></strong><span class="STYLE5"><u>1 文章信息查询，2 图片浏览查询，3 媒体播放查询，4 人员介绍查询，5 网站加载查询。</u></span><u><br>
        </u><strong><u>B前台设置功能有：<br>
        </u></strong><span class="STYLE5"><u>1 启动页面设置，2 超时返回设置， 3 退出密码设置，4 超时返回时间设置， 5 背景音乐，6 开机自动运行， 7 触摸虚拟键盘， 8 页面内容打印， 9 自动关机设置，10 网址访问黑白名单策略，11 软件皮肤设置，等等。</u></span><u><br>
        </u><strong><u>C后台管理功能如下：<br>
        </u></strong><u class="STYLE5">1 系统参数设置，2 系统模块设置，3 后台权限管理，4 客户查询统计，5 文章信息管理，6 图片浏览管理，7 媒体播放管理，8 人员介绍管理，9 网站加载管理，10 查询系统预览。</u></p>
      <p><span class="STYLE3"><strong><u>技术环境：</u></strong><br />
        </span>运行环境：1 操作系统：Win98 、Win2000、WinXP、Win2003 、Win7（推荐）、Win8 <br>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp;  2 浏览器：IE6.0 、IE8.0 、IE10（推荐）、IE11<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3 分辨率：1024*768（推荐） 、1366*768、1680*1050、1920*1080、1080*1920(竖屏)<br />
        开发环境：Win7+JQUERY+VB+JS+ASP+ACCESS+SQL+IE8.0+IE10<br />
        系统架构：B/S  即浏览器/服务器+C/S 即客户端/服务器</p>
      <p><span class="STYLE3"><strong><u>软件安装：</u></strong><br>
        </span>1、先运行 mtoucher.exe，如果首次安装运行下 绿色安装.bat；<br>
        2、成功启动查询程序后在屏幕左上角及右上角各点击一次，出现密码退出，输入默认密码：123456；<br>
        3、运行 mconfig.exe 进行软件注册及设置退出密码和超时时间等，再登录后台管理在参数设置里再注册下即可。注册码跟机器码在一台电脑里均一致，请在要安装的使用机器上再申请注册。<br>
        4、运行 mconfig.exe 设置程序，设置下无人操作时间、退出密码，勾下开机启动就可以了。其他跟进需要设置。</p>
      <p><strong><span class="STYLE3"><u>软件注册：</u></span></strong>软件实行永久免费运行模式，即便不注册也可以永久无限制功能的使用，但是为了保障软件的产权和开发者的权益没有注册的用户会在客户端查询程序出现未注册提示！软件分开服务端和客户端进行注册，因为两个为不同的程序，服务端为主系统，客户端为拥有触摸查询和网站浏览器的双核引擎程序。 </p>
      <p>&nbsp;</p></td>
  </tr>
  <tr>
    <td height="30" bgcolor="#3498db">&nbsp;</td>
  </tr>
</table>
</body>
</html>
