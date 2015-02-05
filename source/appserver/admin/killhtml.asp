<%
'功能:使用正则表示式对字符串进行替换
'清HTML代码 作者：陈劲全 QQ：820094076
'2010-10-30

Function RegReplace(Str, PatternStr, RepStr)
    Dim NewStr, regEx
    NewStr = Str
    If IsNull(NewStr) Then
        RegReplace = ""
        Exit Function
    End If
    Set regEx = New RegExp
    regEx.IgnoreCase = True
    regEx.Global = True
    regEx.Pattern = PatternStr
    NewStr = regEx.Replace(NewStr, RepStr)
    RegReplace = NewStr
End Function
%>


<%
'过滤HTML各种标签样式脚本


Function HTMLFilter(sHTML, sFilters)
    If sHTML & "" = "" Then Exit Function
    If sFilters & "" = "" Then sFilters = "SCRIPT,OBJECT"
    Dim aFilters
     aFilters = Split(UCase(sFilters), ",")
    For i = 0 To UBound(aFilters)
        Select Case UCase(Trim(aFilters(i)))
            Case "JORKIN"
                Do While InStr(sHTML, "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;") >0
                    sHTML = Replace(sHTML, "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;", "&nbsp;&nbsp;&nbsp;&nbsp;")
                Loop
            Case "SCRIPT"
                '// 去除脚本<scr ipt></scr ipt>及 onload 等
                sHTML = RegReplace(sHTML, "<SCRIPT[\s\S]*?</SCRIPT>", "")
                sHTML = RegReplace(sHTML, "\s[on].+?=\s+?([\""|\'])(.*?)\1", "")
                sHTML = RegReplace(sHTML, "(JAVASCRIPT|JSCRIPT|VBSCRIPT|VBS):", "$1：")
            Case "FIXIMG"
                sHTML = RegReplace(sHTML, "<IMG.*?\sSRC=([^\""\'\s][^\""\'\s>]*).*?>", "<img src=$2 border=0>")
                sHTML = RegReplace(sHTML, "<IMG.*SRC=([\""\']?)(.\1\S+).*?>", "<img src=$2 border=0>")
            Case "TABLE"
                '// 去除表格<table><tr><td><th>
                sHTML = RegReplace(sHTML, "</?TABLE[^>]*>", "")
                sHTML = RegReplace(sHTML, "</?TBODY[^>]*>", "")
                sHTML = RegReplace(sHTML, "<(/?)TR[^>]*>", "<$1p>")
                sHTML = RegReplace(sHTML, "</?TH[^>]*>", " ")
                sHTML = RegReplace(sHTML, "</?TD[^>]*>", " ")
            Case "CLASS"
                '// 去除样式类class=""
                sHTML = RegReplace(sHTML, "(<[^>]+) CLASS=[^ |^>]+([^>]*>)", "$1 $2")
                sHTML = RegReplace(sHTML, "\sCLASS\s*?=\s*?([\""|\'])(.*?)\1", "")
            Case "STYLE"
                '// 去除样式style=""
                sHTML = RegReplace(sHTML, "(<[^>]+) STYLE=[^ |^>]+([^>]*>)", "$1 $2")
                sHTML = RegReplace(sHTML, "\sSTYLE\s*?=\s*?([\""|\'])(.*?)\1", "")
            Case "XML"
                '// 去除XML<?xml>
                sHTML = RegReplace(sHTML, "<\\?XML[^>]*>", "")
		    Case "SPAN"
                '// 去除<SPAN></SPAN>
                sHTML = RegReplace(sHTML, "</?SPAN[^>]*>", "")
            Case "NAMESPACE"
                '// 去除命名空间<o:p></o:p>
                sHTML = RegReplace(sHTML, "<\/?[a-z]+:[^>]*>", "")
            Case "FONT"
                '// 去除字体<font></font>
                sHTML = RegReplace(sHTML, "</?FONT[^>]*>", "")
			Case "DIV"
                '// 去除字体<div></div>
                sHTML = RegReplace(sHTML, "</?DIV[^>]*>", "")
            Case "MARQUEE"
                '// 去除字幕<marquee></marquee>
                sHTML = RegReplace(sHTML, "</?MARQUEE[^>]*>", "")
            Case "OBJECT"
                '// 去除对象<object><param><embed></object>
                sHTML = RegReplace(sHTML, "</?OBJECT[^>]*>", "")
                sHTML = RegReplace(sHTML, "</?PARAM[^>]*>", "")
                sHTML = RegReplace(sHTML, "</?EMBED[^>]*>", "")
            Case "COMMENT"
                '// 去除HTML注释, 会处理<script>和<style>内注释, 慎用
                sHTML = RegReplace(sHTML, "<!--[\s\S]*?-->", "")
            Case Else
                '// 去除其它标签
                sHTML = RegReplace(sHTML, "</?" & aFilters(i) & "[^>]*?>", "<br>")
        End Select
    Next
    HTMLFilter = sHTML
End Function
%>

