package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import inter.Action;

public class MainAction implements Action {

	@Override
	public String execute(HttpServletRequest reqeust, HttpServletResponse response) {
		
		return "index.jsp";
	}

}
