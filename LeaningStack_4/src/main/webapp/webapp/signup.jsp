<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 등록</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #333; /* 어두운 배경색 */
            color: #fff; /* 흰색 글자 */
            margin: 0;
            padding: 0;
        }
        .container {
            width: 40%;
            margin: 80px auto;
            background-color: #444; /* 컨테이너 배경색 */
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.5);
        }
        h1 {
            text-align: center;
            margin-bottom: 30px;
            color: #fff;
        }
        .form-table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        .form-table td {
            padding: 15px;
            border: none;
        }
        .form-table td:first-child {
            width: 30%;
            text-align: right;
            font-weight: bold;
            color: #ddd; /* 회색 텍스트 */
        }
        .form-table input[type="text"],
        .form-table input[type="password"],
        .form-table button {
            width: calc(100% - 20px);
            max-width: 300px;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #666;
            font-size: 14px;
            background-color: #555;
            color: #fff;
        }
        .form-table input[type="text"]:focus,
        .form-table input[type="password"]:focus {
            border-color: #5bc0de;
        }
        .form-table button {
            background-color: #5bc0de;
            border: none;
            cursor: pointer;
        }
        .form-table button:hover {
            background-color: #31b0d5;
        }
        .btn-check {
            margin-left: 10px;
            padding: 10px 15px;
            background-color: #5bc0de;
            border: none;
            color: #fff;
            border-radius: 5px;
            cursor: pointer;
        }
        .btn-check:hover {
            background-color: #31b0d5;
        }
    </style>
    <script>
        function Check() {
            const form = document.forms["Member_Input"];
            if (form.id.value.trim() === "") {
                alert("아이디를 입력하세요.");
                form.id.focus();
                return false;
            }
            if (form.pass.value.trim() === "") {
                alert("비밀번호를 입력하세요.");
                form.pass.focus();
                return false;
            }
            if (form.name.value.trim() === "") {
                alert("이름을 입력하세요.");
                form.name.focus();
                return false;
            }
            form.submit();
        }

        function Check_id() {
            window.open(
                "checkid.jsp?id=" + document.forms["Member_Input"].id.value,
                "_idcheck",
                "height=200, width=300, menubar=no, directories=no, resizable=no, status=no, scrollbars=yes"
            ).focus();
        }
    </script>
</head>
<body>
    <div class="container">
        <h1>회원 가입</h1>
        <form name="Member_Input" method="post" action="member_output.jsp">
            <table class="form-table">
                <tr>
                    <td>아이디</td>
                    <td>
                        <input type="text" name="id" maxlength="10">                       
                    </td>
                        <td>
                              <button type="button" class="btn-check" onclick="Check_id()">ID 중복검사</button>         
                   		</td>
                    
                </tr>
                <tr>
                    <td>비밀번호</td>
                    <td><input type="password" name="pass" maxlength="10"></td>
                </tr>
                <tr>
                    <td>이름</td>
                    <td><input type="text" name="name" maxlength="10"></td>
                </tr>
            </table>
            <div style="text-align: center;">
                <button type="button" onclick="Check()">회원가입</button>
            </div>
        </form>
    </div>
</body>
</html>
