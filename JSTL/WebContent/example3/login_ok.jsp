<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- jstl 라이브러리 사용 선언부 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:if test="${param.id eq 'admin' }">

	<p>[관리자]<c:out value="${param.id}"></c:out> 님 안녕하세요 ?</p>
</c:if>

<c:if test="${param.id ne 'admin' }">

	<p>[일반회원]<c:out value="${param.id}"></c:out> 님 안녕하세요 ?</p>
</c:if>


</body>
</html>