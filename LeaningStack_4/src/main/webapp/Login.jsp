<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>로그인 Form</title>
      <style>
         body {
            font-family: Arial, sans-serif;
            background-color: #333;  /* 어두운 배경 색 */
            margin: 0;
            padding: 0;
            color: #fff;  /* 글자색을 흰색으로 설정 */
         }
         .container {
            width: 40%;
            margin: 80px auto;
            background-color: #444;  /* 컨테이너 배경 색을 어두운 색으로 */
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.5);
         }
         h2 {
            color: #fff;  /* 제목을 흰색으로 설정 */
            text-align: center;
            margin-bottom: 40px;  /* 이미지와 로그인폼 간 간격을 추가 */
         }
         .form-group {
            margin-bottom: 20px;
         }
         .form-group label {
            display: block;
            margin-bottom: 5px;
            color: #ddd;  /* 레이블 색상은 연한 회색 */
         }
         .form-group input[type="text"], 
         .form-group input[type="password"] {
            width: 100%;
            max-width: 350px;  /* 입력창 너비를 350px로 제한 */
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #666;  /* 어두운 경계선 색상 */
            font-size: 14px;
            background-color: #555;  /* 어두운 배경 색 */
            color: #fff;  /* 입력 글자 색상 */
            margin: 0 auto;  /* 가운데 정렬 */
            display: block;
         }
         .form-group input[type="text"]:focus, 
         .form-group input[type="password"]:focus {
            border-color: #5bc0de;  /* 포커스 시 테두리 색상 */
         }
         .form-group button {
            padding: 10px 15px;
            background-color: #5bc0de;
            border: none;
            color: #fff;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            width: 100%;
            max-width: 350px;  /* 버튼 너비도 입력창과 맞추기 */
            margin: 20px auto 0;  /* 버튼 상단 여백을 추가 */
            display: block;
         }
         .form-group button:hover {
            background-color: #31b0d5;
         }
         .login-header img {
            max-width: 60%;  /* 이미지 크기 조정 (60%) */
            height: auto;
            display: block;
            margin: 0 auto 40px;  /* 이미지 아래쪽 여백을 40px로 설정 */
         }
         /* 밑줄 친 회원가입 링크 스타일 */
         .signup-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #5bc0de;  /* 파란색으로 설정 */
            text-decoration: underline;  /* 밑줄 추가 */
         }
         .signup-link:hover {
            color: #31b0d5;  /* 호버 시 색상 변경 */
         }
      </style>
   </head>
   <body>
      <div class="container">
         <!-- 이미지 상단에 배치 -->
         <div class="login-header">
            <img src="images/logo.png" alt="로그인 이미지">
         </div>
         
         <form method="post" action="loginPro.jsp">
            <!-- 아이디 입력 -->
            <div class="form-group">
               <label for="id">아이디</label>
               <input type="text" id="id" name="id" required>
            </div>

            <!-- 패스워드 입력 -->
            <div class="form-group">
               <label for="passwd">패스워드</label>
               <input type="password" id="passwd" name="passwd" required>
            </div>

            <!-- 로그인 버튼 -->
            <div class="form-group">
               <button type="submit">로그인</button>
            </div>
         </form>

         <!-- 회원가입 링크 -->
         <a href="signup.jsp" class="signup-link">회원가입</a>
      </div>
   </body>
</html>
