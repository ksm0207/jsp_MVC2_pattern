<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- jstl 라이브러리 사용 선언부 -->
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>


<% 
	// JSTL을 사용하지 않는경우.
	String index = request.getParameter("idx");
	int res = 5; // 지역변수
	
	// 1. 받은 파라미터가 null이 아니면 정수로 변환
	if(index != null){
		int i = Integer.parseInt(index);
		
		if(i > 5){
%>	
		<pre>i가 50%이상입니다.</pre>	
<%
		}else{
%>
		<pre>i가 50%미만입니다.</pre>
<%
		}
	}
%>
	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%--
			JSTL : Java Standard Tag Library
			       자바기반 웹 환경에서 지원하는 확장된 Tag를 
			       사용할 수 있도록 제공되는 라이브러리.
			       Tag를 이용한 제어문을 지원해준다.
			       <%=%> 이런거 안써도됨.
	 --%>
	 
	 <%-- JSTL 변수 선언 --%>
	 <!-- 접두어 : set 변수 : var
	                     값 : 파라미터 -->
	<core:set var="i" value="${param.idx}"></core:set>
	
	<core:if test="${i != null and i > 5 }">
		<core:out value="i가 5보다 큽니다"></core:out>
		<!-- <pre>i가 5보다 크다</pre> -->
	</core:if>
		

	<core:if test="${i != null and i <= 5 }">
		<core:out value="i가 5보다 작거나 같습니다 "></core:out>
	</core:if>
	
	
	
	
</body>
</html>