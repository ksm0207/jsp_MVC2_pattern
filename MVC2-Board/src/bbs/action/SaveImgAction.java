package bbs.action;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class SaveImgAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// 첨부된 이미지를 editor_img라는 폴더에 업로드!
		// 그리고 마지막에 저장된 이미지의 경로를 JSON으로 반환해야 한다.
		try {
			ServletContext application = request.getServletContext();
			
			String realPath = application.getRealPath("/editor_img");
			
			MultipartRequest mr = new MultipartRequest(request, realPath,
					1024*1024*5, "utf-8", new DefaultFileRenamePolicy());
			
			String fname = null;
			File f = mr.getFile("s_file");
			if(f != null)
				fname = f.getName(); //저장된 파일명
			
			//jsp파일에서 JSON표기법으로 지금 업로드된 파일의
			// 경로를 출력해야 한다. 그래서 파일명과 경로를 request에 저장!
			request.setAttribute("fname", fname);
			request.setAttribute("c_path", request.getContextPath());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/saveImage.jsp";
	}

}
