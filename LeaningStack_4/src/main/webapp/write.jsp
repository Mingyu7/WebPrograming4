<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<SCRIPT type="text/javascript">
	function Check() {
		if (Write.name.value.length < 1) {
			alert("작성자를 입력하세요");
			Write.name.focus();
			return false;
		}
		if (Write.pass.value.length < 1) {
			alert("비밀번호를 입력하세요");
			Write.pass.focus();
			return false;
		}
		if (Write.email.value.indexOf("@") + "" == "-1"
				|| Write.email.value.indexOf(".") + "" == "-1"
				|| Write.email.value == "") {
			alert("이메일을 입력하세요");
			Write.email.focus();
			return false;
		}
		if (Write.title.value.length < 1) {
			alert("글제목을 입력하세요");
			Write.title.focus();
			return false;
		}
		if (Write.contents.value.length < 1) {
			alert("글내용을 입력하세요");
			Write.contents.focus();
			return false;
		}

	}
</SCRIPT>
</head>

<body>
	<center><font size=3><b>게시판 글쓰기</b></font>
	<table border="0" width="700" cellpadding='0' cellspacing='0'>
		<tr>
			<td><hr size=1 noshade="noshade"></td>

		</tr>
	</table>

	<form name=Write action="write_input.jsp" method="post"	onsubmit="return Check()">
		<table border="0" width=700 cellpading=2 cellspacing=2>
			<tr>
				<td width=200 bgcolor="cccccc"><center><font size=3><b>작성자</b></font></td>
				<td><p>
						<input type=text size=12 name=name> * 필수
					</p></td>
			</tr>

			<tr>
				<td width=200 bgcolor="cccccc"><center><font size=3><b>비밀번호</b></td>
				<td><p>
						<input type="password" name=pass> * 필수(게시물 수정시 삭제 필요합니다.)
					</p></td>
			</tr>

			<tr>
				<td width=200 bgcolor="cccccc"><center><font size=3><b>E-mail</b></font></td>
				<td><p>
						<input type=text size=40 maxlength="50" name=email>
					</p></td>
			</tr>

			<tr>
				<td colspan="2"><hr size=1 noshade="noshade"></td>
			</tr>

			<tr>
				<td width="200" bgcolor="cccccc"><center><font size=2>글제목</font></td>
				<td><input type=text size=70 maxlength="50" name=title></td>
			</tr>

			<tr>
				<td bgcolor="cccccc"><center><font size=2>글 내용</font></td>
				<td><textarea cols=70 rows=15 wrap="virtual" name=contents> </textarea></td>
			</tr>

			<tr>
				<td colspan="2"><hr size=1 noshade="noshade"></td>
			</tr>

			<tr>
				<td align="center" colspan="2" width="100%">
					<table>
						<tr>
							<td width="100" align="center"><input type="reset"
								value="다시작성">
							<td>
							<td width="200" align="center"><input type="submit"
								value="등록"></td>
						</tr>
					</table>
				</td>
			</tr>

			</form>
</body>
</html>