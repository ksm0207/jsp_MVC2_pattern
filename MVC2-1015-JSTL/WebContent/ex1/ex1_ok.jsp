<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	request.setCharacterEncoding("UTF-8");
%>
<body>
	<h1>EL : Expression Language (표현 언어를 의미함)</h1>
	<h3>Map , list 등 컬렉션 프레임워크에 접근을
		유용하게 해 주는 문법을 가진 표현언어 $ 중괄호 로 표현한다.
	</h3>
	
	<h2>
		표현언어가 가지는 기본 객체
		
		<ol>
			<li>param : 파라미터를 접근할 수 있다 서버로 넘어오는 name값을 참조하자.</li>
			<li>requestScope :  요청객체에 접근할 떄 사용한다.</li>
			<li>sessiontScope : HttpSession 접근할 떄 사용한다.</li>
		</ol>	
	</h2>
	
	<h3>넘어오는 파라미터를 EL표기법으로 가져와보자.</h3>
	
	<h4>(1) : ${param.s_id} </h4>
	<h4>(2) : ${param.s_pw} </h4>
	<h4>(3) : ${param.cPage} </h4>
	
</body>
</html>