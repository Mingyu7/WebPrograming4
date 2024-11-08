<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>회원가입 Form</title>
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
         .form-group input[type="password"],
         .form-group input[type="email"],
         .form-group input[type="tel"],
         .form-group select {
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
         .form-group input[type="password"]:focus,
         .form-group input[type="email"]:focus,
         .form-group input[type="tel"]:focus,
         .form-group select:focus {
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
         /* 밑줄 친 로그인 링크 스타일 */
         .login-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #5bc0de;  /* 파란색으로 설정 */
            text-decoration: underline;  /* 밑줄 추가 */
         }
         .login-link:hover {
            color: #31b0d5;  /* 호버 시 색상 변경 */
         }
         .gender-group {
            margin-bottom: 20px;
         }
         /* 생년월일 레이블을 입력창과 같은 라인에 배치 */
         .dob-group {
            display: flex;
            gap: 10px;
            justify-content: space-between;
         }
         .dob-group label {
            display: inline-block;
            width: 30%; /* 레이블의 너비를 30%로 설정 */
            margin-bottom: 0; /* 레이블의 기본 아래 여백을 제거 */
         }
         .dob-group select {
            width: 30%; /* 각 select 요소의 너비를 30%로 설정 */
         }
      </style>
   </head>
   <body>
      <div class="container">
         <!-- 이미지 상단에 배치 -->
         <div class="login-header">
            <img src="images/logo.png" alt="회원가입 이미지">
         </div>
         
         <form method="post" action="signupPro.jsp">
            <!-- 아이디 입력 -->
            <div class="form-group">
               <label for="id">아이디</label>
               <input type="text" id="id" name="id" required>
            </div>

            <!-- 비밀번호 입력 -->
            <div class="form-group">
               <label for="passwd">비밀번호</label>
               <input type="password" id="passwd" name="passwd" required>
            </div>

            <!-- 비밀번호 확인 -->
            <div class="form-group">
               <label for="passwd2">비밀번호 확인</label>
               <input type="password" id="passwd2" name="passwd2" required>
            </div>

            <!-- 이메일 입력 -->
            <div class="form-group">
               <label for="email">이메일</label>
               <input type="email" id="email" name="email" required>
            </div>

            <!-- 생년월일 입력 -->
            <div class="form-group dob-group">
               <label for="dob">생년월일</label>
               <select name="dob_year" required>
                  <option value="">년도</option>
                  <!-- 1920년부터 2024년까지 연도 선택 -->
                  <% for (int year = 2024; year >= 1920; year--) { %>
                     <option value="<%= year %>"><%= year %></option>
                  <% } %>
               </select>
               <select name="dob_month" required>
                  <option value="">월</option>
                  <option value="01">01</option>
                  <option value="02">02</option>
                  <option value="03">03</option>
                  <option value="04">04</option>
                  <option value="05">05</option>
                  <option value="06">06</option>
                  <option value="07">07</option>
                  <option value="08">08</option>
                  <option value="09">09</option>
                  <option value="10">10</option>
                  <option value="11">11</option>
                  <option value="12">12</option>
               </select>
               <select name="dob_day" required>
                  <option value="">일</option>
                  <% for (int day = 1; day <= 31; day++) { %>
                     <option value="<%= day %>"><%= day %></option>
                  <% } %>
               </select>
            </div>

            <!-- 전화번호 입력 -->
            <div class="form-group">
               <label for="tel">전화번호</label>
               <input type="tel" id="tel" name="tel" pattern="^\d{3}-\d{3,4}-\d{4}$" placeholder="000-0000-0000" required>
            </div>

            <!-- 성별 선택 (드롭다운으로 변경) -->
            <div class="form-group gender-group">
               <label for="gender">성별</label>
               <select name="gender" id="gender" required>
                  <option value="">성별을 선택하세요</option>
                  <option value="여자">여자</option>
                  <option value="남자">남자</option>
               </select>
            </div>

            <!-- 회원가입 버튼 -->
            <div class="form-group">
               <button type="submit">회원가입</button>
            </div>
         </form>

         <!-- 로그인 링크 -->
         <a href="login.jsp" class="login-link">이미 계정이 있으신가요? 로그인</a>
      </div>
   </body>
</html>
