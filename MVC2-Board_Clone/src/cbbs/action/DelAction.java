package cbbs.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.BbsDAO;

public class DelAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		String b_idx = request.getParameter("b_idx");
		String pwd = request.getParameter("pwd");
		BbsDAO.delBbs(b_idx,pwd);
		
		return null;
	}

}
