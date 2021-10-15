package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.LocationsDAO;
import user.service.Action;

public class AddAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		String s_loc_id = request.getParameter("s_loc_id");
		String s_addr = request.getParameter("s_addr");
		String s_post = request.getParameter("s_post");
		String s_city = request.getParameter("s_city");
		String s_state = request.getParameter("s_state");
		String s_country = request.getParameter("s_country");
		/*
			System.out.println("도시코드 :" + s_loc_id);
			System.out.println("주소 :" + s_addr);
			System.out.println("우편번호 :" + s_post);
			System.out.println("도시명 :" + s_city);
			System.out.println("주,도 :" + s_state);
			System.out.println("국적코드 :" + s_country);
		*/
		LocationsDAO.add(s_loc_id, s_addr, s_post, s_city, s_state, s_country);
		
		return null;
	}

}
