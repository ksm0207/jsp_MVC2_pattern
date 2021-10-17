package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import inter.Action;
import member.dao.MemberDAO;
import member.vo.MemberVO;

public class LoginAction  implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		System.out.println("ID : " + id );
		System.out.println("PW : " + pw);
		
		MemberVO login = MemberDAO.login(id, pw);
		HttpSession session = request.getSession();
		
		session.setAttribute("login", login);
		
		return "./member/login.jsp";
	}

}
