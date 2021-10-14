package cbbs.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.BbsDAO;
import mybatis.vo.BbsVO;

public class EditAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		String viewPath = "./edit.jsp";
		String c_type = request.getContentType();
		/*
		 	getContentType() : Form에서 요청시 encType을 얻게된다
		 	                   c_type의 값이 "application" 으로 시작한다면 '일반 form' 에서 요청한 것이고
		 	                   현재는 view.jsp에서 [수정] 버튼을 클릭한 경우다
		 
		 * */
		String cPage = request.getParameter("cPage");
		String b_idx = request.getParameter("b_idx");
		
		if(c_type != null && c_type.startsWith("application")) {
			// 해당 게시물 검색
			BbsVO vo = BbsDAO.getBbs(b_idx);
			// request에 vo 저장하기
			request.setAttribute("vo", vo);
			
		}else if(c_type.startsWith("multipart")) {
			// 파일첨부가 된 Form에서 요청 된 경우 
			viewPath = "Controller?type=view&cPage="+cPage+"&b_idx="+b_idx;
		}
		
		return viewPath;
	}

}
