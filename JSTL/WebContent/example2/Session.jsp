<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		session.setAttribute("id", id);
	
	%>
	<h1> ID : ${sessionScope.id }</h1>
	<h1> ID : ${id }</h1>
	<h1> PW : ${param.pw }</h1>

</body>
</html>