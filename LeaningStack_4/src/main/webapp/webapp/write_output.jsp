<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ page import = "java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("utf-8"); %>

<HTML>
<HEAD>
    <TITLE>게시판</TITLE>
    <style type="text/css">
        /* 스타일은 그대로 유지 */
        body { font-family: Arial, sans-serif; background-color: #f5f5f5; padding: 20px; }
        .container { width: 100%; max-width: 800px; margin: 0 auto; background-color: #fff; padding: 20px; border-radius: 8px; box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); }
        .content-header { text-align: center; font-size: 1.5em; margin-bottom: 20px; }
        .info-table { width: 100%; margin-bottom: 20px; }
        .info-table td { padding: 8px; font-size: 0.9em; }
        .info-table td:nth-child(1) { width: 30%; font-weight: bold; background-color: #f0f0f0; }
        .content-title { text-align: center; background-color: #cccccc; padding: 15px; font-size: 1.2em; font-weight: bold; }
        .content-body { background-color: #ededed; padding: 20px; font-size: 1em; line-height: 1.6; }
        .footer { text-align: right; margin-top: 20px; }
        .footer a { color: #007BFF; text-decoration: none; margin-left: 15px; }
        .footer a:hover { text-decoration: underline; }
        hr { border: 1px solid #ccc; }
        .form-container { margin-top: 20px; padding: 15px; background-color: #f9f9f9; border-radius: 8px; box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); display: none; }
        .form-container input[type="text"], .form-container input[type="password"] { width: 100%; padding: 10px; margin: 8px 0; border: 1px solid #ccc; border-radius: 5px; }
        .form-container input[type="submit"] { background-color: #007BFF; color: white; padding: 10px 15px; border: none; border-radius: 5px; cursor: pointer; }
        .form-container input[type="submit"]:hover { background-color: #0056b3; }
        .comment-container { margin-top: 20px; padding: 10px; background-color: #f8f8f8; border-radius: 5px; box-shadow: 0 1px 5px rgba(0, 0, 0, 0.1); }
        .comment { margin-bottom: 15px; padding: 10px; background-color: #fff; border-radius: 5px; box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1); }
        .comment h4 { font-size: 1em; color: #007BFF; }
        .comment p { font-size: 0.9em; line-height: 1.4; }
    </style>
</HEAD>

<BODY>
  
<%
    String num = request.getParameter("num");
    Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://localhost:3306/dbmember";

    Connection conn = DriverManager.getConnection(url, "member", "apple");

    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String name = "";
    String title = "";
    String contents = "";
    String writedate = "";
    int readcount = 0;

    try {
        String strSQL = "SELECT * FROM tblboard WHERE num = ?";
        pstmt = conn.prepareStatement(strSQL);
        pstmt.setInt(1, Integer.parseInt(num));
        rs = pstmt.executeQuery();
        rs.next();

        name = rs.getString("name");
        title = rs.getString("title");
        contents = rs.getString("contents").trim();
        contents = contents.replaceAll("\n", "<br>");
        writedate = rs.getString("writedate");
        readcount = rs.getInt("readcount");

        // 조회수 업데이트
        strSQL = "UPDATE tblboard SET readcount=readcount+1 WHERE num = ?";
        pstmt = conn.prepareStatement(strSQL);
        pstmt.setInt(1, Integer.parseInt(num));
        pstmt.executeUpdate();
    } catch (SQLException e) {
        out.print("SQL 에러: " + e.toString());
    } finally {
        if (rs != null) rs.close();
        if (pstmt != null) pstmt.close();
    }
%>

<div class="container">
    <div class="content-header">
        <b>게시판</b>
    </div>

    <table class="info-table">
        <tr>
            <td>작성자</td>
            <td><%= name %></td>
        </tr>
        <tr>
            <td>작성일</td>
            <td><%= writedate %></td>
        </tr>
        <tr>
            <td>조회수</td>
            <td><%= readcount %></td>
        </tr>
    </table>

    <div class="content-title">
        <%= title %>
    </div>

    <div class="content-body">
        <%= contents %>
    </div>

    <div class="footer">
        <a href="write.jsp">[글쓰기]</a>
        <a href="re_write.jsp">[글수정]</a>
        <a href="#" onclick="showDeleteForm()">[글삭제]</a> <!-- 글삭제 버튼 클릭 시 폼 보이기 -->
        <a href="listboard.jsp">[목록보기]</a>
    </div>

    <!-- 게시글 내용 아래에 댓글 작성 폼 추가 -->
    <div class="comment-form">
        <h3>댓글 작성</h3>
        <form action="postComment.jsp" method="post">
            <input type="hidden" name="board_id" value="<%= num %>"> <!-- 게시글 번호 -->
            작성자: <input type="text" name="commenter_name" required><br>
            댓글 내용: <textarea name="comment_text" required></textarea><br>
            <input type="submit" value="댓글 작성">
        </form>
    </div>

    <!-- 댓글 표시 부분 -->
    <div class="comment-container">
        <h3>댓글 목록</h3>
        <%
            // 댓글 조회
            String commentSQL = "SELECT * FROM tblcomments WHERE board_id = ? ORDER BY comment_id DESC";
            pstmt = conn.prepareStatement(commentSQL);
            pstmt.setInt(1, Integer.parseInt(num));
            rs = pstmt.executeQuery();

            while (rs.next()) {
                String commenterName = rs.getString("commenter_name");
                String commentText = rs.getString("comment_text");
        %>
                <div class="comment">
                    <h4><%= commenterName %></h4>
                    <p><%= commentText %></p>
                </div>
        <%
            }
        %>
    </div>

</div>

<!-- 글 삭제 폼 -->
<div class="form-container" id="deleteForm">
    <form method="post" onsubmit="return confirmDelete();">
        <h2>글 삭제</h2>
        <label for="delName">삭제할 작성자:</label>
        <input type="text" id="delName" name="delName" required>

        <label for="delPass">삭제할 비밀번호:</label>
        <input type="password" id="delPass" name="delPass" required>

        <input type="submit" value="삭제하기">
    </form>
</div>

<!-- JavaScript로 폼 보이기 및 삭제 확인 -->
<script type="text/javascript">
    function showDeleteForm() {
        // 삭제 폼을 보이도록 설정
        document.getElementById("deleteForm").style.display = "block";
    }

    function confirmDelete() {
        var delName = document.getElementById("delName").value;
        var delPass = document.getElementById("delPass").value;

        // 사용자가 입력한 값이 비어 있지 않은지 확인
        if (delName && delPass) {
            // 확인 팝업 띄우기
            return confirm("정말로 삭제하시겠습니까?");
        } else {
            alert("작성자와 비밀번호를 입력해주세요.");
            return false;
        }
    }
</script>

<%
    String DelName = request.getParameter("delName");
    String DelPass = request.getParameter("delPass");

    if (DelName != null && DelPass != null) {
        try {
            String deleteSQL = "DELETE FROM tblboard WHERE name = ? AND pass = ?";
            pstmt = conn.prepareStatement(deleteSQL);
            pstmt.setString(1, DelName);
            pstmt.setString(2, DelPass);

            int affectedRows = pstmt.executeUpdate();
            if (affectedRows > 0) {
                out.println("<script>alert('글이 삭제되었습니다.'); location.href='listboard.jsp';</script>");
            } else {
                out.println("<script>alert('삭제할 권한이 없습니다.'); history.back();</script>");
            }
        } catch (SQLException e) {
            out.print("SQL 에러: " + e.toString());
        }
    }
%>


</BODY>
</HTML>
