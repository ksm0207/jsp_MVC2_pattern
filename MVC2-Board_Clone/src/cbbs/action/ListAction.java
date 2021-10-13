package cbbs.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bbs.util.Paging;
import mybatis.dao.BbsDAO;
import mybatis.vo.BbsVO;

public class ListAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
	
		// 페이지 처리를 위한 객체 생성
		
		Paging page = new Paging();
		
		// 총 게시물 수를 구해서 값 저장하기
		page.setTotalBoard(BbsDAO.getTotalCount());
				
		// 현재 페이지 값 파라미터로 받기
		String cPage = request.getParameter("cPage");
		System.out.println("CPage :" + cPage);
		
		// nowPage dataType : int
		if(cPage != null) {
			int nowPage = Integer.parseInt(cPage);
			page.setNowPage(nowPage);
		}else {
			// 서버 시작 후 파라미터 값은 0이되고
			// begin / end + 시작 페이지 + 마지막 페이지 값을 구할 수 없어서
			// 디폴트 값인 1을 불러온다
			page.setNowPage(page.getNowPage());
		}
		
		System.out.println("현재 페이지 :" + cPage);
		System.out.println("getStartPage() : 시작 페이지 :" + page.getStartPage());
		System.out.println("getEndPage() : 마지막 페이지 : " + page.getEndPage());
		System.out.println("getPerBlock() : 페이지 블록 :" + page.getPerBlock());
		System.out.println("TotalPage(): 총 페이지 : " + page.getTotalPage());
	
		
		BbsVO[] list = BbsDAO.getList(page.getBegin(), page.getEnd());
		
		request.setAttribute("page", page); // 페이지 객체 저장
		request.setAttribute("list",list ); // 게시글 수 저장
		
		return "./list.jsp";
	}

}
