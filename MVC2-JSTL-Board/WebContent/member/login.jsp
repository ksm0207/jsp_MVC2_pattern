<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<c:if test="${login.member_id == null}">
		<div>
			<form action="Controller" method="POST">
			
				<label for="id">ID : </label>
				<input type="text" placeholder="ID" name="id"><br>
				
				<label for="pw">PW : </label>
				<input type="password" placeholder="PW" name="pw"><br>
				
				<button type="submit">Login</button>
				<input type="hidden" name="type" value="login">
			</form>
		</div>
	</c:if>
	
	<c:if test="${login.member_id != null }">
		<span>안녕하세요 ${login.member_id} 님!</span>
		<a href="Controller?type=logout">로그아웃</a>
	</c:if>
	
	
</body>
</html>