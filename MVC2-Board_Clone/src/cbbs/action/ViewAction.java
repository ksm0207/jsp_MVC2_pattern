package cbbs.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.BbsDAO;
import mybatis.vo.BbsVO;

public class ViewAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		String cPage = request.getParameter("cPage");
		String b_idx = request.getParameter("b_idx");
		
		System.out.println(cPage + " / " + b_idx);
		
		BbsVO vo = BbsDAO.getBbs(b_idx);
		
		request.setAttribute("cPage", cPage);
		request.setAttribute("getBbs", vo);
		return "view.jsp";
	}

}
