package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import inter.Action;

public class SignAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		return "./member/reg.jsp";
	}
	
	
}
