<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="./param_res.jsp">
		<input type="text" id = "id" name = "id" placeholder="아이디">
		<input type="text" id = "pw" name = "pw" placeholder="비밀번호">
		<button type="button" onclick="sendData(this.form)">보내기</button>
	</form>
	<script>
		function sendData(form){
			
			form.submit();
		}
	</script>
</body>
</html>