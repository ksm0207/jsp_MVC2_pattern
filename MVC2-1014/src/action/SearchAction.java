package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.LocationsDAO;
import mybatis.vo.LocationsVO;
import user.service.Action;

public class SearchAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		String searchType = request.getParameter("searchType");
		String searchValue= request.getParameter("searchValue");
	
		LocationsVO[] ar = LocationsDAO.selectList(searchType, searchValue);
		
		request.setAttribute("search", ar);
		
		return "./search_res.jsp";
	}

}
