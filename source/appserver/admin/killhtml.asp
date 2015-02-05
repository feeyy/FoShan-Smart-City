<%
'����:ʹ�������ʾʽ���ַ��������滻
'��HTML���� ���ߣ��¾�ȫ QQ��820094076
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
'����HTML���ֱ�ǩ��ʽ�ű�


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
                '// ȥ���ű�<scr ipt></scr ipt>�� onload ��
                sHTML = RegReplace(sHTML, "<SCRIPT[\s\S]*?</SCRIPT>", "")
                sHTML = RegReplace(sHTML, "\s[on].+?=\s+?([\""|\'])(.*?)\1", "")
                sHTML = RegReplace(sHTML, "(JAVASCRIPT|JSCRIPT|VBSCRIPT|VBS):", "$1��")
            Case "FIXIMG"
                sHTML = RegReplace(sHTML, "<IMG.*?\sSRC=([^\""\'\s][^\""\'\s>]*).*?>", "<img src=$2 border=0>")
                sHTML = RegReplace(sHTML, "<IMG.*SRC=([\""\']?)(.\1\S+).*?>", "<img src=$2 border=0>")
            Case "TABLE"
                '// ȥ�����<table><tr><td><th>
                sHTML = RegReplace(sHTML, "</?TABLE[^>]*>", "")
                sHTML = RegReplace(sHTML, "</?TBODY[^>]*>", "")
                sHTML = RegReplace(sHTML, "<(/?)TR[^>]*>", "<$1p>")
                sHTML = RegReplace(sHTML, "</?TH[^>]*>", " ")
                sHTML = RegReplace(sHTML, "</?TD[^>]*>", " ")
            Case "CLASS"
                '// ȥ����ʽ��class=""
                sHTML = RegReplace(sHTML, "(<[^>]+) CLASS=[^ |^>]+([^>]*>)", "$1 $2")
                sHTML = RegReplace(sHTML, "\sCLASS\s*?=\s*?([\""|\'])(.*?)\1", "")
            Case "STYLE"
                '// ȥ����ʽstyle=""
                sHTML = RegReplace(sHTML, "(<[^>]+) STYLE=[^ |^>]+([^>]*>)", "$1 $2")
                sHTML = RegReplace(sHTML, "\sSTYLE\s*?=\s*?([\""|\'])(.*?)\1", "")
            Case "XML"
                '// ȥ��XML<?xml>
                sHTML = RegReplace(sHTML, "<\\?XML[^>]*>", "")
		    Case "SPAN"
                '// ȥ��<SPAN></SPAN>
                sHTML = RegReplace(sHTML, "</?SPAN[^>]*>", "")
            Case "NAMESPACE"
                '// ȥ�������ռ�<o:p></o:p>
                sHTML = RegReplace(sHTML, "<\/?[a-z]+:[^>]*>", "")
            Case "FONT"
                '// ȥ������<font></font>
                sHTML = RegReplace(sHTML, "</?FONT[^>]*>", "")
			Case "DIV"
                '// ȥ������<div></div>
                sHTML = RegReplace(sHTML, "</?DIV[^>]*>", "")
            Case "MARQUEE"
                '// ȥ����Ļ<marquee></marquee>
                sHTML = RegReplace(sHTML, "</?MARQUEE[^>]*>", "")
            Case "OBJECT"
                '// ȥ������<object><param><embed></object>
                sHTML = RegReplace(sHTML, "</?OBJECT[^>]*>", "")
                sHTML = RegReplace(sHTML, "</?PARAM[^>]*>", "")
                sHTML = RegReplace(sHTML, "</?EMBED[^>]*>", "")
            Case "COMMENT"
                '// ȥ��HTMLע��, �ᴦ��<script>��<style>��ע��, ����
                sHTML = RegReplace(sHTML, "<!--[\s\S]*?-->", "")
            Case Else
                '// ȥ��������ǩ
                sHTML = RegReplace(sHTML, "</?" & aFilters(i) & "[^>]*?>", "<br>")
        End Select
    Next
    HTMLFilter = sHTML
End Function
%>

