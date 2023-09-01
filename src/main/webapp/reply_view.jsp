<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="reply.jsp" method="post">
		<input type="text" readonly="readonly" name="id" value="${param.id }"><br>
		<input type="text" name="name" value="${param.name }"><br>
		<input type="text" name="title" value="${param.title }"><br>
		<textarea name="content"></textarea><br>
		<input type="submit" value="답글 전송">
	</form>
</body>
</html>