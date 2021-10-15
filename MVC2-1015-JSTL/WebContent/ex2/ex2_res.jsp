<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>m_pw : ${param.m_pw }</h1>
	<h1>param.m_pw : ${param.m_pw }</h1>
	<h1>param["m_pw"] :  ${param["m_pw"]}</h1>
	
	<h1>sessionScope.m_id["m_id"] :  ${sessionScope.m_id}</h1>
	<h1>m_id = "${m_id}" getAttribute() 대신 사용가능하다. </h1>
	
	Object o = request.getAttribute("m_id")
	if(o != null){
		String msg = (String)o;
	}
	이거 대신 $m_id 로 사용할 수 있다 !
	
</body>
</html>