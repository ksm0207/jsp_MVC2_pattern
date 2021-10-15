<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
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
		request.setCharacterEncoding("UTF-8");
		
		String m_id= request.getParameter("s_id");
		
		// Map구조
		Map<String,String> map = new HashMap<String,String>();
		map.put("m_id", m_id);
		
		request.setAttribute("m_map", map);
		
		request.setAttribute("u_id", m_id);
		session.setAttribute("u_id", "Result");
		
	%>
	<jsp:forward page="ex3_res.jsp">
		<jsp:param name="m_id" value="m_id"/>
	</jsp:forward>
</body>
</html>