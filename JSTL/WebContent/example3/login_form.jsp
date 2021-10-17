<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action = "login_ok.jsp">
		<label for = "id">아이디 : </label>
		<input type="text" id= "id" name="id">
		
		<label for = "id">비밀번호 : </label>
		<input type="text" id= "pw" name="pw">
		
		<button type="button" onclick="sendData(this.form)">Send</button>
	</form>
	
	<script>
			
	function sendData(form){
	
			let id = document.getElementById('id').value;
			console.log(id);
			let pw = document.getElementById('pw').value;
			
			if(id.trim().length < 1){
				alert('아이디를 입력해주세요');
				return false;
			}
			if(pw.trim().length < 1){
				alert("패스워드를 입력해주세요.");
				return false;
			}
			
			document.forms[0].submit();
			
	
	}
	</script>

</body>
</html>