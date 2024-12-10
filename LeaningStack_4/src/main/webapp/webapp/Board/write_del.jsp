<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*"%>
<!DOCTYPE html>
<%
    String DelName = request.getParameter("delName");
    String DelPass = request.getParameter("delPass");
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 삭제</title>
</head>
<body>
    <form method="post">
        <h1>게시글 삭제</h1>
        삭제할 작성자: <input type="text" name="delName" required>
        <br>
        삭제할 비밀번호: <input type="password" name="delPass" required>
        <br>
        <input type="submit" value="삭제하기">
    </form>

    <%
        if (DelName != null && DelPass != null) {
            // 데이터베이스 연결 및 삭제 작업
            try {
                Class.forName("com.mysql.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/dbmember";
                Connection conn = DriverManager.getConnection(url, "member", "apple");

                String deleteSQL = "DELETE FROM tblboard WHERE name = ? AND pass = ?";
                PreparedStatement pstmt = conn.prepareStatement(deleteSQL);
                pstmt.setString(1, DelName); // 삭제할 name
                pstmt.setString(2, DelPass); // 삭제할 pass

                int affectedRows = pstmt.executeUpdate();
                if (affectedRows > 0) {
                    out.println("<script>alert('글이 삭제되었습니다.'); location.href='listboard.jsp';</script>");
                } else {
                    out.println("<script>alert('삭제할 권한이 없습니다.'); history.back();</script>");
                }

                pstmt.close();
                conn.close();
            } catch (SQLException e) {
                out.print("SQL 에러: " + e.toString());
            } catch (Exception e) {
                out.print("에러: " + e.toString());
            }
        }
    %>
</body>
</html>
