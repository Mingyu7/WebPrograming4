<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*, java.util.*" %>
<!-- 댓글 저장 -->
<%
    String board_id = request.getParameter("board_id");
    String commenter_name = request.getParameter("commenter_name");
    String comment_text = request.getParameter("comment_text");

    Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://localhost:3306/dbmember";
    Connection conn = DriverManager.getConnection(url, "member", "apple");
    PreparedStatement pstmt = null;

    try {
        String insertSQL = "INSERT INTO tblcomments (board_id, commenter_name, comment_text) VALUES (?, ?, ?)";
        pstmt = conn.prepareStatement(insertSQL);
        pstmt.setInt(1, Integer.parseInt(board_id));  // 게시글 ID
        pstmt.setString(2, commenter_name);           // 댓글 작성자
        pstmt.setString(3, comment_text);             // 댓글 내용

        int affectedRows = pstmt.executeUpdate();
        if (affectedRows > 0) {
            out.println("<script>alert('댓글이 등록되었습니다.'); window.location.href='listboard.jsp';</script>");
        } else {
            out.println("<script>alert('댓글 등록에 실패했습니다.'); history.back();</script>");
        }

    } catch (SQLException e) {
        out.print("SQL 에러: " + e.toString());
    } finally {
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }
%>
