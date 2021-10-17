<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:forEach varStatus="i" var="mvo" items="${list}">

<span>${i.index+1}</span>

<span>${mvo.name}</span>
<span>${mvo.age}</span>
<span>${mvo.gender}</span>
<span>${mvo.addr}</span>
<span>${mvo.favFood}</span>

</c:forEach>

</body>
</html>