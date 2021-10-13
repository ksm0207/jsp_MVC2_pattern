package bbs.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.BbsDAO;

public class DelAction implements Action {

	@Override
	public String execute(HttpServletRequest request, 
			HttpServletResponse response) {
		// 기본키와 현재페이지 값 그리고 비밀번호 값 받기
		String b_idx = request.getParameter("b_idx");
		//String cPage = request.getParameter("cPage");
		String pwd = request.getParameter("pwd");
		
		BbsDAO.delBbs(b_idx, pwd);
		
		return null;
	}

}
