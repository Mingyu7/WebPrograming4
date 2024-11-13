<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("utf-8"); %>

<HTML>
<HEAD>
    <TITLE>게시판</TITLE>
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
</HEAD>

<BODY>
<%
    Class.forName("com.mysql.jdbc.Driver");

    String url = "jdbc:mysql://localhost:3306/dbmember";
    Connection conn = DriverManager.getConnection(url, "member", "apple");

    Statement stmt = conn.createStatement();
    String strSQL = "SELECT * FROM tblboard ORDER BY num DESC";
    ResultSet rs = stmt.executeQuery(strSQL);
%>

<center><font size='3'><b>게시판</b></font></center>

<center><TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
    <TR>
        <TD><hr size='1' noshade></TD>
    </TR>
</TABLE></center>

<center><TABLE border='0' cellspacing='1' cellpadding='2' width='600'>
    <TR bgcolor='cccccc'>
        <TD><font size=2><center><b>번호</b></center></font></TD>
        <TD><font size=2><center><b>제목</b></center></font></TD>
        <TD><font size=2><center><b>작성자</b></center></font></TD>
        <TD><font size=2><center><b>작성일</b></center></font></TD>
        <TD><font size=2><center><b>조회</b></center></font></TD>
    </TR>

<%
while(rs.next()) {
    int num = rs.getInt("num");
    String name = rs.getString("name");
    String email = rs.getString("email");
    String title = rs.getString("title");
    String writedate = rs.getString("writedate");
    int readcount = rs.getInt("readcount");
%>
    <TR bgcolor='ededed'>
        <TD align=center><font size=2 color='black'><%= num %></font></TD>
        <TD align=left>
            <a href="write_output.jsp?num=<%= num %>">
                <font size=2 color='black'><%= title %></font>
            </a>
        </TD>
        <TD align=center>
            <a href="mailto:<%= email %>">
                <font size=2 color='black'><%= name %></font>
            </a>
        </TD>
        <TD align=center><font size=2><%= writedate %></font></TD>
        <TD align=center><font size=2><%= readcount %></font></TD>
    </TR>
<%
}
%>
</TABLE></center>

<center><TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
    <TR>
        <TD><hr size='1' noshade></TD>
    </TR>
</TABLE></center>

<TABLE border='0' width='600'>
    <TR>
        <TD align='left'></TD>
        <TD align="right"><a href='write.jsp'>|글쓰기|</a></TD>
    </TR>
</TABLE>

<%
rs.close();
stmt.close();
conn.close();
%>


</BODY>
</HTML>
