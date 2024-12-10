<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판 글쓰기</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            color: #333;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 70%;
            margin: 50px auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: #4CAF50;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        td {
            padding: 10px;
            text-align: left;
        }
        td.bg-gray {
            background-color: #f2f2f2;
            width: 200px;
            font-weight: bold;
        }
        input[type="text"], input[type="password"], textarea {
            width: 100%;
            padding: 10px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
            background-color: #f9f9f9;
        }
        input[type="submit"], input[type="reset"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 10px;
        }
        input[type="submit"]:hover, input[type="reset"]:hover {
            background-color: #45a049;
        }
        textarea {
            resize: vertical;
        }
        hr {
            border: 0;
            height: 1px;
            background-color: #ddd;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group p {
            font-size: 14px;
            color: #888;
        }
        .center {
            text-align: center;
        }
    </style>
    <script type="text/javascript">
        function Check() {
            if (Write.name.value.length < 1) {
                alert("작성자를 입력하세요");
                Write.name.focus();
                return false;
            }
            if (Write.pass.value.length < 1) {
                alert("비밀번호를 입력하세요");
                Write.pass.focus();
                return false;
            }
            if (Write.email.value.indexOf("@") + "" == "-1"
                    || Write.email.value.indexOf(".") + "" == "-1"
                    || Write.email.value == "") {
                alert("이메일을 입력하세요");
                Write.email.focus();
                return false;
            }
            if (Write.title.value.length < 1) {
                alert("글제목을 입력하세요");
                Write.title.focus();
                return false;
            }
            if (Write.contents.value.length < 1) {
                alert("글내용을 입력하세요");
                Write.contents.focus();
                return false;
            }
        }
    </script>
</head>

<body>

    <div class="container">
        <h1>게시판 수정</h1>
        <form name="Write" action="write_update.jsp" method="post" onsubmit="return Check()">
            <table>
                <tr>
                    <td class="bg-gray">작성자</td>
                    <td>
                        <input type="text" size="12" name="name"> * 수정할 작성자 입력
                    </td>
                </tr>

                <tr>
                    <td class="bg-gray">비밀번호</td>
                    <td>
                        <input type="password" name="pass"> * 수정할 비밀번호 입력
                    </td>
                </tr>

                <tr>
                    <td class="bg-gray">E-mail</td>
                    <td>
                        <input type="text" size="40" maxlength="50" name="email">
                    </td>
                </tr>

                <tr>
                    <td colspan="2"><hr></td>
                </tr>

                <tr>
                    <td class="bg-gray">글제목</td>
                    <td>
                        <input type="text" size="70" maxlength="50" name="title">
                    </td>
                </tr>

                <tr>
                    <td class="bg-gray">글 내용</td> * 수정 내용 입력
                    <td>
                        <textarea cols="70" rows="15" name="contents"></textarea>
                    </td>
                </tr>

                <tr>
                    <td colspan="2"><hr></td>
                </tr>

                <tr>
                    <td class="center" colspan="2">
                        <input type="reset" value="다시작성">
                        <input type="submit" value="등록">
                    </td>
                </tr>
            </table>
        </form>
    </div>

</body>
</html>
