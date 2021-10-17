package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import emp.dao.EmployeeDAO;
import emp.vo.EmployeeVO;
import inter.Action;

public class TotalAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		EmployeeVO[] emp = EmployeeDAO.empTotal();
		request.setAttribute("emp", emp);
		
		return "total.jsp";
	}
	
	

}
