<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- jstl 라이브러리 사용 선언부 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 파라미터 값을 저장할 변수 선언. --%>
	<c:set var="s_id" value="${param.s_id}"></c:set>
					
	<c:if test="${s_id eq 'admin' }"> <!-- eq : == 와 같은 의미 -->
		<c:out value="[관리자] : ${s_id } 님 안녕하세요?"></c:out>
	</c:if>
	
	<c:if test="${s_id ne 'admin'  }"> <!-- ne : != 와 같은 의미 -->
		<c:out value="[회원] : ${s_id }  님 안녕하세요 ?"></c:out>
	</c:if>

</body>
</html>