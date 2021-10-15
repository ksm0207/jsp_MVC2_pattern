<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ex8.TestVO"%>
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
	 TestVO tvo1 = new TestVO("Kimsungmin01","010-9600-5982","ksm03071@gmail.com");
	 TestVO tvo2 = new TestVO("Kimsungmin02","010-1234-5982","ksm03071@gmail.com");
	 TestVO tvo3 = new TestVO("Kimsungmin03","010-1011-1213","ksm03071@gmail.com");
	
	 // 위 객체들을 저장할 ArrayList 생성
	 List<TestVO> list = new ArrayList<TestVO>();
	 
	 list.add(tvo1);
	 list.add(tvo2);  /* 객체 저장 */
	 list.add(tvo3);
	 
	 System.out.println(list.size());
	 
	 session.setAttribute("list", list);
%>
	<button type="button" onclick="javascript:location.href='./ex6_for2객체리턴.jsp'">다음</button>

</body>
</html>