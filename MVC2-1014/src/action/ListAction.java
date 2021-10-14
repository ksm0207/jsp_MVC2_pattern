package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bbs.util.Paging;
import mybatis.dao.LocationsDAO;
import mybatis.vo.LocationsVO;
import user.service.Action;

public class ListAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		LocationsVO[] ar = LocationsDAO.selectList(null, null);
		
		request.setAttribute("total", ar);
		
		
		return "total.jsp";
	}

}
