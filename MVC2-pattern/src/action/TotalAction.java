package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import inter.Action;
import mybatis.dao.EmpDAO;
import mybatis.vo.EmpVO;

public class TotalAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		EmpVO[] total = EmpDAO.getList();
		
		request.setAttribute("total", total);
		
		return "./ex1/total.jsp";
	}
	

}
