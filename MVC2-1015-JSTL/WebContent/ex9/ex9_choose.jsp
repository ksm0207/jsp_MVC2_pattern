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
	
	<%--
		  현재 페이지는 money라는 파라미터를 받는다.
		  money에 따라 과일을 선택할 수 있다.
		  사과 700
		  배 1000
		  샤인머스켓 1800
	 --%>
	 
	 <c:if test="${param.money >= 1800 }">
	 		<span>선택할 수 있는 과일은 <strong>사과 배 샤인머스켓 입니다.</strong></span>
	 </c:if>
	 
	  <c:if test="${param.money >= 1000 and param.money <= 1799 }">
	 		<span>선택할 수 있는 과일은 <strong>사과 배 입니다.</strong></span>
	 </c:if>
	 
	 <c:if test="${param.money >= 700 and param.money <= 999 }">
	 		<span>선택할 수 있는 과일은 <strong>사과 입니다.</strong></span>
	 </c:if>
	 
	 <h1>아래는 choose 문법을 사용한 결과 입니다.</h1><br>
	 
	 <c:choose>
	 	<c:when test="${param.money >= 1800 }">사과 배 샤인머스켓 입니다</c:when>
	 	<c:when test="${param.money >= 1000 }">사과 배  입니다</c:when>
	 	<c:when test="${param.money >= 700 }">사과  입니다</c:when>
	 	<c:otherwise>선택할 수 있는 과일이 없습니다</c:otherwise>
	 </c:choose>


</body>
</html>