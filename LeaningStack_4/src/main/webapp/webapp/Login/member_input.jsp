<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<HTML>
<HEAD>
<TITLE>회원 등록</TITLE>
 <style type="text/css">
        body {
            font-family: Arial, sans-serif;
            background-color: #333;  /* 어두운 배경 색 */
            color: #fff;  /* 글자색을 흰색으로 설정 */
            margin: 0;
            padding: 20px;
        }
        .container {
            width: 300px;
            background-color: #444;  /* 컨테이너 배경 색 */
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.5);
            margin: 0 auto;  /* 가운데 정렬 */
            transition: all 0.3s ease;  /* 호버 효과를 부드럽게 */
        }
        .container:hover {
            transform: scale(1.02);  /* 호버 시 약간 커지는 효과 */
        }
        .form-group {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #cccccc;
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 10px;
            transition: background-color 0.3s;  /* 배경색 변화 */
        }
        .form-group:hover {
            background-color: #bbb;  /* 호버 시 색상 변화 */
        }
        input[type="text"], input[type="password"] {
            width: 100%;
            max-width: 150px;  /* 입력창 너비 제한 */
            padding: 8px;
            border-radius: 5px;
            border: 1px solid #666;  /* 어두운 경계선 색상 */
            background-color: #555;  /* 어두운 배경 색 */
            color: #fff;  /* 입력 글자 색상 */
            font-size: 14px;  /* 글자 크기 */
            transition: border-color 0.3s;  /* 테두리 색상 변화 */
        }
        input[type="text"]:focus, input[type="password"]:focus {
            border-color: #5bc0de;  /* 포커스 시 테두리 색상 */
            outline: none;  /* 기본 아우트라인 제거 */
        }
        input[type="button"] {
            padding: 10px 15px;
            background-color: #5bc0de;  /* 버튼 배경 색 */
            border: none;
            color: #fff;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;  /* 버튼 글자 크기 */
            transition: background-color 0.3s;  /* 배경 색상 변화 */
        }
        input[type="button"]:hover {
            background-color: #31b0d5;  /* 호버 시 버튼 색상 */
        }
        a {
            color: #5bc0de;  /* 링크 색상 */
            text-decoration: none;
            transition: color 0.3s;  /* 링크 색상 변화 */
        }
        a:hover {
            text-decoration: underline;  /* 호버 시 밑줄 추가 */
            color: #31b0d5;  /* 호버 시 색상 변경 */
        }
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
            <TD bgcolor='cccccc' width="300px">
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
