<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*"%>
<%
request.setCharacterEncoding("utf-8");
%>

<%
	// 클라이언트로부터 전달된 파라미터 값 가져오기
	String name = request.getParameter("name");
	String pass = request.getParameter("pass");
	String email = request.getParameter("email");
	String title = request.getParameter("title");
	String contents = request.getParameter("contents");
	
	// JDBC 드라이버 로드
	Class.forName("com.mysql.jdbc.Driver");
	
	// 데이터베이스 연결 설정
	String url = "jdbc:mysql://localhost:3306/dbmember";
	Connection conn = DriverManager.getConnection(url, "member", "apple");
	
	PreparedStatement pstmt = null;
	
	// 현재 날짜 및 시간 생성
	Calendar dateIn = Calendar.getInstance();
	String indata = Integer.toString(dateIn.get(Calendar.YEAR)) + "-";
	indata = indata + Integer.toString(dateIn.get(Calendar.MONTH) + 1) + "-";
	indata = indata + Integer.toString(dateIn.get(Calendar.DATE)) + " ";
	indata = indata + Integer.toString(dateIn.get(Calendar.HOUR_OF_DAY)) + ":";
	indata = indata + Integer.toString(dateIn.get(Calendar.MINUTE)) + ":";
	indata = indata + Integer.toString(dateIn.get(Calendar.SECOND));
	
	// 업데이트 SQL 구문
	String strSQL = "UPDATE tblboard SET email = ?, title = ?, contents = ?, writedate = ? WHERE name = ? AND pass = ?";
	pstmt = conn.prepareStatement(strSQL);
	
	// PreparedStatement에 값 설정
	pstmt.setString(1, email); // 업데이트할 email 값
	pstmt.setString(2, title); // 업데이트할 title 값
	pstmt.setString(3, contents); // 업데이트할 contents 값
	pstmt.setString(4, indata); // 업데이트할 writedate 값
	pstmt.setString(5, name); // 조건에 사용할 name 값
	pstmt.setString(6, pass); // 조건에 사용할 pass 값
	
	// 업데이트 실행 및 결과 확인
	int updatedRows = pstmt.executeUpdate();
	
	// 자원 정리
	pstmt.close();
	conn.close();
	
	// 업데이트 성공 여부에 따라 처리
	if (updatedRows > 0) {
	    out.println("<script>");
	    out.println("alert('수정 완료되었습니다.');");
	    out.println("location.href='listboard.jsp';");
	    out.println("</script>");
	} else {
	    out.println("<script>");
	    out.println("alert('일치하는 레코드가 없어 업데이트할 수 없습니다.');");
	    out.println("history.back();");
	    out.println("</script>");
	}

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB수정 완료</title>
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
			<b>DB 수정 완료</b>
		</div>

		<div class="message">수정이 완료되었습니다. 이제 게시글 목록으로 이동합니다.</div>

		<div class="footer">
			<a href="listboard.jsp">[목록 보기]</a>
		</div>
	</div>
</body>
</html>
