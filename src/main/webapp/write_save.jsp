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
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="dao" class="test.TestDAO"/>
<jsp:useBean id="dto" class="test.TestDTO" />
<jsp:setProperty property="*" name="dto" />

<c:choose>
	<c:when test="${ dao.writeSave(dto) == 1}">
		<script type="text/javascript">
			alert("게시글이 등록되었습니다😀😀")
			location.href="list.jsp"
			//history.back(); //전에 작성했던 내용이 남아있음
		</script>
	</c:when>
	<c:otherwise>
		<script type="text/javascript">
			alert("문제 발생😓😓")
			history.back();
		</script>
	</c:otherwise>
</c:choose>

</body>
</html>