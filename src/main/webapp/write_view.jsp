<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>글 등록 페이지</h3>
	
	<form action="write_save.jsp" method="post">
		이름 : <input type="text" name="name"><br>
		제목 : <input type="text" name="title"><br>
		내용 : <textarea rows="" cols="" name="content"></textarea>
		<hr>
		<input type="submit" value="등록">
		<input type="button" value="목록으로 돌아가기" onclick="history.back()">
		<!-- history.back() : 웹 브라우저에서 저장되어 있는 이전으로 이동, 서버로 재요청이 아님 -->
	</form>
</body>
</html>