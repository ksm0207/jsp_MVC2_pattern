package bbs.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mybatis.dao.BbsDAO;
import mybatis.vo.BbsVO;

public class ViewAction implements Action {

	List<BbsVO> r_list;//멤버변수
	
	public boolean checkBbs(BbsVO vo){
		boolean value = true;
		
		for(BbsVO bvo : r_list){
			if(bvo.getB_idx().equals(vo.getB_idx())){
				value = false;
				break;
			}
		}
		
		return value;
	}
	
	@Override
	public String execute(HttpServletRequest request, 
			HttpServletResponse response) {
		// 파라마터 값 받기
		String cPage = request.getParameter("cPage");//원래 있었던 페이지값
		String b_idx = request.getParameter("b_idx");//기본키
		
		//한번 읽기를 한 게시물은 ArrayList에 저장하여 session에 read_list라는
		//이름으로 저장을 하자!
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("read_list");
		
		if(obj == null) {
			r_list = new ArrayList<BbsVO>();
			session.setAttribute("read_list", r_list);
		}else {
			r_list = (ArrayList<BbsVO>)obj;
		}
		//System.out.println(cPage +"/"+ b_idx);
		BbsVO vo = BbsDAO.getBbs(b_idx);
		
		//위에서 검색된 BbsVO가 이전에 한번이라도 읽었던 것이라는
		// 반드시 read_list(r_list)에 저장되었을 것이다.
		if(checkBbs(vo)) {
			//한번도 읽지 않은 게시물이므로 hit수를 증가시킨 후
			// r_list에 추가
			BbsDAO.updateHit(b_idx);
			r_list.add(vo);
		}
		
		// view.jsp에서 표현해야할 값들을 request에 저장한다.
		
		request.setAttribute("vo", vo);
		request.setAttribute("cPage", cPage);
		
		return "/view.jsp";
	}

}
