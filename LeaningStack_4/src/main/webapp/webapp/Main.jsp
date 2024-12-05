<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>커뮤니티 메인 페이지</title>
    <style>
        /* 기본 스타일 초기화 */
        body, h1, h2, p, ul, li, a {
            margin: 0;
            padding: 0;
            text-decoration: none;
            list-style: none;
            color: #333;
        }

        /* body 기본 스타일 */
        body {
            font-family: 'Arial', sans-serif;
            line-height: 1.6;
            background-color: #f0f2f5;
        }

        /* header 스타일 */
        header {
            background-color: #9DC0DB;
            padding: 10px 20px;
            color: #fff;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        /* 로고 영역 */
        .logo {
            font-size: 1.8em;
            font-weight: bold;
            margin-right: 30px;
        }

        /* 카테고리 영역 */
        nav {
            display: flex;
        }

        nav ul {
            display: flex;
        }

        nav ul li {
            margin: 0 15px;
        }

        nav ul li a {
            color: #fff;
            font-weight: bold;
            transition: color 0.3s;
        }

        nav ul li a:hover {
            color: #f0f2f5;
        }

        /* 로그인/회원가입 버튼 */
        .auth-buttons {
            display: flex;
            margin-left: auto;
        }

        .auth-buttons a {
            color: #fff;
            font-weight: bold;
            margin-left: 15px;
            border: 1px solid #fff;
            padding: 8px 15px;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .auth-buttons a:hover {
            background-color: #0056b3;
        }

        /* main 스타일 */
        main {
            text-align: center;
            padding: 50px 20px;
        }

        main h2 {
            font-size: 2em;
            color: #333;
        }

        main p {
            font-size: 1.2em;
            color: #666;
            margin-top: 20px;
        }

        /* footer 스타일 */
        footer {
            background-color: #9DC0DB;
            color: #fff;
            text-align: center;
            padding: 10px 0;
            position: absolute;
            bottom: 0;
            width: 100%;
        }

        /* 버튼 스타일 */
        button {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
 <header>
    <div class="logo">
        <img src="images/logo.png" alt="Logo" style="height: 50px;">
    </div>
    <nav>
        <ul>
            <li><a href="Community.jsp">커뮤니티</a></li>
            <li><a href="freeboard.jsp">자유게시판</a></li>
            <li><a href="Q&A.jsp">질문게시판</a></li>
            <li><a href="Photo.jsp">갤러리</a></li>        
            <li><a href="About.jsp">팀원소개</a></li>       
            <li><a href="SiteMap.jsp">사이트맵</a></li>   
        </ul>
    </nav>
    <div class="auth-buttons">
        <a href="Login.jsp">로그인</a>
        <a href="signup.jsp">회원가입</a>
    </div>
</header>

    
    <main>
        <h2>환영합니다!</h2>
        <p>학생들을 위한 커뮤니티에 오신걸 환영합니다.</p>
    </main>

    <footer>
        <p>&copy; 2024 유원대학교 AI소프트웨어학과</p>
    </footer>
</body>
</html>
