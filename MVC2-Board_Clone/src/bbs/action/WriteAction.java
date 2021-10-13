package bbs.action;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import mybatis.dao.BbsDAO;

public class WriteAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("글쓰기");
		
		String viewPage = "./write.jsp";
		
		ServletContext context = request.getServletContext();
		
		String realPath = context.getRealPath("/bbs_upload");
		
		String c_type = request.getContentType();
			
		if(c_type != null && c_type.startsWith("multipart")) {
			
			try {
				MultipartRequest req = new 
						MultipartRequest(request,realPath,1024*1024*5,
								"UTF-8",new DefaultFileRenamePolicy());
				
				String title = req.getParameter("title");
				String writer = req.getParameter("writer");
				String content = req.getParameter("content");
				String file = req.getFilesystemName("file");
				String ip = request.getRemoteAddr();
				String pwd = req.getParameter("pwd");
			    BbsDAO.add(title, writer, content, file,ip,pwd);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			viewPage = null;
		}

		
		
										              
		return viewPage;
	}

}
