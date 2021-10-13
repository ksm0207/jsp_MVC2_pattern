package cbbs.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mybatis.dao.BbsDAO;
import mybatis.vo.BbsVO;

public class ViewAction implements Action{
	
	List<BbsVO> r_list;

	public boolean checkBbs(BbsVO vo){
		boolean value = true;
		
		for(BbsVO bvo : r_list){
			if(bvo.getB_idx().equals(vo.getB_idx())){
				value = false;
				break;
			}
		}
		
		return value;
	}
	

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		String cPage = request.getParameter("cPage");
		String b_idx = request.getParameter("b_idx");
		
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("read_list");
		
		if(obj == null) {
			r_list = new ArrayList<BbsVO>();
			session.setAttribute("read_list", r_list);
		}else {
			r_list = (ArrayList<BbsVO>)obj;
		}
		
		BbsVO vo = BbsDAO.getBbs(b_idx);
		
		if(checkBbs(vo)) {
			BbsDAO.updateHit(b_idx);
			r_list.add(vo);
		}
		
		request.setAttribute("getBbs", vo);
		request.setAttribute("cPage", cPage);
		return "view.jsp";
	}

}
