<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div>
		<form action="Controller" method="post">
		
			<label for="id">ID : </label>
			<input type="text" placeholder="ID" name="id"><br>
			
			<label for="pw">PW : </label>
			<input type="password" placeholder="PW" name="pw"><br>
			
			
			<button type="button" onclick="sendData(this.form)">Send</button>
			<input type="hidden" name="type" value="login">
			
		</form>
	</div>
	
	<script>
		function sendData(form){
			
			document.forms[0].submit();
		}
	</script>

</body>
</html>