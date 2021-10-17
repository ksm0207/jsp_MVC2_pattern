<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<!-- jstl 라이브러리 사용 선언부 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
	table{
	
		width: 600px;
		border-collapse: collapse;
	
	}
	table th, table td {
		border: 1px solid black;
		padding: 5px;
	}	
	table caption {
		text-indent: -9999px;
	}
	#add_popup{
		display: none;
	}
	#search_popup{
		display : none;
	}
</style>
</head>
<body>
	<div id="wrap" style="margin: auto;">
		<header>
			<h1>사원 목록</h1>
		</header>
		<article>
			<table>
				<caption>목록</caption>
				
				<colgroup>
					<col width="30px"/>
					<col width="100px"/>
					<col width="150px"/>
					<col width="*"/>
				</colgroup>
				
				<thead>
					<tr>
						<td colspan="5">
							<button type="button" onclick="addWin()">추가</button>
							<button type="button" onclick="searchWin()">검색</button>
						</td>
					</tr>
					
					
					<tr>
						<th>사번</th>
						<th>이름</th>
						<th>성</th>
						<th>직업</th>
						<th>부서코드</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach varStatus="count" var="evo" items="${emp}">
				
					<tr>
						<td>${evo.employee_id}</td>
						<td>${evo.first_name}</td>
						<td>${evo.last_name}</td>
						<td>${evo.job_id}</td>
						<td>${evo.department_id}</td>
					</tr>
					
				</c:forEach>
				</tbody>
					
			</table>
		</article>
	</div>
	

</body>
</html>