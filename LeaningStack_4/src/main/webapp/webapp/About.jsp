<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>개발자 소개</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
        }
        header {
            background-color: #9dc0db;
            color: white;
            text-align: center;
            padding: 1rem 0;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 1rem;
        }
        header img {
            height: 70px;
            width: auto;
        }
        .container {
            display: flex;
            justify-content: center;
            gap: 2rem;
            padding: 2rem;
        }
        .developer-card {
            background: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 300px;
            height: 400px;
            text-align: center;
            padding: 1.5rem;
            opacity: 1;
            transform: translateY(0);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .developer-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }
        .developer-card img {
            border-radius: 50%;
            width: 100px;
            height: 100px;
            object-fit: cover;
            margin-bottom: 1rem;
        }
        .developer-card h3 {
            margin: 0.5rem 0;
            font-size: 1.25rem;
        }
        .developer-card p {
            color: #666;
            font-size: 0.9rem;
        }
        footer {
            text-align: center;
            margin-top: 2rem;
            padding: 1rem;
            background: #9dc0db;
            color: white;
        }
    </style>
</head>
<body>
    <header>
        <img src="images/logo.png" alt="LearnStack 로고">
        <h1>개발자 소개</h1>
    </header>
    <div class="container">
        <div class="developer-card">
            <img src="#" alt="Developer 1">
            <h3>이민규</h3>
            <p>팀장</p>
            <p>"게시판 보기, 게시글 추가,수정,삭제 기능 제작"</p>
        </div>
        <div class="developer-card">
            <img src="images.hc.png" alt="Developer 2">
            <h3>임형철</h3>
            <p>팀원</p>
            <p>"로그인 및 회원가입페이지 제작/ 팀원 소개 페이지 제작"</p>
        </div>
        <div class="developer-card">
            <img src="#" alt="Developer 3">
            <h3>이건희</h3>
            <p>팀원</p>
            <p>""</p>
        </div>
    </div>
    <footer>
        <p>&copy; 팀 소개</p>
    </footer>
</body>
</html>
