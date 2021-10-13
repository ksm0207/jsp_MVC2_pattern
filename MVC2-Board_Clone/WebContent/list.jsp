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
  		//  1 < 5
  		if(pvo.getStartPage() < pvo.getPerBlock()){
%>
	<!-- 조건 true -->
	<li class="disable">이전</li>
<%
		}else{
%>			  <!-- else getStartPage : 6 < 5   : nowPage -->
	<li><a href="Controller?type=list&cPage=<%=pvo.getStartPage()-pvo.getPerBlock()%>">처음으로</a></li>
<%
		}//if문의 끝
  
  		// i = 1 i< 5 i ++
  	for(int i=pvo.getStartPage(); i<=pvo.getEndPage(); i++){
	  // nowPage == 1
	  if(pvo.getNowPage() == i){
		  System.out.println(true);
%>
		<!--  text  -->
		<li class="now"><%=i%></li>
<%
		}else{
			System.out.println(false);
%>		<!-- 현재 페이지 외 나머지 블록들 -->
		<li><a href="Controller?type=list&cPage=<%=i%>"><%=i %></a></li>
<%
		}//if문의 끝
  	  }//for의 끝
  
  //다음 블록으로 이동하는 기능을 부여해야 할지? 하지 말아야 할지?를
  //endPage가 totalPage보다 작을 경우에만 부여하자!
       // 마지막페이지 5 <  총 페이지 6
  	if(pvo.getEndPage() < pvo.getTotalPage()){
%>
											<!-- 1 + 5 -->
	<li><a href="Controller?type=list&cPage=<%=pvo.getStartPage()+pvo.getPerBlock()%>">마지막</a></li>
<%
  	}
%>

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
	Object obj2 = request.getAttribute("list");
	if(obj2 != null){
		BbsVO[] ar = (BbsVO[])obj2;
		
			for(int i=0; i<ar.length; i++){
				BbsVO vo = ar[i];//배열에서 하나의 요소를  가져온다.
%>			
				<tr>
					<td><%=vo.getB_idx() %></td>
					<td style="text-align: left">
			
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






