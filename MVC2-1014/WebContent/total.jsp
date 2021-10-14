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
			<h1>도시 목록</h1>
		</header>
		<article>
			<table>
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
						Object o = request.getAttribute("total");
						
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
	
	<%-- 추가 팝엉 div 생성 --%>
	<div id ="add_popup" title="사원추가">
		<div id="content">
			<form action="Controller" method="POST">
			
				<label for="emp_id">사번 :</label>
				<input type="text" id="employee_id" name="employee_id"><br>
				
				<label for="emp_fname">이름 :</label>
				<input type="text" id="first_name" name="first_name"><br>
			
				<label for="emp_lname">성씨 :</label>
				<input type="text" id="last_name" name="last_name"><br>
				
				<label for="emp_email">이메일 :</label>
				<input type="text" id="email" name="email"><br>
				
				<label for="emp_job">직종 :</label>
				<input type="text" id="job_id" name="job_id" value="IT_PROG"><br>
				
				<label for="emp_date">입사 :</label>
				<input type="text" id="hire_date" name="hire_date"><br>
				
				<label for="emp_deptno">부서코드 :</label>
				<input type="text" id="department_id" name="department_id" value="30"><br>
				
				<input type="button" value="저장" onclick="create()">
				
				<input type="hidden" name="search" value="result">
			</form>
		</div>
	</div>
	
	<div id ="search_popup" title="사원검색">
		<div id="content">
			<form action="Controller" method="POST">
			
				<select id="searchType" name = "searchType">
					<option value= "0">도시코드</option>
					<option value= "1">주소</option>
					<option value= "2">우편번호</option>
					<option value= "3">도시명</option>
					<option value= "4">국적</option>
				</select>
				
				<input type="text" id="searchValue" name="searchValue">
			 	<input type="hidden" name="type" value="search"> 
				<input type="button" value="검색" onclick= "searchLocations()">
			</form>
		</div>
	</div>
	
	<script>
	
		function addWin(){
			$("#add_popup").dialog();
		}
		
		function searchWin(){
			$("#search_popup").dialog();
		}
	
	
		$(function(){
			$("#hire_date").datepicker({
				dateFormat: 'yy년mm월dd일',
				dayNamesMin: [ "일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일" ],
				monthNames: [ "1월", "2월", "3월", "4월", "5월", "6월",
					"7월", "8월", "9월", "10월", "11월", "12월" ],
					showMonthAfterYear: true,
			    
			});
		});
	
		
		function create() {
			
			let emp_no = $("#employee_id").val();
			let first_name = $("#first_name").val();
			let last_name = $("#last_name").val();
			let email = $("#email").val();
			let job_id = $("#job_id").val();
			let hire_date = $("#hire_date").val();
			let department_id = $("#department_id").val();
			
			$.ajax({				url : "Controller",
				data : "search="+"add&employee_id="+emp_no.trim()+"&first_name="+first_name.trim()+"&last_name="+last_name.trim()
				                                      +"&email="+email.trim()+"&job_id="+job_id.trim()+"&hire_date="+hire_date+"&department_id="+department_id,
				type : "POST"
			})
			.done(function(data){
				alert("success");
			})
			.fail(function(error){
				alert("error");
			})
			
			document.forms[0].submit();
			
		}
		
	
		function searchLocations(){
			
			let pattern_num = /[0-9]/;	// 숫자 
	    	let pattern_eng = /[a-zA-Z]/;	// 문자 
	    	let pattern_spc = /[~!@#$%^&*()_+|<>?:{}]/; // 특수문자
	    	let pattern_kor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; // 한글체크
			
	    	let searchType = $("#searchType").val();
			let searchValue = $("#searchValue").val();
			
			if(searchType.trim().length < 1){
				alert("옵션을 선택해주세요.");
				return false;
			}
			
			if(searchValue.trim().length < 1){
				alert("검색할 목록을 입력하세요. ");
				return false;
			}
			
			// 번호만 입력하게 하기 위한 정규식 패턴
			if( (pattern_num.test (searchValue) )  //숫자
				 && 
				 !(pattern_eng.test (searchValue) ) // 영문
				 && 
				 !( pattern_spc.test (searchValue) )  // 특수문자
				 && 
				 !(pattern_kor.test (searchValue) ) ){ // 한글체크
	    		return true

	    	}else{

	    		alert("숫자만 입력 가능합니다.")

	    		return false

	    	}

			
			$.ajax({
				url : "Controller",
				data : "type=search"+"&searchType="+searchType.trim()+"&searchValue="+searchValue.trim(),
				type : "POST"
			})
			.done(function(data){
				alert("success");
			})
			.fail(function(error){
				alert("error");
			})
			
			document.forms[1].submit();
			
		}
			
	</script>

</body>
</html>