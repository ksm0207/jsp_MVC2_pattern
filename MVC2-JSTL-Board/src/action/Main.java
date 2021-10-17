package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import inter.Action;

public class Main implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		return "./index.jsp";
	}

}
