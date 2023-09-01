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
	list page <br><br>
	<jsp:useBean id="dao" class="test.TestDAO"/>
	
	<table border="1" style="margin: auto;">
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>제목</th>
			<th>날짜</th>
			<th>조회수</th>
			<th>그룹번호</th>
			<th>step</th>
			<th>들여쓰기</th>
		</tr>
		<c:forEach var="dto" items="${ dao.List() }">
			<tr>
				<td>${ dto.id }</td>
				<td>${ dto.name }</td>
				<td>
					<c:forEach begin="1" end="${ dto.indent }">
						┗
					</c:forEach>
				<a href="content_view.jsp?id=${ dto.id }">${ dto.title }</a></td>
				<td>${ dto.savedate }</td>
				<td>${ dto.hit }</td>
				<td>${ dto.idgroup }</td>
				<td>${ dto.step }</td>
				<td>${ dto.indent }</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="8">
				<a href="write_view.jsp">글 등록</a>
			</td>
		</tr>
	</table>
	
</body>
</html>