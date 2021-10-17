package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import inter.Action;

public class LoginPage implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		return "./member/login.jsp";
	}

}
