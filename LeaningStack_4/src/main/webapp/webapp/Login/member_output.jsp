<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("utf-8"); %>

<html>
<head>
<meta charset="UTF-8">
<title>회원 등록 성공</title>
<style type="text/css">
<!--
a:link {
   font-family: "";
   color: black;
   text-decoration: none;
}

a:visited {
   font-family: "";
   color: black;
   text-decoration: none;
}

a:hover {
   font-family: "";
   color: black;
   text-decoration: underline;
}
-->
</style>
</head>
<body>
   <%
   String id = request.getParameter("id");
   String pass = request.getParameter("pass");
   String name = request.getParameter("name");

   String check_ok = "yes";

   if (id == "")
      check_ok = "no";
   if (pass == "")
      check_ok = "no";
   if (name == "")
      check_ok = "no";

   Class.forName("com.mysql.jdbc.Driver");

   String url = "jdbc:mysql://localhost:3306/dbmember";
   Connection conn = DriverManager.getConnection(url, "member", "apple");
   Statement stmt = conn.createStatement();

   String strSQL = "SELECT id FROM tblmember where id='" + id + "'";
   ResultSet rs = stmt.executeQuery(strSQL);

   if (!rs.next())      check_ok = "yes";
   else      check_ok = "no";

   if (check_ok == "yes") {
      strSQL = "INSERT INTO tblmember(id, pass, name)";
      strSQL = strSQL + "VALUES ('" + id + "', '" + pass + "', '" + name + "')";
      stmt.executeUpdate(strSQL);
   %>
   <center>
      <font><b>회원 가입 성공</b></font>
      <table border="0" width='600' cellpadding='0' cellspacing='0'>
         <tr>
            <td>
               <hr size='1' noshade>
            </td>
         </tr>
      </table>

      <table cellSpacing='0' cellPadding='10' align='center' border='0'>
         <tr>
            <td align="center"><font size='2'>회원 가입을 축하합니다.<br>로그인
                  하세요
            </font></td>
         </tr>
         <tr>
            <td align="center"><font size='2'><a href="member.jsp">[로그인]</a></font>
            </td>
         </tr>
      </table>
   </center>
   <%
   } else {
   %>
   <center>
      <font><b>회원 가입 실패</b></font>
      <table border="0" width='600' cellpadding='0' cellspacing='0'>
         <tr>
            <td>
               <hr size='1' noshade>
            </td>
         </tr>
      </table>

      <table cellSpacing='0' cellPadding='10' align='center' border='0'>
         <tr>
            <td align="center"><font size='2'>회원 가입에 실패 했습니다.<br>다시
                  가입서를 작성 하세요
            </font></td>
         </tr>
         <tr>
            <td align="center"><font size='2'><a
                  href="member_input.jsp">[가입서 작성]</a></font></td>
         </tr>
      </table>
   </center>
   <%
   }
   stmt.close();
   conn.close();
   %>
</body>
</html>