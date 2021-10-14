package cbbs.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.BbsDAO;
import mybatis.vo.BbsVO;

public class EditAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		String cPage = request.getParameter("cPage");
		String b_idx = request.getParameter("b_idx");
		
		String title = request.getParameter("title");
		System.out.println("From edit.jsp : Title : " + title);
		
		System.out.println("EditAction : " + cPage + " / " + b_idx);
		
		BbsVO vo = BbsDAO.getBbs(b_idx);
		
		request.setAttribute("cPage", cPage);
		request.setAttribute("vo", vo);
		
		return "edit.jsp";
	}

}
