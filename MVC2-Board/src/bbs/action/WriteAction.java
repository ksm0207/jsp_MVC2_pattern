package bbs.action;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import mybatis.dao.BbsDAO;

public class WriteAction implements Action {

	@Override
	public String execute(HttpServletRequest request, 
			HttpServletResponse response) {
		String viewPage = "/write.jsp";
		
		String c_type = request.getContentType();
		// get방식 : null
		// post방식이면서 encType이 생략된 경우 : application/....
		// post방식이면서 encType이 "multipart/..." : multipart/...
		//System.out.println(c_type);
		// list.jsp에서 글쓰기 버튼을 선택하여 여기로 왔는지? 아니면
		// write.jsp에서 보내기 버튼을 선택하여 왔는지를 구분할 수 있다.
		if(c_type != null && c_type.startsWith("multipart")) {
			//DB작업과 파일업로드(cos라이브러리의 MultipartRequest생성)
			try {
				ServletContext application = request.getServletContext();
				
				// 첨부되는 파일이 저장될 위치를 절대경로로 만든다.
				String realPath = application.getRealPath("/bbs_upload");
	
				MultipartRequest mr = new MultipartRequest(request, realPath, 
				1024*1024*5, "utf-8", new DefaultFileRenamePolicy());
				// 이때 첨부된 파일이 있다면 업로드가 된다.
				
				//나머지 파라미터들 받기
				String title = mr.getParameter("title");
				String writer = mr.getParameter("writer");
				String content = mr.getParameter("content");
				String pwd = mr.getParameter("pwd");
				
				//이미 업로드된 파일얻기
				File f = mr.getFile("file");
				
				//만약! 파일첨부를 하지 않았다면 f는 null이다.
				String fname = "";
				String oname = "";
				if(f != null){
					fname = f.getName(); //현재 저장된 파일명
					oname = mr.getOriginalFileName("file");
					// 만약 파일명이 변경되지 않았다면 fname과 oname은 같다.
				}
				
				//글쓴이의 ip알아내기
				String ip = request.getRemoteAddr();
				
				//DB에 저장!!!
				BbsDAO.add(title, writer, content, fname, oname, pwd, ip);
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			viewPage = null;
		}
		
		return viewPage;
	}

}
