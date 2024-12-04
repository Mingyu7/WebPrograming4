<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ page import = "java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("utf-8"); %>

<HTML>
<HEAD>
    <TITLE>게시판</TITLE>
</HEAD>
<BODY>
<%
    String num = request.getParameter("num");
    Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://localhost:3306/dbmember";

    Connection conn = DriverManager.getConnection(url, "member", "apple");

    PreparedStatement pstmt = null;
    ResultSet rs = null;
    try {
        String strSQL = "SELECT * FROM tblboard WHERE num = ?";
        pstmt = conn.prepareStatement(strSQL);
        pstmt.setInt(1, Integer.parseInt(num));
        rs = pstmt.executeQuery();
        rs.next();

        String name = rs.getString("name");
        String title = rs.getString("title");
        String contents = rs.getString("contents").trim();
        contents = contents.replaceAll("\n", "<br>");
        String writedate = rs.getString("writedate");
        int readcount = rs.getInt("readcount");
%>
<center><font size='3'><b>게시판</b></font></center>

<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
    <TR>
        <TD><hr size='1' noshade></TD>
    </TR>
</TABLE>

<TABLE border='0' width='600'>
    <TR>
        <TD align='left'><font size='2'>작성자 : <%=name %></font></TD>
        <TD align='right'>
            <font size='2'>작성일: <%=writedate %>, 조회수: <%=readcount %></font>
        </TD>
    </TR>
</TABLE>

</TD>
</TR>
</TABLE>

<TABLE border='0' cellspacing=3 cellpadding=3 width='600'>
    <TR bgcolor='cccccc'>
        <TD align='center'><font size='3'><b><%=title %></b></font></TD>
    </TR>
</TABLE>

<TABLE border='0' cellspacing=5 cellpadding=10 width='600'>
    <TR bgcolor='ededed'>
        <TD><font size='2' color=''><%=contents %></font></TD>
    </TR>
</TABLE>

<TABLE border='0' width='600'>
    <TR>
        <TD><br></TD>
    </TR>
</TABLE>

<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
    <TR>
        <TD><hr size='1' noshade></TD>
    </TR>
</TABLE>

<TABLE border='0' width='600'>
    <TR>
        <TD align='right'>
            <a href=write.jsp>[글쓰기]</a>
            <a href=listboard.jsp>[목록보기]</a>
        </TD>
    </TR>
</TABLE>

<%
    strSQL = "UPDATE tblboard SET readcount=readcount+1 WHERE num = ?"; // 수정 sql
    pstmt = conn.prepareStatement(strSQL);
    pstmt.setInt(1, Integer.parseInt(num));
    pstmt.executeUpdate();
}catch(SQLException e){
    out.print("SQL에러 " + e.toString());
}catch(Exception ex){
    out.print("JSP에러 " + ex.toString());
}finally{
	rs.close();
	pstmt.close();
	conn.close();
	}	
%>
</BODY>
</HTML>



    
