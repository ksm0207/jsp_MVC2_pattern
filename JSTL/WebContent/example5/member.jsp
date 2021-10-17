<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.MemberVO" %>    
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	MemberVO mvo1 = new MemberVO("Kim","27","Man","Seoul","Coffee");
    MemberVO mvo2 = new MemberVO("Nam","31","Girl","Seoul","Bread"); 
    
    ArrayList<MemberVO> list = new ArrayList<MemberVO>();
    
    list.add(mvo1);
    list.add(mvo2);
    
    System.out.println(list.size());
    
    session.setAttribute("list",list);
%>
<button onclick="javascript:location.href='member_view.jsp'">Send</button>

</body>
</html>