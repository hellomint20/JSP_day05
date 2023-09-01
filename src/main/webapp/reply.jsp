<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% request.setCharacterEncoding("UTF-8"); %>

	<jsp:useBean id="dao" class="test.TestDAO" />
	<jsp:useBean id="dto" class="test.TestDTO" />
	<jsp:setProperty property="*" name="dto"/>
	
	${ dao.reply (dto) }
	<% response.sendRedirect("list.jsp");  %>
</body>
</html>