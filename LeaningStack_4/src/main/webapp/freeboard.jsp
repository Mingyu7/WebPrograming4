<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("utf-8"); %>

<HTML>
<HEAD>
    <TITLE>게시판</TITLE>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #333;
            color: #fff;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 80%;
            max-width: 800px;
            margin: 50px auto;
            background-color: #444;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.5);
        }
        h2 {
            text-align: center;
            color: #5bc0de;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        table, th, td {
            border: 1px solid #666;
        }
        th, td {
            padding: 10px;
            text-align: center;
            font-size: 14px;
        }
        th {
            background-color: #555;
            color: #ddd;
        }
        tr:nth-child(even) {
            background-color: #5c5c5c;
        }
        tr:nth-child(odd) {
            background-color: #666;
        }
        a {
            color: #5bc0de;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
        .write-button {
            text-align: right;
            margin-top: 20px;
        }
        .write-button a {
            color: #fff;
            background-color: #5bc0de;
            padding: 10px 15px;
            border-radius: 5px;
            text-decoration: none;
        }
        .write-button a:hover {
            background-color: #31b0d5;
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
        <TD align='right'><a href='write.jsp'>|글쓰기|</a></TD>
    </TR>
</TABLE>

<%
rs.close();
stmt.close();
conn.close();
%>


</BODY>
</HTML>
