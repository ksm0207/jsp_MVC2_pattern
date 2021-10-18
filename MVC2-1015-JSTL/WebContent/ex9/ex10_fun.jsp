<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- jstl 라이브러리 사용 선언부(core) -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- jstl 라이브러리 사용 선언부(function)-->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%--
			현재 페이지는 str이라는 파라미터를 받는다.
			받은 파라미터의 값 길이를 구해보자.
	--%>
	
	<h3>str 파라미터 값 : ${param.str}</h3>
	
	<h3>str 길이 $param.str.length() : ${param.str.length()}</h3>
	<h3>str.substring(0,3) : ${param.str.substring(0,3)}</h3>
	
	<h3>fn:toUpperCase(s1) : ${fn:toUpperCase(s1)}</h3><br>
	<h3>fn:toLowerCase(s1) : ${fn:toLowerCase(s1)}</h3><br>
	
	<c:set var="s1" value="${param.str}"></c:set>
	<h3>fn:substring(s1,0,3) : ${fn:substring(s1,0,3)}</h3> - 문자열 자르기 <br>
	
	<h3>fn:indexOf(s1,"c") : ${fn:indexOf(param.str, "c")}</h3>- 문자열 찾기 <br>
	<h3>fn:replace(s1,"cd","CD") : ${fn:replace(param.str,"cd","CD")}</h3>- 문자열 대체<br>
	<h3>fn:length(s1) : ${fn:length(s1)}</h3> - 문자열길이<br>
	
</body>
</html>