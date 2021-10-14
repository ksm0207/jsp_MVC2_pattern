<%@page import="mybatis.vo.LocationsVO"%>
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
			<h1>검색 결과</h1>
		</header>
		<article>
			<table style="text-align: center;">
				<caption>목록</caption>
				
				<colgroup>
					<col width="50px"/>
					<col width="150px"/>
					<col width="*"/>
					<col width="100px"/>
					<col width="100px"/>
					<col width="50px"/>
				</colgroup>
				
				<thead>
					<tr>
						<td colspan="7">
							<a href="Controller?type=list">뒤로가기</a>
							<button type="button" onclick="addWin()">추가</button>
							<button type="button" onclick="searchWin()">검색</button>
						</td>
						
					</tr>
					<tr>
						<th>도시코드</th>
						<th>주소</th>
						<th>우편번호</th>
						<th>도시명</th>
						<th>주,도</th>
						<th>국적코드</th>
						
					</tr>
				</thead>
				
				
				<tbody>
				
					<%
						Object o = request.getAttribute("search");
						
						if(o != null) {
							LocationsVO[] ar = (LocationsVO[])o;
							
							for(LocationsVO vo : ar){
					%>
				
					<tr>
						<td><%=vo.getLocation_id() %></td>
						<td><%=vo.getStreet_address() %></td>
						<td><%=vo.getPostal_code() %></td>
						<td><%=vo.getCity() %></td>
						
						<%
							if(vo.getState_province() == null){
						%>
							<td></td>
						<%
							}else{
						%>
							<td><%=vo.getState_province() %></td>
						<%
							}						
						%>
						<td><%=vo.getCountry_id() %></td>	
					</tr>
				<%
							}
					}
				%>
				
				</tbody>
			</table>
		</article>
	</div>
	
</body>
</html>