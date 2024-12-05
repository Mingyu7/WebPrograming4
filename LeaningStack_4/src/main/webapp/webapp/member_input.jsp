<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<HTML>
<HEAD>
<TITLE>회원 등록</TITLE>
<style type='text/css'>
<!--
a:link {font-family:"";color:black;text-decoration:none;}
a:visited {font-family:"";color:black;text-decoration:none;}
a:hover {font-family:"";color:black;text-decoration:underline;}
-->
</style>
<SCRIPT language="JavaScript">
function Check() {
    if (Member_Input.id.value.length < 1) {
        alert("아이디를 입력하세요.");
        Member_Input.id.focus();
        return false;
    }
    if (Member_Input.pass.value.length < 1) {
        alert("비밀번호를 입력하세요.");
        Member_Input.pass.focus();
        return false;
    }
    if (Member_Input.name.value.length < 1) {
        alert("이름을 입력하세요.");
        Member_Input.name.focus();
        return false;
    }
    Member_Input.submit();
}

function Check_id() {
    browsing_window = window.open("checkid.jsp?id=" + Member_Input.id.value, "_idcheck", 
    		"height=200, width=300, menubar=no, directories=no, resizable=no, status=no, scrollbars=yes");
    browsing_window.focus();
}
</SCRIPT>
</HEAD>
<BODY>
<center><font size='3'><b>회원 가입</b></font>
<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
    <TR>
        <TD><hr size='1' noshade /></TD>
    </TR>
</TABLE>

<FORM Name='Member_Input' Method='post' Action='member_output.jsp'>
    <TABLE border='2' cellSpacing='0' cellPadding=5 align=center>
    
        <TR>
            <TD bgcolor='cccccc' align='center'><font size='2'>아이디</font></TD>
            <TD bgcolor='cccccc'>
                <input type='text' maxLength='10' size='10' name='id'>
                <input type='button' OnClick='Check_id()' value='ID 중복검사'>
            </TD>
        </TR>
        
        <TR>
            <TD bgcolor='cccccc' align='center'><font size='2'>비밀번호</font></TD>
            <TD bgcolor='cccccc'>
                <input type='password' maxLength='10' size='10' name='pass'>
            </TD>
        </TR>
        
        <TR>
            <TD bgcolor='cccccc' align='center'><font size='2'>이름</font></TD>
            <TD bgcolor='cccccc'>
                <input type='text' maxLength='10' size='10' name='name'>
            </TD>
        </TR>
        
    </TABLE>
    <TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
        <TR>
            <TD><hr size='1' noshade /></TD>
        </TR>
    </TABLE>
    
    <TABLE>
        <TR>
            <TD colspan='2' align='center'>
             	<input type='button' OnClick='Check()' value='회원가입'>
            </TD>
        </TR>
    </TABLE>
</FORM>
</BODY>
</HTML>
