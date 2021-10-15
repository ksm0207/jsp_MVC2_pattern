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
	<%
		String [] ar = {"자바","Mybatis","Spring","Lombok"};
		request.setAttribute("ar", ar);
	%>
	
	<h1>JSTL for연습</h1>
	<ul>
		<!-- 일반적인 for문 for(String str : ar) -->
		<!-- request에 저장된 객체를 itmes에 넣기 -->
		<c:forEach varStatus="count" var="str" items="${ar}">
			<li> (${count.index+1}) ${str}</li>
		</c:forEach>
	</ul>
	
	<ol>
		<c:forEach begin="1" end="10">
			<li>NoteBook </li>
		</c:forEach>
	</ol>
	
</body>
</html>