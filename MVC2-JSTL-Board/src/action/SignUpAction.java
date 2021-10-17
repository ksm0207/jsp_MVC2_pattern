package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import inter.Action;
import member.dao.MemberDAO;

public class SignUpAction implements Action {
	        
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		
		MemberDAO.add(id, pw, name, phone);
		
		
		return "./member/login.jsp";
	}

}
