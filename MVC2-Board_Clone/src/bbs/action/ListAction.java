package bbs.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bbs.util.Paging;
import mybatis.dao.BbsDAO;
import mybatis.vo.BbsVO;

public class ListAction implements Action{

	@Override
	public String execute(HttpServletRequest request, 
			HttpServletResponse response) {
		// 페이징 처리를 위한 객체생성
		Paging page = new Paging();
		
		//전체페이지 값을 구하기 위해 먼저 총 게시물의 수를 구해서 지정한다.
		//int cnt = BbsDAO.getTotalCount();
		//page.setTotalRecord(cnt);
		
		page.setTotalRecord(BbsDAO.getTotalCount());
		//이렇게 총 게시물 수가 지정되면 총 페이지 수까지 구해진다.
		System.out.println("총 게시물 수 :" + page.getTotalRecord());
		// 현재 페이지 값 받기
		String cPage = request.getParameter("cPage");
		if(cPage != null) {
			int p = Integer.parseInt(cPage);
			System.out.println("현재 페이지 : " + p);
			page.setNowPage(p);//이때!!!!
			// 게시물을 추출할 범위(begin과 end) 그리고
			//시작페이지와 마지막페이지 값이 모두 구해진다.
		}else {
			page.setNowPage(page.getNowPage());
		}
		
		System.out.println("begin : " + page.getBegin());
		System.out.println("end : " + page.getEnd());
		
		System.out.println("Start Page :" + page.getStartPage());
		System.out.println("end Page :" + page.getEndPage());
		
		System.out.println("총 페이지 : " + page.getTotalPage());
		
		//화면에 표현할 게시물들을 가져온다.
		BbsVO[] ar = BbsDAO.getList(page.getBegin(), page.getEnd());
		
		//뷰 페이지에서 표현할 수 있도록 request에 저장해서 보낸다.
		request.setAttribute("ar", ar);
		request.setAttribute("page", page);//***********************
		
		return "/list.jsp";
	}

}
