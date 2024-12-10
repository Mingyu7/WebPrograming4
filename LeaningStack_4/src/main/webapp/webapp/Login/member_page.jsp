<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>회원 전용 페이지</title>
    <style type="text/css">
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            color: #333;
            text-align: center;
            padding: 50px;
        }
        .container {
            margin: 0 auto;
            padding: 20px;
            max-width: 400px;
            background-color: #ffffff;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
        a {
            color: #007bff;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
<%
    // 세션에서 사용자 아이디 읽기
    String userId = (String) session.getAttribute("user");

    if (userId != null) {
%>
        <h1>환영합니다, <%= userId %> 님!</h1>
        <p>회원 전용 페이지에 오신 것을 환영합니다.</p>
        <a href="logout.jsp">로그아웃</a>
<%
    } else {
        // 로그인하지 않은 경우
%>
        <h1>로그인이 필요합니다.</h1>
        <a href="member.jsp">로그인 페이지로 이동</a>
<%
    }
%>
    </div>
</body>
</html>
