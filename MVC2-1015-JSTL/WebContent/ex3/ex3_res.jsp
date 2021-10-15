<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>저장된 값들 확인하기.</h1>
	
	<h2>u_id :  ${u_id }</h2>
	<h2>m_id : ${m_id}</h2>
	<h2>m_map : ${m_map }</h2>
	<h2>같은 이름으로 request와 session에 저장이 되었는데
	    여기서 우선순위는 request에 있다.
	</h2>
	
	<h2>SessionScope.u_id :  ${sessionScope.u_id }</h2>
	
	<h2>
		map구조에 request를 담았다 이 map구조에 있는 아이디를 출력해보자<br>
		<h3> requestScope.m_map.m_id : ${requestScope.m_map.m_id}</h3>
		<h3> m_map.m_id : ${m_map.m_id} K,V</h3>
	</h2>

</body>
</html>