<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");
	// 세션에 저장하기 위해 파라미터 받기.
	String s_id = request.getParameter("s_id");
	session.setAttribute("m_id", s_id);
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>param.s_pw : ${param.s_pw} (Parameter)</h1>

	<h1>배열로 넘어오는 값 받기</h1>
	<h3>request.getParameterValues 와 동일함</h3>
		
	<h3>paramValues.변수명[0]</h3>
	<h2>${paramValues.s_phone[0]} - ${paramValues.s_phone[1]} - ${paramValues.s_phone[2]} -</h2>
	
	<button type="button" onclick="javascript:location.href='ex2_res.jsp?m_pw=${param.s_pw}'">보내기</button>
	
</body>
</html>