<%@page import="java.util.ArrayList"%>
<%@page import="mybatis.vo.CommVO"%>
<%@page import="java.util.List"%>
<%@page import="mybatis.dao.BbsDAO"%>
<%@page import="mybatis.vo.BbsVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#bbs table {
	    width:580px;
	    margin-left:10px;
	    border:1px solid black;
	    border-collapse:collapse;
	    font-size:14px;
	    
	}
	
	#bbs table caption {
	    font-size:20px;
	    font-weight:bold;
	    margin-bottom:10px;
	}
	
	#bbs table th {
	    text-align:center;
	    border:1px solid black;
	    padding:4px 10px;
	}
	
	#bbs table td {
	    text-align:left;
	    border:1px solid black;
	    padding:4px 10px;
	}
	
	.no {width:15%}
	.subject {width:30%}
	.writer {width:20%}
	.reg {width:20%}
	.hit {width:15%}
	.title{background:lightsteelblue}
	
	.odd {background:silver}
	
	.hide{ display: none; }	
</style>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">

</head>
<body>
<%!List<BbsVO> r_list;//멤버변수
	
	public boolean checkBbs(BbsVO vo){
		boolean value = true;
		
		for(BbsVO bvo : r_list){
			if(bvo.getB_idx().equals(vo.getB_idx())){
				value = false;
				break;
			}
		}
		
		return value;
	}%>
<%
	Object obj = request.getAttribute("vo");
	Object obj2 = request.getAttribute("cPage");
	if(obj != null){
		BbsVO vo = (BbsVO)obj;
		String cPage = (String)obj2;
%>

	<div id="bbs">
	<form method="post" >
		<table summary="게시판 글쓰기">
			<caption>게시판 글쓰기</caption>
			<tbody>
				<tr>
					<th>제목:</th>
					<td><%=vo.getSubject() %> </td>
				</tr>
				<%
					if(vo.getFile_name() != null && vo.getFile_name().length() > 4){
				%>
				<tr>
					<th>첨부파일:</th>
					<td><a href="javascript: down('<%=vo.getFile_name() %>')">
						<%=vo.getFile_name() %>
					</a></td>
				</tr>
				<%
					}
				%>
				<tr>
					<th>이름:</th>
					<td><%=vo.getWriter() %></td>
				</tr>
				<tr>
					<th>내용:</th>
					<td><%=vo.getContent() %></td>
				</tr>
				
				<tr>
					<td colspan="2">
						<input type="button" value="수정" onclick="edit()"/>
						<input type="button" value="삭제" onclick="del()"/>
						<input type="button" value="목록"
						 onclick="goList()"/>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
	<form method="post" action="ans_write.jsp">
		이름:<input type="text" name="writer"/><br/>
		내용:<textarea rows="4" cols="55" name="content"></textarea><br/>
		비밀번호:<input type="password" name="pwd"/><br/>
		
		<%-- 원글을 의미하는 원글의 기본키 --%>
		<input type="hidden" name="b_idx" value="${vo.b_idx}">
		<input type="hidden" name="cPage" value="${cPage}"><%-- ans_write.jsp에서 
					댓글을 저장한 후 다시 view.jsp로 돌아올 때 필요하다. --%>
		<input type="hidden" name="ip" value="<%=request.getRemoteAddr()%>">
		<input type="submit" value="저장하기"/> 
	</form>
	<p/>
	댓글들<hr/>
	<%
		List<CommVO> c_list = vo.getC_list();
		for(CommVO cvo : c_list){
	%>
		<div>
			이름:<%=cvo.getWriter() %> &nbsp;&nbsp;
			날짜:<%=cvo.getWrite_date() %><br/>
			내용:<%=cvo.getContent() %>
		</div>
		<hr/>
	<%
		}//for문의 끝
	%>
	
	</div>
	
	<form name="frm" method="post" >
		<input type="hidden" name="cPage" value="<%=cPage%>">
		<input type="hidden" name="b_idx" value="<%=vo.getB_idx()%>">
		<input type="hidden" name="f_name" />
		<input type="hidden" name="type" />
	</form>
	
	<%-- 삭제시 보여주는 팝업창 --%>
	<div id="del_dialog" title="삭제" class="hide">
		<form action="Controller" method="post">
			<label for="pwd">비밀번호:</label>
			<input type="password" id="pwd" name="pwd" size="10"/>
			<br/><br/>
			<input type="hidden" name="type" value="del">
			<input type="hidden" name="cPage" value="<%=cPage%>">
			<input type="hidden" name="b_idx" value="<%=vo.getB_idx()%>">
			<input type="button" value="삭제" onclick="delBbs(this.form)"/>
		</form>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
	<script>
	
		function delBbs(frm){
			var pw = $("#pwd").val().trim();
			if(pw.length < 1){
				alert("비밀번호를 입력하세요");
				$("#pwd").val("");
				$("#pwd").focus();
				return;
			}
			frm.submit(); // 결국 Controller를 거쳐서 DelAction으로 간다.
		}
		function edit(){
			
			document.frm.action = "edit.jsp";
			document.frm.submit();
		}
	
		function goList(){
		
			document.frm.action = "Controller";
			document.frm.type.value = "list";
			document.frm.submit();
		}
		
		function del(){ //삭제버튼을 클릭하면 호출되는 곳
			$("#del_dialog").dialog();//대화창 보여주기
			
		}
		
		function down(fname){
			document.frm.f_name.value = fname;
			document.frm.action = "download.jsp";
			document.frm.submit();
		}
	</script>
<%
	}else
		response.sendRedirect("list.jsp");
%>	

	
</body>
</html>







