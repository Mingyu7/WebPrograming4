<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import = "java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("utf-8"); %>



<%
   String name = request.getParameter("name");
   String pass = request.getParameter("pass");
   String email = request.getParameter("email");
   String title = request.getParameter("title");
   String contents = request.getParameter("contents");

   Class.forName("com.mysql.jdbc.Driver");
   
   String url = "jdbc:mysql://localhost:3306/dbmember";
   Connection conn = DriverManager.getConnection(url,"member","apple");
   
   PreparedStatement pstmt = null;
   
   Calendar dateIn = Calendar.getInstance();
   String indata = Integer.toString(dateIn.get(Calendar.YEAR)) + "-";
   indata = indata + Integer.toString(dateIn.get(Calendar.MONTH)+1) + "-";
   indata = indata + Integer.toString(dateIn.get(Calendar.DATE)) + " ";
   indata = indata + Integer.toString(dateIn.get(Calendar.HOUR_OF_DAY)) + ":";
   indata = indata + Integer.toString(dateIn.get(Calendar.MINUTE)) + ":";
   indata = indata + Integer.toString(dateIn.get(Calendar.SECOND));
   
   String strSQL = "INSERT INTO tblboard(name, pass, email, title, contents, writedate, readcount)";
   strSQL = strSQL + "VALUES (?, ?, ?, ?, ?, ?, ?)";
   pstmt = conn.prepareStatement(strSQL);
   pstmt.setString(1, name);
   pstmt.setString(2, pass);
   pstmt.setString(3, email);
   pstmt.setString(4, title);
   pstmt.setString(5, contents);
   pstmt.setString(6, indata);
   pstmt.setInt(7, 0);
   pstmt.executeUpdate();
   
   pstmt.close();
   conn.close();
   
   response.sendRedirect("listboard.jsp");
%>

<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <title>DB저장 완료</title>
      <style type="text/css">
         body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            padding: 20px;
         }

         .container {
            width: 100%;
            max-width: 800px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
         }

         .content-header {
            text-align: center;
            font-size: 1.5em;
            margin-bottom: 20px;
         }

         .message {
            text-align: center;
            font-size: 1.2em;
            margin-top: 30px;
         }

         .footer {
            text-align: center;
            margin-top: 20px;
         }

         .footer a {
            color: #007BFF;
            text-decoration: none;
            margin-left: 15px;
         }

         .footer a:hover {
            text-decoration: underline;
         }

         hr {
            border: 1px solid #ccc;
         }
      </style>
   </head>
   <body>
      <div class="container">
         <div class="content-header">
            <b>DB 저장 완료</b>
         </div>

         <div class="message">
            저장이 완료되었습니다. 이제 게시글 목록으로 이동합니다.
         </div>

         <div class="footer">
            <a href="listboard.jsp">[목록 보기]</a>
         </div>
      </div>
   </body>
</html>
