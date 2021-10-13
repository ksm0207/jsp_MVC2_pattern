<%@page import="bbs.util.Paging"%>
<%@page import="mybatis.vo.BbsVO"%>
<%@page import="mybatis.dao.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/table.css">
</head>
<body>
	<div id="bbs">
		<table summary="게시판 목록">
			<caption>게시판 목록</caption>
			<thead>
				<tr class="title">
					<th class="no">번호</th>
					<th class="subject">제목</th>
					<th class="writer">글쓴이</th>
					<th class="reg">날짜</th>
					<th class="hit">조회수</th>
				</tr>
			</thead>
			
			<tfoot>
                      <tr>
                          <td colspan="4">
                              <ol class="paging">
<%
	//페이징을 위해 request에 page라는 이름으로 저장한 객체를 얻어낸다.
	Object obj = request.getAttribute("page");
	Paging pvo = null;
	if(obj != null){
		
		pvo = (Paging)obj;
  	
  		if(pvo.getStartPage() < pvo.getPagePerBlock()){
%>
	<li class="disable">&lt;</li>
<%
		}else{
%>
	<li><a href="Controller?type=list&cPage=<%=pvo.getStartPage()-pvo.getPagePerBlock()%>">&lt;</a></li>
<%
		}//if문의 끝
  
  for(int i=pvo.getStartPage(); i<=pvo.getEndPage(); i++){
	  
	  if(pvo.getNowPage() == i){
		  System.out.println(i);
%>
		<li class="now"><%=i%> </li>
<%
		}else{
%>
		<li><a href="Controller?type=list&cPage=<%=i%>"><%=i %> </a></li>
<%
}//if문의 끝
  }//for의 끝

  if(pvo.getEndPage() < pvo.getTotalPage()){
%>
	<li><a href="Controller?type=list&cPage=<%=pvo.getStartPage()+pvo.getPagePerBlock()%>">&gt;</a></li>
<%
}else{
%>
	<li class="disable">&gt;</li>
<%
}
%> 
                              </ol>
                          </td>
						  <td>
							<input type="button" value="글쓰기"
			onclick="javascript:location.href='Controller?type=write'"/>
			
						  </td>
                      </tr>
                  </tfoot>
			<tbody>
<%
// 게시물 목록 가져온다.
	
	Object o = request.getAttribute("ar");
	
	if(o != null){
		BbsVO[] ar = (BbsVO[])o;
		for(int i=0; i<ar.length; i++){
		BbsVO vo = ar[i];
%>			
				<tr>
					<td><%=vo.getB_idx() %></td>
					<td style="text-align: left">
					<%--
		
					 --%>
						<a href="view.jsp?cPage=<%=pvo.getNowPage()%>&b_idx=<%=vo.getB_idx()%>">
							<%=vo.getSubject() %>
							<%
								if(vo.getC_list() != null && vo.getC_list().size() > 0){
							%>
								(<%=vo.getC_list().size() %>)
							<%		
								}
							%>
						</a>
					</td>
					<td><%=vo.getWriter() %></td>
					<td>
						<% 
							if(vo.getWrite_date() != null){
						%>
							<%=vo.getWrite_date().substring(0,10) %>
						<%		
							}
						%>
					</td>
					<td><%=vo.getHit() %></td>
				</tr>
<%
		}//for문의 끝
	}//if문의 끝
	
%>

<%
	}
%>
			</tbody>
		</table>
		
	</div>
	
</body>
</html>






