<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>커뮤니티 게시판</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f2f5;
        }
        .container {
            max-width: 1200px;
            margin: 30px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        header {
            text-align: center;
            padding: 20px;
            background-color: #007bff;
            color: #fff;
            border-radius: 8px 8px 0 0;
        }
        h1 {
            font-size: 2em;
            margin: 0;
        }
        .btn-new-post {
            display: inline-block;
            margin: 20px 0;
            padding: 12px 20px;
            background-color: #28a745;
            color: white;
            font-size: 1em;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }
        .btn-new-post:hover {
            background-color: #218838;
        }
        .post-card {
            display: flex;
            flex-direction: column;
            border: 1px solid #ddd;
            border-radius: 8px;
            margin-bottom: 20px;
            padding: 16px;
            background-color: #fafafa;
            transition: box-shadow 0.3s ease;
        }
        .post-card:hover {
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
        }
        .post-title {
            font-size: 1.5em;
            margin: 0;
            color: #333;
            text-decoration: none;
        }
        .post-title:hover {
            color: #007bff;
        }
        .post-meta {
            color: #666;
            font-size: 0.9em;
            margin-top: 8px;
        }
    </style>
</head>
<body>
    <header>
        <h1>커뮤니티 게시판</h1>
    </header>
    
    <div class="container">
        <a href="newPost.jsp" class="btn-new-post">새 게시물 작성</a>
        
        <%-- 게시물 목록을 출력하는 예제 코드 --%>
        <% 
            String[][] posts = {
                {"1", "첫 번째 게시물", "관리자", "2024-09-01", "150"},
                {"2", "두 번째 게시물", "사용자1", "2024-09-02", "75"},
                {"3", "세 번째 게시물", "사용자2", "2024-09-03", "200"}
            };
            
            for (String[] post : posts) {
        %>
        <div class="post-card">
            <a href="post.jsp?id=<%= post[0] %>" class="post-title"><%= post[1] %></a>
            <div class="post-meta">
                작성자: <%= post[2] %> | 작성일: <%= post[3] %> | 조회수: <%= post[4] %>
            </div>
        </div>
        <% } %>
    </div>
</body>
</html>
