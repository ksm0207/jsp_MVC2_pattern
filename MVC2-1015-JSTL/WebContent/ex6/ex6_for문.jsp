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
	<h1>JSTL for문 연습</h1>
	
	<c:set var ="cnt" value="10" scope="page"></c:set>
	
	<ul>
		<!-- varStatus : 내부적으로 가지고 있는 상태 값 : -->
		<!-- for(int i) 같은거. -->
		<!-- varStatus : index값  begin : 시작인덱스 / end : 끝 -->
		<c:forEach varStatus="st" begin="1" end="${cnt}">
			<li>${st.index}</li> <!-- st.index : begin end 만큼 돌아간 반복요소 결과값 -->
		</c:forEach>
		
		
	</ul>
	
	<h1>출력하는 다른 방법 c:out</h1><br>
	
	<c:set var ="cnt" value="10" scope="page"></c:set>
	
	<ul>
		<!-- c:out : html 태그같은것을 출력하고싶을때 사용함. -->
		<c:forEach varStatus="st" begin="1" end="${cnt}">
			<li>${st.index}/ <c:out value="${st.index}"></c:out></li> 
			
		</c:forEach>
		
	</ul>
	<br>
	
	<h1>c:set 맛보기로 태그 생성해보기</h1>
	<c:set var="str" value="<strong>Kimsungmin</strong>"></c:set>
	<h1>출력 : ${str} </h1>
	                     <!-- escapeXML = true  : set의 value 태그자체를 읽어버림. -->
	                     <!-- escapeXML = false : 태그안에 내용만 읽음-->
	<c:out value="${str}" escapeXml="true"></c:out></li><br>
	<c:out value="${str}" escapeXml="false"></c:out></li> <br>

</body>
</html>