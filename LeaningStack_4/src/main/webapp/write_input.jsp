
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
   pstmt.setString(2,pass);
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
   </head>
   <body>
      저장완료
   </body>
</html>