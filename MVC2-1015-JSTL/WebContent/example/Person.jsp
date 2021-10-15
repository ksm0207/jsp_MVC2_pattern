<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	String idx = request.getParameter("idx");
	request.setAttribute("user", "Namyeonseo");
%>
<body>

<c:out value="${param.idx }"></c:out>
<c:out value="${null }">JSTL</c:out>
<c:out value="Hello">World</c:out><br>
<br>

<c:set var="count" value="10"></c:set>
값은 : <c:out value="${count} 입니다."></c:out>
<c:out value="$pageScore.count : ${pageScope.count}"></c:out>
<br>
<c:set var="person" value="Kim"></c:set>
<c:out value= "${person}"></c:out><br>


기존유저
<c:out value="${user}"></c:out>
<br>

<c:set var="user" value="Kimsungmin"></c:set>
새로운유저
<c:out value="${user}"></c:out>
</body>
</html>