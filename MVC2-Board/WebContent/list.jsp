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
	
	#bbs table th,#bbs table td {
	    text-align:center;
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
	
	/* paging */
	
	table tfoot ol.paging {
	    list-style:none;
	}
	
	table tfoot ol.paging li {
	    float:left;
	    margin-right:8px;
	}
	
	table tfoot ol.paging li a {
	    display:block;
	    padding:3px 7px;
	    border:1px solid #00B3DC;
	    color:#2f313e;
	    font-weight:bold;
	}
	
	table tfoot ol.paging li a:hover {
	    background:#00B3DC;
	    color:white;
	    font-weight:bold;
	}
	
	.disable {
	    padding:3px 7px;
	    border:1px solid silver;
	    color:silver;
	}
	
	.now {
	   padding:3px 7px;
	    border:1px solid #ff4aa5;
	    background:#ff4aa5;
	    color:white;
	    font-weight:bold;
	}
		
</style>
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
%>
		<li class="now"><%=i%></li>
<%
		}else{
%>
		<li><a href="Controller?type=list&cPage=<%=i%>"><%=i%></a></li>
<%
		}//if문의 끝
  	  }//for의 끝
  
  //다음 블록으로 이동하는 기능을 부여해야 할지? 하지 말아야 할지?를
  //endPage가 totalPage보다 작을 경우에만 부여하자!
  	if(pvo.getEndPage() < pvo.getTotalPage()){
%>
	<li><a href="Controller?type=list&cPage=<%=pvo.getStartPage()+pvo.getPagePerBlock()%>">&gt;</a></li>
<%
	}else{
%>
	<li class="disable">&gt;</li>
<%
	}
  
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
	Object obj2 = request.getAttribute("ar");
	if(obj2 != null){
		BbsVO[] ar = (BbsVO[])obj2;
		
			for(int i=0; i<ar.length; i++){
				BbsVO vo = ar[i];//배열에서 하나의 요소를  가져온다.
%>			
				<tr>
					<td><%=vo.getB_idx() %></td>
					<td style="text-align: left">
					<%--
					제목을 클릭하면
					view.jsp로 이동을 한다. 이때 cPage라는 파라미터명에는
					현재 페이지값이 들어가고 b_idx라는 파라미터명에는
					사용자가 클릭한 게시물의 기본키를 저장하여 호출한다.
					 --%>
						<a href="Controller?type=view&cPage=<%=pvo.getNowPage()%>&b_idx=<%=vo.getB_idx()%>">
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
			</tbody>
		</table>
		
	</div>
	
</body>
</html>






