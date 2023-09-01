<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	content view <br><br>
	<jsp:useBean id="dao" class="test.TestDAO" />
	
	<c:set var="dto" value="${ dao.contentView(param.id) }"/>
	
	<form action="modify.jsp" method="post">
		<table border="1" style="margin: auto;">
			<tr>
				<th>번호</th><td><input type="text" readonly name="id" value="${ dto.id }"></td>
			</tr>
			<tr>
				<th>조회수</th><td>${ dto.hit }</td>
			</tr>
			<tr>
				<th>이름</th><td><input type="text" name="name" value="${ dto.name }"></td>
			</tr>
			<tr>
				<th>제목</th><td><input type="text" name="title" value="${ dto.title }"></td>
			</tr>
			<tr>
				<th>내용</th><td><textarea name="content">${ dto.content }</textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="수정">
					<a href="list.jsp">목록 이동</a>
					<a href="reply_view.jsp?id=${ dto.id }&title=${dto.title}&name=${dto.name}">답변</a>
					<a href="delete.jsp?id=${ dto.id }">삭제</a>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>