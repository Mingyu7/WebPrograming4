<%@ page language="java" 
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style type="text/css">
<!--
    a:link {font-family: ""; color: black; text-decoration: none;}
    a:visited {font-family: ""; color: black; text-decoration: none;}
    a:hover {font-family: ""; color: black; text-decoration: underline;}
-->
</style>
</html>

<BODY>
	<center><font size=3><b>회원 전용 페이지</b></font>
	<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
	<TR>
		<TD><hr size=1 noshade="noshade"> </TD>
	</TR>
	</TABLE>
<TABLE cellSpacing='0' cellPadding='30' align='center' border='0'>
<%
    try {
        String strUser = "yes";
        String strSession = session.getAttribute("user").toString();
        if (strUser.equals(strSession)) {
%>
            <TR>
                <TD align='center'>
                    <font size='2' color="red">로그인 성공.</font>
                </TD>
            </TR>
            <TR>
                <TD align='center'>
                    <a href='member.jsp'>로그인</a>
                </TD>
            </TR>
<%
        } else {
%>
            <TR>
                <TD align='center'>
                    <font size='2'>2회원 전용 페이지</font>
                </TD>
            </TR>
            <TR>
                <TD align='center'>
                    <font size='2'>이 페이지는 회원에게만 제공되는 페이지입니다.</font>
                </TD>
            </TR>
<%
        }
    } catch (NullPointerException e) {
%>
        <TR>
            <TD align='center'>
                <font size='2'>로그인 하세요.</font>
            </TD>
        </TR>
        <TR>
            <TD align='center'>
                <a href='member.jsp'>로그인</a>
            </TD>
        </TR>
<%
    }
%>
</TABLE>
</BODY>
</HTML>

